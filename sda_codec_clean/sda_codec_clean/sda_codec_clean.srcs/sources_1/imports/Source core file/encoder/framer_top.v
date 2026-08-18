`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2025 12:13:31 PM
// Design Name: 
// Module Name: framer_top
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


module framer_top(
    input               clk,
    input               rst_n,
    input               en,
    input   [31:0]      data_in,
    output              header_dv,
    output              payload_dv,
    output  [7:0]       header,
    output  [31:0]      payload
);

wire    c16_dv;
wire    [7:0]       crc_16;
wire    c32_dv;
wire    [31:0]      crc_32;

framer framer_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in)
    ,.header_dv     (c16_dv)
    ,.header        (crc_16)
    ,.payload_dv    (c32_dv)
    ,.payload       (crc_32)
);

crc_16 #(.max(15)) crc_16_inst(
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (c16_dv)
    ,.data_in       (crc_16)
    ,.flag          (header_dv)
    ,.data_out      (header)
);

crc_32 #(.max(477)) crc_32_inst(
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (c32_dv)
    ,.data_in       (crc_32)
    ,.flag          (payload_dv)
    ,.data_out      (payload)
);







endmodule











