`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2025 03:31:01 PM
// Design Name: 
// Module Name: euclid_proc
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


module euclid_proc(
    input               clk,
    input               rst_n,
    input               en,
    input   [127:0]     syndrome,
    output              flag,
    output  [71:0]      delta,
    output  [63:0]      omega
);
    
parameter       max     = 39;
reg     [7:0]   count   = 8'd0;

parameter   IDLE        = 4'b0001;
parameter   INIT        = 4'b0010;
parameter   ACTIVE      = 4'b0100;
parameter   END         = 4'b1000;

reg     [3:0]   state;
reg     [3:0]   next_state;

reg     [127:0]     syndrome_d0;

reg     [7:0]   reg_A   [0:16];
reg     [7:0]   reg_S   [0:16];
reg     [7:0]   reg_C   [0:16];
reg     [7:0]   reg_W   [0:16];
reg     [7:0]   reg_T   [0:16];
reg     [7:0]   reg_Y   [0:16];

wire    [7:0]   X   [0:16];
wire    [7:0]   Y   [0:16];
wire    [7:0]   Z   [0:16];
wire    [7:0]   T   [0:16];

wire    [7:0]   B   [0:16];
wire    [7:0]   C   [0:16];
wire    [7:0]   D   [0:16];
wire    [7:0]   S   [0:16];

wire    [7:0]   inv_0;
wire    [7:0]   fold_B;
wire    [7:0]   fold_D;

reg     [7:0]   reg_inv_0;
reg     [7:0]   reg_fold_B;
reg     [7:0]   reg_fold_D;

reg     [7:0]   pos     = 8'd0;

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
                                next_state  <= INIT;
                            else
                                next_state  <= IDLE;
                        end
        INIT:           next_state  <= ACTIVE;
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
        syndrome_d0     <= 128'b0;
    else
        syndrome_d0     <= syndrome;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        pos   <= 8'd0;
    else if (state == ACTIVE)
        begin
            if (pos < 4)
                pos   <= pos + 1'b1;
            else
                pos   <= 8'd0;
        end
    else if (state == END)
        pos   <= 8'd0;
end

reg [7:0] i;
always @(posedge clk or negedge rst_n)
    begin
        if (~rst_n)
            begin
                reg_inv_0       <= 8'b0;
                reg_fold_B      <= 8'b0;
                reg_fold_D      <= 8'b0;
                
                for (i = 0; i < 17; i = i + 1) begin
                    reg_A[i]    <= 8'b0;
                    reg_C[i]    <= 8'b0;
                    reg_S[i]    <= 8'b0;
                    reg_W[i]    <= 8'b0;
                    reg_Y[i]    <= 8'b0;
                    reg_T[i]    <= 8'b0;
                end
            end
    else if (state == INIT)
        begin
            reg_A[16]   <= 8'h01;
            reg_T[0]    <= 8'h01;
                            
            for (i = 0; i < 16; i = i + 1) begin
                reg_A[i]    <= 8'b0;
            end
            for (i = 1; i < 17; i = i + 1) begin
                reg_T[i]    <= 8'b0;
            end
            for (i = 0; i < 17; i = i + 1) begin
                reg_C[i]    <= 8'b0;
                reg_W[i]    <= 8'b0;
                reg_Y[i]    <= 8'b0;
            end
                            
            reg_S[16]   <= syndrome_d0[127:120];
            reg_S[15]   <= syndrome_d0[119:112];
            reg_S[14]   <= syndrome_d0[111:104];
            reg_S[13]   <= syndrome_d0[103:96];
            reg_S[12]   <= syndrome_d0[95:88];
            reg_S[11]   <= syndrome_d0[87:80];
            reg_S[10]   <= syndrome_d0[79:72];
            reg_S[9]    <= syndrome_d0[71:64];
            reg_S[8]    <= syndrome_d0[63:56];
            reg_S[7]    <= syndrome_d0[55:48];
            reg_S[6]    <= syndrome_d0[47:40];
            reg_S[5]    <= syndrome_d0[39:32];
            reg_S[4]    <= syndrome_d0[31:24];
            reg_S[3]    <= syndrome_d0[23:16];
            reg_S[2]    <= syndrome_d0[15:8];
            reg_S[1]    <= syndrome_d0[7:0];
            reg_S[0]    <= 8'b0;
        end
    else if (state == ACTIVE)
        begin
            case (pos)
                8'd0:   reg_inv_0       <= inv_0;
                8'd1:   reg_fold_B      <= fold_B;
                8'd3:   reg_fold_D      <= fold_D;
                8'd4:
                    begin
                        for (i = 0; i < 17; i = i + 1) begin
                            reg_A[i]    <= reg_S[i];
                            reg_W[i]    <= reg_T[i];
                            reg_T[i]    <= T[i];
                        end
                                
                        reg_S[16]       <= S[14];
                        reg_S[15]       <= S[13];
                        reg_S[14]       <= S[12];
                        reg_S[13]       <= S[11];
                        reg_S[12]       <= S[10];
                        reg_S[11]       <= S[9];
                        reg_S[10]       <= S[8];
                        reg_S[9]        <= S[7];
                        reg_S[8]        <= S[6];
                        reg_S[7]        <= S[5];
                        reg_S[6]        <= S[4];
                        reg_S[5]        <= S[3];
                        reg_S[4]        <= S[2];
                        reg_S[3]        <= S[1];
                        reg_S[2]        <= S[0];
                        reg_S[1]        <= 8'b0;
                        reg_S[0]        <= 8'b0;
                    end
            endcase
            
            for (i = 0; i < 17; i = i + 1) begin
                reg_C[i]    <= C[i];
                reg_Y[i]    <= Y[i];
            end
        end
end

inverter    invert_0    (reg_S[16], inv_0);
multiplier  gf_B        (reg_inv_0, reg_A[16], fold_B);
multiplier  gf_D        (reg_inv_0, reg_C[15], fold_D);

assign  B[0]    = 8'b0;
multiplier  gf_B16      (reg_fold_B, reg_S[16], B[16]);
multiplier  gf_B15      (reg_fold_B, reg_S[15], B[15]);
multiplier  gf_B14      (reg_fold_B, reg_S[14], B[14]);
multiplier  gf_B13      (reg_fold_B, reg_S[13], B[13]);
multiplier  gf_B12      (reg_fold_B, reg_S[12], B[12]);
multiplier  gf_B11      (reg_fold_B, reg_S[11], B[11]);
multiplier  gf_B10      (reg_fold_B, reg_S[10], B[10]);
multiplier  gf_B9       (reg_fold_B, reg_S[9],  B[9]);
multiplier  gf_B8       (reg_fold_B, reg_S[8],  B[8]);
multiplier  gf_B7       (reg_fold_B, reg_S[7],  B[7]);
multiplier  gf_B6       (reg_fold_B, reg_S[6],  B[6]);
multiplier  gf_B5       (reg_fold_B, reg_S[5],  B[5]);
multiplier  gf_B4       (reg_fold_B, reg_S[4],  B[4]);
multiplier  gf_B3       (reg_fold_B, reg_S[3],  B[3]);
multiplier  gf_B2       (reg_fold_B, reg_S[2],  B[2]);
multiplier  gf_B1       (reg_fold_B, reg_S[1],  B[1]);

assign  D[16]   = 8'b0;
multiplier  gf_D15      (reg_fold_D, reg_S[16], D[15]);
multiplier  gf_D14      (reg_fold_D, reg_S[15], D[14]);
multiplier  gf_D13      (reg_fold_D, reg_S[14], D[13]);
multiplier  gf_D12      (reg_fold_D, reg_S[13], D[12]);
multiplier  gf_D11      (reg_fold_D, reg_S[12], D[11]);
multiplier  gf_D10      (reg_fold_D, reg_S[11], D[10]);
multiplier  gf_D9       (reg_fold_D, reg_S[10], D[9]);
multiplier  gf_D8       (reg_fold_D, reg_S[9],  D[8]);
multiplier  gf_D7       (reg_fold_D, reg_S[8],  D[7]);
multiplier  gf_D6       (reg_fold_D, reg_S[7],  D[6]);
multiplier  gf_D5       (reg_fold_D, reg_S[6],  D[5]);
multiplier  gf_D4       (reg_fold_D, reg_S[5],  D[4]);
multiplier  gf_D3       (reg_fold_D, reg_S[4],  D[3]);
multiplier  gf_D2       (reg_fold_D, reg_S[3],  D[2]);
multiplier  gf_D1       (reg_fold_D, reg_S[2],  D[1]);
multiplier  gf_D0       (reg_fold_D, reg_S[1],  D[0]);

assign  C[16]   = reg_A[16] ^ B[16];
assign  C[15]   = reg_A[15] ^ B[15];
assign  C[14]   = reg_A[14] ^ B[14];
assign  C[13]   = reg_A[13] ^ B[13];
assign  C[12]   = reg_A[12] ^ B[12];
assign  C[11]   = reg_A[11] ^ B[11];
assign  C[10]   = reg_A[10] ^ B[10];
assign  C[9]    = reg_A[9]  ^ B[9];
assign  C[8]    = reg_A[8]  ^ B[8];
assign  C[7]    = reg_A[7]  ^ B[7];
assign  C[6]    = reg_A[6]  ^ B[6];
assign  C[5]    = reg_A[5]  ^ B[5];
assign  C[4]    = reg_A[4]  ^ B[4];
assign  C[3]    = reg_A[3]  ^ B[3];
assign  C[2]    = reg_A[2]  ^ B[2];
assign  C[1]    = reg_A[1]  ^ B[1];
assign  C[0]    = reg_A[0]  ^ B[0];

assign S[16]    = reg_C[16] ^ D[16];
assign S[15]    = reg_C[15] ^ D[15];
assign S[14]    = reg_C[14] ^ D[14];
assign S[13]    = reg_C[13] ^ D[13];
assign S[12]    = reg_C[12] ^ D[12];
assign S[11]    = reg_C[11] ^ D[11];
assign S[10]    = reg_C[10] ^ D[10];
assign S[9]     = reg_C[9] ^ D[9];
assign S[8]     = reg_C[8] ^ D[8];
assign S[7]     = reg_C[7] ^ D[7];
assign S[6]     = reg_C[6] ^ D[6];
assign S[5]     = reg_C[5] ^ D[5];
assign S[4]     = reg_C[4] ^ D[4];
assign S[3]     = reg_C[3] ^ D[3];
assign S[2]     = reg_C[2] ^ D[2];
assign S[1]     = reg_C[1] ^ D[1];
assign S[0]     = reg_C[0] ^ D[0];

assign  X[16]   = 8'b0;
assign  X[0]    = 8'b0;
multiplier  gf_X14      (reg_fold_B, reg_T[14], X[15]);
multiplier  gf_X13      (reg_fold_B, reg_T[13], X[14]);
multiplier  gf_X12      (reg_fold_B, reg_T[12], X[13]);
multiplier  gf_X11      (reg_fold_B, reg_T[11], X[12]);
multiplier  gf_X10      (reg_fold_B, reg_T[10], X[11]);
multiplier  gf_X9       (reg_fold_B, reg_T[9],  X[10]);
multiplier  gf_X8       (reg_fold_B, reg_T[8],  X[9]);
multiplier  gf_X7       (reg_fold_B, reg_T[7],  X[8]);
multiplier  gf_X6       (reg_fold_B, reg_T[6],  X[7]);
multiplier  gf_X5       (reg_fold_B, reg_T[5],  X[6]);
multiplier  gf_X4       (reg_fold_B, reg_T[4],  X[5]);
multiplier  gf_X3       (reg_fold_B, reg_T[3],  X[4]);
multiplier  gf_X2       (reg_fold_B, reg_T[2],  X[3]);
multiplier  gf_X1       (reg_fold_B, reg_T[1],  X[2]);
multiplier  gf_X0       (reg_fold_B, reg_T[0],  X[1]);

assign  Z[16]   = 8'b0;
multiplier  gf_Y15      (reg_fold_D, reg_T[15], Z[15]);
multiplier  gf_Y14      (reg_fold_D, reg_T[14], Z[14]);
multiplier  gf_Y13      (reg_fold_D, reg_T[13], Z[13]);
multiplier  gf_Y12      (reg_fold_D, reg_T[12], Z[12]);
multiplier  gf_Y11      (reg_fold_D, reg_T[11], Z[11]);
multiplier  gf_Y10      (reg_fold_D, reg_T[10], Z[10]);
multiplier  gf_Y9       (reg_fold_D, reg_T[9],  Z[9]);
multiplier  gf_Y8       (reg_fold_D, reg_T[8],  Z[8]);
multiplier  gf_Y7       (reg_fold_D, reg_T[7],  Z[7]);
multiplier  gf_Y6       (reg_fold_D, reg_T[6],  Z[6]);
multiplier  gf_Y5       (reg_fold_D, reg_T[5],  Z[5]);
multiplier  gf_Y4       (reg_fold_D, reg_T[4],  Z[4]);
multiplier  gf_Y3       (reg_fold_D, reg_T[3],  Z[3]);
multiplier  gf_Y2       (reg_fold_D, reg_T[2],  Z[2]);
multiplier  gf_Y1       (reg_fold_D, reg_T[1],  Z[1]);
multiplier  gf_Y0       (reg_fold_D, reg_T[0],  Z[0]);

assign  Y[16]   = reg_W[16] ^ X[16];
assign  Y[15]   = reg_W[15] ^ X[15];
assign  Y[14]   = reg_W[14] ^ X[14];
assign  Y[13]   = reg_W[13] ^ X[13];
assign  Y[12]   = reg_W[12] ^ X[12];
assign  Y[11]   = reg_W[11] ^ X[11];
assign  Y[10]   = reg_W[10] ^ X[10];
assign  Y[9]    = reg_W[9]  ^ X[9];
assign  Y[8]    = reg_W[8]  ^ X[8];
assign  Y[7]    = reg_W[7]  ^ X[7];
assign  Y[6]    = reg_W[6]  ^ X[6];
assign  Y[5]    = reg_W[5]  ^ X[5];
assign  Y[4]    = reg_W[4]  ^ X[4];
assign  Y[3]    = reg_W[3]  ^ X[3];
assign  Y[2]    = reg_W[2]  ^ X[2];
assign  Y[1]    = reg_W[1]  ^ X[1];
assign  Y[0]    = reg_W[0]  ^ X[0];

assign  T[16]   = reg_Y[16] ^ Z[16];
assign  T[15]   = reg_Y[15] ^ Z[15];
assign  T[14]   = reg_Y[14] ^ Z[14];
assign  T[13]   = reg_Y[13] ^ Z[13];
assign  T[12]   = reg_Y[12] ^ Z[12];
assign  T[11]   = reg_Y[11] ^ Z[11];
assign  T[10]   = reg_Y[10] ^ Z[10];
assign  T[9]    = reg_Y[9]  ^ Z[9];
assign  T[8]    = reg_Y[8]  ^ Z[8];
assign  T[7]    = reg_Y[7]  ^ Z[7];
assign  T[6]    = reg_Y[6]  ^ Z[6];
assign  T[5]    = reg_Y[5]  ^ Z[5];
assign  T[4]    = reg_Y[4]  ^ Z[4];
assign  T[3]    = reg_Y[3]  ^ Z[3];
assign  T[2]    = reg_Y[2]  ^ Z[2];
assign  T[1]    = reg_Y[1]  ^ Z[1];
assign  T[0]    = reg_Y[0]  ^ Z[0];

assign  flag    = (count == 40);
assign  delta   = (flag) ? {reg_T[8], reg_T[7], reg_T[6], reg_T[5], reg_T[4], reg_T[3], reg_T[2], reg_T[1], reg_T[0]} : 72'b0;
assign  omega   = (flag) ? {reg_S[16], reg_S[15], reg_S[14], reg_S[13], reg_S[12], reg_S[11], reg_S[10], reg_S[9]} : 64'b0;


endmodule




