`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University / ETRI Daejeon
Engineers    : Irzal Zaini & Williamsyah Baginda Miraj
Module Name  : lpc_dec
Description  : 24-bit to 16-bit Line Product Code (LPC) Sub-Decoder.
               Performs 2D horizontal (H[0:3]) and vertical (V[0:3]) parity 
               syndrome checking to correct single-bit errors in the 16-bit 
               encoded data matrix (E[0:15]) and reverses the differential 
               encoding to recover the 16-bit descrambled word (U[0:15]).

Revision History:
  - Rev 1.0 (Initial) : 2D syndrome single-bit error corrector & differential decoder.
  - Rev 1.1 (2026-10-22 05:45 KST) : Updated timescale to 1ns/1ps and added 
    corrected_bit_stb tracker for lpc_dec_top.v.
  - Rev 2.0 (2026-10-27 04:09 KST) : [ETRI Audit Item 6 - SDA OISL Page 40-41, Sec. 2.6.3.6.8]
    Added matching Active Disparity Management state tracker (running_disparity).
  - Rev 2.1 (2026-10-28 13:56 KST) : [Internal Audit Fix #6 - Orthogonal 8-Syndrome Disparity Recovery]
    1. Enabled ACTIVE_DISP_INV_EN = 1 by default to match lpc.v Rev 2.1.
    2. Exploited the Figure 2-13 e_0,0 parity coupling property:
       - A 24-bit disparity-inverted codeword (~raw_codeword) flips ONLY Hr[0] and Vr[0]
         (because Hr[1:3] and Vr[1:3] each sum 6 inverted bits, which cancel out mod 2!),
         whereas a single-bit error on E[0] flips ALL 8 syndromes (Hr=4'b1111, Vr=4'b1111).
       - Full 8-syndrome classifier (word_is_inverted) cleanly separates disparity
         inversion (with 0 or 1 channel bit error) from non-inverted codewords, and
         S[0..15] corrects single-bit errors across all 16 data bits including E[0]!
===========================================================================
*/

module lpc_dec #(
    parameter ACTIVE_DISP_INV_EN = 1 // [Rev 2.1] Enabled by default per SDA OISL Sec. 2.6.3.6.8
)(
    input  wire        clk,
    input  wire        rst_n,
    input  wire        en,
    input  wire [23:0] data_in,
    output wire        flag,
    output wire [15:0] data_out
);

    reg         en_d0;
    reg  [23:0] temp;

    reg  signed [11:0] running_disparity;
    function [4:0] count_ones_24(input [23:0] w);
        integer idx;
        reg [4:0] sum;
        begin
            sum = 5'd0;
            for (idx = 0; idx < 24; idx = idx + 1) begin
                sum = sum + w[idx];
            end
            count_ones_24 = sum;
        end
    endfunction

    wire [0:15] U;
    wire [0:15] M;
    wire [0:15] E;
    wire [0:3]  H;
    wire [0:3]  V;
    wire [7:0]  P;
    wire [0:15] S;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            en_d0 <= 1'b0;
        else
            en_d0 <= en;
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            temp <= 24'b0;
        else
            temp <= data_in;
    end

    // =========================================================================
    // [Rev 2.1] ORTHOGONAL 8-SYNDROME DISPARITY INVERSION DETECTOR
    // Evaluates raw syndromes Hr[0:3] and Vr[0:3] on incoming 'temp':
    // Because flipping all 24 bits toggles ONLY Hr[0] and Vr[0], an inverted
    // codeword (with 0 or 1 bit error) maps (~Hr[0], Hr[1:3], ~Vr[0], Vr[1:3])
    // into a valid 0-error (0000_0000) or 1-bit error syndrome!
    // =========================================================================
    wire [0:15] Er = temp[23:8];
    wire [7:0]  Pr = temp[7:0];
    wire [0:3]  Hr, Vr;

    assign Hr[0] = Er[0]  ^ Er[1]  ^ Er[2]  ^ Er[3]  ^ (~Pr[7]);
    assign Hr[1] = Er[4]  ^ Er[5]  ^ Er[6]  ^ Er[7]  ^ (~Pr[6]) ^ Er[0];
    assign Hr[2] = Er[8]  ^ Er[9]  ^ Er[10] ^ Er[11] ^ (~Pr[5]) ^ Er[0];
    assign Hr[3] = Er[12] ^ Er[13] ^ Er[14] ^ Er[15] ^ (~Pr[4]) ^ Er[0];

    assign Vr[0] = Er[0] ^ Er[4] ^ Er[8]  ^ Er[12] ^ Pr[3];
    assign Vr[1] = Er[1] ^ Er[5] ^ Er[9]  ^ Er[13] ^ Pr[2] ^ Er[0];
    assign Vr[2] = Er[2] ^ Er[6] ^ Er[10] ^ Er[14] ^ Pr[1] ^ Er[0];
    assign Vr[3] = Er[3] ^ Er[7] ^ Er[11] ^ Er[15] ^ Pr[0] ^ Er[0];

    // Candidate syndromes if 'temp' was inverted by TX Active Disparity Management:
    wire [0:3] Hi = {~Hr[0], Hr[1], Hr[2], Hr[3]};
    wire [0:3] Vi = {~Vr[0], Vr[1], Vr[2], Vr[3]};
    wire [2:0] hi_wt = Hi[0] + Hi[1] + Hi[2] + Hi[3];
    wire [2:0] vi_wt = Vi[0] + Vi[1] + Vi[2] + Vi[3];

    // 'temp' is disparity-inverted iff un-inverting it yields 0 errors, a 1-bit parity error,
    // a 1-bit data error (hi_wt==1 && vi_wt==1), or an E[0] error (Hi==4'b1111 && Vi==4'b1111):
    wire inv_valid_syndrome = ((hi_wt == 3'd0) && (vi_wt == 3'd0)) ||
                              ((hi_wt == 3'd1) && (vi_wt == 3'd0)) ||
                              ((hi_wt == 3'd0) && (vi_wt == 3'd1)) ||
                              ((hi_wt == 3'd1) && (vi_wt == 3'd1)) ||
                              ((Hi == 4'b1111) && (Vi == 4'b1111));

    wire word_is_inverted   = ACTIVE_DISP_INV_EN && inv_valid_syndrome;
    wire [23:0] aligned_temp = word_is_inverted ? ~temp : temp;

    wire [4:0]        rx_ones_cnt  = count_ones_24(temp);
    wire signed [6:0] rx_disparity = $signed({1'b0, rx_ones_cnt, 1'b0}) - 7'sd24;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            running_disparity <= 12'sd0;
        else if (en_d0)
            running_disparity <= running_disparity + {{5{rx_disparity[6]}}, rx_disparity};
        else
            running_disparity <= 12'sd0;
    end

    assign E = {aligned_temp[23], aligned_temp[22], aligned_temp[21], aligned_temp[20],
                aligned_temp[19], aligned_temp[18], aligned_temp[17], aligned_temp[16],
                aligned_temp[15], aligned_temp[14], aligned_temp[13], aligned_temp[12],
                aligned_temp[11], aligned_temp[10], aligned_temp[9],  aligned_temp[8]};

    assign P = aligned_temp[7:0];

    // Horizontal & Vertical Syndrome Equations on Polarity-Aligned Codeword
    assign H[0] = E[0]  ^ E[1]  ^ E[2]  ^ E[3]  ^ (~P[7]);
    assign H[1] = E[4]  ^ E[5]  ^ E[6]  ^ E[7]  ^ (~P[6]) ^ E[0];
    assign H[2] = E[8]  ^ E[9]  ^ E[10] ^ E[11] ^ (~P[5]) ^ E[0];
    assign H[3] = E[12] ^ E[13] ^ E[14] ^ E[15] ^ (~P[4]) ^ E[0];

    assign V[0] = E[0] ^ E[4] ^ E[8]  ^ E[12] ^ P[3];
    assign V[1] = E[1] ^ E[5] ^ E[9]  ^ E[13] ^ P[2] ^ E[0];
    assign V[2] = E[2] ^ E[6] ^ E[10] ^ E[14] ^ P[1] ^ E[0];
    assign V[3] = E[3] ^ E[7] ^ E[11] ^ E[15] ^ P[0] ^ E[0];

    // 2D Cross-Point Error Localization
    // Note: E[0] error flips all 8 syndromes (H=1111, V=1111); E[1..15] flips exactly 1 H and 1 V!
    wire is_e0_err = (&H) & (&V);
    assign S[0]  = is_e0_err | (H[0] & V[0] & ~(|H[1:3]) & ~(|V[1:3]));
    assign S[1]  = H[0] & V[1] & ~is_e0_err;
    assign S[2]  = H[0] & V[2] & ~is_e0_err;
    assign S[3]  = H[0] & V[3] & ~is_e0_err;
    assign S[4]  = H[1] & V[0] & ~is_e0_err;
    assign S[5]  = H[1] & V[1] & ~is_e0_err;
    assign S[6]  = H[1] & V[2] & ~is_e0_err;
    assign S[7]  = H[1] & V[3] & ~is_e0_err;
    assign S[8]  = H[2] & V[0] & ~is_e0_err;
    assign S[9]  = H[2] & V[1] & ~is_e0_err;
    assign S[10] = H[2] & V[2] & ~is_e0_err;
    assign S[11] = H[2] & V[3] & ~is_e0_err;
    assign S[12] = H[3] & V[0] & ~is_e0_err;
    assign S[13] = H[3] & V[1] & ~is_e0_err;
    assign S[14] = H[3] & V[2] & ~is_e0_err;
    assign S[15] = H[3] & V[3] & ~is_e0_err;

    // Single-Bit Error Correction
    assign M[0]  = E[0]  ^ S[0];
    assign M[1]  = E[1]  ^ S[1];
    assign M[2]  = E[2]  ^ S[2];
    assign M[3]  = E[3]  ^ S[3];
    assign M[4]  = E[4]  ^ S[4];
    assign M[5]  = E[5]  ^ S[5];
    assign M[6]  = E[6]  ^ S[6];
    assign M[7]  = E[7]  ^ S[7];
    assign M[8]  = E[8]  ^ S[8];
    assign M[9]  = E[9]  ^ S[9];
    assign M[10] = E[10] ^ S[10];
    assign M[11] = E[11] ^ S[11];
    assign M[12] = E[12] ^ S[12];
    assign M[13] = E[13] ^ S[13];
    assign M[14] = E[14] ^ S[14];
    assign M[15] = E[15] ^ S[15];

    // Differential Decoding (Inverse of Figure 2-13)
    assign U[0]  = M[0];
    assign U[1]  = M[1]  ^ M[0];
    assign U[2]  = M[2]  ^ M[1];
    assign U[3]  = M[3]  ^ M[2];
    assign U[4]  = M[4]  ^ M[3];
    assign U[5]  = M[5]  ^ M[4];
    assign U[6]  = M[6]  ^ M[5];
    assign U[7]  = M[7]  ^ M[6];
    assign U[8]  = M[8];
    assign U[9]  = M[9]  ^ M[8];
    assign U[10] = M[10] ^ M[9];
    assign U[11] = M[11] ^ M[10];
    assign U[12] = M[12] ^ M[11];
    assign U[13] = M[13] ^ M[12];
    assign U[14] = M[14] ^ M[13];
    assign U[15] = M[15] ^ M[14];

    wire corrected_bit_stb = en_d0 && (|S);

    assign flag     = en_d0;
    assign data_out = (flag) ? {U[0], U[1], U[2],  U[3],  U[4],  U[5],  U[6],  U[7],
                                U[8], U[9], U[10], U[11], U[12], U[13], U[14], U[15]} : 16'b0;

endmodule