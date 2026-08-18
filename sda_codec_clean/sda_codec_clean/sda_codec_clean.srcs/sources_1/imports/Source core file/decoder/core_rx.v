`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2025 06:04:20 PM
// Design Name: 
// Module Name: core_rx
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


module core_rx(
    input               clk,
    input               rst_n,
    input               en,
    input   [95:0]      data_in,
    output              header_dv,
    output  [7:0]       header,
    output              payload_dv,
    output  [63:0]      payload
);

wire    lpc_dv;
wire    [63:0]      lpc;
wire    scrambler_dv;
wire    [63:0]      scrambler;

wire    rs_head_dv;
wire    [7:0]       rs_head;
wire    rs_load_dv;
wire    [63:0]      rs_load;

lpc_dec_top lpc_dec_top_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in)
    ,.flag          (lpc_dv)
    ,.data_out      (lpc)
);

scrambler scrambler_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (lpc_dv)
    ,.data_in       (lpc)
    ,.flag          (scrambler_dv)
    ,.data_out      (scrambler)
);

separator separator_inst (
    .clk                (clk)
    ,.rst_n             (rst_n)
    ,.en                (scrambler_dv)
    ,.data_in           (scrambler)
    ,.header_dv         (rs_head_dv)
    ,.header            (rs_head)
    ,.payload_dv        (rs_load_dv)
    ,.payload           (rs_load)
);

rs_decoder #(33) rs_decoder_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (rs_head_dv)
    ,.data_in       (rs_head)
    ,.flag          (header_dv)
    ,.data_out      (header)
);

rs_decoder_64 rs_decoder_64_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (rs_load_dv)
    ,.data_in       (rs_load)
    ,.flag          (payload_dv)
    ,.data_out      (payload)
);





endmodule






