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
    input       clk,
    input       rst_n,
    output      flag
);

parameter   max     = 1119;     // 1332 or 1525 or 1119 sim
(*mark_debug = "true" *)reg     [15:0]  count   = 16'd0;

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        count   <= 16'd0;
    else if (count < max)
        count   <= count + 1'b1;
    else
        count   <= 16'd0;
end

assign  flag    = (count == 0);






endmodule