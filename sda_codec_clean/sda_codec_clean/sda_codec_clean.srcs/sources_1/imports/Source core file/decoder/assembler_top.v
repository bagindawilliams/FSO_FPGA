`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2025 11:38:09 AM
// Design Name: 
// Module Name: assembler_top
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


module assembler_top(
    input               clk,
    input               rst_n,
    input               en_head,
    input               en_load,
    input   [7:0]       header_in,
    input   [31:0]      payload_in,
    output              flag,
    output  [31:0]      data_out
);

wire    c16_dv;
wire    c32_dv;
wire    [7:0]       crc_16;
wire    [31:0]      crc_32;

crc_16 #(.max(16)) crc_16_inst(
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en_head)
    ,.data_in       (header_in)
    ,.flag          (c16_dv)
    ,.data_out      (crc_16)
);

crc_32 #(.max(478)) crc_32_inst(
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en_load)
    ,.data_in       (payload_in)
    ,.flag          (c32_dv)
    ,.data_out      (crc_32)
);

assembler assembler_inst (
    .clk                (clk)
    ,.rst_n             (rst_n)
    ,.en_head           (c16_dv)
    ,.en_load           (c32_dv)
    ,.header_in         (crc_16)
    ,.payload_in        (crc_32)
    ,.flag              (flag)
    ,.data_out          (data_out)
);






endmodule












