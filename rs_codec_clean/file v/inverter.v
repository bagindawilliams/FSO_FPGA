`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/13/2025 03:03:37 PM
// Design Name: 
// Module Name: inverter
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


module inverter (
    input   [7:0]   a,
    output  [7:0]   r
);

parameter   max     = 255;

wire [7:0]  alpha_a,
            alpha_r;
reg [7:0] alpha_value       [0:max];
reg [7:0] decimal_value     [0:max];

initial begin
    $readmemh("alpha_value.mem", alpha_value);
    $readmemh("decimal_value.mem", decimal_value);
end

assign r    = decimal_value[alpha_r];
assign alpha_a  = alpha_value[a];
assign alpha_r  = (alpha_a == max) ? (alpha_a == 8'b0) ?
                max : 8'b0 : (alpha_a - (alpha_a * 2) + max);





endmodule






