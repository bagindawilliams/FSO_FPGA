`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University / ETRI Daejeon
Engineers    : Irzal Zaini & Williamsyah Baginda Miraj
Module Name  : syndrome_unit
Description  : Reed-Solomon Syndrome Computation Unit over GF(2^8).
               Evaluates the incoming codeword at 16 consecutive roots 
               (alpha^0 to alpha^15) over a 256-cycle evaluation window.
               For shortened RS(32,16) headers, the 223 trailing zero cycles 
               automatically shift the codeword roots to align with the 
               Chien search starting position (alpha^-254).

Revision History:
  - Rev 1.0 (Initial) : Syndrome computation for roots alpha^0..alpha^15 over 0x11D.
  - Rev 2.0 (2026-10-27 03:54 KST) : [ETRI Audit Item 2 & 3 - SDA OISL Page 37, Sec. 2.6.3.6.3]
    Updated the 16 syndrome evaluation roots (gf_0..gf_f) to r_k = alpha^((11*(120+k)) % 255)
    for j = 120..135 over GF(2^8) 0x187:
      j=120 (alpha^45)=8'h78, j=121 (alpha^56)=8'h3f, j=122 (alpha^67)=8'hac, j=123 (alpha^78)=8'h13,
      j=124 (alpha^89)=8'h84, j=125 (alpha^100)=8'h06, j=126 (alpha^111)=8'he0, j=127 (alpha^122)=8'h8a,
      j=128 (alpha^133)=8'h9c, j=129 (alpha^144)=8'h88, j=130 (alpha^155)=8'h41, j=131 (alpha^166)=8'h73,
      j=132 (alpha^177)=8'h35, j=133 (alpha^188)=8'h0b, j=134 (alpha^199)=8'h0a, j=135 (alpha^210)=8'ha7.
===========================================================================
*/

module syndrome_unit #(
    parameter max = 255
)(
    input  wire         clk,
    input  wire         rst_n,
    input  wire         en,
    input  wire [7:0]   data_in,
    output wire         flag,
    output wire [127:0] syndrome
);

    reg [15:0] count = 16'd0;

    reg  [7:0] Q [0:15];
    wire [7:0] D [0:15];
    wire [7:0] C [0:15];

    localparam IDLE   = 3'b001;
    localparam ACTIVE = 3'b010;
    localparam END    = 3'b100;

    reg [2:0] state;
    reg [2:0] next_state;

    reg [7:0] data_in_d0;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            count <= 16'd0;
        else if (state == ACTIVE)
            count <= count + 1'b1;
        else
            count <= 16'd0;
    end

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

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            data_in_d0 <= 8'b0;
        else
            data_in_d0 <= data_in;
    end

    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < 16; i = i + 1)
                Q[i] <= 8'b0;
        end else if (state == ACTIVE) begin
            for (i = 0; i < 16; i = i + 1)
                Q[i] <= D[i];
        end else begin
            for (i = 0; i < 16; i = i + 1)
                Q[i] <= 8'b0;
        end
    end

    // [Rev 2.0 - 2026-10-27 03:54 KST] Evaluation roots alpha^(11*j) for j = 120..135 over GF(0x187)
    multiplier gf_0 (8'h78, Q[0],  C[0]);
    multiplier gf_1 (8'h3f, Q[1],  C[1]);
    multiplier gf_2 (8'hac, Q[2],  C[2]);
    multiplier gf_3 (8'h13, Q[3],  C[3]);
    multiplier gf_4 (8'h84, Q[4],  C[4]);
    multiplier gf_5 (8'h06, Q[5],  C[5]);
    multiplier gf_6 (8'he0, Q[6],  C[6]);
    multiplier gf_7 (8'h8a, Q[7],  C[7]);
    multiplier gf_8 (8'h9c, Q[8],  C[8]);
    multiplier gf_9 (8'h88, Q[9],  C[9]);
    multiplier gf_a (8'h41, Q[10], C[10]);
    multiplier gf_b (8'h73, Q[11], C[11]);
    multiplier gf_c (8'h35, Q[12], C[12]);
    multiplier gf_d (8'h0b, Q[13], C[13]);
    multiplier gf_e (8'h0a, Q[14], C[14]);
    multiplier gf_f (8'ha7, Q[15], C[15]);

    assign D[0]  = data_in_d0 ^ C[0];
    assign D[1]  = data_in_d0 ^ C[1];
    assign D[2]  = data_in_d0 ^ C[2];
    assign D[3]  = data_in_d0 ^ C[3];
    assign D[4]  = data_in_d0 ^ C[4];
    assign D[5]  = data_in_d0 ^ C[5];
    assign D[6]  = data_in_d0 ^ C[6];
    assign D[7]  = data_in_d0 ^ C[7];
    assign D[8]  = data_in_d0 ^ C[8];
    assign D[9]  = data_in_d0 ^ C[9];
    assign D[10] = data_in_d0 ^ C[10];
    assign D[11] = data_in_d0 ^ C[11];
    assign D[12] = data_in_d0 ^ C[12];
    assign D[13] = data_in_d0 ^ C[13];
    assign D[14] = data_in_d0 ^ C[14];
    assign D[15] = data_in_d0 ^ C[15];

    assign syndrome[127:120] = (state == END) ? Q[15] : 8'b0;
    assign syndrome[119:112] = (state == END) ? Q[14] : 8'b0;
    assign syndrome[111:104] = (state == END) ? Q[13] : 8'b0;
    assign syndrome[103:96]  = (state == END) ? Q[12] : 8'b0;
    assign syndrome[95:88]   = (state == END) ? Q[11] : 8'b0;
    assign syndrome[87:80]   = (state == END) ? Q[10] : 8'b0;
    assign syndrome[79:72]   = (state == END) ? Q[9]  : 8'b0;
    assign syndrome[71:64]   = (state == END) ? Q[8]  : 8'b0;
    assign syndrome[63:56]   = (state == END) ? Q[7]  : 8'b0;
    assign syndrome[55:48]   = (state == END) ? Q[6]  : 8'b0;
    assign syndrome[47:40]   = (state == END) ? Q[5]  : 8'b0;
    assign syndrome[39:32]   = (state == END) ? Q[4]  : 8'b0;
    assign syndrome[31:24]   = (state == END) ? Q[3]  : 8'b0;
    assign syndrome[23:16]   = (state == END) ? Q[2]  : 8'b0;
    assign syndrome[15:8]    = (state == END) ? Q[1]  : 8'b0;
    assign syndrome[7:0]     = (state == END) ? Q[0]  : 8'b0;

    assign flag = (state == END);

endmodule