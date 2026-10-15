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
                - Fixed port mapping to arq_tx_controller.v (tx_frame_type,
                 mgmt_tick_1hz, rx_ack_valid_in, header_gen_busy).
               - Fixed s_axis_eth_tready handshake directly from fso_payload_top
                 so the first 2 words of Ethernet are never overwritten during 
                 0xAB and 0xCDEF FSO header injection.
===========================================================================
*/

module ethernet_fso_framer (
    input  wire        clk,
    input  wire        rst_n,

    // 1. INPUT: Ethernet Data from XGMII Front-End Segmenter
    input  wire [31:0] s_axis_eth_tdata,
    input  wire        s_axis_eth_tvalid,
    input  wire        s_axis_eth_tlast,
    output wire        s_axis_eth_tready,

    // 2. INPUT: Telemetry, PNT, and FCCH
    input  wire        mgmt_trigger_1hz,
    input  wire [5:0]  rx_phy_ts_sec,
    input  wire [39:0] rx_phy_ts_picosec,
    input  wire [5:0]  tx_phy_ts_sec,
    input  wire [39:0] tx_phy_ts_picosec,
    input  wire [63:0] range_meters,
    input  wire [31:0] range_ts_sec,
    input  wire [39:0] range_ts_picosec,
    input  wire        ts_valid,
    input  wire [5:0]  tod_seconds_in,
    input  wire [3:0]  fcch_opcode,
    input  wire [15:0] fcch_pl,

    // 3. INPUT: ARQ Feedback (From RX Decoder Path)
    input  wire [15:0] rx_rxfn_in,
    input  wire        rx_ack_in,
    input  wire        rx_ack_valid_in,

    // 4. OUTPUT: To CDC 1 (x_gth_logic.v)
    output wire [7:0]  m_axis_hdr_tdata,
    output wire        m_axis_hdr_tvalid,
    output wire        m_axis_hdr_tlast,
    input  wire        m_axis_hdr_tready,

    output wire [31:0] m_axis_fso_tdata,
    output wire        m_axis_fso_tvalid,
    output wire        m_axis_fso_tlast,
    input  wire        m_axis_fso_tready,
    
    output wire        eth_data_error_flag
);

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

    //  FIX: Route backpressure from fso_payload_top (paused during 0xAB/0xCDEF)
    assign s_axis_eth_tready   = payload_eth_tready && !tx_stall_mac;
    assign eth_data_error_flag = 1'b0;
    assign m_axis_hdr_tlast    = 1'b0;

    wire hdr_sys_busy;
    // Keep controller in frame-wait state until the 1912B payload finishes
    reg  payload_streaming;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) payload_streaming <= 1'b0;
        else if (tx_trigger_gen) payload_streaming <= 1'b1;
        else if (m_axis_fso_tvalid && m_axis_fso_tready && m_axis_fso_tlast) payload_streaming <= 1'b0;
    end

    wire frame_busy = hdr_sys_busy || payload_streaming;

    // B. ARQ TX CONTROLLER (All ports properly wired)
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

    // C. HEADER TOP SUBSYSTEM (16-Byte Formatter)
    fso_header_top u_fso_header_top (
        .clk                 (clk),
        .rst_n               (rst_n),
        .trigger_header_gen  (tx_trigger_gen),
        .txfn_in             (tx_txfn_out),
        .rxfn_in             (rx_rxfn_in),            
        .ack_in              (rx_ack_in),             
        .ack_valid_in        (rx_ack_valid_in),       
        .frame_type_in       (frame_type_out),
        .tx_ts_in            (40'd0),
        .tod_seconds_in      (tod_seconds_in),
        .ts_applies_in       (3'd0),
        .fcch_opcode_in      (fcch_opcode),
        .fcch_pl_in          (fcch_pl),
        .final_header_byte   (m_axis_hdr_tdata),
        .final_header_valid  (m_axis_hdr_tvalid),
        .system_busy         (hdr_sys_busy)
    );

    // D. PAYLOAD TOP SUBSYSTEM (1912-Byte Formatter)
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