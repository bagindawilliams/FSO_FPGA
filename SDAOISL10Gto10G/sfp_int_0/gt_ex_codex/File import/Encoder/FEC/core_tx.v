`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2025 05:32:39 PM
// Design Name: 
// Module Name: core_tx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module core_tx(
    input               clk,
    input               rst_n,
    input               en_head,
    input               en_load,
    input   [7:0]       header,
    input   [63:0]      payload,
    output              flag,
    output  [95:0]      data_out
);

wire    encoder_dv;
wire    [7:0]       rs_head;
wire    [63:0]      rs_load;

wire    combiner_dv;
wire    [63:0]      combiner;
wire    scrambler_dv;
wire    [63:0]      scrambler;

rs_encoder #(31) rs_enc_header_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en_head)
    ,.data_in       (header)
    ,.flag          (encoder_dv)
    ,.data_out      (rs_head)
);

rs_encoder_64 rs_encoder_64_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en_load)
    ,.data_in       (payload)
    ,.flag          ()
    ,.data_out      (rs_load)
);

combiner combiner_inst (
    .clk                (clk)
    ,.rst_n             (rst_n)
    ,.en                (encoder_dv)
    ,.header_in         (rs_head)
    ,.payload_in        (rs_load)
    ,.flag              (combiner_dv)
    ,.data_out          (combiner)
);

scrambler scrambler_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (combiner_dv)
    ,.data_in       (combiner)
    ,.flag          (scrambler_dv)
    ,.data_out      (scrambler)
);

lpc_top lpc_top_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (scrambler_dv)
    ,.data_in       (scrambler)
    ,.flag          (flag)
    ,.data_out      (data_out)
);





endmodule






