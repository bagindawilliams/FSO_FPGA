`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : FSO Payload Top Subsystem.
               Integrates:
               1. fso_payload.v (DATA encapsulation + CRC-32 + ARQ DDR4 RAM)
               2. fso_idle_generator.v (25-bit PRBS IDLE payload + CRC-32)
               3. mgmt_telemetry_generator.v (Table 2-14 PNT payload + CRC-32)
               4. fso_payload_mux.v (4-to-1 AXI-Stream Payload Multiplexer)

Revision History:
  - Rev 1.0 (Initial) : 1912-Byte Payload Top subsystem integration.
  - Rev 2.1 (2026-10-28 13:56 KST) : [Internal Audit Fix #5]
    Forwarded 'seg_valid_bytes [10:0]' from upstream segmenter to u_fso_payload
    for dynamic Ethernet packet length encapsulation.
===========================================================================
*/

module fso_payload_top (
    input  wire        clk,
    input  wire        rst_n,

    // Ethernet Segment Input from packaging_and_segmentation
    input  wire [31:0] s_axis_eth_tdata,
    input  wire        s_axis_eth_tvalid,
    input  wire        s_axis_eth_tlast,
    output wire        s_axis_eth_tready,
    input  wire [10:0] seg_valid_bytes,

    // Control & ARQ Inputs from arq_tx_controller
    input  wire [1:0]  payload_mux_sel,
    input  wire [15:0] txfn_in,
    input  wire        ddr4_write_req,
    input  wire        ddr4_read_req,
    input  wire        ddr4_delete_req,
    input  wire [15:0] ddr4_addr,

    // Satellite PNT & Ranging Telemetry Inputs (Table 2-14)
    input  wire        mgmt_trigger_1hz,
    input  wire [5:0]  rx_phy_ts_sec,
    input  wire [39:0] rx_phy_ts_picosec,
    input  wire [5:0]  tx_phy_ts_sec,
    input  wire [39:0] tx_phy_ts_picosec,
    input  wire [63:0] range_meters,
    input  wire [31:0] range_ts_sec,
    input  wire [39:0] range_ts_picosec,
    input  wire        ts_valid,

    // Final Arbitrated 1912-Byte Payload Output to CDC 1
    output wire [31:0] m_axis_fso_tdata,
    output wire        m_axis_fso_tvalid,
    output wire        m_axis_fso_tlast,
    input  wire        m_axis_fso_tready
);

    wire [31:0] idle_tdata;
    wire        idle_tvalid, idle_tlast, idle_tready;

    wire [31:0] data_tdata;
    wire        data_tvalid, data_tlast, data_tready;

    wire [31:0] mgmt_tdata;
    wire        mgmt_tvalid, mgmt_tlast, mgmt_tready;

    wire [31:0] retx_tdata;
    wire        retx_tvalid, retx_tlast, retx_tready;

    // 1. Path 00: IDLE Payload Capsule (1912 Bytes)
    fso_idle_generator u_fso_idle_generator (
        .clk           (clk),
        .rst_n         (rst_n),
        .txfn_in       (txfn_in),
        .m_axis_tdata  (idle_tdata),
        .m_axis_tvalid (idle_tvalid),
        .m_axis_tlast  (idle_tlast),
        .m_axis_tready (idle_tready)
    );

    // 2. Path 01 & 11: DATA Encapsulation & ARQ Retransmit Capsule (1912 Bytes)
    fso_payload u_fso_payload (
        .clk                (clk),
        .rst_n              (rst_n),
        .s_axis_eth_tdata   (s_axis_eth_tdata),
        .s_axis_eth_tvalid  (s_axis_eth_tvalid),
        .s_axis_eth_tlast   (s_axis_eth_tlast),
        .s_axis_eth_tready  (s_axis_eth_tready),
        .seg_valid_bytes    (seg_valid_bytes),
        .ddr4_write_req     (ddr4_write_req),
        .ddr4_read_req      (ddr4_read_req),
        .ddr4_delete_req    (ddr4_delete_req),
        .ddr4_addr          (ddr4_addr),
        .m_axis_data_tdata  (data_tdata),
        .m_axis_data_tvalid (data_tvalid),
        .m_axis_data_tlast  (data_tlast),
        .m_axis_data_tready (data_tready),
        .m_axis_retx_tdata  (retx_tdata),
        .m_axis_retx_tvalid (retx_tvalid),
        .m_axis_retx_tlast  (retx_tlast),
        .m_axis_retx_tready (retx_tready)
    );

    // 3. Path 10: MGMT / PNT Telemetry Capsule (1912 Bytes)
    mgmt_telemetry_generator u_mgmt_telemetry_generator (
        .clk               (clk),
        .rst_n             (rst_n),
        .mgmt_trigger_1hz  (mgmt_trigger_1hz),
        .rx_phy_ts_sec     (rx_phy_ts_sec),
        .rx_phy_ts_picosec (rx_phy_ts_picosec),
        .tx_phy_ts_sec     (tx_phy_ts_sec),
        .tx_phy_ts_picosec (tx_phy_ts_picosec),
        .range_meters      (range_meters),
        .range_ts_sec      (range_ts_sec),
        .range_ts_picosec  (range_ts_picosec),
        .ts_valid          (ts_valid),
        .m_axis_tdata      (mgmt_tdata),
        .m_axis_tvalid     (mgmt_tvalid),
        .m_axis_tlast      (mgmt_tlast),
        .m_axis_tready     (mgmt_tready)
    );

    // 4. 4-to-1 Payload Stream Multiplexer
    fso_payload_mux u_fso_payload_mux (
        .payload_mux_sel (payload_mux_sel),
        .s_idle_tdata    (idle_tdata),
        .s_idle_tvalid   (idle_tvalid),
        .s_idle_tlast    (idle_tlast),
        .s_idle_tready   (idle_tready),
        .s_data_tdata    (data_tdata),
        .s_data_tvalid   (data_tvalid),
        .s_data_tlast    (data_tlast),
        .s_data_tready   (data_tready),
        .s_mgmt_tdata    (mgmt_tdata),
        .s_mgmt_tvalid   (mgmt_tvalid),
        .s_mgmt_tlast    (mgmt_tlast),
        .s_mgmt_tready   (mgmt_tready),
        .s_retx_tdata    (retx_tdata),
        .s_retx_tvalid   (retx_tvalid),
        .s_retx_tlast    (retx_tlast),
        .s_retx_tready   (retx_tready),
        .m_axis_tdata    (m_axis_fso_tdata),
        .m_axis_tvalid   (m_axis_fso_tvalid),
        .m_axis_tlast    (m_axis_fso_tlast),
        .m_axis_tready   (m_axis_fso_tready)
    );

endmodule