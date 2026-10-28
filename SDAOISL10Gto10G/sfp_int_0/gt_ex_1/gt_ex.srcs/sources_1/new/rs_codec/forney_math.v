`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University / ETRI Daejeon
Engineers    : Irzal Zaini & Williamsyah Baginda Miraj
Module Name  : forney_math
Description  : Reed-Solomon Forney Algorithm Unit over GF(2^8).
               Computes the error magnitude (forney = C0 * chien^-1) using 
               the Error Evaluator Polynomial (omega) and the odd-power sum 
               from the Chien Search module.

Revision History:
  - Rev 1.0 (Initial) : Forney error evaluator for root offset j_0 = 0 over 0x11D.
  - Rev 2.0 (2026-10-27 03:54 KST) : [ETRI Audit Item 2 & 3 - SDA OISL Page 37, Sec. 2.6.3.6.3]
    Updated evaluator step multipliers (gf_d0..gf_7) to r_k = alpha^((11*(120+k)) % 255)
    for k = 0..7 over GF(2^8) 0x187 so that the non-zero initial root offset (j_0 = 120,
    factor beta^(120*m)) is automatically compensated in C0 every cycle without extra latency.
===========================================================================
*/

module forney_math #(
    parameter max = 254
)(
    input  wire        clk,
    input  wire        rst_n,
    input  wire        en,
    input  wire [63:0] omega,
    input  wire [7:0]  chien,
    output wire        flag,
    output wire [7:0]  forney
);

    reg [7:0] count = 8'd0;

    localparam IDLE   = 3'b001;
    localparam ACTIVE = 3'b010;
    localparam END    = 3'b100;

    reg [2:0] state;
    reg [2:0] next_state;

    reg [63:0] omega_d0;

    reg  [7:0] Q [0:7];
    wire [7:0] D [0:7];
    wire [7:0] C0;
    wire [7:0] C1;
    wire [7:0] inv_0;

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

    // Input Omega Register
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            omega_d0 <= 64'b0;
        else
            omega_d0 <= omega;
    end

    // Evaluator Shift Registers
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < 8; i = i + 1)
                Q[i] <= 8'b0;
        end else if (state == ACTIVE) begin
            if (count == 8'd0) begin
                Q[7] <= omega_d0[63:56];
                Q[6] <= omega_d0[55:48];
                Q[5] <= omega_d0[47:40];
                Q[4] <= omega_d0[39:32];
                Q[3] <= omega_d0[31:24];
                Q[2] <= omega_d0[23:16];
                Q[1] <= omega_d0[15:8];
                Q[0] <= omega_d0[7:0];
            end else begin
                for (i = 0; i < 8; i = i + 1)
                    Q[i] <= D[i];
            end
        end else begin
            for (i = 0; i < 8; i = i + 1)
                Q[i] <= 8'b0;
        end
    end

    // GF(2^8) Inversion and Multipliers (beta^(120+k) for k = 0..7 in GF 0x187)
    inverter   invert_0 (chien, inv_0);
    multiplier gf_0     (inv_0, C0,   C1);
    multiplier gf_d0    (8'h78, Q[0], D[0]);
    multiplier gf_1     (8'h3f, Q[1], D[1]);
    multiplier gf_2     (8'hac, Q[2], D[2]);
    multiplier gf_3     (8'h13, Q[3], D[3]);
    multiplier gf_4     (8'h84, Q[4], D[4]);
    multiplier gf_5     (8'h06, Q[5], D[5]);
    multiplier gf_6     (8'he0, Q[6], D[6]);
    multiplier gf_7     (8'h8a, Q[7], D[7]);

    assign C0   = Q[0] ^ Q[1] ^ Q[2] ^ Q[3] ^ Q[4] ^ Q[5] ^ Q[6] ^ Q[7];

    assign flag   = (state == ACTIVE);
    assign forney = (count != 8'd0) ? C1 : 8'b0;

endmodule