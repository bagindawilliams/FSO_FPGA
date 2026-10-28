`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Top Module for FSO Header Path.
               Instantiates the Header Generator and FSO CRC-16.
               Outputs a clean, sequential 16-Byte Header stream.
===========================================================================
*/

module fso_header_top (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        trigger_header_gen,

    // Dynamic ARQ & Status Parameters
    input  wire [15:0] txfn_in,
    input  wire [15:0] rxfn_in,
    input  wire        ack_in,
    input  wire        ack_valid_in,
    input  wire [1:0]  frame_type_in, 
    
    // Telemetry & Timing Inputs
    input  wire [39:0] tx_ts_in,
    input  wire [5:0]  tod_seconds_in,
    input  wire [2:0]  ts_applies_in,
    input  wire [3:0]  fcch_opcode_in,
    input  wire [15:0] fcch_pl_in,

    // Serialized Output to CDC (8-bit @ 312.5 MHz)
    output wire [7:0]  final_header_byte,
    output wire        final_header_valid,
    output wire        system_busy
);

    wire [7:0] raw_header_byte;
    wire       raw_header_en;

    // 1. Instantiate the Header Generator
    header_generator u_header_gen (
        .clk             (clk),
        .rst_n           (rst_n),
        .trigger_gen     (trigger_header_gen),
        .txfn            (txfn_in),
        .rxfn            (rxfn_in),
        .ack             (ack_in),
        .ack_valid       (ack_valid_in),
        .frame_type      (frame_type_in),
        .tx_ts           (tx_ts_in),
        .tod_seconds     (tod_seconds_in),
        .ts_applies      (ts_applies_in),
        .fcch_opcode     (fcch_opcode_in),
        .fcch_pl         (fcch_pl_in),
        .header_byte_out (raw_header_byte),
        .header_en_out   (raw_header_en),
        .gen_busy        (system_busy)
    );

    // 2. Instantiate the FSO CRC-16 (Irzal Zaini's Core)
    fso_crc_16 #(.max(15)) u_crc_16 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (raw_header_en),
        .data_in  (raw_header_byte),
        .flag     (final_header_valid),
        .data_out (final_header_byte)
    );

endmodule