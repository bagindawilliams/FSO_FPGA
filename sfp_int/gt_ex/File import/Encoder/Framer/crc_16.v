`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2025 02:08:47 PM
// Design Name: 
// Module Name: crc_16
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


module crc_16 # (parameter max = 15) (
    input           clk,
    input           rst_n,
    input           en,
    input   [7:0]   data_in,
    output          flag,
    output  [7:0]   data_out
);

reg     [7:0]   count   = 8'd0;

localparam  IDLE        = 3'b001;
localparam  ACTIVE      = 3'b010;
localparam  END         = 3'b100;

reg     [2:0]   state;
reg     [2:0]   next_state;

reg     [7:0]   temp;
reg     [7:0]   crc_out;

wire    [15:0]  D;
reg     [15:0]  Q   = 16'b0;
reg     [15:0]  R   = 16'b0;

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

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        temp    <= 8'd0;
    else
        temp    <= data_in;
end

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        begin
            Q   <= 16'b0;
            R   <= 16'b0;
        end
    else if (state == ACTIVE)
        begin
            if (count < max)
                begin
                    Q   <= D;
                    if (count == max - 2)
                        R   <= D;
                end
            else
                begin
                    Q   <= 16'b0;
                    R   <= 16'b0;
                end
        end
end

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        crc_out     <= 16'b0;
    else if (state == ACTIVE)
        begin
            if (count < max - 1)
                crc_out     <= temp;
            else if (count == max - 1)
                crc_out     <= R[15:8];
            else if (count == max)
                crc_out     <= R[7:0];
        end
end

assign  D[0]    = Q[8] ^ Q[12] ^ temp[0] ^ temp[4];
assign  D[1]    = Q[9] ^ Q[13] ^ temp[1] ^ temp[5];
assign  D[2]    = Q[10] ^ Q[14] ^ temp[2] ^ temp[6];
assign  D[3]    = Q[11] ^ Q[15] ^ temp[3] ^ temp[7];
assign  D[4]    = Q[12] ^ temp[4];
assign  D[5]    = Q[8] ^ Q[12] ^ Q[13] ^ temp[0] ^ temp[4] ^ temp[5];
assign  D[6]    = Q[9] ^ Q[13] ^ Q[14] ^ temp[1] ^ temp[5] ^ temp[6];
assign  D[7]    = Q[10] ^ Q[14] ^ Q[15] ^ temp[2] ^ temp[6] ^ temp[7];
assign  D[8]    = Q[0] ^ Q[11] ^ Q[15] ^ temp[3] ^ temp[7];
assign  D[9]    = Q[1] ^ Q[12] ^ temp[4];
assign  D[10]   = Q[2] ^ Q[13] ^ temp[5];
assign  D[11]   = Q[3] ^ Q[14] ^ temp[6];
assign  D[12]   = Q[4] ^ Q[8] ^ Q[12] ^ Q[15] ^ temp[0] ^ temp[4] ^ temp[7];
assign  D[13]   = Q[5] ^ Q[9] ^ Q[13] ^ temp[1] ^ temp[5];
assign  D[14]   = Q[6] ^ Q[10] ^ Q[14] ^ temp[2] ^ temp[6];
assign  D[15]   = Q[7] ^ Q[11] ^ Q[15] ^ temp[3] ^ temp[7];

assign  flag        = (count != 0);
assign  data_out    = (flag) ? crc_out : 16'b0;






endmodule



