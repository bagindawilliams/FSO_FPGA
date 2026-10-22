`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab, Kookmin University
// Engineer: Williamsyah Baginda Miraj & Giovanni Dwi
// Create Date: 12/28/2025 06:04:20 PM
// Module Name: core_rx
// Description: FEC Reception Core (Demux Preamble -> LPC Dec -> Descrambler -> 
//              FEC_Demux -> RS Header & Payload Decoders).
//
// Revision Note:
//   - Updated hierarchy:
//     1) demux_preamble_128
//     2) preamble_sda_decoder
//     3) lpc_dec_top (4 x lpc_dec)
//     4) descrambler
//     5) FEC_Demux (renamed from separator / FEC_separator)
//     6) rs_decoder & rs_decoder_64
//////////////////////////////////////////////////////////////////////////////////

module core_rx(
    input               clk,
    input               rst_n,
    input               en,
    input   [127:0]     data_in,      // 128-bit from rx_gth_logic (CDC 3)
    output              header_dv,    // 16 cycles @ 8-bit (16-Byte Decoded Header)
    output  [7:0]       header,
    output              payload_dv,   // 239 cycles @ 64-bit (1912-Byte Decoded Payload)
    output  [63:0]      payload,
    output              link_locked   // Optical Preamble 72-bit lock status
);

    // 1. Demux Preamble & LPC Wires
    wire [71:0] preamble_extracted;
    wire        preamble_valid;
    wire [95:0] lpc_data_raw;
    wire        lpc_valid_raw;

    // 2. LPC Decoder -> Descrambler Wires
    wire        lpc_dv;
    wire [63:0] lpc;

    // 3. Descrambler -> FEC_Demux Wires
    wire        descrambler_dv;
    wire [63:0] descrambled_data;

    // 4. FEC_Demux -> RS Decoders Wires
    wire        rs_head_dv;
    wire [7:0]  rs_head;
    wire        rs_load_dv;
    wire [63:0] rs_load;

    // --- 1. INSTANSIASI DEMULTIPLEXER 128-BIT ---
    demux_preamble_128 demux_inst (
        .clk                (clk),
        .rst_n              (rst_n),
        .cdc_data_in        (data_in),
        .cdc_valid_in       (en),
        .preamble_extracted (preamble_extracted),
        .preamble_valid     (preamble_valid),
        .lpc_data_out       (lpc_data_raw),
        .lpc_valid_out      (lpc_valid_raw)
    );

    // --- 2. INSTANSIASI PREAMBLE SDA DECODER ---
    preamble_sda_decoder preamble_sda_decoder_inst (
        .clk                (clk),
        .rst_n              (rst_n),
        .preamble_in        (preamble_extracted),
        .preamble_valid_in  (preamble_valid),
        .link_locked_out    (link_locked)
    );

    // --- 3. INSTANSIASI LPC(24,16) DECODER TOP (96-bit -> 64-bit) ---
    lpc_dec_top lpc_dec_top_inst (
        .clk                (clk),
        .rst_n              (rst_n),
        .en                 (lpc_valid_raw),
        .data_in            (lpc_data_raw),
        .flag               (lpc_dv),
        .data_out           (lpc)
    );

    // --- 4. INSTANSIASI PRBS DESCRAMBLER (64-bit, 259 Siklus) ---
    descrambler descrambler_inst (
        .clk                (clk),
        .rst_n              (rst_n),
        .en                 (lpc_dv),
        .data_in            (lpc),
        .flag               (descrambler_dv),
        .data_out           (descrambled_data)
    );

    // --- 5. INSTANSIASI FEC_DEMUX (259x64b -> 32x8b Hdr + 255x64b Pld) ---
    FEC_Demux fec_demux_inst (
        .clk                (clk),
        .rst_n              (rst_n),
        .en                 (descrambler_dv),
        .data_in            (descrambled_data),
        .header_dv          (rs_head_dv),
        .header             (rs_head),
        .payload_dv         (rs_load_dv),
        .payload            (rs_load)
    );

    // --- 6. INSTANSIASI RS(32,16) HEADER DECODER ---
    rs_decoder #(33) rs_decoder_inst (
        .clk                (clk),
        .rst_n              (rst_n),
        .en                 (rs_head_dv),
        .data_in            (rs_head),
        .flag               (header_dv),
        .data_out           (header)
    );

    // --- 7. INSTANSIASI 8xRS(255,239) PAYLOAD DECODER ---
    rs_decoder_64 rs_decoder_64_inst (
        .clk                (clk),
        .rst_n              (rst_n),
        .en                 (rs_load_dv),
        .data_in            (rs_load),
        .flag               (payload_dv),
        .data_out           (payload)
    );

endmodule