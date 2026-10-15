`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : FSO Payload Grand Top Module.
               Matches the hardware tree structure perfectly.
               Integrates 4 self-contained capsules and 1 arbitrator:
               1. fso_payload (Data path: Injector + CRC + RAM + FIFO)
               2. fso_idle_generator (IDLE path: PRBS + CRC + FIFO)
               3. mgmt_telemetry_generator (MGMT path: Telemetry + CRC + FIFO)
               4. fso_payload_mux (Final Arbitration to CDC)
===========================================================================
*/

module fso_payload_top (
    input  wire        clk,
    input  wire        rst_n,

    // -------------------------------------------------------
    // Interface from XGMII Front-End (packaging_and_segmentation.v)
    // Expected: 1900 Bytes
    // -------------------------------------------------------
    input  wire [31:0] s_axis_eth_tdata,
    input  wire        s_axis_eth_tvalid,
    input  wire        s_axis_eth_tlast,
    output wire        s_axis_eth_tready,

    // -------------------------------------------------------
    // Control Interface (from arq_tx_controller.v)
    // -------------------------------------------------------
    input  wire [1:0]  payload_mux_sel,  // 00=IDLE, 01=DATA, 10=MGMT, 11=RETX
    input  wire [15:0] txfn_in,          // Used to seed IDLE PRBS
    
    // ARQ RAM Controls
    input  wire        ddr4_write_req,
    input  wire        ddr4_read_req,
    input  wire        ddr4_delete_req,
    input  wire [15:0] ddr4_addr,

    // -------------------------------------------------------
    // Telemetry & PNT Inputs (from Satellite CPU)
    // -------------------------------------------------------
    input  wire        mgmt_trigger_1hz,
    input  wire [5:0]  rx_phy_ts_sec,
    input  wire [39:0] rx_phy_ts_picosec,
    input  wire [5:0]  tx_phy_ts_sec,
    input  wire [39:0] tx_phy_ts_picosec,
    input  wire [63:0] range_meters,
    input  wire [31:0] range_ts_sec,
    input  wire [39:0] range_ts_picosec,
    input  wire        ts_valid,

    // -------------------------------------------------------
    // Output Interface to x_gth_logic.v (CDC)
    // Expected: 1912 Bytes strictly continuous (Zero gap)
    // -------------------------------------------------------
    output wire [31:0] m_axis_fso_tdata,
    output wire        m_axis_fso_tvalid,
    output wire        m_axis_fso_tlast,
    input  wire        m_axis_fso_tready
);

    // =======================================================
    // INTERNAL INTERCONNECT WIRES
    // =======================================================
    // Path 01: DATA (Normal Payload)
    wire [31:0] data_tdata; wire data_tvalid; wire data_tlast; wire data_tready;
    
    // Path 11: RETX (ARQ RAM Retransmission)
    wire [31:0] retx_tdata; wire retx_tvalid; wire retx_tlast; wire retx_tready;
    
    // Path 00: IDLE
    wire [31:0] idle_tdata; wire idle_tvalid; wire idle_tlast; wire idle_tready;
    
    // Path 10: MGMT
    wire [31:0] mgmt_tdata; wire mgmt_tvalid; wire mgmt_tlast; wire mgmt_tready;

    // =======================================================
    // 1. DATA PATH SUB-TOP
    // Outputs to MUX Port 01 (DATA) and Port 11 (RETX)
    // =======================================================
    fso_payload u_fso_payload (
        .clk                (clk),
        .rst_n              (rst_n),
        
        .s_axis_eth_tdata   (s_axis_eth_tdata),
        .s_axis_eth_tvalid  (s_axis_eth_tvalid),
        .s_axis_eth_tlast   (s_axis_eth_tlast),
        .s_axis_eth_tready  (s_axis_eth_tready),
        
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

    // =======================================================
    // 2. IDLE PATH SUB-TOP
    // Outputs to MUX Port 00 (IDLE)
    // =======================================================
    fso_idle_generator u_fso_idle_generator (
        .clk             (clk),
        .rst_n           (rst_n),
        .txfn_in         (txfn_in),
        
        .m_axis_tdata    (idle_tdata),
        .m_axis_tvalid   (idle_tvalid),
        .m_axis_tlast    (idle_tlast),
        .m_axis_tready   (idle_tready)
    );

    // =======================================================
    // 3. MGMT PATH SUB-TOP
    // Outputs to MUX Port 10 (MGMT)
    // =======================================================
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

    // =======================================================
    // 4. THE MULTIPLEXER (Final Arbitration Stage)
    // Connects the 4 output paths to the single CDC input
    // =======================================================
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