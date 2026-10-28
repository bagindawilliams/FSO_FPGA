`timescale 1ns / 1ps
/*
===========================================================================
Description  : Low-Density Parity Check (LPC) Sub-module.
               CRITICAL FIX (Data-Parity Misalignment):
               - Removed the clocked registers for P[7:0].
               - Converted the lengthy IF-ELSE parity generation into 
                 pure combinational XOR/XNOR gates.
               - This guarantees that Data (E) and Parity (P) emerge on 
                 the exact same clock cycle without shifting/mixing.

Revision History:
  - Rev 1.0 (Initial) : Combinational differential encoder (E[0:15]) and 2D parity (P[7:0]).
  - Rev 2.0 (2026-10-27 04:09 KST) : [ETRI Audit Item 6 - SDA OISL Page 40-41, Sec. 2.6.3.6.8,
    Figure 2-13 & Figure 2-14]:
    1. Added explicit Running Disparity accumulation state (running_disparity,
       cw_ones_cnt, cw_disparity, disp_invert_active) to implement Active Disparity
       Management across each 259-cycle frame (resetting to 0 between frames since
       Preamble has zero disparity per Sec. 2.6.3.6.8).
    2. Verified exact 24-bit codeword bit ordering per Figure 2-14:
       {e_0,0 .. e_3,3, ph_0 .. ph_3, pv_0 .. pv_3} = {E[0:15], P[7:0]} with e_0,0 at MSB.
===========================================================================
*/
module lpc #(
    parameter ACTIVE_DISP_INV_EN = 0 // 0 = Parity-embedded disparity (default compatible with 2D syndrome), 1 = Full-word bitwise inversion
)(
    input               clk,
    input               rst_n,
    input               en,
    input   [15:0]      data_in,
    output              flag,
    output  [23:0]      data_out
);

    reg         en_d0;
    reg  [15:0] temp;

    wire [0:15] U;
    wire [0:15] E;
    wire [0:3]  H;
    wire [0:3]  V;
    wire [7:0]  P; // CRITICAL: Converted to combinational wire

    // 1-Cycle Pipeline Delay for Input
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            en_d0 <= 1'b0;
            temp  <= 16'b0;
        end else begin
            en_d0 <= en;
            temp  <= data_in;
        end
    end

    // Combinational Math for Encryption 'E' (Figure 2-13 Differential Encoding)
    assign U    = {temp[15], temp[14], temp[13], temp[12], temp[11], temp[10], temp[9], temp[8], 
                   temp[7],  temp[6],  temp[5],  temp[4],  temp[3],  temp[2],  temp[1], temp[0]};

    assign E[0]  = U[0];
    assign E[1]  = U[1]  ^ E[0];
    assign E[2]  = U[2]  ^ E[1];
    assign E[3]  = U[3]  ^ E[2];
    assign E[4]  = U[4]  ^ E[3];
    assign E[5]  = U[5]  ^ E[4];
    assign E[6]  = U[6]  ^ E[5];
    assign E[7]  = U[7]  ^ E[6];
    assign E[8]  = U[8];
    assign E[9]  = U[9]  ^ E[8];
    assign E[10] = U[10] ^ E[9];
    assign E[11] = U[11] ^ E[10];
    assign E[12] = U[12] ^ E[11];
    assign E[13] = U[13] ^ E[12];
    assign E[14] = U[14] ^ E[13];
    assign E[15] = U[15] ^ E[14];

    assign H[0]  = E[0]  ^ E[1]  ^ E[2]  ^ E[3];
    assign H[1]  = E[4]  ^ E[5]  ^ E[6]  ^ E[7];
    assign H[2]  = E[8]  ^ E[9]  ^ E[10] ^ E[11];
    assign H[3]  = E[12] ^ E[13] ^ E[14] ^ E[15];
    
    assign V[0]  = E[0]  ^ E[4]  ^ E[8]  ^ E[12];
    assign V[1]  = E[1]  ^ E[5]  ^ E[9]  ^ E[13];
    assign V[2]  = E[2]  ^ E[6]  ^ E[10] ^ E[14];
    assign V[3]  = E[3]  ^ E[7]  ^ E[11] ^ E[15];

    // CRITICAL: Combinational Math for Parity 'P' (Eliminates 1-Cycle Delay Bug)
    // P[7:4] = {ph_0, ph_1, ph_2, ph_3}, P[3:0] = {pv_0, pv_1, pv_2, pv_3} per Figure 2-14
    assign P[7] = ~H[0];
    assign P[6] = ~(E[0] ^ H[1]); // XNOR Gate implementation
    assign P[5] = ~(E[0] ^ H[2]);
    assign P[4] = ~(E[0] ^ H[3]);
    
    assign P[3] = V[0];
    assign P[2] = (E[0] ^ V[1]);  // XOR Gate implementation
    assign P[1] = (E[0] ^ V[2]);
    assign P[0] = (E[0] ^ V[3]);

    // =========================================================================
    // [Rev 2.0 - 2026-10-27 04:09 KST] ACTIVE DISPARITY MANAGEMENT (Sec. 2.6.3.6.8)
    // Tracks Running Disparity (RD) across 24-bit LPC codewords:
    //   cw_disparity = 2 * (number of 1s in 24-bit codeword) - 24
    // If RD and cw_disparity share the same non-zero sign, disp_invert_active = 1
    // and RD_next = RD - cw_disparity; otherwise RD_next = RD + cw_disparity.
    // =========================================================================
    wire [23:0] raw_codeword = {E[0], E[1], E[2], E[3], E[4], E[5], E[6], E[7],
                                E[8], E[9], E[10], E[11], E[12], E[13], E[14], E[15], P};

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

    wire [4:0]         cw_ones_cnt        = count_ones_24(raw_codeword);
    wire signed [6:0]  cw_disparity       = $signed({1'b0, cw_ones_cnt, 1'b0}) - 7'sd24;
    reg  signed [11:0] running_disparity;

    wire disp_invert_active = en_d0 && (
        ((running_disparity > 12'sd0) && (cw_disparity > 7'sd0)) ||
        ((running_disparity < 12'sd0) && (cw_disparity < 7'sd0))
    );

    wire signed [11:0] next_running_disparity = disp_invert_active ?
        (running_disparity - {{5{cw_disparity[6]}}, cw_disparity}) :
        (running_disparity + {{5{cw_disparity[6]}}, cw_disparity});

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            running_disparity <= 12'sd0;
        end else if (en_d0) begin
            running_disparity <= next_running_disparity;
        end else begin
            // Reset running disparity to 0 at frame boundary (Preamble has 0 disparity)
            running_disparity <= 12'sd0;
        end
    end

    wire [23:0] managed_codeword = (ACTIVE_DISP_INV_EN && disp_invert_active) ? ~raw_codeword : raw_codeword;

    // Output Assembly (Figure 2-14: e_0,0 at bit 23 down to pv_3 at bit 0)
    assign flag     = en_d0;
    assign data_out = en_d0 ? managed_codeword : 24'd0;

endmodule