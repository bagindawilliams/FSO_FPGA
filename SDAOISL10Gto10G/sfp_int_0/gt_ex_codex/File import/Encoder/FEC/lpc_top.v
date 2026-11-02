`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2025 10:16:45 AM
// Design Name: 
// Module Name: lpc_top
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


module lpc_top(
    input               clk,
    input               rst_n,
    input               en,
    input   [63:0]      data_in,
    output              flag,
    output  [95:0]      data_out
);

lpc lpc_3 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [63:48])
    ,.flag          (flag)
    ,.data_out      (data_out   [95:72])
);

lpc lpc_2 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [47:32])
    ,.flag          ()
    ,.data_out      (data_out   [71:48])
);

lpc lpc_1 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [31:16])
    ,.flag          ()
    ,.data_out      (data_out   [47:24])
);

lpc lpc_0 (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (en)
    ,.data_in       (data_in    [15:0])
    ,.flag          ()
    ,.data_out      (data_out   [23:0])
);







endmodule








