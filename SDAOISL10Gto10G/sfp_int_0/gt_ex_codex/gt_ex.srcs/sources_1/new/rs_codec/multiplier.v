`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University / ETRI Daejeon
Engineers    : Irzal Zaini & Williamsyah Baginda Miraj
Module Name  : multiplier
Description  : Galois Field GF(2^8) Multiplier Module.
               Computes the product 'r = a * b' over GF(2^8) by adding the 
               logarithm exponents modulo 255 via lookup tables 
               (alpha_value.mem and decimal_value.mem).

Revision History:
  - Rev 1.0 (Initial) : GF(2^8) log/antilog multiplier using 0x11D tables.
  - Rev 2.0 (2026-10-27 03:54 KST) : [ETRI Audit Item 2 - SDA OISL Page 37, Sec. 2.6.3.6.3]
    Operates over the rebuilt GF(2^8) tables (alpha_value.mem & decimal_value.mem)
    generated with primitive polynomial F(x) = x^8 + x^7 + x^2 + x + 1 (0x187).
===========================================================================
*/

module multiplier #(
    parameter max = 255
)(
    input  wire [7:0] a,
    input  wire [7:0] b,
    output wire [7:0] r
);

    wire [7:0] alpha_a;
    wire [7:0] alpha_b;
    wire [7:0] alpha_r;

    reg  [7:0] alpha_value   [0:max];
    reg  [7:0] decimal_value [0:max];

    initial begin
        $readmemh("alpha_value.mem", alpha_value);
        $readmemh("decimal_value.mem", decimal_value);
    end

    assign alpha_a = alpha_value[a];
    assign alpha_b = alpha_value[b];
    assign alpha_r = (alpha_a == max || alpha_b == max) ? max : (alpha_a + alpha_b) % max;
    assign r       = decimal_value[alpha_r];

endmodule