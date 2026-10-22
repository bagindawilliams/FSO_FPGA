`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : lpc_dec
Description  : Low Parity Code (LPC) 24-bit to 16-bit Decoder Sub-Module.
               Compliant with SDA OISL Standard Section 2.6.3.6.8 (Fig 2-13).
               
               THEORETICAL OPERATIONS (SDA OISL SECTION 2.6.3.6.8):
               1. 2D Horizontal & Vertical Parity Syndrome Computation:
                  - Horizontal parity bits H[0:3] check 4 rows of 4 bits.
                  - Vertical parity bits V[0:3] check 4 columns of 4 bits.
                  - Bit E[0] is XORed into P[6:4] and P[2:0] at the encoder.
                  - Single-bit error at E[4r+c] ((r,c) != (0,0)) produces 
                    weight(SH) == 1 and weight(SV) == 1.
                  - Single-bit error at E[0] ((r,c) == (0,0)) produces 
                    SH == 4'b1111 and SV == 4'b1111.
               2. Differential Decoding (Two 8-bit Chains):
                  - U[0] = E[0], U[k] = E[k] ^ E[k-1] for k = 1..7
                  - U[8] = E[8], U[k] = E[k] ^ E[k-1] for k = 9..15

               Revision History:
               - Rev 1.0 (Initial) : 2D Parity Syndrome & Differential LPC(24,16) Decoder.
               - Rev 1.1 (2026-10-22 05:47 KST) : Updated timescale to 1ns/1ps 
                 for full simulation timing precision.
===========================================================================
*/

module lpc_dec (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        en,
    input  wire [23:0] data_in,
    output wire        flag,
    output wire [15:0] data_out
);

    reg        en_d0;
    reg [23:0] temp;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            en_d0 <= 1'b0;
            temp  <= 24'd0;
        end else begin
            en_d0 <= en;
            temp  <= data_in;
        end
    end

    // Extract received Differential bits E_rx[0:15] and Parity bits P_rx[7:0]
    wire [0:15] E_rx = {temp[23], temp[22], temp[21], temp[20], temp[19], temp[18], temp[17], temp[16],
                        temp[15], temp[14], temp[13], temp[12], temp[11], temp[10], temp[9],  temp[8]};
    wire [7:0]  P_rx = temp[7:0];

    // Recompute Horizontal (H_calc) and Vertical (V_calc) parity over E_rx[0:15]
    wire [0:3] H_calc;
    wire [0:3] V_calc;
    wire [7:0] P_calc;

    assign H_calc[0] = E_rx[0]  ^ E_rx[1]  ^ E_rx[2]  ^ E_rx[3];
    assign H_calc[1] = E_rx[4]  ^ E_rx[5]  ^ E_rx[6]  ^ E_rx[7];
    assign H_calc[2] = E_rx[8]  ^ E_rx[9]  ^ E_rx[10] ^ E_rx[11];
    assign H_calc[3] = E_rx[12] ^ E_rx[13] ^ E_rx[14] ^ E_rx[15];

    assign V_calc[0] = E_rx[0]  ^ E_rx[4]  ^ E_rx[8]  ^ E_rx[12];
    assign V_calc[1] = E_rx[1]  ^ E_rx[5]  ^ E_rx[9]  ^ E_rx[13];
    assign V_calc[2] = E_rx[2]  ^ E_rx[6]  ^ E_rx[10] ^ E_rx[14];
    assign V_calc[3] = E_rx[3]  ^ E_rx[7]  ^ E_rx[11] ^ E_rx[15];

    assign P_calc[7] = ~H_calc[0];
    assign P_calc[6] = ~(E_rx[0] ^ H_calc[1]);
    assign P_calc[5] = ~(E_rx[0] ^ H_calc[2]);
    assign P_calc[4] = ~(E_rx[0] ^ H_calc[3]);

    assign P_calc[3] = V_calc[0];
    assign P_calc[2] = (E_rx[0] ^ V_calc[1]);
    assign P_calc[1] = (E_rx[0] ^ V_calc[2]);
    assign P_calc[0] = (E_rx[0] ^ V_calc[3]);

    // 2D Parity Syndrome Vectors (Exposed for SDA OISL Theory Verification)
    wire [0:3] SH = {P_rx[7] ^ P_calc[7], P_rx[6] ^ P_calc[6], P_rx[5] ^ P_calc[5], P_rx[4] ^ P_calc[4]};
    wire [0:3] SV = {P_rx[3] ^ P_calc[3], P_rx[2] ^ P_calc[2], P_rx[1] ^ P_calc[1], P_rx[0] ^ P_calc[0]};

    wire sh_one = (SH == 4'b1000) || (SH == 4'b0100) || (SH == 4'b0010) || (SH == 4'b0001);
    wire sv_one = (SV == 4'b1000) || (SV == 4'b0100) || (SV == 4'b0010) || (SV == 4'b0001);
    wire can_correct_rc = sh_one && sv_one;
    wire can_correct_e0 = (SH == 4'b1111) && (SV == 4'b1111);

    wire [0:15] E;
    assign E[0] = E_rx[0] ^ can_correct_e0;

    genvar idx;
    generate
        for (idx = 1; idx < 16; idx = idx + 1) begin : gen_err_corr
            assign E[idx] = E_rx[idx] ^ (can_correct_rc & SH[idx / 4] & SV[idx % 4]);
        end
    endgenerate

    // Differential Decoding: U[k] = E[k] ^ E[k-1]
    wire [0:15] U;
    assign U[0]  = E[0];
    assign U[1]  = E[1]  ^ E[0];
    assign U[2]  = E[2]  ^ E[1];
    assign U[3]  = E[3]  ^ E[2];
    assign U[4]  = E[4]  ^ E[3];
    assign U[5]  = E[5]  ^ E[4];
    assign U[6]  = E[6]  ^ E[5];
    assign U[7]  = E[7]  ^ E[6];

    assign U[8]  = E[8];
    assign U[9]  = E[9]  ^ E[8];
    assign U[10] = E[10] ^ E[9];
    assign U[11] = E[11] ^ E[10];
    assign U[12] = E[12] ^ E[11];
    assign U[13] = E[13] ^ E[12];
    assign U[14] = E[14] ^ E[13];
    assign U[15] = E[15] ^ E[14];

    assign flag     = en_d0;
    assign data_out = (flag) ? {U[0], U[1], U[2],  U[3],  U[4],  U[5],  U[6],  U[7],
                                U[8], U[9], U[10], U[11], U[12], U[13], U[14], U[15]} : 16'd0;

endmodule