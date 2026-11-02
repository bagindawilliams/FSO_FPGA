`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : rs_encoder_64
Description  : 8-Lane Parallel 64-bit Reed-Solomon RS(255,239) Encoder.
               Instantiates 8 parallel byte-wide rs_encoder engines to 
               achieve 8-symbol (64-bit) symbol interleaving depth per 
               SDA OISL Section 2.6.3.6.3.

Revision History:
  - Rev 1.0 (Initial) : 8-lane parallel RS(255,239) encoder wrapper.
  - Rev 2.1 (2026-10-28 13:56 KST) : [Internal Audit Fix #2]
    Aligned default parameter MAX_CYCLE to 254 (0-indexed: 0..238 = 239 data
    cycles, 239..254 = 16 parity flush cycles; total = 255 cycles) to match
    core_tx.v instantiation and documentation.
===========================================================================
*/

module rs_encoder_64 #(parameter MAX_CYCLE = 254) (
    input           clk,
    input           rst_n,
    input           en,
    input   [63:0]  data_in,
    output          flag,
    output  [63:0]  data_out
);

    wire [7:0] f;
    assign flag = &f;

    rs_encoder #(MAX_CYCLE) rs_encoder_7 (clk, rst_n, en, data_in[63:56], f[7], data_out[63:56]);
    rs_encoder #(MAX_CYCLE) rs_encoder_6 (clk, rst_n, en, data_in[55:48], f[6], data_out[55:48]);
    rs_encoder #(MAX_CYCLE) rs_encoder_5 (clk, rst_n, en, data_in[47:40], f[5], data_out[47:40]);
    rs_encoder #(MAX_CYCLE) rs_encoder_4 (clk, rst_n, en, data_in[39:32], f[4], data_out[39:32]);
    rs_encoder #(MAX_CYCLE) rs_encoder_3 (clk, rst_n, en, data_in[31:24], f[3], data_out[31:24]);
    rs_encoder #(MAX_CYCLE) rs_encoder_2 (clk, rst_n, en, data_in[23:16], f[2], data_out[23:16]);
    rs_encoder #(MAX_CYCLE) rs_encoder_1 (clk, rst_n, en, data_in[15:8],  f[1], data_out[15:8]);
    rs_encoder #(MAX_CYCLE) rs_encoder_0 (clk, rst_n, en, data_in[7:0],   f[0], data_out[7:0]);

endmodule