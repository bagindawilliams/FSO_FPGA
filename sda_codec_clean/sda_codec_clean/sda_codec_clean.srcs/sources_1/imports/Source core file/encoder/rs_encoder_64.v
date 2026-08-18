`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2025 03:07:50 PM
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


module rs_encoder_64(
    input               clk,
    input               rst_n,
    input               en,
    input   [63:0]      data_in,
    output              flag,
    output  [63:0]      data_out
);

rs_encoder rs_encoder_7 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [63:56])
    ,.flag          (flag)
    ,.data_out      (data_out   [63:56])
);

rs_encoder rs_encoder_6 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [55:48])
    ,.data_out      (data_out   [55:48])
);

rs_encoder rs_encoder_5 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [47:40])
    ,.data_out      (data_out   [47:40])
);

rs_encoder rs_encoder_4 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [39:32])
    ,.data_out      (data_out   [39:32])
);

rs_encoder rs_encoder_3 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [31:24])
    ,.data_out      (data_out   [31:24])
);

rs_encoder rs_encoder_2 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [23:16])
    ,.data_out      (data_out   [23:16])
);

rs_encoder rs_encoder_1 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [15:8])
    ,.data_out      (data_out   [15:8])
);

rs_encoder rs_encoder_0 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [7:0])
    ,.data_out      (data_out   [7:0])
);



endmodule




