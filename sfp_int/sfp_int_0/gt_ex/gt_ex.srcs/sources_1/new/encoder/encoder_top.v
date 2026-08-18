`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2025 06:46:33 PM
// Design Name: 
// Module Name: encoder_top
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


module encoder_top(
    input               clk_gth,
    input               clk_logic,
    input               rst_n,
    input               en,
    input   [31:0]      data_in,
    output              flag,
    output  [31:0]      data_out
);

wire    c16_dv;
wire    [7:0]       crc_16;
wire    c32_dv;
wire    [31:0]      crc_32;

wire    header_dv;
wire    [7:0]       header;
wire    payload_dv;
wire    [63:0]      payload;

wire    core_dv;
wire    [95:0]      core_data;

framer_top framer_top_inst (
    .clk                (clk_gth)
    ,.rst_n             (rst_n)
    ,.en                (en)
    ,.data_in           (data_in)
    ,.header_dv         (c16_dv)
    ,.header            (crc_16)
    ,.payload_dv        (c32_dv)
    ,.payload           (crc_32)
);

x_gth_logic x_gth_logic_inst (
    .clk_gth            (clk_gth)
    ,.clk_logic         (clk_logic)
    ,.rst_n             (rst_n)
    ,.en_head           (c16_dv)
    ,.en_load           (c32_dv)
    ,.header_in         (crc_16)
    ,.payload_in        (crc_32)
    ,.header_dv         (header_dv)
    ,.header            (header)
    ,.payload_dv        (payload_dv)
    ,.payload           (payload)
);

core_tx core_tx_inst (
    .clk                (clk_logic)
    ,.rst_n             (rst_n)
    ,.en_head           (header_dv)
    ,.en_load           (payload_dv)
    ,.header            (header)
    ,.payload           (payload)
    ,.flag              (core_dv)
    ,.data_out          (core_data)
);

x_logic_gth x_logic_gth_inst (
    .clk_gth        (clk_gth)
    ,.clk_logic     (clk_logic)
    ,.rst_n         (rst_n)
    ,.en            (core_dv)
    ,.data_in       (core_data)
    ,.flag          (flag)
    ,.data_out      (data_out)
);






endmodule






