`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2025 01:12:46 PM
// Design Name: 
// Module Name: decoder_top
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


module decoder_top(
    input               clk_gth,
    input               clk_logic,
    input               rst_n,
    input               en,
    input   [31:0]      data_in,
    output              flag,
    output  [31:0]      data_out
);

wire    core_dv;
wire    [95:0]      core_data;

wire    rs_head_dv;
wire    [7:0]       rs_head;
wire    rs_load_dv;
wire    [63:0]      rs_load;

wire    header_dv;
wire    [7:0]       header;
wire    payload_dv;
wire    [31:0]      payload;

rx_gth_logic rx_gth_logic_inst (
    .clk_gth            (clk_gth)
    ,.clk_logic         (clk_logic)
    ,.rst_n             (rst_n)
    ,.en                (en)
    ,.data_in           (data_in)
    ,.flag              (core_dv)
    ,.data_out          (core_data)
);

core_rx core_rx_inst (
    .clk                (clk_logic)
    ,.rst_n             (rst_n)
    ,.en                (core_dv)
    ,.data_in           (core_data)
    ,.header_dv         (rs_head_dv)
    ,.header            (rs_head)
    ,.payload_dv        (rs_load_dv)
    ,.payload           (rs_load)
);

rx_logic_gth rx_logic_gth_inst (
    .clk_gth            (clk_gth)
    ,.clk_logic         (clk_logic)
    ,.rst_n             (rst_n)
    ,.en_head           (rs_head_dv)
    ,.en_load           (rs_load_dv)
    ,.header_in         (rs_head)
    ,.payload_in        (rs_load)
    ,.header_dv         (header_dv)
    ,.header            (header)
    ,.payload_dv        (payload_dv)
    ,.payload           (payload)
);

assembler_top assembler_top_inst (
    .clk                (clk_gth)
    ,.rst_n             (rst_n)
    ,.en_head           (header_dv)
    ,.en_load           (payload_dv)
    ,.header_in         (header)
    ,.payload_in        (payload)
    ,.flag              (flag)
    ,.data_out          (data_out)
);







endmodule







