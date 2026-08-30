`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2025 12:40:30 PM
// Design Name: 
// Module Name: rs_decoder_64
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


module rs_decoder_64(
    input               clk,
    input               rst_n,
    input               en,
    input   [63:0]      data_in,
    output              flag,
    output  [63:0]      data_out
);

rs_decoder rs_decoder_7 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [63:56])
    ,.flag          (flag)
    ,.data_out      (data_out   [63:56])
);

rs_decoder rs_decoder_6 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [55:48])
    ,.flag          ()
    ,.data_out      (data_out   [55:48])
);

rs_decoder rs_decoder_5 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [47:40])
    ,.flag          ()
    ,.data_out      (data_out   [47:40])
);

rs_decoder rs_decoder_4 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [39:32])
    ,.flag          ()
    ,.data_out      (data_out   [39:32])
);

rs_decoder rs_decoder_3 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [31:24])
    ,.flag          ()
    ,.data_out      (data_out   [31:24])
);

rs_decoder rs_decoder_2 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [23:16])
    ,.data_out      (data_out   [23:16])
);

rs_decoder rs_decoder_1 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [15:8])
    ,.flag          ()
    ,.data_out      (data_out   [15:8])
);

rs_decoder rs_decoder_0 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [7:0])
    ,.flag          ()
    ,.data_out      (data_out   [7:0])
);



endmodule





