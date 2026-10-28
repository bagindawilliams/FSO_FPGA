`timescale 1ns / 100ps
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
===========================================================================
*/

module sda_decoder (
    input  wire        clk_gth,            // 312.5 MHz Clock
    input  wire        clk_logic,          // 200.0 MHz Clock
    input  wire        rst_n,              // Active-low reset

    // Input from gth64b66b_rx.v (312.5 MHz Domain, 3117 Bytes/frame)
    input  wire        rx_fso_valid_in,
    input  wire [31:0] rx_fso_data_in,

    // Reassembled Ethernet Frame Output to eth_tx_back_end_top (2008 Bytes for 2000B Jumbo)
    output wire [31:0] m_axis_eth_tdata,
    output wire        m_axis_eth_tvalid,
    output wire        m_axis_eth_tlast,

    // Closed-Loop ARQ Feedback to sda_encoder
    output wire [15:0] arq_fb_rxfn,
    output wire        arq_fb_ack,
    output wire        arq_fb_ack_valid,

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

    // 3. CDC 4 -> fso_ethernet_deframer (312.5 MHz)
    wire         cdc4_hdr_dv;
    wire [7:0]   cdc4_hdr_data;
    wire         cdc4_pld_dv;
    wire [31:0]  cdc4_pld_data;

    assign m_axis_hdr_tvalid = cdc4_hdr_dv;
    assign m_axis_hdr_tdata  = cdc4_hdr_data;
    assign m_axis_fso_tvalid = cdc4_pld_dv;
    assign m_axis_fso_tdata  = cdc4_pld_data;

    // 4. fso_ethernet_deframer -> ethernet_frame_reassembly (312.5 MHz, 1908 Bytes)
    wire [31:0]  deframed_data_tdata;
    wire         deframed_data_tvalid;
    wire         deframed_data_tlast;
    wire         deframed_data_tready;

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

    // Stage 2: FEC Reception Core (200.0 MHz)
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

    // Stage 3: CDC 4 (200.0 MHz -> 312.5 MHz)
    rx_logic_gth u_cdc_rx_4 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en_head    (rs_head_dv),
        .en_load    (rs_load_dv),
        .header_in  (rs_head),
        .payload_in (rs_load),
        .header_dv  (cdc4_hdr_dv),
        .header     (cdc4_hdr_data),
        .payload_dv (cdc4_pld_dv),
        .payload    (cdc4_pld_data)
    );

    // Stage 4: FSO-to-Ethernet Deframer & Selective Repeat ARQ (312.5 MHz)
    fso_ethernet_deframer u_fso_ethernet_deframer (
        .clk                  (clk_gth),
        .rst_n                (rst_n),
        .s_axis_hdr_tvalid    (cdc4_hdr_dv),
        .s_axis_hdr_tdata     (cdc4_hdr_data),
        .s_axis_fso_tvalid    (cdc4_pld_dv),
        .s_axis_fso_tdata     (cdc4_pld_data),
        .m_axis_fso_tdata     (deframed_data_tdata),
        .m_axis_fso_tvalid    (deframed_data_tvalid),
        .m_axis_fso_tlast     (deframed_data_tlast),
        .m_axis_fso_tready    (deframed_data_tready),
        .local_fb_rxfn        (arq_fb_rxfn),
        .local_fb_ack         (arq_fb_ack),
        .local_fb_ack_valid   (arq_fb_ack_valid),
        .peer_rxfn_out        (),
        .peer_ack_out         (),
        .peer_ack_valid_out   (),
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

    // Stage 5: Ethernet Frame Reassembly & Preamble Injection (312.5 MHz)
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