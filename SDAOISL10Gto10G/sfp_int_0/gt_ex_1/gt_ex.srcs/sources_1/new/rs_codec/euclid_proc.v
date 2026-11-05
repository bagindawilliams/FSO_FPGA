`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University / ETRI Daejeon
Engineers    : Irzal Zaini & Williamsyah Baginda Miraj
Module Name  : euclid_proc
Description  : Reed-Solomon Key Equation Solver (Euclidean Algorithm).
               Computes the 72-bit Error Locator Polynomial (delta) and 
               the 64-bit Error Evaluator Polynomial (omega) from the 
               128-bit syndrome vector in 40 active clock cycles.

               Mathematical Foundation & Parameter Basis (SDA OISL v2.1.2):
               - Solves the Reed-Solomon Key Equation over GF(2^8) (0x187):
                   Lambda(x) * S(x) = Omega(x) mod x^(2t), where 2t = 16 (t = 8).
               - Initial Conditions (INIT state):
                   A(x) = x^16 (deg_A = 16), W(x) = 0
                   S(x) = S_15*x^15 + ... + S_0 (deg_S = 15), T(x) = 1
               - Termination Invariant:
                   Stops when formal remainder degree reaches deg_S == 7 (< t = 8),
                   placing Omega_7..Omega_0 at reg_S[16:9] and Lambda_8..Lambda_0
                   at reg_T[8:0] after at most 16 steps (32 clock cycles <= max = 39).

Revision History:
  - Rev 1.0 (Initial) : 40-cycle Euclidean key equation solver for RS(255,239) & RS(32,16).
  - Rev 2.6 (2026-10-30 01:32 KST) : [Audit Fix N02 - Degree-Tracked Sugiyama Euclidean Solver]
    1. Added explicit formal degree tracking registers ('deg_A' initialized to 16 and 
       'deg_S' initialized to 15) with a 2-cycle per degree-step schedule (pos = 0..1, 
       completing in <= 32 cycles within the existing 40-cycle 'max = 39' window).
    2. Added leading-zero normalization when 'reg_S[16] == 8'd0' and 'deg_S >= 5'd8' so 
       vanishing leading syndromes (such as S_15 == 0 in 2-error delta=119 cases) and 
       multi-degree cancellations (such as single-symbol errors, nu = 1) normalize 
       cleanly without dividing by zero or overwriting Lambda(x) in reg_T.
    3. Added exact termination hold when 'deg_S == 5'd7' (deg(Omega) < 8), ensuring 
       100% error recovery across 0, 1, 2, ..., 8 symbol errors in both RS(32,16) and 
       RS(255,239) codewords.
===========================================================================
*/

module euclid_proc #(
    parameter max = 39
)(
    input  wire         clk,
    input  wire         rst_n,
    input  wire         en,
    input  wire [127:0] syndrome,
    output wire         flag,
    output wire [71:0]  delta,
    output wire [63:0]  omega
);

    reg [7:0] count = 8'd0;

    localparam IDLE   = 4'b0001;
    localparam INIT   = 4'b0010;
    localparam ACTIVE = 4'b0100;
    localparam END    = 4'b1000;

    reg [3:0] state;
    reg [3:0] next_state;

    reg [127:0] syndrome_d0;

    reg [7:0] reg_A [0:16];
    reg [7:0] reg_S [0:16];
    reg [7:0] reg_C [0:16];
    reg [7:0] reg_W [0:16];
    reg [7:0] reg_T [0:16];
    reg [7:0] reg_Y [0:16];

    // [Rev 2.6 - Fix N02] Formal degree counters for dividend A(x) and remainder S(x)
    reg [4:0] deg_A;
    reg [4:0] deg_S;

    wire [7:0] X [0:16];
    wire [7:0] Y [0:16];
    wire [7:0] Z [0:16];
    wire [7:0] T [0:16];

    wire [7:0] B [0:16];
    wire [7:0] C [0:16];
    wire [7:0] D [0:16];
    wire [7:0] S [0:16];

    wire [7:0] inv_0;
    wire [7:0] fold_B;
    wire [7:0] fold_D;

    reg [7:0] reg_inv_0;
    reg [7:0] reg_fold_B;
    reg [7:0] reg_fold_D;

    reg [7:0] pos = 8'd0;

    // FSM State Register
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Cycle Counter (0 to 39 in ACTIVE, 40 at END)
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
                    next_state = INIT;
                else
                    next_state = IDLE;
            end
            INIT:   next_state = ACTIVE;
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

    // Input Syndrome Register
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            syndrome_d0 <= 128'b0;
        else
            syndrome_d0 <= syndrome;
    end

    // [Rev 2.6 - Fix N02] 2-Cycle Sub-Iteration Phase Counter (0 to 1)
    // Completes up to 16 single-degree steps in at most 32 cycles (within max = 39)
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            pos <= 8'd0;
        else if (state == ACTIVE) begin
            if (pos == 8'd0)
                pos <= 8'd1;
            else
                pos <= 8'd0;
        end else begin
            pos <= 8'd0;
        end
    end

    // Degree difference delta_d = deg_A - deg_S (always >= 0 while deg_S >= 8)
    wire [4:0] delta_d = (deg_A >= deg_S) ? (deg_A - deg_S) : 5'd0;

    // Shifted locator polynomial x^(delta_d) * reg_T(x)
    wire [7:0] T_shift [0:16];
    genvar g;
    generate
        for (g = 0; g < 17; g = g + 1) begin : gen_t_shift
            assign T_shift[g] = (g >= delta_d) ? reg_T[g - delta_d] : 8'd0;
        end
    endgenerate

    // Polynomial Register Updates
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            reg_inv_0  <= 8'b0;
            reg_fold_B <= 8'b0;
            reg_fold_D <= 8'b0;
            deg_A      <= 5'd16;
            deg_S      <= 5'd15;

            for (i = 0; i < 17; i = i + 1) begin
                reg_A[i] <= 8'b0;
                reg_C[i] <= 8'b0;
                reg_S[i] <= 8'b0;
                reg_W[i] <= 8'b0;
                reg_Y[i] <= 8'b0;
                reg_T[i] <= 8'b0;
            end
        end else if (state == INIT) begin
            reg_inv_0  <= 8'b0;
            reg_fold_B <= 8'b0;
            reg_fold_D <= 8'b0;
            deg_A      <= 5'd16;
            deg_S      <= 5'd15;

            reg_A[16] <= 8'h01;
            reg_T[0]  <= 8'h01;

            for (i = 0; i < 16; i = i + 1)
                reg_A[i] <= 8'b0;
            for (i = 1; i < 17; i = i + 1)
                reg_T[i] <= 8'b0;
            for (i = 0; i < 17; i = i + 1) begin
                reg_C[i] <= 8'b0;
                reg_W[i] <= 8'b0;
                reg_Y[i] <= 8'b0;
            end

            reg_S[16] <= syndrome_d0[127:120];
            reg_S[15] <= syndrome_d0[119:112];
            reg_S[14] <= syndrome_d0[111:104];
            reg_S[13] <= syndrome_d0[103:96];
            reg_S[12] <= syndrome_d0[95:88];
            reg_S[11] <= syndrome_d0[87:80];
            reg_S[10] <= syndrome_d0[79:72];
            reg_S[9]  <= syndrome_d0[71:64];
            reg_S[8]  <= syndrome_d0[63:56];
            reg_S[7]  <= syndrome_d0[55:48];
            reg_S[6]  <= syndrome_d0[47:40];
            reg_S[5]  <= syndrome_d0[39:32];
            reg_S[4]  <= syndrome_d0[31:24];
            reg_S[3]  <= syndrome_d0[23:16];
            reg_S[2]  <= syndrome_d0[15:8];
            reg_S[1]  <= syndrome_d0[7:0];
            reg_S[0]  <= 8'b0;
        end else if (state == ACTIVE) begin
            if (pos == 8'd0) begin
                // Phase 0: Latch multiplicative inverse of leading coefficient reg_S[16]
                reg_inv_0  <= inv_0;
                reg_fold_B <= fold_B;
            end else begin
                // Phase 1: Execute 1 degree-reduction or normalization step while deg_S >= 8
                if (deg_S >= 5'd8) begin
                    if (reg_S[16] == 8'd0) begin
                        // Rule 1: Leading coefficient of reg_S is zero -> normalize reg_S left by 1
                        for (i = 16; i >= 1; i = i - 1) begin
                            reg_S[i] <= reg_S[i - 1];
                        end
                        reg_S[0] <= 8'd0;
                        deg_S    <= deg_S - 5'd1;
                    end else if (deg_A > deg_S) begin
                        // Rule 2a (deg_A > deg_S): Eliminate reg_A[16], shift A remainder left by 1
                        for (i = 16; i >= 1; i = i - 1) begin
                            reg_A[i] <= C[i - 1];
                        end
                        reg_A[0] <= 8'd0;
                        deg_A    <= deg_A - 5'd1;

                        for (i = 0; i < 17; i = i + 1) begin
                            reg_W[i] <= Y[i];
                        end
                    end else begin
                        // Rule 2b (deg_A == deg_S): Eliminate reg_A[16], swap (A, W) <-> (S, T),
                        // and shift new S remainder left by 1
                        for (i = 0; i < 17; i = i + 1) begin
                            reg_A[i] <= reg_S[i];
                            reg_W[i] <= reg_T[i];
                            reg_T[i] <= Y[i];
                        end
                        deg_A <= deg_S;

                        for (i = 16; i >= 1; i = i - 1) begin
                            reg_S[i] <= C[i - 1];
                        end
                        reg_S[0] <= 8'd0;
                        deg_S    <= deg_S - 5'd1;
                    end
                end
                // Rule 3 (deg_S == 5'd7): Termination reached (deg(Omega) < 8); hold all registers steady
            end

            for (i = 0; i < 17; i = i + 1) begin
                reg_C[i] <= C[i];
                reg_Y[i] <= Y[i];
            end
        end
    end

    // Galois Field Inverter and Multipliers
    inverter   invert_0 (reg_S[16], inv_0);
    multiplier gf_B     (reg_inv_0, reg_A[16], fold_B);
    multiplier gf_D     (reg_inv_0, reg_C[15], fold_D);

    // [Rev 2.6] Use combinational fold_B during pos == 1 after reg_inv_0 is latched on pos == 0
    assign B[0] = 8'b0;
    multiplier gf_B16 (fold_B, reg_S[16], B[16]);
    multiplier gf_B15 (fold_B, reg_S[15], B[15]);
    multiplier gf_B14 (fold_B, reg_S[14], B[14]);
    multiplier gf_B13 (fold_B, reg_S[13], B[13]);
    multiplier gf_B12 (fold_B, reg_S[12], B[12]);
    multiplier gf_B11 (fold_B, reg_S[11], B[11]);
    multiplier gf_B10 (fold_B, reg_S[10], B[10]);
    multiplier gf_B9  (fold_B, reg_S[9],  B[9]);
    multiplier gf_B8  (fold_B, reg_S[8],  B[8]);
    multiplier gf_B7  (fold_B, reg_S[7],  B[7]);
    multiplier gf_B6  (fold_B, reg_S[6],  B[6]);
    multiplier gf_B5  (fold_B, reg_S[5],  B[5]);
    multiplier gf_B4  (fold_B, reg_S[4],  B[4]);
    multiplier gf_B3  (fold_B, reg_S[3],  B[3]);
    multiplier gf_B2  (fold_B, reg_S[2],  B[2]);
    multiplier gf_B1  (fold_B, reg_S[1],  B[1]);

    assign D[16] = 8'b0;
    multiplier gf_D15 (reg_fold_D, reg_S[16], D[15]);
    multiplier gf_D14 (reg_fold_D, reg_S[15], D[14]);
    multiplier gf_D13 (reg_fold_D, reg_S[14], D[13]);
    multiplier gf_D12 (reg_fold_D, reg_S[13], D[12]);
    multiplier gf_D11 (reg_fold_D, reg_S[12], D[11]);
    multiplier gf_D10 (reg_fold_D, reg_S[11], D[10]);
    multiplier gf_D9  (reg_fold_D, reg_S[10], D[9]);
    multiplier gf_D8  (reg_fold_D, reg_S[9],  D[8]);
    multiplier gf_D7  (reg_fold_D, reg_S[8],  D[7]);
    multiplier gf_D6  (reg_fold_D, reg_S[7],  D[6]);
    multiplier gf_D5  (reg_fold_D, reg_S[6],  D[5]);
    multiplier gf_D4  (reg_fold_D, reg_S[5],  D[4]);
    multiplier gf_D3  (reg_fold_D, reg_S[4],  D[3]);
    multiplier gf_D2  (reg_fold_D, reg_S[3],  D[2]);
    multiplier gf_D1  (reg_fold_D, reg_S[2],  D[1]);
    multiplier gf_D0  (reg_fold_D, reg_S[1],  D[0]);

    assign C[16] = reg_A[16] ^ B[16];
    assign C[15] = reg_A[15] ^ B[15];
    assign C[14] = reg_A[14] ^ B[14];
    assign C[13] = reg_A[13] ^ B[13];
    assign C[12] = reg_A[12] ^ B[12];
    assign C[11] = reg_A[11] ^ B[11];
    assign C[10] = reg_A[10] ^ B[10];
    assign C[9]  = reg_A[9]  ^ B[9];
    assign C[8]  = reg_A[8]  ^ B[8];
    assign C[7]  = reg_A[7]  ^ B[7];
    assign C[6]  = reg_A[6]  ^ B[6];
    assign C[5] = reg_A[5]  ^ B[5];
    assign C[4]  = reg_A[4]  ^ B[4];
    assign C[3]  = reg_A[3]  ^ B[3];
    assign C[2]  = reg_A[2]  ^ B[2];
    assign C[1]  = reg_A[1]  ^ B[1];
    assign C[0]  = reg_A[0]  ^ B[0];

    assign S[16] = reg_C[16] ^ D[16];
    assign S[15] = reg_C[15] ^ D[15];
    assign S[14] = reg_C[14] ^ D[14];
    assign S[13] = reg_C[13] ^ D[13];
    assign S[12] = reg_C[12] ^ D[12];
    assign S[11] = reg_C[11] ^ D[11];
    assign S[10] = reg_C[10] ^ D[10];
    assign S[9]  = reg_C[9]  ^ D[9];
    assign S[8]  = reg_C[8]  ^ D[8];
    assign S[7]  = reg_C[7]  ^ D[7];
    assign S[6]  = reg_C[6]  ^ D[6];
    assign S[5]  = reg_C[5]  ^ D[5];
    assign S[4]  = reg_C[4]  ^ D[4];
    assign S[3]  = reg_C[3]  ^ D[3];
    assign S[2]  = reg_C[2]  ^ D[2];
    assign S[1]  = reg_C[1]  ^ D[1];
    assign S[0]  = reg_C[0]  ^ D[0];

    // [Rev 2.6] Multiply fold_B by x^(delta_d) * reg_T(x) = T_shift[16:0]
    multiplier gf_X16 (fold_B, T_shift[16], X[16]);
    multiplier gf_X14 (fold_B, T_shift[15], X[15]);
    multiplier gf_X13 (fold_B, T_shift[14], X[14]);
    multiplier gf_X12 (fold_B, T_shift[13], X[13]);
    multiplier gf_X11 (fold_B, T_shift[12], X[12]);
    multiplier gf_X10 (fold_B, T_shift[11], X[11]);
    multiplier gf_X9  (fold_B, T_shift[10], X[10]);
    multiplier gf_X8  (fold_B, T_shift[9],  X[9]);
    multiplier gf_X7  (fold_B, T_shift[8],  X[8]);
    multiplier gf_X6  (fold_B, T_shift[7],  X[7]);
    multiplier gf_X5  (fold_B, T_shift[6],  X[6]);
    multiplier gf_X4  (fold_B, T_shift[5],  X[5]);
    multiplier gf_X3  (fold_B, T_shift[4],  X[4]);
    multiplier gf_X2  (fold_B, T_shift[3],  X[3]);
    multiplier gf_X1  (fold_B, T_shift[2],  X[2]);
    multiplier gf_X0  (fold_B, T_shift[1],  X[1]);
    multiplier gf_X00 (fold_B, T_shift[0],  X[0]);

    assign Z[16] = 8'b0;
    multiplier gf_Y15 (reg_fold_D, reg_T[15], Z[15]);
    multiplier gf_Y14 (reg_fold_D, reg_T[14], Z[14]);
    multiplier gf_Y13 (reg_fold_D, reg_T[13], Z[13]);
    multiplier gf_Y12 (reg_fold_D, reg_T[12], Z[12]);
    multiplier gf_Y11 (reg_fold_D, reg_T[11], Z[11]);
    multiplier gf_Y10 (reg_fold_D, reg_T[10], Z[10]);
    multiplier gf_Y9  (reg_fold_D, reg_T[9],  Z[9]);
    multiplier gf_Y8  (reg_fold_D, reg_T[8],  Z[8]);
    multiplier gf_Y7  (reg_fold_D, reg_T[7],  Z[7]);
    multiplier gf_Y6  (reg_fold_D, reg_T[6],  Z[6]);
    multiplier gf_Y5  (reg_fold_D, reg_T[5],  Z[5]);
    multiplier gf_Y4  (reg_fold_D, reg_T[4],  Z[4]);
    multiplier gf_Y3  (reg_fold_D, reg_T[3],  Z[3]);
    multiplier gf_Y2  (reg_fold_D, reg_T[2],  Z[2]);
    multiplier gf_Y1  (reg_fold_D, reg_T[1],  Z[1]);
    multiplier gf_Y0  (reg_fold_D, reg_T[0],  Z[0]);

    assign Y[16] = reg_W[16] ^ X[16];
    assign Y[15] = reg_W[15] ^ X[15];
    assign Y[14] = reg_W[14] ^ X[14];
    assign Y[13] = reg_W[13] ^ X[13];
    assign Y[12] = reg_W[12] ^ X[12];
    assign Y[11] = reg_W[11] ^ X[11];
    assign Y[10] = reg_W[10] ^ X[10];
    assign Y[9]  = reg_W[9]  ^ X[9];
    assign Y[8]  = reg_W[8]  ^ X[8];
    assign Y[7]  = reg_W[7]  ^ X[7];
    assign Y[6]  = reg_W[6]  ^ X[6];
    assign Y[5]  = reg_W[5]  ^ X[5];
    assign Y[4]  = reg_W[4]  ^ X[4];
    assign Y[3]  = reg_W[3]  ^ X[3];
    assign Y[2]  = reg_W[2]  ^ X[2];
    assign Y[1]  = reg_W[1]  ^ X[1];
    assign Y[0]  = reg_W[0]  ^ X[0];

    assign T[16] = reg_Y[16] ^ Z[16];
    assign T[15] = reg_Y[15] ^ Z[15];
    assign T[14] = reg_Y[14] ^ Z[14];
    assign T[13] = reg_Y[13] ^ Z[13];
    assign T[12] = reg_Y[12] ^ Z[12];
    assign T[11] = reg_Y[11] ^ Z[11];
    assign T[10] = reg_Y[10] ^ Z[10];
    assign T[9]  = reg_Y[9]  ^ Z[9];
    assign T[8]  = reg_Y[8]  ^ Z[8];
    assign T[7]  = reg_Y[7]  ^ Z[7];
    assign T[6]  = reg_Y[6]  ^ Z[6];
    assign T[5]  = reg_Y[5]  ^ Z[5];
    assign T[4]  = reg_Y[4]  ^ Z[4];
    assign T[3]  = reg_Y[3]  ^ Z[3];
    assign T[2]  = reg_Y[2]  ^ Z[2];
    assign T[1]  = reg_Y[1]  ^ Z[1];
    assign T[0]  = reg_Y[0]  ^ Z[0];

    assign flag  = (count == 8'd40);
    assign delta = (flag) ? {reg_T[8], reg_T[7], reg_T[6], reg_T[5], reg_T[4], reg_T[3], reg_T[2], reg_T[1], reg_T[0]} : 72'b0;
    assign omega = (flag) ? {reg_S[16], reg_S[15], reg_S[14], reg_S[13], reg_S[12], reg_S[11], reg_S[10], reg_S[9]} : 64'b0;

endmodule