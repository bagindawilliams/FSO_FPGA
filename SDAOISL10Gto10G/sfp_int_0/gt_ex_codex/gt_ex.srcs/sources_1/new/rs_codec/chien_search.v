`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University / ETRI Daejeon
Engineers    : Irzal Zaini & Williamsyah Baginda Miraj
Module Name  : chien_search
Description  : Reed-Solomon Chien Search Engine over GF(2^8).
               Evaluates the Error Locator Polynomial (delta) across field 
               elements to identify error positions (C0 == 0) and outputs 
               the formal derivative evaluation (chien = C1) for Forney's 
               algorithm.

Revision History:
  - Rev 1.0 (Initial) : Chien search step multipliers alpha^1..alpha^8 over 0x11D.
  - Rev 2.0 (2026-10-27 03:54 KST) : [ETRI Audit Item 2 & 3 - SDA OISL Page 37, Sec. 2.6.3.6.3]
    Updated step multipliers (gf_1..gf_8) to powers of beta = alpha^11 over GF(2^8) 0x187
    to match generator polynomial roots alpha^(11*j):
      beta^1 (alpha^11) = 8'had, beta^2 (alpha^22) = 8'hbe, beta^3 (alpha^33) = 8'h3a,
      beta^4 (alpha^44) = 8'h3c, beta^5 (alpha^55) = 8'hdc, beta^6 (alpha^66) = 8'h56,
      beta^7 (alpha^77) = 8'hca, beta^8 (alpha^88) = 8'h42.
===========================================================================
*/

module chien_search #(
    parameter max = 254
)(
    input  wire        clk,
    input  wire        rst_n,
    input  wire        en,
    input  wire [71:0] delta,
    output wire        flag,
    output wire        error,
    output wire [7:0]  chien
);

    reg [7:0] count = 8'd0;

    localparam IDLE   = 3'b001;
    localparam ACTIVE = 3'b010;
    localparam END    = 3'b100;

    reg [2:0] state;
    reg [2:0] next_state;

    reg [71:0] delta_d0;

    reg  [7:0] Q [0:8];
    wire [7:0] D [0:8];
    wire [7:0] C0;
    wire [7:0] C1;

    // FSM State Register
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Cycle Counter
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            count <= 8'd0;
        else if (state == ACTIVE)
            count <= count + 1'b1;
        else
            count <= 8'd0;
    end

    // Next State Logic
    always @(*) begin
        case (state)
            IDLE: begin
                if (en)
                    next_state = ACTIVE;
                else
                    next_state = IDLE;
            end
            ACTIVE: begin
                if (count < max)
                    next_state = ACTIVE;
                else
                    next_state = END;
            end
            END:     next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Input Delta Register
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            delta_d0 <= 72'b0;
        else
            delta_d0 <= delta;
    end

    // Coefficient Shift Registers
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < 9; i = i + 1)
                Q[i] <= 8'b0;
        end else if (state == ACTIVE) begin
            if (count == 8'd0) begin
                Q[8] <= delta_d0[71:64];
                Q[7] <= delta_d0[63:56];
                Q[6] <= delta_d0[55:48];
                Q[5] <= delta_d0[47:40];
                Q[4] <= delta_d0[39:32];
                Q[3] <= delta_d0[31:24];
                Q[2] <= delta_d0[23:16];
                Q[1] <= delta_d0[15:8];
                Q[0] <= delta_d0[7:0];
            end else begin
                for (i = 0; i < 9; i = i + 1)
                    Q[i] <= D[i];
            end
        end else begin
            for (i = 0; i < 9; i = i + 1)
                Q[i] <= 8'b0;
        end
    end

    // GF(2^8) Multipliers for powers beta^1 to beta^8 (where beta = alpha^11 in GF 0x187)
    multiplier gf_1 (8'had, Q[1], D[1]);
    multiplier gf_2 (8'hbe, Q[2], D[2]);
    multiplier gf_3 (8'h3a, Q[3], D[3]);
    multiplier gf_4 (8'h3c, Q[4], D[4]);
    multiplier gf_5 (8'hdc, Q[5], D[5]);
    multiplier gf_6 (8'h56, Q[6], D[6]);
    multiplier gf_7 (8'hca, Q[7], D[7]);
    multiplier gf_8 (8'h42, Q[8], D[8]);

    assign D[0] = Q[0];
    assign C0   = Q[0] ^ Q[1] ^ Q[2] ^ Q[3] ^ Q[4] ^ Q[5] ^ Q[6] ^ Q[7] ^ Q[8];
    assign C1   = Q[1] ^ Q[3] ^ Q[5] ^ Q[7];

    assign flag  = (state == ACTIVE);
    assign error = (count != 8'd0 && C0 == 8'b0);
    assign chien = (count != 8'd0) ? C1 : 8'b0;

endmodule