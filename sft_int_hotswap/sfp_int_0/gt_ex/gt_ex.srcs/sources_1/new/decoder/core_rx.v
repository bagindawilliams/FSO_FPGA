`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2025 06:04:20 PM
// Design Name: 
// Module Name: core_rx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module core_rx(
    input               clk,
    input               rst_n,
    input               en,
    input   [127:0]     data_in, // UBAH: Menerima 128-bit dari CDC
    output              header_dv,
    output  [7:0]       header,
    output              payload_dv,
    output  [63:0]      payload,
    output              link_locked // BARU: Sinyal indikator Preamble sinkron
);

// --- KABEL INTERNAL BARU UNTUK DEMUX & PREAMBLE ---
wire [71:0] preamble_extracted;
wire        preamble_valid;
wire [95:0] lpc_data_raw;
wire        lpc_valid_raw;

// --- KABEL EKSISTING ---
wire    lpc_dv;
wire    [63:0]      lpc;
wire    scrambler_dv;
wire    [63:0]      scrambler;

wire    rs_head_dv;
wire    [7:0]       rs_head;
wire    rs_load_dv;
wire    [63:0]      rs_load;

// --- 1. INSTANSIASI DEMULTIPLEXER 128-BIT ---
demux_preamble_128 demux_inst (
    .clk                (clk)
    ,.rst_n             (rst_n)
    ,.cdc_data_in       (data_in)
    ,.cdc_valid_in      (en)
    ,.preamble_extracted(preamble_extracted)
    ,.preamble_valid    (preamble_valid)
    ,.lpc_data_out      (lpc_data_raw)
    ,.lpc_valid_out     (lpc_valid_raw)
);

// --- 2. INSTANSIASI PREAMBLE SDA DECODER ---
preamble_sda_dec preamble_sda_dec_inst (
    .clk                (clk)
    ,.rst_n             (rst_n)
    ,.preamble_in       (preamble_extracted)
    ,.preamble_valid_in (preamble_valid)
    ,.link_locked_out   (link_locked)
);

// --- 3. BLOK EKSISTING (DISAMBUNG KE OUTPUT DEMUX) ---
lpc_dec_top lpc_dec_top_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (lpc_valid_raw)   // UBAH: Trigger dari Demux
    ,.data_in       (lpc_data_raw)    // UBAH: Data 96-bit dari Demux
    ,.flag          (lpc_dv)
    ,.data_out      (lpc)
);

scrambler scrambler_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (lpc_dv)
    ,.data_in       (lpc)
    ,.flag          (scrambler_dv)
    ,.data_out      (scrambler)
);

separator separator_inst (
    .clk                (clk)
    ,.rst_n             (rst_n)
    ,.en                (scrambler_dv)
    ,.data_in           (scrambler)
    ,.header_dv         (rs_head_dv)
    ,.header            (rs_head)
    ,.payload_dv        (rs_load_dv)
    ,.payload           (rs_load)
);

rs_decoder #(33) rs_decoder_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (rs_head_dv)
    ,.data_in       (rs_head)
    ,.flag          (header_dv)
    ,.data_out      (header)
);

rs_decoder_64 rs_decoder_64_inst (
    .clk            (clk)
    ,.rst_n         (rst_n)
    ,.en            (rs_load_dv)
    ,.data_in       (rs_load)
    ,.flag          (payload_dv)
    ,.data_out      (payload)
);

endmodule

