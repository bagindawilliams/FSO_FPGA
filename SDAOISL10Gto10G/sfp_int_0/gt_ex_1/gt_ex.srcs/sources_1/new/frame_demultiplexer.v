`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : frame_demultiplexer
Description  : Data Plane Frame Router (1908-Byte / 477-Word Payload).
               Routes verified payloads based on rx_frame_type[1:0]:
               - 2'b00 (IDLE): Routed to idle_discard.v
               - 2'b10 (MGMT): Routed to mgmt_extraction.v
               - 2'b01 (DATA): Routed to arq_rx_reorder_ddr4_wrapper.v
===========================================================================
*/

module frame_demultiplexer (
    input  wire        clk,
    input  wire        rst_n,

    // Verified 1908-Byte Payload from deframer_payload
    input  wire [31:0] s_axis_pld_tdata,
    input  wire        s_axis_pld_tvalid,
    input  wire        s_axis_pld_tlast,

    // Header Context & Control Inputs
    input  wire [1:0]  rx_frame_type,
    input  wire [15:0] rx_txfn,
    input  wire        non_data_seq_adv,
    input  wire [15:0] non_data_txfn,

    // In-Order 1908-Byte DATA Output to ethernet_frame_reassembly
    output wire [31:0] m_axis_data_tdata,
    output wire        m_axis_data_tvalid,
    output wire        m_axis_data_tlast,
    input  wire        m_axis_data_tready,

    // Extracted MGMT Telemetry Outputs
    output wire [5:0]  mgmt_rx_phy_ts_sec,
    output wire [39:0] mgmt_rx_phy_ts_picosec,
    output wire [5:0]  mgmt_tx_phy_ts_sec,
    output wire [39:0] mgmt_tx_phy_ts_picosec,
    output wire [63:0] mgmt_range_meters,
    output wire [31:0] mgmt_range_ts_sec,
    output wire [39:0] mgmt_range_ts_picosec,
    output wire        mgmt_ts_valid,
    output wire        mgmt_telemetry_valid,

    // Diagnostic Counters
    output wire [15:0] expected_txfn,
    output wire [15:0] idle_frame_cnt,
    output wire [15:0] mgmt_frame_cnt
);

    wire is_idle = (rx_frame_type == 2'b00);
    wire is_data = (rx_frame_type == 2'b01);
    wire is_mgmt = (rx_frame_type == 2'b10);

    // 1. IDLE Frame Termination (2'b00)
    idle_discard u_idle_discard (
        .clk               (clk),
        .rst_n             (rst_n),
        .s_axis_idle_tdata (is_idle ? s_axis_pld_tdata : 32'd0),
        .s_axis_idle_tvalid(s_axis_pld_tvalid && is_idle),
        .s_axis_idle_tlast (s_axis_pld_tlast  && is_idle),
        .idle_frame_cnt    (idle_frame_cnt),
        .idle_byte_cnt     ()
    );

    // 2. MGMT Frame Telemetry Extraction (2'b10)
    mgmt_extraction u_mgmt_extraction (
        .clk                     (clk),
        .rst_n                   (rst_n),
        .s_axis_mgmt_tdata       (is_mgmt ? s_axis_pld_tdata : 32'd0),
        .s_axis_mgmt_tvalid      (s_axis_pld_tvalid && is_mgmt),
        .s_axis_mgmt_tlast       (s_axis_pld_tlast  && is_mgmt),
        .mgmt_rx_phy_ts_sec      (mgmt_rx_phy_ts_sec),
        .mgmt_rx_phy_ts_picosec  (mgmt_rx_phy_ts_picosec),
        .mgmt_tx_phy_ts_sec      (mgmt_tx_phy_ts_sec),
        .mgmt_tx_phy_ts_picosec  (mgmt_tx_phy_ts_picosec),
        .mgmt_range_meters       (mgmt_range_meters),
        .mgmt_range_ts_sec       (mgmt_range_ts_sec),
        .mgmt_range_ts_picosec   (mgmt_range_ts_picosec),
        .mgmt_ts_valid           (mgmt_ts_valid),
        .mgmt_telemetry_valid    (mgmt_telemetry_valid),
        .mgmt_frame_cnt          (mgmt_frame_cnt)
    );

    // 3. Selective Repeat ARQ Reorder Buffer for DATA Frames (2'b01)
    arq_rx_reorder_ddr4_wrapper u_arq_rx_reorder (
        .clk               (clk),
        .rst_n             (rst_n),
        .s_axis_data_tdata (is_data ? s_axis_pld_tdata : 32'd0),
        .s_axis_data_tvalid(s_axis_pld_tvalid && is_data),
        .s_axis_data_tlast (s_axis_pld_tlast  && is_data),
        .rx_txfn_in        (rx_txfn),
        .non_data_seq_adv  (non_data_seq_adv),
        .non_data_txfn     (non_data_txfn),
        .m_axis_ord_tdata  (m_axis_data_tdata),
        .m_axis_ord_tvalid (m_axis_data_tvalid),
        .m_axis_ord_tlast  (m_axis_data_tlast),
        .m_axis_ord_tready (m_axis_data_tready),
        .expected_txfn     (expected_txfn)
    );

endmodule