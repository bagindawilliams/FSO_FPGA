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


module error_inject(
    input               clk,
    input               rst_n,
    input               en,
    input   [31:0]      data_in,
    output              flag,
    output  [31:0]      data_out
);

parameter   max_error   = 47;
parameter   max_pad     = 1035 - max_error;

reg     [31:0]      error   [0:max_error];
reg     [15:0]      con_error   = 16'd0;
reg     [15:0]      con_pad     = 16'd0;

initial
    $readmemh("error.mem", error);

parameter   IDLE        = 4'b0001;
parameter   ERROR       = 4'b0010;
parameter   PAD         = 4'b0100;
parameter   END         = 4'b1000;

reg     [3:0]   state;
reg     [3:0]   next_state;

reg     [31:0]      data_d0;
reg     [31:0]      error_out;

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        state   <= IDLE;
    else
        state   <= next_state;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        con_error   <= 16'd0;
    else if (state == ERROR)
        con_error   <= con_error + 1'b1;
    else
        con_error   <= 16'd0;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        con_pad   <= 16'd0;
    else if (state == PAD)
        con_pad   <= con_pad + 1'b1;
    else
        con_pad   <= 16'd0;
end

always @(*)
begin
    case(state)
        IDLE:           begin
                            if (en)
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

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        data_d0     <= 32'b0;
    else
        data_d0     <= data_in;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        error_out   <= 32'b0;
    else if (state == ERROR)
        error_out   <= error[con_error] ^ data_d0;
    else if (state == PAD)
        error_out   <= data_d0;
    else
        error_out   <= 32'b0;
end

assign  flag        = (con_error != 0 && state == ERROR || state == PAD);
assign  data_out    = (flag) ? error_out : 32'b0;




endmodule