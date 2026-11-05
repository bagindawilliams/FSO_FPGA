`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : sda_decoder
Description  : Complete SDA OISL Receiver Grand Top Module.
               Integrates all 5 receiver stages:
               1. rx_gth_logic             (CDC 3: 312.5M 32b -> 200M 128b)
               2. core_rx                  (Demux 128, LPC Dec, Descrambler, 
                                            FEC_Demux, RS(32,16) & 8xRS(255,239))
               3. rx_logic_gth             (CDC 4: 200M -> 312.5M Hdr & Pld)
               4. fso_ethernet_deframer    (CRC-16/32 Check, Header Parser, 
                                            Selective Repeat ARQ & Frame Demux)
               5. ethernet_frame_reassembly(De-Segmenter, Padding Stripper, 
                                            eth_preamble_gen & mux_eth_32)

Revision History:
  - Rev 1.0 (Initial) : SDA Decoder top-level receiver integration.
  - Rev 2.5 (2026-10-29 16:42 KST) : [Audit Fix R05 - Peer vs. Local ARQ Feedback Routing]
    Connected 'peer_rxfn_out', 'peer_ack_out', and 'peer_ack_valid_out' on 
    u_fso_ethernet_deframer and added parameter 'LOOPBACK_ARQ_DIRECT'.
  - Rev 2.6 (2026-10-30 00:55 KST) : [Audit Fix N01 - Exact Child Port Name Alignment]
    Restored exact child port names '.link_locked(rx_preamble_locked)' on u_core_rx 
    and '.header(m_axis_hdr_tdata)', '.payload(m_axis_fso_tdata)' on u_cdc_rx_4.
  - Rev 2.7 (2026-10-30 01:55 KST) : [Audit Fix N05 - Dedicated Peer ACK Output Ports]
    Exported dedicated 'peer_fb_rxfn', 'peer_fb_ack', and 'peer_fb_ack_valid' outputs
    alongside 'arq_fb_*' so two-terminal deployments can route local CRC feedback to 
    outbound Header generation and peer Header ACK feedback to the local TX tracker 
    simultaneously without multiplexing loss.
===========================================================================
*/

module sda_decoder #(
    parameter LOOPBACK_ARQ_DIRECT = 1
)(
    input  wire        clk_gth,            // 312.5 MHz RX Recovered Clock
    input  wire        clk_logic,          // 200.0 MHz Baseband Logic Clock
    input  wire        rst_n,              // Active-low reset

    // Input from gth64b66b_rx.v (312.5 MHz Domain, 3117 Bytes/frame)
    input  wire        rx_fso_valid_in,
    input  wire [31:0] rx_fso_data_in,

    // Reassembled Ethernet Frame Output to eth_tx_back_end_top (2008 Bytes for 2000B Jumbo)
    output wire [31:0] m_axis_eth_tdata,
    output wire        m_axis_eth_tvalid,
    output wire        m_axis_eth_tlast,

    // Closed-Loop ARQ Feedback Output to sda_encoder (Local RX CRC Feedback)
    output wire [15:0] arq_fb_rxfn,
    output wire        arq_fb_ack,
    output wire        arq_fb_ack_valid,

    // [Rev 2.7 - Fix N05] Dedicated Remote Peer Header ACK Outputs to sda_encoder
    output wire [15:0] peer_fb_rxfn,
    output wire        peer_fb_ack,
    output wire        peer_fb_ack_valid,

    // Probing & Status Outputs
    output wire        m_axis_hdr_tvalid,
    output wire [7:0]  m_axis_hdr_tdata,
    output wire        m_axis_fso_tvalid,
    output wire [31:0] m_axis_fso_tdata,
    output wire        rx_preamble_locked,
    output wire        hdr_crc_ok,
    output wire        pld_crc_ok
);

    // 1. CDC 3 -> core_rx (200.0 MHz, 128-bit)
    wire         core_dv;
    wire [127:0] core_data;

    // 2. core_rx -> CDC 4 (200.0 MHz)
    wire         rs_head_dv;
    wire [7:0]   rs_head;
    wire         rs_load_dv;
    wire [63:0]  rs_load;

    // 3. fso_ethernet_deframer -> ethernet_frame_reassembly (312.5 MHz, 1908 Bytes)
    wire [31:0]  deframed_data_tdata;
    wire         deframed_data_tvalid;
    wire         deframed_data_tlast;
    wire         deframed_data_tready;

    // [Rev 2.5 & Rev 2.7 - Fix N05] Distinct wires for local CRC feedback and remote peer Header ACK
    wire [15:0]  local_fb_rxfn_w;
    wire         local_fb_ack_w;
    wire         local_fb_ack_valid_w;
    wire [15:0]  peer_rxfn_w;
    wire         peer_ack_w;
    wire         peer_ack_valid_w;

    assign arq_fb_rxfn       = LOOPBACK_ARQ_DIRECT ? local_fb_rxfn_w      : local_fb_rxfn_w;
    assign arq_fb_ack        = LOOPBACK_ARQ_DIRECT ? local_fb_ack_w       : local_fb_ack_w;
    assign arq_fb_ack_valid  = LOOPBACK_ARQ_DIRECT ? local_fb_ack_valid_w : local_fb_ack_valid_w;

    assign peer_fb_rxfn      = peer_rxfn_w;
    assign peer_fb_ack       = peer_ack_w;
    assign peer_fb_ack_valid = peer_ack_valid_w;

    // Stage 1: CDC 3 (312.5 MHz 32b -> 200.0 MHz 128b)
    rx_gth_logic u_cdc_rx_3 (
        .clk_gth   (clk_gth),
        .clk_logic (clk_logic),
        .rst_n     (rst_n),
        .en        (rx_fso_valid_in),
        .data_in   (rx_fso_data_in),
        .flag      (core_dv),
        .data_out  (core_data)
    );

    // Stage 2: Baseband FEC Reception Core (200.0 MHz)
    core_rx u_core_rx (
        .clk         (clk_logic),
        .rst_n       (rst_n),
        .en          (core_dv),
        .data_in     (core_data),
        .header_dv   (rs_head_dv),
        .header      (rs_head),
        .payload_dv  (rs_load_dv),
        .payload     (rs_load),
        .link_locked (rx_preamble_locked)
    );

    // Stage 3: CDC 4 (200.0 MHz 8b Hdr / 64b Pld -> 312.5 MHz 8b Hdr / 32b Pld)
    rx_logic_gth u_cdc_rx_4 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en_head    (rs_head_dv),
        .en_load    (rs_load_dv),
        .header_in  (rs_head),
        .payload_in (rs_load),
        .header_dv  (m_axis_hdr_tvalid),
        .header     (m_axis_hdr_tdata),
        .payload_dv (m_axis_fso_tvalid),
        .payload    (m_axis_fso_tdata)
    );

    // Stage 4: FSO-to-Ethernet Deframer, CRC-16/32 Verifier, ARQ RX Controller & Reorder Buffer
    fso_ethernet_deframer u_fso_ethernet_deframer (
        .clk                  (clk_gth),
        .rst_n                (rst_n),
        .s_axis_hdr_tvalid    (m_axis_hdr_tvalid),
        .s_axis_hdr_tdata     (m_axis_hdr_tdata),
        .s_axis_fso_tvalid    (m_axis_fso_tvalid),
        .s_axis_fso_tdata     (m_axis_fso_tdata),
        .m_axis_fso_tdata     (deframed_data_tdata),
        .m_axis_fso_tvalid    (deframed_data_tvalid),
        .m_axis_fso_tlast     (deframed_data_tlast),
        .m_axis_fso_tready    (deframed_data_tready),
        .local_fb_rxfn        (local_fb_rxfn_w),
        .local_fb_ack         (local_fb_ack_w),
        .local_fb_ack_valid   (local_fb_ack_valid_w),
        .peer_rxfn_out        (peer_rxfn_w),
        .peer_ack_out         (peer_ack_w),
        .peer_ack_valid_out   (peer_ack_valid_w),
        .hdr_crc_ok           (hdr_crc_ok),
        .pld_crc_ok           (pld_crc_ok),
        .rx_txfn              (),
        .rx_frame_type        (),
        .rx_tx_ts             (),
        .rx_fcch_op           (),
        .rx_fcch_pl           (),
        .mgmt_range_meters    (),
        .mgmt_telemetry_valid (),
        .expected_txfn        ()
    );

    // Stage 5: Ethernet Frame Reassembly (Table 2-18) & 8-Byte Preamble Injector
    ethernet_frame_reassembly u_ethernet_frame_reassembly (
        .clk                   (clk_gth),
        .rst_n                 (rst_n),
        .s_axis_fso_tdata      (deframed_data_tdata),
        .s_axis_fso_tvalid     (deframed_data_tvalid),
        .s_axis_fso_tlast      (deframed_data_tlast),
        .s_axis_fso_tready     (deframed_data_tready),
        .m_axis_eth_tdata      (m_axis_eth_tdata),
        .m_axis_eth_tvalid     (m_axis_eth_tvalid),
        .m_axis_eth_tlast      (m_axis_eth_tlast),
        .m_axis_eth_tready     (1'b1),
        .reassembled_pkt_bytes (),
        .reassembled_pkt_cnt   ()
    );

endmodule