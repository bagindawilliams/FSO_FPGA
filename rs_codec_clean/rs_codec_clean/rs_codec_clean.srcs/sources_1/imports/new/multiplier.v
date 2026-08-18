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


module multiplier (
    input   [7:0]   a,
    input   [7:0]   b,
    output  [7:0]   r
);

reg [7:0]   r_reg,
            a_temp,
            b_temp;

integer i;
always @(*) begin
    r_reg   = 8'b0;
    a_temp  = a;
    b_temp  = b;
    
    for (i = 0; i < 8; i = i + 1) begin
        if (b_temp[0])
            r_reg   = r_reg ^ a_temp;
        if (a_temp[7])
            a_temp  = (a_temp << 1) ^ 8'h1d;
        else
            a_temp  = (a_temp << 1);
        b_temp  = b_temp >> 1;
    end
end

assign  r   = r_reg;








endmodule







