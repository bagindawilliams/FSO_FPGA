`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University / ETRI Daejeon
Engineers    : Irzal Zaini & Williamsyah Baginda Miraj
Module Name  : lpc_dec_top
Description  : 4-Lane Parallel LPC(24,16) Decoder Top Module (96-bit -> 64-bit).
               Instantiates 4 parallel 24-to-16 bit LPC decoders (lpc_dec_3 .. 
               lpc_dec_0) and tracks cumulative corrected single-bit errors 
               (total_corrected_bits) for testbench telemetry.

Revision History:
  - Rev 1.0 (Initial) : 4-lane parallel LPC(24,16) decoder wrapper.
  - Rev 2.2 (2026-10-28 14:55 KST) : Defined 'total_corrected_bits' telemetry
    counter and synchronized internal monitor wires with lpc_dec.v Rev 2.2.
===========================================================================
*/

module lpc_dec_top (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        en,
    input  wire [95:0] data_in,
    output wire        flag,
    output wire [63:0] data_out
);

    wire [3:0] f;
    assign flag = &f;

    lpc_dec lpc_dec_3 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[95:72]),
        .flag     (f[3]),
        .data_out (data_out[63:48])
    );

    lpc_dec lpc_dec_2 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[71:48]),
        .flag     (f[2]),
        .data_out (data_out[47:32])
    );

    lpc_dec lpc_dec_1 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[47:24]),
        .flag     (f[1]),
        .data_out (data_out[31:16])
    );

    lpc_dec lpc_dec_0 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[23:0]),
        .flag     (f[0]),
        .data_out (data_out[15:0])
    );

    // Cumulative Single-Bit Error Repair Counter for Testbench Telemetry
    reg [15:0] total_corrected_bits;
    wire [2:0] cycle_repaired_cnt = lpc_dec_3.corrected_bit_stb +
                                    lpc_dec_2.corrected_bit_stb +
                                    lpc_dec_1.corrected_bit_stb +
                                    lpc_dec_0.corrected_bit_stb;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n)
            total_corrected_bits <= 16'd0;
        else if (flag)
            total_corrected_bits <= total_corrected_bits + {13'd0, cycle_repaired_cnt};
    end

endmodule