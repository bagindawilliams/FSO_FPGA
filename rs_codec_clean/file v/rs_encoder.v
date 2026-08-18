`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2025 09:45:54 AM
// Design Name: 
// Module Name: rs_encoder
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


module rs_encoder #( parameter max = 254 )(
    input           sys_clk,
    input           rst_n,
    input           de,
    input   [7:0]   data_in,
    output          valid,
    output  [7:0]   data_out
);

reg [7:0]   count   = 8'b0;
localparam  IDLE    = 4'h1,
            ACTIVE  = 4'h2,
            FLUSH   = 4'h4,
            END     = 4'h8;
reg [3:0]   state, next_state;

reg [7:0]   data_d0;
reg [7:0]   Q [0:15];
wire [7:0]  D [0:15];
wire [7:0]  R [0:15];
wire [7:0]  C0, C1;

always @(posedge sys_clk)
    state   <= (~rst_n) ? IDLE : next_state;

always @(posedge sys_clk) begin
    if (~rst_n)
        count   <= 8'b0;
    else if (state == ACTIVE || state == FLUSH)
        count   <= count + 1'b1;
    else
        count   <= 8'b0;
end

always @(*) begin
    case (state)
        IDLE:           begin
                            if (de)
                                next_state  <= ACTIVE;
                            else
                                next_state  <= IDLE;
                        end
        ACTIVE:         begin
                            if (count < max - 16)
                                next_state  <= ACTIVE;
                            else
                                next_state  <= FLUSH;
                        end
        FLUSH:          begin
                            if (count < max)
                                next_state  <= FLUSH;
                            else
                                next_state  <= END;
                        end
        END:            next_state  <= IDLE;
        default:        next_state  <= IDLE;
    endcase
end

always @(posedge sys_clk)
    data_d0     <= (~rst_n) ? 8'b0 : data_in;

integer i;
always @(posedge sys_clk) begin
    if (~rst_n)
        for (i = 0; i < 16; i = i + 1)
            Q[i]  <= 8'b0;
    else if (state == ACTIVE || state == FLUSH)
        for (i = 0; i < 16; i = i + 1)
            Q[i]  <= D[i];
    else
        for (i = 0; i < 16; i = i + 1)
            Q[i]  <= 8'b0;
end

assign  D[0]    = R[0];
assign  D[1]    = R[1]  ^ Q[0];
assign  D[2]    = R[2]  ^ Q[1];
assign  D[3]    = R[3]  ^ Q[2];
assign  D[4]    = R[4]  ^ Q[3];
assign  D[5]    = R[5]  ^ Q[4];
assign  D[6]    = R[6]  ^ Q[5];
assign  D[7]    = R[7]  ^ Q[6];
assign  D[8]    = R[8]  ^ Q[7];
assign  D[9]    = R[9]  ^ Q[8];
assign  D[10]   = R[10] ^ Q[9];
assign  D[11]   = R[11] ^ Q[10];
assign  D[12]   = R[12] ^ Q[11];
assign  D[13]   = R[13] ^ Q[12];
assign  D[14]   = R[14] ^ Q[13];
assign  D[15]   = R[15] ^ Q[14];

assign  C0  = Q[15] ^ data_d0;
assign  C1  = (state == FLUSH) ? 8'b0 : C0;

assign  valid       = (state == ACTIVE || state == FLUSH);
assign  data_out    = (state == FLUSH) ? C0 : data_d0;

multiplier gf_0     (8'h3b, C1, R[0]);
multiplier gf_1     (8'h24, C1, R[1]);
multiplier gf_2     (8'h32, C1, R[2]);
multiplier gf_3     (8'h62, C1, R[3]);
multiplier gf_4     (8'he5, C1, R[4]);
multiplier gf_5     (8'h29, C1, R[5]);
multiplier gf_6     (8'h41, C1, R[6]);
multiplier gf_7     (8'ha3, C1, R[7]);
multiplier gf_8     (8'h08, C1, R[8]);
multiplier gf_9     (8'h1e, C1, R[9]);
multiplier gf_a     (8'hd1, C1, R[10]);
multiplier gf_b     (8'h44, C1, R[11]);
multiplier gf_c     (8'hbd, C1, R[12]);
multiplier gf_d     (8'h68, C1, R[13]);
multiplier gf_e     (8'h0d, C1, R[14]);
multiplier gf_f     (8'h3b, C1, R[15]);





endmodule