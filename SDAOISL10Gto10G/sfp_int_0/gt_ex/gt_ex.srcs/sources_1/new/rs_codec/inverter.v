`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University / ETRI Daejeon
Engineers    : Irzal Zaini & Williamsyah Baginda Miraj
Module Name  : inverter
Description  : Galois Field GF(2^8) Multiplicative Inverse Lookup Module.
               Maps an 8-bit field element 'a' to its multiplicative inverse 
               'r = a^(-1)' using logarithm (alpha_value.mem) and antilogarithm 
               (decimal_value.mem) lookup tables constructed with primitive 
               polynomial p(x) = x^8 + x^4 + x^3 + x^2 + 1 (0x11D).
===========================================================================
*/

module inverter #(
    parameter max = 255
)(
    input  wire [7:0] a,
    output wire [7:0] r
);

    wire [7:0] alpha_a;
    wire [7:0] alpha_r;

    reg  [7:0] alpha_value   [0:max];
    reg  [7:0] decimal_value [0:max];

    initial begin
        $readmemh("alpha_value.mem", alpha_value);
        $readmemh("decimal_value.mem", decimal_value);
    end

    assign alpha_a = alpha_value[a];
    assign alpha_r = (alpha_a == max) ? ((alpha_a == 8'b0) ? max : 8'b0) : (alpha_a - (alpha_a * 2) + max);
    assign r       = decimal_value[alpha_r];

endmodule