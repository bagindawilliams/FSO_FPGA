`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : fso_ethernet_deframer
Description  : FSO-to-Ethernet Deframer Top Module (Mirror of 
               ethernet_fso_framer.v in the Transmit Path).
===========================================================================
*/

module fso_ethernet_deframer (
    input  wire        clk,
    input  wire        rst_n,

    // Inputs from CDC 4 (rx_logic_gth @ 312.5 MHz)
    input  wire        s_axis_hdr_tvalid,
    input  wire [7:0]  s_axis_hdr_tdata,
    input  wire        s_axis_fso_tvalid,
    input  wire [31:0] s_axis_fso_tdata,

    // In-Order Verified 1908-Byte DATA Output to ethernet_frame_reassembly
    output wire [31:0] m_axis_fso_tdata,
    output wire        m_axis_fso_tvalid,
    output wire        m_axis_fso_tlast,
    input  wire        m_axis_fso_tready,

    // ARQ Feedback Outputs
    output wire [15:0] local_fb_rxfn,
    output wire        local_fb_ack,
    output wire        local_fb_ack_valid,
    output wire [15:0] peer_rxfn_out,
    output wire        peer_ack_out,
    output wire        peer_ack_valid_out,

    // Telemetry & Status Outputs
    output wire        hdr_crc_ok,
    output wire        pld_crc_ok,
    output wire [15:0] rx_txfn,
    output wire [1:0]  rx_frame_type,
    output wire [39:0] rx_tx_ts,
    output wire [3:0]  rx_fcch_op,
    output wire [15:0] rx_fcch_pl,
    output wire [63:0] mgmt_range_meters,
    output wire        mgmt_telemetry_valid,
    output wire [15:0] expected_txfn
);

    deframer u_deframer (
        .clk                  (clk),
        .rst_n                (rst_n),
        .header_dv            (s_axis_hdr_tvalid),
        .header_in            (s_axis_hdr_tdata),
        .payload_dv           (s_axis_fso_tvalid),
        .payload_in           (s_axis_fso_tdata),
        .m_axis_fso_tdata     (m_axis_fso_tdata),
        .m_axis_fso_tvalid    (m_axis_fso_tvalid),
        .m_axis_fso_tlast     (m_axis_fso_tlast),
        .m_axis_fso_tready    (m_axis_fso_tready),
        .local_fb_rxfn        (local_fb_rxfn),
        .local_fb_ack         (local_fb_ack),
        .local_fb_ack_valid   (local_fb_ack_valid),
        .peer_rxfn_out        (peer_rxfn_out),
        .peer_ack_out         (peer_ack_out),
        .peer_ack_valid_out   (peer_ack_valid_out),
        .hdr_crc_ok           (hdr_crc_ok),
        .pld_crc_ok           (pld_crc_ok),
        .rx_txfn              (rx_txfn),
        .rx_frame_type        (rx_frame_type),
        .rx_tx_ts             (rx_tx_ts),
        .rx_fcch_op           (rx_fcch_op),
        .rx_fcch_pl           (rx_fcch_pl),
        .mgmt_range_meters    (mgmt_range_meters),
        .mgmt_telemetry_valid (mgmt_telemetry_valid),
        .expected_txfn        (expected_txfn)
    );

endmodule