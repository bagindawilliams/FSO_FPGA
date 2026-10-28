`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : rs_encoder
Description  : Reed-Solomon (RS) Systematic Encoder over GF(2^8).
               Appends 16 Parity bytes to an incoming data stream using 
               generator polynomial g(x) = (x + alpha^0)...(x + alpha^15).

               Configuration:
               - Payload RS(255,239): MAX_CYCLE = 255 (or 254)
                 -> Active Data Phase = 239 cycles (count = 0..238)
                 -> Flush Parity Phase = 16 cycles (count = 239..254)
                 -> Total Output = 255 cycles.
               - Header RS(32,16)   : MAX_CYCLE = 32 (or 31)
                 -> Active Data Phase = 16 cycles (count = 0..15)
                 -> Flush Parity Phase = 16 cycles (count = 16..31)
                 -> Total Output = 32 cycles.

Revision History:
  - Rev 1.0 (Initial) : Baseline RS(255,239) / RS(32,16) encoder with roots alpha^0..alpha^15.
  - Rev 2.0 (2026-10-27 03:54 KST) : [ETRI Audit Item 3 - SDA OISL Page 37, Sec. 2.6.3.6.3]
    Recalculated and replaced all 16 generator polynomial multiplier coefficients (gf_0..gf_f)
    for g(x) = prod_{j=120}^{135} (x - alpha^(11*j)) over GF(2^8) primitive polynomial
    F(x) = x^8 + x^7 + x^2 + x + 1 (0x187) in conventional basis:
      g_0        = 8'h01 (alpha^0)
      g_1 = g_15 = 8'ha5 (alpha^30)
      g_2 = g_14 = 8'h69 (alpha^230)
      g_3 = g_13 = 8'h1b (alpha^49)
      g_4 = g_12 = 8'h9f (alpha^235)
      g_5 = g_11 = 8'h68 (alpha^129)
      g_6 = g_10 = 8'h98 (alpha^81)
      g_7 = g_9  = 8'h65 (alpha^76)
      g_8        = 8'h4a (alpha^173)
===========================================================================
*/

module rs_encoder # (parameter MAX_CYCLE = 255) (
    input           clk,
    input           rst_n,
    input           en,
    input   [7:0]   data_in,
    output          flag,
    output  [7:0]   data_out
);
    
    reg     [7:0]   count   = 8'd0;

    localparam  IDLE        = 4'b0001;
    localparam  ACTIVE      = 4'b0010;
    localparam  FLUSH       = 4'b0100;
    localparam  END         = 4'b1000;

    reg     [3:0]   state;
    reg     [3:0]   next_state;

    reg     [7:0]   data_d0;

    reg     [7:0]   Q   [0:15];
    wire    [7:0]   D   [0:15];
    wire    [7:0]   R   [0:15];

    wire    [7:0]   C0;
    wire    [7:0]   C1;

    // =======================================================
    // FSM LOGIC
    // =======================================================
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            state   <= IDLE;
        else
            state   <= next_state;
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            count   <= 8'd0;
        else if (state == ACTIVE || state == FLUSH)
            count   <= count + 1'b1;
        else
            count   <= 8'd0;
    end

    always @(*) begin
        case(state)
            IDLE:   begin
                        if (en) next_state <= ACTIVE;
                        else    next_state <= IDLE;
                    end
            ACTIVE: begin
                        // Read Data Phase
                        if (count < MAX_CYCLE - 16) next_state <= ACTIVE;
                        else                        next_state <= FLUSH;
                    end
            FLUSH:  begin
                        // Dump 16 Parity Bytes Phase
                        if (count < MAX_CYCLE) next_state <= FLUSH;
                        else                   next_state <= END;
                    end
            END:    next_state <= IDLE;
            default: next_state <= IDLE;
        endcase
    end

    // =======================================================
    // DATA PIPELINE & SHIFT REGISTERS
    // =======================================================
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            data_d0 <= 8'b0;
        else
            data_d0 <= data_in;
    end

    reg [7:0] i;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < 16; i = i + 1)
                Q[i]  <= 8'b0;
        end 
        else if (state == ACTIVE || state == FLUSH) begin
            for (i = 0; i < 16; i = i + 1)
                Q[i]  <= D[i];
        end 
        else begin
            for (i = 0; i < 16; i = i + 1)
                Q[i]  <= 8'b0;
        end
    end

    // =======================================================
    // GALOIS FIELD MULTIPLIERS
    // [Rev 2.0 - 2026-10-27 03:54 KST] Updated to SDA OISL v2.1.2 Page 37
    // roots alpha^(11*j) for j = 120..135 over GF(2^8) 0x187:
    // =======================================================
    multiplier gf_0 (8'h01, C1, R[0]);
    multiplier gf_1 (8'ha5, C1, R[1]);
    multiplier gf_2 (8'h69, C1, R[2]);
    multiplier gf_3 (8'h1b, C1, R[3]);
    multiplier gf_4 (8'h9f, C1, R[4]);
    multiplier gf_5 (8'h68, C1, R[5]);
    multiplier gf_6 (8'h98, C1, R[6]);
    multiplier gf_7 (8'h65, C1, R[7]);
    multiplier gf_8 (8'h4a, C1, R[8]);
    multiplier gf_9 (8'h65, C1, R[9]);
    multiplier gf_a (8'h98, C1, R[10]);
    multiplier gf_b (8'h68, C1, R[11]);
    multiplier gf_c (8'h9f, C1, R[12]);
    multiplier gf_d (8'h1b, C1, R[13]);
    multiplier gf_e (8'h69, C1, R[14]);
    multiplier gf_f (8'ha5, C1, R[15]);

    assign  D[0]  = R[0];
    assign  D[1]  = R[1]  ^ Q[0];
    assign  D[2]  = R[2]  ^ Q[1];
    assign  D[3]  = R[3]  ^ Q[2];
    assign  D[4]  = R[4]  ^ Q[3];
    assign  D[5]  = R[5]  ^ Q[4];
    assign  D[6]  = R[6]  ^ Q[5];
    assign  D[7]  = R[7]  ^ Q[6];
    assign  D[8]  = R[8]  ^ Q[7];
    assign  D[9]  = R[9]  ^ Q[8];
    assign  D[10] = R[10] ^ Q[9];
    assign  D[11] = R[11] ^ Q[10];
    assign  D[12] = R[12] ^ Q[11];
    assign  D[13] = R[13] ^ Q[12];
    assign  D[14] = R[14] ^ Q[13];
    assign  D[15] = R[15] ^ Q[14];

    assign  C0       = Q[15] ^ data_d0;
    assign  C1       = (state == FLUSH) ? 8'b0 : C0;

    // Output Mapping
    assign  flag     = (state == ACTIVE || state == FLUSH);
    assign  data_out = (state == FLUSH) ? C0 : data_d0;

endmodule