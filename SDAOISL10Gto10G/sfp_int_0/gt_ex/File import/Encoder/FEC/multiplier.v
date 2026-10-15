`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2025 02:08:47 PM
// Design Name: 
// Module Name: multiplier
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


module multiplier(
    input   [7:0]   a,
    input   [7:0]   b,
    output  [7:0]   r
);

parameter   max     = 255;

wire    [7:0]   alpha_a;
wire    [7:0]   alpha_b;
wire    [7:0]   alpha_r;

reg     [7:0]   alpha_value     [0:max];
reg     [7:0]   decimal_value   [0:max];

initial begin
    $readmemh("alpha_value.mem", alpha_value);
    $readmemh("decimal_value.mem", decimal_value);
end

assign  alpha_a     = alpha_value[a];
assign  alpha_b     = alpha_value[b];
assign  alpha_r     = (alpha_a == max || alpha_b == max) ? max : (alpha_a + alpha_b) % max;
assign  r           = decimal_value[alpha_r];



endmodule








