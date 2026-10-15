`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2025 06:13:29 PM
// Design Name: 
// Module Name: lpc_dec_top
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


module lpc_dec_top(
    input               clk,
    input               rst_n,
    input               en,
    input   [95:0]      data_in,
    output              flag,
    output  [63:0]      data_out
);

lpc_dec lpc_3 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [95:72])
    ,.flag          (flag)
    ,.data_out      (data_out   [63:48])
);

lpc_dec lpc_2 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [71:48])
    ,.flag          ()
    ,.data_out      (data_out   [47:32])
);

lpc_dec lpc_1 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [47:24])
    ,.flag          ()
    ,.data_out      (data_out   [31:16])
);

lpc_dec lpc_0 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [23:0])
    ,.flag          ()
    ,.data_out      (data_out   [15:0])
);







endmodule








