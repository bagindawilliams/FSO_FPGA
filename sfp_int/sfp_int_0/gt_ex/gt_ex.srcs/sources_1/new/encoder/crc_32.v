`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2025 03:57:25 PM
// Design Name: 
// Module Name: crc_32
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


module crc_32 # (parameter max = 477) (
    input               clk,
    input               rst_n,
    input               en,
    input   [31:0]      data_in,
    output              flag,
    output  [31:0]      data_out
);

reg     [15:0]   count  = 16'd0;

localparam  IDLE        = 3'b001;
localparam  ACTIVE      = 3'b010;
localparam  END         = 3'b100;

reg     [2:0]   state;
reg     [2:0]   next_state;

reg     [31:0]      temp;
reg     [31:0]      crc_out;

wire    [31:0]  D;
reg     [31:0]  Q   = 16'b0;
reg     [31:0]  R   = 16'b0;

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
        count   <= 16'd0;
    else if (state == ACTIVE)
        count   <= count + 1'b1;
    else
        count   <= 16'd0;
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
        temp    <= 32'd0;
    else
        temp    <= data_in;
end

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        Q   <= 32'b0;
    else if (state == ACTIVE)
        Q   <= D;
    else
        Q   <= 32'b0;
end

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        crc_out     <= 32'b0;
    else if (state == ACTIVE)
        begin
            if (count < max)
                crc_out     <= temp;
            else if (count == max)
                crc_out     <= Q;
        end
end

assign  D[0] = Q[0] ^ Q[6] ^ Q[9] ^ Q[10] ^ Q[12] ^ Q[16] ^ Q[24] ^ Q[25] ^ Q[26] ^ Q[28] ^ Q[29] ^ Q[30] ^ Q[31] ^ temp[0] ^ temp[6] ^ temp[9] ^ temp[10] ^ temp[12] ^ temp[16] ^ temp[24] ^ temp[25] ^ temp[26] ^ temp[28] ^ temp[29] ^ temp[30] ^ temp[31];
assign  D[1] = Q[0] ^ Q[1] ^ Q[6] ^ Q[7] ^ Q[9] ^ Q[11] ^ Q[12] ^ Q[13] ^ Q[16] ^ Q[17] ^ Q[24] ^ Q[27] ^ Q[28] ^ temp[0] ^ temp[1] ^ temp[6] ^ temp[7] ^ temp[9] ^ temp[11] ^ temp[12] ^ temp[13] ^ temp[16] ^ temp[17] ^ temp[24] ^ temp[27] ^ temp[28];
assign  D[2] = Q[0] ^ Q[1] ^ Q[2] ^ Q[6] ^ Q[7] ^ Q[8] ^ Q[9] ^ Q[13] ^ Q[14] ^ Q[16] ^ Q[17] ^ Q[18] ^ Q[24] ^ Q[26] ^ Q[30] ^ Q[31] ^ temp[0] ^ temp[1] ^ temp[2] ^ temp[6] ^ temp[7] ^ temp[8] ^ temp[9] ^ temp[13] ^ temp[14] ^ temp[16] ^ temp[17] ^ temp[18] ^ temp[24] ^ temp[26] ^ temp[30] ^ temp[31];
assign  D[3] = Q[1] ^ Q[2] ^ Q[3] ^ Q[7] ^ Q[8] ^ Q[9] ^ Q[10] ^ Q[14] ^ Q[15] ^ Q[17] ^ Q[18] ^ Q[19] ^ Q[25] ^ Q[27] ^ Q[31] ^ temp[1] ^ temp[2] ^ temp[3] ^ temp[7] ^ temp[8] ^ temp[9] ^ temp[10] ^ temp[14] ^ temp[15] ^ temp[17] ^ temp[18] ^ temp[19] ^ temp[25] ^ temp[27] ^ temp[31];
assign  D[4] = Q[0] ^ Q[2] ^ Q[3] ^ Q[4] ^ Q[6] ^ Q[8] ^ Q[11] ^ Q[12] ^ Q[15] ^ Q[18] ^ Q[19] ^ Q[20] ^ Q[24] ^ Q[25] ^ Q[29] ^ Q[30] ^ Q[31] ^ temp[0] ^ temp[2] ^ temp[3] ^ temp[4] ^ temp[6] ^ temp[8] ^ temp[11] ^ temp[12] ^ temp[15] ^ temp[18] ^ temp[19] ^ temp[20] ^ temp[24] ^ temp[25] ^ temp[29] ^ temp[30] ^ temp[31];
assign  D[5] = Q[0] ^ Q[1] ^ Q[3] ^ Q[4] ^ Q[5] ^ Q[6] ^ Q[7] ^ Q[10] ^ Q[13] ^ Q[19] ^ Q[20] ^ Q[21] ^ Q[24] ^ Q[28] ^ Q[29] ^ temp[0] ^ temp[1] ^ temp[3] ^ temp[4] ^ temp[5] ^ temp[6] ^ temp[7] ^ temp[10] ^ temp[13] ^ temp[19] ^ temp[20] ^ temp[21] ^ temp[24] ^ temp[28] ^ temp[29];
assign  D[6] = Q[1] ^ Q[2] ^ Q[4] ^ Q[5] ^ Q[6] ^ Q[7] ^ Q[8] ^ Q[11] ^ Q[14] ^ Q[20] ^ Q[21] ^ Q[22] ^ Q[25] ^ Q[29] ^ Q[30] ^ temp[1] ^ temp[2] ^ temp[4] ^ temp[5] ^ temp[6] ^ temp[7] ^ temp[8] ^ temp[11] ^ temp[14] ^ temp[20] ^ temp[21] ^ temp[22] ^ temp[25] ^ temp[29] ^ temp[30];
assign  D[7] = Q[0] ^ Q[2] ^ Q[3] ^ Q[5] ^ Q[7] ^ Q[8] ^ Q[10] ^ Q[15] ^ Q[16] ^ Q[21] ^ Q[22] ^ Q[23] ^ Q[24] ^ Q[25] ^ Q[28] ^ Q[29] ^ temp[0] ^ temp[2] ^ temp[3] ^ temp[5] ^ temp[7] ^ temp[8] ^ temp[10] ^ temp[15] ^ temp[16] ^ temp[21] ^ temp[22] ^ temp[23] ^ temp[24] ^ temp[25] ^ temp[28] ^ temp[29];
assign  D[8] = Q[0] ^ Q[1] ^ Q[3] ^ Q[4] ^ Q[8] ^ Q[10] ^ Q[11] ^ Q[12] ^ Q[17] ^ Q[22] ^ Q[23] ^ Q[28] ^ Q[31] ^ temp[0] ^ temp[1] ^ temp[3] ^ temp[4] ^ temp[8] ^ temp[10] ^ temp[11] ^ temp[12] ^ temp[17] ^ temp[22] ^ temp[23] ^ temp[28] ^ temp[31];
assign  D[9] = Q[1] ^ Q[2] ^ Q[4] ^ Q[5] ^ Q[9] ^ Q[11] ^ Q[12] ^ Q[13] ^ Q[18] ^ Q[23] ^ Q[24] ^ Q[29] ^ temp[1] ^ temp[2] ^ temp[4] ^ temp[5] ^ temp[9] ^ temp[11] ^ temp[12] ^ temp[13] ^ temp[18] ^ temp[23] ^ temp[24] ^ temp[29];
assign  D[10]   = Q[0] ^ Q[2] ^ Q[3] ^ Q[5] ^ Q[9] ^ Q[13] ^ Q[14] ^ Q[16] ^ Q[19] ^ Q[26] ^ Q[28] ^ Q[29] ^ Q[31] ^ temp[0] ^ temp[2] ^ temp[3] ^ temp[5] ^ temp[9] ^ temp[13] ^ temp[14] ^ temp[16] ^ temp[19] ^ temp[26] ^ temp[28] ^ temp[29] ^ temp[31];
assign  D[11] = Q[0] ^ Q[1] ^ Q[3] ^ Q[4] ^ Q[9] ^ Q[12] ^ Q[14] ^ Q[15] ^ Q[16] ^ Q[17] ^ Q[20] ^ Q[24] ^ Q[25] ^ Q[26] ^ Q[27] ^ Q[28] ^ Q[31] ^ temp[0] ^ temp[1] ^ temp[3] ^ temp[4] ^ temp[9] ^ temp[12] ^ temp[14] ^ temp[15] ^ temp[16] ^ temp[17] ^ temp[20] ^ temp[24] ^ temp[25] ^ temp[26] ^ temp[27] ^ temp[28] ^ temp[31];
assign  D[12] = Q[0] ^ Q[1] ^ Q[2] ^ Q[4] ^ Q[5] ^ Q[6] ^ Q[9] ^ Q[12] ^ Q[13] ^ Q[15] ^ Q[17] ^ Q[18] ^ Q[21] ^ Q[24] ^ Q[27] ^ Q[30] ^ Q[31] ^ temp[0] ^ temp[1] ^ temp[2] ^ temp[4] ^ temp[5] ^ temp[6] ^ temp[9] ^ temp[12] ^ temp[13] ^ temp[15] ^ temp[17] ^ temp[18] ^ temp[21] ^ temp[24] ^ temp[27] ^ temp[30] ^ temp[31];
assign  D[13] = Q[1] ^ Q[2] ^ Q[3] ^ Q[5] ^ Q[6] ^ Q[7] ^ Q[10] ^ Q[13] ^ Q[14] ^ Q[16] ^ Q[18] ^ Q[19] ^ Q[22] ^ Q[25] ^ Q[28] ^ Q[31] ^ temp[1] ^ temp[2] ^ temp[3] ^ temp[5] ^ temp[6] ^ temp[7] ^ temp[10] ^ temp[13] ^ temp[14] ^ temp[16] ^ temp[18] ^ temp[19] ^ temp[22] ^ temp[25] ^ temp[28] ^ temp[31];
assign  D[14] = Q[2] ^ Q[3] ^ Q[4] ^ Q[6] ^ Q[7] ^ Q[8] ^ Q[11] ^ Q[14] ^ Q[15] ^ Q[17] ^ Q[19] ^ Q[20] ^ Q[23] ^ Q[26] ^ Q[29] ^ temp[2] ^ temp[3] ^ temp[4] ^ temp[6] ^ temp[7] ^ temp[8] ^ temp[11] ^ temp[14] ^ temp[15] ^ temp[17] ^ temp[19] ^ temp[20] ^ temp[23] ^ temp[26] ^ temp[29];
assign  D[15] = Q[3] ^ Q[4] ^ Q[5] ^ Q[7] ^ Q[8] ^ Q[9] ^ Q[12] ^ Q[15] ^ Q[16] ^ Q[18] ^ Q[20] ^ Q[21] ^ Q[24] ^ Q[27] ^ Q[30] ^ temp[3] ^ temp[4] ^ temp[5] ^ temp[7] ^ temp[8] ^ temp[9] ^ temp[12] ^ temp[15] ^ temp[16] ^ temp[18] ^ temp[20] ^ temp[21] ^ temp[24] ^ temp[27] ^ temp[30];
assign  D[16] = Q[0] ^ Q[4] ^ Q[5] ^ Q[8] ^ Q[12] ^ Q[13] ^ Q[17] ^ Q[19] ^ Q[21] ^ Q[22] ^ Q[24] ^ Q[26] ^ Q[29] ^ Q[30] ^ temp[0] ^ temp[4] ^ temp[5] ^ temp[8] ^ temp[12] ^ temp[13] ^ temp[17] ^ temp[19] ^ temp[21] ^ temp[22] ^ temp[24] ^ temp[26] ^ temp[29] ^ temp[30];
assign  D[17] = Q[1] ^ Q[5] ^ Q[6] ^ Q[9] ^ Q[13] ^ Q[14] ^ Q[18] ^ Q[20] ^ Q[22] ^ Q[23] ^ Q[25] ^ Q[27] ^ Q[30] ^ Q[31] ^ temp[1] ^ temp[5] ^ temp[6] ^ temp[9] ^ temp[13] ^ temp[14] ^ temp[18] ^ temp[20] ^ temp[22] ^ temp[23] ^ temp[25] ^ temp[27] ^ temp[30] ^ temp[31];
assign  D[18] = Q[2] ^ Q[6] ^ Q[7] ^ Q[10] ^ Q[14] ^ Q[15] ^ Q[19] ^ Q[21] ^ Q[23] ^ Q[24] ^ Q[26] ^ Q[28] ^ Q[31] ^ temp[2] ^ temp[6] ^ temp[7] ^ temp[10] ^ temp[14] ^ temp[15] ^ temp[19] ^ temp[21] ^ temp[23] ^ temp[24] ^ temp[26] ^ temp[28] ^ temp[31];
assign  D[19] = Q[3] ^ Q[7] ^ Q[8] ^ Q[11] ^ Q[15] ^ Q[16] ^ Q[20] ^ Q[22] ^ Q[24] ^ Q[25] ^ Q[27] ^ Q[29] ^ temp[3] ^ temp[7] ^ temp[8] ^ temp[11] ^ temp[15] ^ temp[16] ^ temp[20] ^ temp[22] ^ temp[24] ^ temp[25] ^ temp[27] ^ temp[29];
assign  D[20] = Q[4] ^ Q[8] ^ Q[9] ^ Q[12] ^ Q[16] ^ Q[17] ^ Q[21] ^ Q[23] ^ Q[25] ^ Q[26] ^ Q[28] ^ Q[30] ^ temp[4] ^ temp[8] ^ temp[9] ^ temp[12] ^ temp[16] ^ temp[17] ^ temp[21] ^ temp[23] ^ temp[25] ^ temp[26] ^ temp[28] ^ temp[30];
assign  D[21] = Q[5] ^ Q[9] ^ Q[10] ^ Q[13] ^ Q[17] ^ Q[18] ^ Q[22] ^ Q[24] ^ Q[26] ^ Q[27] ^ Q[29] ^ Q[31] ^ temp[5] ^ temp[9] ^ temp[10] ^ temp[13] ^ temp[17] ^ temp[18] ^ temp[22] ^ temp[24] ^ temp[26] ^ temp[27] ^ temp[29] ^ temp[31];
assign  D[22] = Q[0] ^ Q[9] ^ Q[11] ^ Q[12] ^ Q[14] ^ Q[16] ^ Q[18] ^ Q[19] ^ Q[23] ^ Q[24] ^ Q[26] ^ Q[27] ^ Q[29] ^ Q[31] ^ temp[0] ^ temp[9] ^ temp[11] ^ temp[12] ^ temp[14] ^ temp[16] ^ temp[18] ^ temp[19] ^ temp[23] ^ temp[24] ^ temp[26] ^ temp[27] ^ temp[29] ^ temp[31];
assign  D[23] = Q[0] ^ Q[1] ^ Q[6] ^ Q[9] ^ Q[13] ^ Q[15] ^ Q[16] ^ Q[17] ^ Q[19] ^ Q[20] ^ Q[26] ^ Q[27] ^ Q[29] ^ Q[31] ^ temp[0] ^ temp[1] ^ temp[6] ^ temp[9] ^ temp[13] ^ temp[15] ^ temp[16] ^ temp[17] ^ temp[19] ^ temp[20] ^ temp[26] ^ temp[27] ^ temp[29] ^ temp[31];
assign  D[24] = Q[1] ^ Q[2] ^ Q[7] ^ Q[10] ^ Q[14] ^ Q[16] ^ Q[17] ^ Q[18] ^ Q[20] ^ Q[21] ^ Q[27] ^ Q[28] ^ Q[30] ^ temp[1] ^ temp[2] ^ temp[7] ^ temp[10] ^ temp[14] ^ temp[16] ^ temp[17] ^ temp[18] ^ temp[20] ^ temp[21] ^ temp[27] ^ temp[28] ^ temp[30];
assign  D[25] = Q[2] ^ Q[3] ^ Q[8] ^ Q[11] ^ Q[15] ^ Q[17] ^ Q[18] ^ Q[19] ^ Q[21] ^ Q[22] ^ Q[28] ^ Q[29] ^ Q[31] ^ temp[2] ^ temp[3] ^ temp[8] ^ temp[11] ^ temp[15] ^ temp[17] ^ temp[18] ^ temp[19] ^ temp[21] ^ temp[22] ^ temp[28] ^ temp[29] ^ temp[31];
assign  D[26] = Q[0] ^ Q[3] ^ Q[4] ^ Q[6] ^ Q[10] ^ Q[18] ^ Q[19] ^ Q[20] ^ Q[22] ^ Q[23] ^ Q[24] ^ Q[25] ^ Q[26] ^ Q[28] ^ Q[31] ^ temp[0] ^ temp[3] ^ temp[4] ^ temp[6] ^ temp[10] ^ temp[18] ^ temp[19] ^ temp[20] ^ temp[22] ^ temp[23] ^ temp[24] ^ temp[25] ^ temp[26] ^ temp[28] ^ temp[31];
assign  D[27] = Q[1] ^ Q[4] ^ Q[5] ^ Q[7] ^ Q[11] ^ Q[19] ^ Q[20] ^ Q[21] ^ Q[23] ^ Q[24] ^ Q[25] ^ Q[26] ^ Q[27] ^ Q[29] ^ temp[1] ^ temp[4] ^ temp[5] ^ temp[7] ^ temp[11] ^ temp[19] ^ temp[20] ^ temp[21] ^ temp[23] ^ temp[24] ^ temp[25] ^ temp[26] ^ temp[27] ^ temp[29];
assign  D[28] = Q[2] ^ Q[5] ^ Q[6] ^ Q[8] ^ Q[12] ^ Q[20] ^ Q[21] ^ Q[22] ^ Q[24] ^ Q[25] ^ Q[26] ^ Q[27] ^ Q[28] ^ Q[30] ^ temp[2] ^ temp[5] ^ temp[6] ^ temp[8] ^ temp[12] ^ temp[20] ^ temp[21] ^ temp[22] ^ temp[24] ^ temp[25] ^ temp[26] ^ temp[27] ^ temp[28] ^ temp[30];
assign  D[29] = Q[3] ^ Q[6] ^ Q[7] ^ Q[9] ^ Q[13] ^ Q[21] ^ Q[22] ^ Q[23] ^ Q[25] ^ Q[26] ^ Q[27] ^ Q[28] ^ Q[29] ^ Q[31] ^ temp[3] ^ temp[6] ^ temp[7] ^ temp[9] ^ temp[13] ^ temp[21] ^ temp[22] ^ temp[23] ^ temp[25] ^ temp[26] ^ temp[27] ^ temp[28] ^ temp[29] ^ temp[31];
assign  D[30] = Q[4] ^ Q[7] ^ Q[8] ^ Q[10] ^ Q[14] ^ Q[22] ^ Q[23] ^ Q[24] ^ Q[26] ^ Q[27] ^ Q[28] ^ Q[29] ^ Q[30] ^ temp[4] ^ temp[7] ^ temp[8] ^ temp[10] ^ temp[14] ^ temp[22] ^ temp[23] ^ temp[24] ^ temp[26] ^ temp[27] ^ temp[28] ^ temp[29] ^ temp[30];
assign  D[31] = Q[5] ^ Q[8] ^ Q[9] ^ Q[11] ^ Q[15] ^ Q[23] ^ Q[24] ^ Q[25] ^ Q[27] ^ Q[28] ^ Q[29] ^ Q[30] ^ Q[31] ^ temp[5] ^ temp[8] ^ temp[9] ^ temp[11] ^ temp[15] ^ temp[23] ^ temp[24] ^ temp[25] ^ temp[27] ^ temp[28] ^ temp[29] ^ temp[30] ^ temp[31];

assign  flag        = (count != 0);
assign  data_out    = (flag) ? crc_out : 32'b0;






endmodule



