`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : inverter
Description  : Galois Field GF(2^8) Multiplicative Inverse Lookup Unit.
               Computes (data_in)^(-1) = alpha^((255 - log_alpha(data_in)) mod 255)
               using log/antilog lookup tables (alpha_value.mem and 
               decimal_value.mem).

Revision History:
  - Rev 1.0 (Initial) : Baseline GF(2^8) inverter over 0x11D tables.
  - Rev 2.0 (2026-10-27 03:54 KST) : [ETRI Audit Item 2 - SDA OISL Page 37, Sec. 2.6.3.6.3]
    Updated lookup tables to GF(2^8) primitive polynomial F(x) = x^8 + x^7 + x^2 + x + 1 (0x187).
  - Rev 2.3 (2026-10-29 12:39 KST) : [Audit Fix F03 - Modulo-255 Inverse for Unity (a = 8'h01)]
    Preserved original module structure and parameter max = 255. Fixed exponent wrap
    when b == 8'd0 (data_in == 8'd1) so c = 8'd0 (alpha^0 = 8'h01 instead of indexing 
    decimal_value[255] = 8'h00) and mapped data_in == 8'd0 to 8'd0.
===========================================================================
*/

module inverter # (parameter max = 255) (
    input   [7:0]   data_in,
    output  [7:0]   data_out
);

    reg [7:0] decimal_value [0:max];
    reg [7:0] alpha_value   [0:max];

    initial begin
        // Load GF(2^8) 0x187 log and antilog tables
        $readmemh("decimal_value.mem", decimal_value);
        $readmemh("alpha_value.mem",   alpha_value);
    end

    wire [7:0] b;
    wire [7:0] c;

    assign b = alpha_value[data_in];
    assign c = (b == 8'd0) ? 8'd0 : (8'd255 - b);

    assign data_out = (data_in == 8'd0) ? 8'd0 : decimal_value[c];

endmodule