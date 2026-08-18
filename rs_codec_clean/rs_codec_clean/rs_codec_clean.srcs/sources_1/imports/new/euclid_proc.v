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


module euclid_proc (
    input               sys_clk,
    input               rst_n,
    input               de,
    input   [127:0]     syndrome,
    output              valid,
    output  [71:0]      delta,
    output  [63:0]      omega
);
    
parameter   max     = 39; 
reg [7:0]   count   = 8'b0;
parameter   IDLE    = 4'h1,
            INIT    = 4'h2,
            ACTIVE  = 4'h4,
            END     = 4'h8;
reg [3:0]   state, next_state;

reg [7:0]   reg_A [0:16];
reg [7:0]   reg_S [0:16];
reg [7:0]   reg_C [0:16];
reg [7:0]   reg_W [0:16];
reg [7:0]   reg_T [0:16];
reg [7:0]   reg_Y [0:16];

wire [7:0]  X [0:16];
wire [7:0]  Y [0:16];
wire [7:0]  Z [0:16];
wire [7:0]  T [0:16];

wire [7:0]  B [0:16];
wire [7:0]  C [0:16];
wire [7:0]  D [0:16];
wire [7:0]  S [0:16];

reg [127:0] syndrome_d0;

wire [7:0]  inv_0,
            fold_B,
            fold_D;

reg [7:0]   reg_inv_0,
            reg_fold_B,
            reg_fold_D,
            pos     = 8'b0;

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
                            if (de)
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

always @(posedge sys_clk)
    syndrome_d0     <= (~rst_n) ? 128'b0 : syndrome;

always @(posedge sys_clk) begin
    if (~rst_n)
        pos   <= 8'b0;
    else if (state == ACTIVE) begin
        if (pos < 4)
            pos   <= pos + 1'b1;
        else
            pos   <= 8'b0;
    end
    else if (state == END)
        pos   <= 8'b0;
end

integer i;
always @(posedge sys_clk) begin
    if (~rst_n) begin
        reg_inv_0   <= 8'b0;
        reg_fold_B  <= 8'b0;
        reg_fold_D  <= 8'b0;
        for (i = 0; i < 17; i = i + 1) begin
            reg_A[i]    <= 8'b0;
            reg_T[i]    <= 8'b0;
            reg_C[i]    <= 8'b0;
            reg_W[i]    <= 8'b0;
            reg_Y[i]    <= 8'b0;
            reg_S[i]    <= 8'b0;
        end
    end
    else if (state == INIT) begin
        reg_A[16]   <= 8'h01;
        reg_T[0]    <= 8'h01;
        reg_S[0]    <= 8'b0;
        for (i = 0; i < 16; i = i + 1)
            reg_A[i]    <= 8'b0;
        for (i = 1; i < 17; i = i + 1)
            reg_T[i]    <= 8'b0;
        for (i = 0; i < 17; i = i + 1) begin
            reg_C[i]    <= 8'b0;
            reg_W[i]    <= 8'b0;
            reg_Y[i]    <= 8'b0;
        end
        for (i = 0; i < 16; i = i + 1)
            reg_S[i + 1]    <= syndrome_d0[ i*8 +: 8 ];
    end
    else if (state == ACTIVE) begin
        case (pos)
            8'd0:   reg_inv_0   <= inv_0;
            8'd1:   reg_fold_B  <= fold_B;
            8'd3:   reg_fold_D  <= fold_D;
            8'd4:   begin
                for (i = 0; i < 17; i = i + 1) begin
                    reg_A[i]    <= reg_S[i];
                    reg_W[i]    <= reg_T[i];
                    reg_T[i]    <= T[i];
                end
                reg_S[1]    <= 8'b0;
                reg_S[0]    <= 8'b0;
                for (i = 0; i < 15; i = i + 1)
                    reg_S[i + 2]    <= S[i];
            end
        endcase
        for (i = 0; i < 17; i = i + 1) begin
            reg_C[i]    <= C[i];
            reg_Y[i]    <= Y[i];
        end
    end
end

inverter    invert_0    (reg_S[16], inv_0);
multiplier  gf_fold_B   (reg_inv_0, reg_A[16], fold_B);
multiplier  gf_fold_D   (reg_inv_0, reg_C[15], fold_D);

genvar j;
generate
    for (j = 1; j < 17; j = j + 1) begin
        multiplier gf_B (
            reg_fold_B, reg_S[j], B[j]
        );
        multiplier gf_D (
            reg_fold_D, reg_S[j], D[j - 1]
        );
    end
    for (j = 0; j < 15; j = j + 1) begin
        multiplier gf_X (
            reg_fold_B, reg_T[j], X[j + 1]
        );
    end
    for (j = 0; j < 16; j = j + 1) begin
        multiplier gf_Z (
            reg_fold_D, reg_T[j], Z[j]
        );
    end
endgenerate

generate
    for (j = 0; j < 17; j = j + 1) begin
        assign C[j] = reg_A[j] ^ B[j];
        assign S[j] = reg_C[j] ^ D[j];
        assign Y[j] = reg_W[j] ^ X[j];
        assign T[j] = reg_Y[j] ^ Z[j];
    end
endgenerate

assign  B[0]    = 8'b0;
assign  D[16]   = 8'b0;
assign  X[16]   = 8'b0;
assign  X[0]    = 8'b0;
assign  Z[16]   = 8'b0;

assign  valid   = (count == 40);
assign  delta   = (valid) ? {reg_T[8], reg_T[7], reg_T[6],
                reg_T[5], reg_T[4], reg_T[3], reg_T[2],
                reg_T[1], reg_T[0]} : 72'b0;
assign  omega   = (valid) ? {reg_S[16], reg_S[15], reg_S[14],
                reg_S[13], reg_S[12], reg_S[11], reg_S[10],
                reg_S[9]} : 64'b0;








endmodule