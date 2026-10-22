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