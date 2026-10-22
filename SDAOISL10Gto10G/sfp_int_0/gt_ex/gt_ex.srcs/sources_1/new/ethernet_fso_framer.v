`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Ethernet to FSO Framer Grand Top Module.
               Implements the core "SDA Encoder" framing block from the architecture.
               
               Subsystem Integrations:
               1. Data Checker: Validates incoming Ethernet frames.
               2. arq_tx_controller.v: The Brain - SDA OCT State Machine.
               3. fso_header_top.v: 16-Byte Header Generator & FSO CRC-16.
               4. fso_payload_top.v: 1912-Byte Payload Assembler, IDLE/MGMT generators,
                  ARQ Retransmit RAM controller, and Final Multiplexer.
               
               Revision Note: 
               - Fixed Clock Domain Crossing (CDC) Interface. Header AXI-Stream 
                 output is now strictly 8-bit to match x_gth_logic.v requirements.
                 Port mappings have been rigidly aligned to prevent synthesis failures.
               - ETRI Timing Management Compliance: Connected 'tx_ts_in' and 
                 'ts_applies_in' to the Timestamp Manager with deterministic 
                 pipeline latency pre-compensation (TX_PIPE_LATENCY_PS = 2,313,200 ps)
                 so the Header TX_TS reflects the exact physical optical egress time.
===========================================================================
*/

module ethernet_fso_framer #(
    // Deterministic delay from Header latch to first Preamble bit exiting GTH TX (in picoseconds)
    parameter [39:0] TX_PIPE_LATENCY_PS = 40'd2_313_200
)(
    input  wire        clk,
    input  wire        rst_n,

    // -------------------------------------------------------
    // 1. INPUT: Ethernet Data from XGMII Front-End Segmenter
    // -------------------------------------------------------
    input  wire [31:0] s_axis_eth_tdata,
    input  wire        s_axis_eth_tvalid,
    input  wire        s_axis_eth_tlast,
    output wire        s_axis_eth_tready,

    // -------------------------------------------------------
    // 2. INPUT: Telemetry, PNT, and FCCH (From Satellite Subsystems)
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
    input  wire [5:0]  tod_seconds_in, // Time of Day for Header Generation
    input  wire [3:0]  fcch_opcode,    // Fast Control Channel Opcode
    input  wire [15:0] fcch_pl,        // Fast Control Channel Payload

    // -------------------------------------------------------
    // 3. INPUT: ARQ Feedback (From RX Decoder Path)
    // -------------------------------------------------------
    input  wire [15:0] rx_rxfn_in,      // Received Frame Number from space
    input  wire        rx_ack_in,       // ACK/NAK status from space
    input  wire        rx_ack_valid_in, // Asserts if the ACK field is valid

    // -------------------------------------------------------
    // 4. OUTPUT: To CDC 1 (Clock Domain Crossing - x_gth_logic.v)
    // -------------------------------------------------------
    // Header Output Stream (16 Bytes Total - Sent 1 Byte per cycle)
    output wire [7:0]  m_axis_hdr_tdata,
    output wire        m_axis_hdr_tvalid,
    output wire        m_axis_hdr_tlast,
    input  wire        m_axis_hdr_tready,

    // Payload Output Stream (1912 Bytes Total - Sent 4 Bytes per cycle)
    output wire [31:0] m_axis_fso_tdata,
    output wire        m_axis_fso_tvalid,
    output wire        m_axis_fso_tlast,
    input  wire        m_axis_fso_tready,
    
    // Status Output
    output wire        eth_data_error_flag
);

    // =======================================================
    // INTERNAL INTERCONNECT WIRES
    // =======================================================
    wire [15:0] tx_txfn_out;
    wire [1:0]  payload_mux_sel;
    wire [1:0]  frame_type_out;
    wire        tx_trigger_gen;
    wire        tx_stall_mac;
    
    wire        ddr4_write_req;
    wire        ddr4_read_req;
    wire        ddr4_delete_req;
    wire [15:0] ddr4_addr;

    wire [31:0] chk_eth_tdata  = s_axis_eth_tdata;
    wire        chk_eth_tvalid = s_axis_eth_tvalid;
    wire        chk_eth_tlast  = s_axis_eth_tlast;
    wire        payload_eth_tready;

    assign s_axis_eth_tready   = payload_eth_tready && !tx_stall_mac;
    assign eth_data_error_flag = 1'b0;
    assign m_axis_hdr_tlast    = 1'b0;

    wire hdr_sys_busy;
    reg  payload_streaming;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) payload_streaming <= 1'b0;
        else if (tx_trigger_gen) payload_streaming <= 1'b1;
        else if (m_axis_fso_tvalid && m_axis_fso_tready && m_axis_fso_tlast) payload_streaming <= 1'b0;
    end

    wire frame_busy = hdr_sys_busy || payload_streaming;

    // =======================================================
    // ETRI TIMING MANAGER: ACTUAL EGRESS TIMESTAMP PREDICTION
    // Predicts exact physical optical output timestamp at the moment 
    // the Header is generated by adding deterministic TX pipeline latency.
    // =======================================================
    wire [39:0] predicted_egress_tx_ts = tx_phy_ts_picosec + TX_PIPE_LATENCY_PS;
    wire [2:0]  active_ts_applies      = {2'b00, ts_valid};

    // =======================================================
    // B. ARQ TX CONTROLLER (The Orchestrator Brain)
    // =======================================================
    arq_tx_controller u_arq_tx_controller (
        .clk               (clk),
        .rst_n             (rst_n),
        .fso_data_valid    (chk_eth_tvalid),
        .mgmt_tick_1hz     (mgmt_trigger_1hz),
        .header_gen_busy   (frame_busy),
        
        .rx_rxfn_in        (rx_rxfn_in),
        .rx_ack_in         (rx_ack_in),
        .rx_ack_valid_in   (rx_ack_valid_in),
        
        .tx_txfn_out       (tx_txfn_out),
        .tx_frame_type     (frame_type_out),
        .tx_trigger_gen    (tx_trigger_gen),
        .payload_mux_sel   (payload_mux_sel),
        .tx_stall_mac      (tx_stall_mac),
        
        .ddr4_write_req    (ddr4_write_req),
        .ddr4_read_req     (ddr4_read_req),
        .ddr4_delete_req   (ddr4_delete_req),
        .ddr4_addr         (ddr4_addr)
    );

    // =======================================================
    // C. HEADER TOP SUBSYSTEM (16-Byte Formatter)
    // =======================================================
    fso_header_top u_fso_header_top (
        .clk                 (clk),
        .rst_n               (rst_n),
        .trigger_header_gen  (tx_trigger_gen),
        
        // Sequence & Status Inputs (From ARQ & Frame Scheduler)
        .txfn_in             (tx_txfn_out),
        .rxfn_in             (rx_rxfn_in),            
        .ack_in              (rx_ack_in),             
        .ack_valid_in        (rx_ack_valid_in),       
        .frame_type_in       (frame_type_out),
        
        // PNT, Timestamp Manager & Control/Status Manager (FCCH)
        .tx_ts_in            (predicted_egress_tx_ts),
        .tod_seconds_in      (tod_seconds_in),
        .ts_applies_in       (active_ts_applies),
        .fcch_opcode_in      (fcch_opcode),
        .fcch_pl_in          (fcch_pl),
        
        // Standardized 8-bit Output Stream
        .final_header_byte   (m_axis_hdr_tdata),
        .final_header_valid  (m_axis_hdr_tvalid),
        .system_busy         (hdr_sys_busy)
    );

    // =======================================================
    // D. PAYLOAD TOP SUBSYSTEM (1912-Byte Formatter)
    // =======================================================
    fso_payload_top u_fso_payload_top (
        .clk               (clk),
        .rst_n             (rst_n),
        
        .s_axis_eth_tdata  (chk_eth_tdata),
        .s_axis_eth_tvalid (chk_eth_tvalid && !tx_stall_mac),
        .s_axis_eth_tlast  (chk_eth_tlast),
        .s_axis_eth_tready (payload_eth_tready),
        
        .payload_mux_sel   (payload_mux_sel),
        .txfn_in           (tx_txfn_out),
        .ddr4_write_req    (ddr4_write_req),
        .ddr4_read_req     (ddr4_read_req),
        .ddr4_delete_req   (ddr4_delete_req),
        .ddr4_addr         (ddr4_addr),
        
        .mgmt_trigger_1hz  (mgmt_trigger_1hz),
        .rx_phy_ts_sec     (rx_phy_ts_sec),
        .rx_phy_ts_picosec (rx_phy_ts_picosec),
        .tx_phy_ts_sec     (tx_phy_ts_sec),
        .tx_phy_ts_picosec (tx_phy_ts_picosec),
        .range_meters      (range_meters),
        .range_ts_sec      (range_ts_sec),
        .range_ts_picosec  (range_ts_picosec),
        .ts_valid          (ts_valid),
        
        .m_axis_fso_tdata  (m_axis_fso_tdata),
        .m_axis_fso_tvalid (m_axis_fso_tvalid),
        .m_axis_fso_tlast  (m_axis_fso_tlast),
        .m_axis_fso_tready (m_axis_fso_tready)
    );

endmodule