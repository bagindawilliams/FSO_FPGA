`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 06:26:34 PM
// Design Name: 
// Module Name: error_inject
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


module error_inject (
    input           sys_clk,
    input           rst_n,
    input           de,
    input   [7:0]   data_in,
    output          valid,
    output  [7:0]   data_out
);

parameter   max_error   = 7;
// payload ~ 254, header ~ 31
parameter   max_pad     = 254 - max_error;

reg [7:0]   error   [0:max_error];
reg [15:0]  con_error   = 16'b0,
            con_pad     = 16'b0;
initial
    $readmemh("error.mem", error);

parameter   IDLE    = 4'h1,
            ERROR   = 4'h2,
            PAD     = 4'h4,
            END     = 4'h8;
reg [3:0]   state, next_state;
reg [7:0]   data_d0, error_out;

always @(posedge sys_clk)
    state   <= (~rst_n) ? IDLE : next_state;

always @(posedge sys_clk) begin
    if (~rst_n)
        con_error   <= 16'b0;
    else if (state == ERROR)
        con_error   <= con_error + 1'b1;
    else
        con_error   <= 16'b0;
end

always @(posedge sys_clk) begin
    if (~rst_n)
        con_pad   <= 16'b0;
    else if (state == PAD)
        con_pad   <= con_pad + 1'b1;
    else
        con_pad   <= 16'b0;
end

always @(*) begin
    case (state)
        IDLE:           begin
                            if (de)
                                next_state  <= ERROR;
                            else
                                next_state  <= IDLE;
                        end
        ERROR:          begin
                            if (con_error < max_error)
                                next_state  <= ERROR;
                            else
                                next_state  <= PAD;
                        end
        PAD:            begin
                            if (con_pad < max_pad)
                                next_state  <= PAD;
                            else
                                next_state  <= END;
                        end
        END:            next_state  <= IDLE;
        default:        next_state  <= IDLE;
    endcase
end

always @(posedge sys_clk)
    data_d0     <= (~rst_n) ? 8'b0 : data_in;

always @(posedge sys_clk) begin
    if (~rst_n)
        error_out   <= 8'b0;
    else if (state == ERROR)
        error_out   <= error[con_error] ^ data_d0;
    else if (state == PAD)
        error_out   <= data_d0;
    else
        error_out   <= 8'b0;
end

assign  valid   = (con_error > 0 && state == ERROR || state == PAD);
assign  data_out    = (valid) ? error_out : 8'b0;







endmodule