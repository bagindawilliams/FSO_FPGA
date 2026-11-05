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
  - Rev 2.2 (2026-10-28 14:55 KST) : [Clean-Path, All 24-Bit Error Positions & Monitor Fix]
    Fixed clean-path false inversion and added internal monitor alias wires 
    (E_rx, P_rx, P_calc, SH, SV).
  - Rev 2.4 (2026-10-29 13:07 KST) : [Deep Audit Fix F05 - CCSDS 141.11-O-1 Vertical Parity E[8]]
    1. Preserved 100% of original descriptions, comments, and Rev 1.0..2.2 history.
    2. Synchronized vertical syndrome equations V[1:3] and P_calc[2:0] with lpc.v Rev 2.4
       by using E[8] (e_2,0) per CCSDS 141.11-O-1 Section 3.3.2.3.4 and Figure 2-13.
    3. Under the normative E[0]/E[8] coupling:
       - A single-bit error on E[0] produces the unique syndrome H == 4'b1111 && V == 4'b1000.
       - A single-bit error on E[8] produces the unique syndrome H == 4'b0010 && V == 4'b1111.
       - Single-bit errors on the remaining 14 data bits produce (h_wt == 1 && v_wt == 1).
       This guarantees 100% orthogonal single-bit error correction across all 24 bit positions.
===========================================================================
*/

module lpc_dec #(
    parameter ACTIVE_DISP_INV_EN = 0
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

    // Raw syndromes on incoming 'temp' (using E[0] on Hr[1:3] and E[8] on Vr[1:3])
    wire [0:15] Er = temp[23:8];
    wire [7:0]  Pr = temp[7:0];
    wire [0:3]  Hr, Vr;

    assign Hr[0] = Er[0]  ^ Er[1]  ^ Er[2]  ^ Er[3]  ^ (~Pr[7]);
    assign Hr[1] = Er[4]  ^ Er[5]  ^ Er[6]  ^ Er[7]  ^ (~Pr[6]) ^ Er[0];
    assign Hr[2] = Er[8]  ^ Er[9]  ^ Er[10] ^ Er[11] ^ (~Pr[5]) ^ Er[0];
    assign Hr[3] = Er[12] ^ Er[13] ^ Er[14] ^ Er[15] ^ (~Pr[4]) ^ Er[0];

    assign Vr[0] = Er[0] ^ Er[4] ^ Er[8]  ^ Er[12] ^ Pr[3];
    assign Vr[1] = Er[1] ^ Er[5] ^ Er[9]  ^ Er[13] ^ Pr[2] ^ Er[8];
    assign Vr[2] = Er[2] ^ Er[6] ^ Er[10] ^ Er[14] ^ Pr[1] ^ Er[8];
    assign Vr[3] = Er[3] ^ Er[7] ^ Er[11] ^ Er[15] ^ Pr[0] ^ Er[8];

    wire word_is_inverted   = ACTIVE_DISP_INV_EN && (Hr == 4'b1000) && (Vr == 4'b1000);
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

    // Horizontal & Vertical Syndrome Equations (CCSDS 141.11-O-1 / SDA OISL Fig 2-13)
    assign H[0] = E[0]  ^ E[1]  ^ E[2]  ^ E[3]  ^ (~P[7]);
    assign H[1] = E[4]  ^ E[5]  ^ E[6]  ^ E[7]  ^ (~P[6]) ^ E[0];
    assign H[2] = E[8]  ^ E[9]  ^ E[10] ^ E[11] ^ (~P[5]) ^ E[0];
    assign H[3] = E[12] ^ E[13] ^ E[14] ^ E[15] ^ (~P[4]) ^ E[0];

    assign V[0] = E[0] ^ E[4] ^ E[8]  ^ E[12] ^ P[3];
    assign V[1] = E[1] ^ E[5] ^ E[9]  ^ E[13] ^ P[2] ^ E[8];
    assign V[2] = E[2] ^ E[6] ^ E[10] ^ E[14] ^ P[1] ^ E[8];
    assign V[3] = E[3] ^ E[7] ^ E[11] ^ E[15] ^ P[0] ^ E[8];

    // Orthogonal 2D Cross-Point Error Localization for All 24 Bit Positions:
    // - E[0] error (bit 23) flips H[0..3] and V[0] -> H == 4'b1111 && V == 4'b1000
    // - E[8] error (bit 15) flips H[2] and V[0..3] -> H == 4'b0010 && V == 4'b1111
    // - E[k] error (k != 0, 8) flips 1 H row (h_wt == 1) and 1 V col (v_wt == 1)
    wire [2:0] h_wt       = H[0] + H[1] + H[2] + H[3];
    wire [2:0] v_wt       = V[0] + V[1] + V[2] + V[3];
    wire       is_e0_err  = (H == 4'b1111) && (V == 4'b1000);
    wire       is_e8_err  = (H == 4'b0010) && (V == 4'b1111);
    wire       is_1b_data = (h_wt == 3'd1) && (v_wt == 3'd1);

    assign S[0]  = is_e0_err;
    assign S[1]  = is_1b_data & H[0] & V[1];
    assign S[2]  = is_1b_data & H[0] & V[2];
    assign S[3]  = is_1b_data & H[0] & V[3];
    assign S[4]  = is_1b_data & H[1] & V[0];
    assign S[5]  = is_1b_data & H[1] & V[1];
    assign S[6]  = is_1b_data & H[1] & V[2];
    assign S[7]  = is_1b_data & H[1] & V[3];
    assign S[8]  = is_e8_err;
    assign S[9]  = is_1b_data & H[2] & V[1];
    assign S[10] = is_1b_data & H[2] & V[2];
    assign S[11] = is_1b_data & H[2] & V[3];
    assign S[12] = is_1b_data & H[3] & V[0];
    assign S[13] = is_1b_data & H[3] & V[1];
    assign S[14] = is_1b_data & H[3] & V[2];
    assign S[15] = is_1b_data & H[3] & V[3];

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

    wire corrected_bit_stb = en_d0 && ((|S) || ((h_wt + v_wt) == 3'd1));

    // Monitor Alias Wires for lpc_dec_top.v Compatibility
    wire [15:0] E_rx   = {E[0], E[1], E[2], E[3], E[4], E[5], E[6], E[7],
                          E[8], E[9], E[10], E[11], E[12], E[13], E[14], E[15]};
    wire [7:0]  P_rx   = P;
    wire [7:0]  P_calc = {~(E[0]^E[1]^E[2]^E[3]), ~(E[0]^E[4]^E[5]^E[6]^E[7]),
                          ~(E[0]^E[8]^E[9]^E[10]^E[11]), ~(E[0]^E[12]^E[13]^E[14]^E[15]),
                          (E[0]^E[4]^E[8]^E[12]), (E[8]^E[1]^E[5]^E[9]^E[13]),
                          (E[8]^E[2]^E[6]^E[10]^E[14]), (E[8]^E[3]^E[7]^E[11]^E[15])};
    wire [3:0]  SH     = {H[0], H[1], H[2], H[3]};
    wire [3:0]  SV     = {V[0], V[1], V[2], V[3]};

    assign flag     = en_d0;
    assign data_out = (flag) ? {U[0], U[1], U[2],  U[3],  U[4],  U[5],  U[6],  U[7],
                                U[8], U[9], U[10], U[11], U[12], U[13], U[14], U[15]} : 16'b0;

endmodule