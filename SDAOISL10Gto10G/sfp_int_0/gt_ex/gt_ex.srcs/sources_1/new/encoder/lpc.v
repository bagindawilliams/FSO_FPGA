`timescale 1ns / 1ps
/*
===========================================================================
Description  : Low-Density Parity Check (LPC) Sub-module.
               CRITICAL FIX (Data-Parity Misalignment):
               - Removed the clocked registers for P[7:0].
               - Converted the lengthy IF-ELSE parity generation into 
                 pure combinational XOR/XNOR gates.
               - This guarantees that Data (E) and Parity (P) emerge on 
                 the exact same clock cycle without shifting/mixing.
===========================================================================
*/
module lpc(
    input               clk,
    input               rst_n,
    input               en,
    input   [15:0]      data_in,
    output              flag,
    output  [23:0]      data_out
);

    reg         en_d0;
    reg  [15:0] temp;

    wire [0:15] U;
    wire [0:15] E;
    wire [0:3]  H;
    wire [0:3]  V;
    wire [7:0]  P; // CRITICAL: Converted to combinational wire

    // 1-Cycle Pipeline Delay for Input
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            en_d0 <= 1'b0;
            temp  <= 16'b0;
        end else begin
            en_d0 <= en;
            temp  <= data_in;
        end
    end

    // Combinational Math for Encryption 'E'
    assign U    = {temp[15], temp[14], temp[13], temp[12], temp[11], temp[10], temp[9], temp[8], 
                   temp[7],  temp[6],  temp[5],  temp[4],  temp[3],  temp[2],  temp[1], temp[0]};

    assign E[0]  = U[0];
    assign E[1]  = U[1]  ^ E[0];
    assign E[2]  = U[2]  ^ E[1];
    assign E[3]  = U[3]  ^ E[2];
    assign E[4]  = U[4]  ^ E[3];
    assign E[5]  = U[5]  ^ E[4];
    assign E[6]  = U[6]  ^ E[5];
    assign E[7]  = U[7]  ^ E[6];
    assign E[8]  = U[8];
    assign E[9]  = U[9]  ^ E[8];
    assign E[10] = U[10] ^ E[9];
    assign E[11] = U[11] ^ E[10];
    assign E[12] = U[12] ^ E[11];
    assign E[13] = U[13] ^ E[12];
    assign E[14] = U[14] ^ E[13];
    assign E[15] = U[15] ^ E[14];

    assign H[0]  = E[0]  ^ E[1]  ^ E[2]  ^ E[3];
    assign H[1]  = E[4]  ^ E[5]  ^ E[6]  ^ E[7];
    assign H[2]  = E[8]  ^ E[9]  ^ E[10] ^ E[11];
    assign H[3]  = E[12] ^ E[13] ^ E[14] ^ E[15];
    
    assign V[0]  = E[0]  ^ E[4]  ^ E[8]  ^ E[12];
    assign V[1]  = E[1]  ^ E[5]  ^ E[9]  ^ E[13];
    assign V[2]  = E[2]  ^ E[6]  ^ E[10] ^ E[14];
    assign V[3]  = E[3]  ^ E[7]  ^ E[11] ^ E[15];

    // CRITICAL: Combinational Math for Parity 'P' (Eliminates 1-Cycle Delay Bug)
    assign P[7] = ~H[0];
    assign P[6] = ~(E[0] ^ H[1]); // XNOR Gate implementation
    assign P[5] = ~(E[0] ^ H[2]);
    assign P[4] = ~(E[0] ^ H[3]);
    
    assign P[3] = V[0];
    assign P[2] = (E[0] ^ V[1]);  // XOR Gate implementation
    assign P[1] = (E[0] ^ V[2]);
    assign P[0] = (E[0] ^ V[3]);

    // Output Assembly
    assign flag     = en_d0;
    assign data_out = {E[0], E[1], E[2], E[3], E[4], E[5], E[6], E[7],
                       E[8], E[9], E[10], E[11], E[12], E[13], E[14], E[15], P};

endmodule