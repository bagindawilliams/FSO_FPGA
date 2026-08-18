`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2025 11:49:14 PM
// Design Name: 
// Module Name: autorun
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


module autorun(
    input       rst_n,
    input       sys_clk,
    output      flag
);

parameter   max     = 599;
reg [15:0]  count   = 16'b0;

always @(posedge sys_clk) begin
    if (~rst_n)
        count   <= 16'b0;
    else if (count < max)
        count   <= count + 1'b1;
    else
        count   <= 16'b0;
end

assign  flag    = (count == 1);






endmodule