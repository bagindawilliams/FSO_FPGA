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
    input               clk,
    input               rst_n,
    input               en,
    output              flag,
    output  [31:0]      data_out
);

parameter   max     = 240;
reg     [31:0]      sample  [0:max];
reg     [7:0]       count   = 8'd0;

initial
    $readmemh("sample.mem", sample);

parameter   IDLE        = 3'b001;
parameter   ACTIVE      = 3'b010;
parameter   END         = 3'b100;

reg     [2:0]   state;
reg     [2:0]   next_state;

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
        count   <= 8'd0;
    else if (state == ACTIVE)
        count   <= count + 1'b1;
    else
        count   <= 8'd0;
end

always @(*)
begin
    case(state)
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

assign  flag        = (state == ACTIVE);
assign  data_out    = (flag) ? sample[count] : 32'b0;



endmodule