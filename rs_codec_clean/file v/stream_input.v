`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2025 02:08:47 PM
// Design Name: 
// Module Name: stream_input
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


module stream_input(
    input           sys_clk,
    input           rst_n,
    input           en,
    output          valid,
    output  [7:0]   data_out
);

// payload ~ 239, header ~ 16
parameter   max     = 239;
reg [7:0]   count   = 8'b0;

parameter   IDLE    = 4'h1,
            ACTIVE  = 4'h2,
            END     = 4'h8;

reg [3:0]   state, next_state;

always @(posedge sys_clk)
    state   <= (~rst_n) ? IDLE : next_state;

always @(posedge sys_clk) begin
    if (~rst_n)
        count   <= 8'b0;
    else if (state == ACTIVE)
        count   <= count + 1'b1;
    else
        count   <= 8'b0;
end

always @(*) begin
    case (state)
        IDLE:           begin
                            if (en)
                                next_state  <= ACTIVE;
                            else
                                next_state  <= IDLE;
                        end
        ACTIVE:         begin
                            if (count < max)
                                next_state  <= ACTIVE;
                            else
                                next_state  <= END;
                        end
        END:            next_state  <= IDLE;
        default:        next_state  <= IDLE;
    endcase
end

assign  valid       = (state == ACTIVE && count > 0);
assign  data_out    = (valid ) ? count : 8'b0;








endmodule