`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Kookmin University / ETRI Daejon
// Engineer: 
// 
// Create Date: 2026/08/20 11:09:22 AM
// Design Name: 
// Module Name: top
// Project Name: ETRI FSO Channel Coding
// Target Devices: 
// Tool Versions: Vivado 2025.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top(
    input       sys_clk_p,
    input       sys_clk_n,
    output      fan
);

wire    rst_n;
assign  rst_n   = 1'b1;
assign  fan     = 1'b0;

(*mark_debug = "true" *)wire    en;
wire    sys_clk;
wire    clk_gth;
wire    clk_logic;

(*mark_debug = "true" *)wire    data_dv;
(*mark_debug = "true" *)wire    [31:0]      data_in;

(*mark_debug = "true" *)wire    tx_dv;
(*mark_debug = "true" *)wire    [31:0]      tx_data;

(*mark_debug = "true" *)wire    fso_dv;
(*mark_debug = "true" *)wire    [31:0]      fso_data;

(*mark_debug = "true" *)wire    flag;
(*mark_debug = "true" *)wire    [31:0]      data_out;

IBUFGDS sys_clk_inst (
    .I      (sys_clk_p)
    ,.IB    (sys_clk_n)
    ,.O     (sys_clk)
);

clk_wiz_0 clk_wiz_0_inst (
    .clk_in1        (sys_clk)
    ,.clk_out1      (clk_gth)
);

clk_wiz_1 clk_wiz_1_inst (
    .clk_in1        (sys_clk)
    ,.clk_out1      (clk_logic)
);

autorun autorun_inst (
    .clk            (clk_gth)
    ,.rst_n         (rst_n)
    ,.flag          (en)
);

stream_input stream_input_inst (
    .clk            (clk_gth)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.flag          (data_dv)
    ,.data_out      (data_in)
);

encoder_top encoder_top_inst (
    .clk_gth        (clk_gth)
    ,.clk_logic     (clk_logic)
    ,.rst_n         (rst_n)
    ,.en            (data_dv)
    ,.data_in       (data_in)
    ,.flag          (tx_dv)
    ,.data_out      (tx_data)
);

error_inject error_inject_inst (
    .clk            (clk_gth)
    ,.rst_n         (rst_n)
    ,.en            (tx_dv)
    ,.data_in       (tx_data)
    ,.flag          (fso_dv)
    ,.data_out      (fso_data)
);

decoder_top decoder_top_inst (
    .clk_gth        (clk_gth)
    ,.clk_logic     (clk_logic)
    ,.rst_n         (rst_n)
    ,.en            (fso_dv)
    ,.data_in       (fso_data)
    ,.flag          (flag)
    ,.data_out      (data_out)
);



endmodule


