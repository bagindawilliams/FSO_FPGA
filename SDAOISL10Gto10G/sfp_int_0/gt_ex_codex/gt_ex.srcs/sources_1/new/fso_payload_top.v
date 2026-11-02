`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : fso_payload_top
Description  : Grand Top-Level FSO Payload Subsystem (1912-Byte Assembler).
               Integrates the 3 autonomous FSO Payload Capsules and the 
               4-to-1 Frame Multiplexer:
               1. fso_payload              : Ethernet DATA Capsule (Path 01) 
                                             & ARQ Retransmit RAM (Path 11).
               2. fso_idle_generator       : Dynamic (TXFN+1) 25-bit PRBS 
                                             IDLE Capsule (Path 00).
               3. mgmt_telemetry_generator : 1Hz Satellite Ranging/Timestamp 
                                             MGMT Capsule (Path 10).
               4. fso_payload_mux          : Lock-On-Frame 4-to-1 AXI-Stream 
                                             Multiplexer to CDC 1.

Revision History:
  - Rev 1.0 (Initial) : 4-path FSO payload capsule integration.
  - Rev 2.2 (2026-10-28 14:55 KST) : Added 'seg_valid_bytes' input port and 
    connected it to u_fso_payload.
  - Rev 2.8 (2026-10-30 11:30 KST) : [Audit Fix A18 - Consistent 14-Bit Length Port]
    Standardized 'seg_valid_bytes' port width to 14 bits ([13:0]) to match 
    fso_payload.v and ethernet_fso_framer.v without width-mismatch warnings.
  - Rev 2.9 (2026-10-30 18:05 KST) : [Audit Fix B01 - Exact fso_payload_mux Port Binding]
    Restored the exact port names on u_fso_payload_mux (.payload_mux_sel, .s_idle_*,
    .s_data_*, .s_mgmt_*, .s_retx_*, and .m_axis_*) to match the combinational
    fso_payload_mux.v module definition in the project, resolving all 22 TX 
    named-port elaboration errors.
  - Rev 3.1 (2026-10-31 14:15 KST) : [Audit Fix OISL-MGMT-001 (D06) - MGMT Payload Snapshot Storage & Replay]
    1. [Fix OISL-MGMT-001 Snapshot Storage]: Added a 512-word (1912-Byte) MGMT retransmit
       snapshot buffer ('mgmt_snap_ram [0:511]') and physical-slot ownership bitmap
       ('mgmt_slot_bitmap [15:0]'). When 'ddr4_write_req' asserts for an MGMT transmission
       ('payload_mux_sel == 2'b10'), all 478 words (1908B telemetry + 4B CRC-32) streaming
       from 'u_mgmt_telemetry_generator' are captured into 'mgmt_snap_ram' while gating
       'ddr4_write_req' away from the DATA-only wrapper inside 'u_fso_payload'.
    2. [Fix OISL-MGMT-001 Snapshot Replay]: When 'ddr4_read_req' targets a physical slot
       marked in 'mgmt_slot_bitmap', 'fso_payload_top' replays the exact 478 stored words
       from 'mgmt_snap_ram' onto the MUX retransmit port ('mux_retx_*'), guaranteeing
       that MGMT retransmissions reuse the exact original payload rather than generating
       a new telemetry snapshot.
===========================================================================
*/

module fso_payload_top (
    input  wire        clk,
    input  wire        rst_n,

    // -------------------------------------------------------
    // 1. Ethernet Segment Stream Input (From Front-End Segmenter)
    // -------------------------------------------------------
    input  wire [31:0] s_axis_eth_tdata,
    input  wire        s_axis_eth_tvalid,
    input  wire        s_axis_eth_tlast,
    output wire        s_axis_eth_tready,
    input  wire [13:0] seg_valid_bytes,   // [Rev 2.8 - Fix A18] Full 14-bit packet/segment byte count

    // -------------------------------------------------------
    // 2. ARQ TX Controller & Scheduler Commands
    // -------------------------------------------------------
    input  wire [1:0]  payload_mux_sel,   // 00=IDLE, 01=DATA, 10=MGMT, 11=RETX
    input  wire [15:0] txfn_in,           // Current TXFN for IDLE PRBS seeding
    input  wire        ddr4_write_req,
    input  wire        ddr4_read_req,
    input  wire        ddr4_delete_req,
    input  wire [15:0] ddr4_addr,

    // -------------------------------------------------------
    // 3. 1Hz MGMT Telemetry & Ranging Inputs
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
    // 4. Multiplexed 1912-Byte FSO Payload Stream Output (To CDC 1)
    // -------------------------------------------------------
    output wire [31:0] m_axis_fso_tdata,
    output wire        m_axis_fso_tvalid,
    output wire        m_axis_fso_tlast,
    input  wire        m_axis_fso_tready,
    input  wire        idle_start_valid,
    output wire        idle_start_ready
);

    // Internal AXI-Stream Buses from the 4 Payload Sources
    wire [31:0] idle_tdata;
    wire        idle_tvalid;
    wire        idle_tlast;
    wire        idle_tready;

    wire [31:0] data_tdata;
    wire        data_tvalid;
    wire        data_tlast;
    wire        data_tready;

    wire [31:0] mgmt_tdata;
    wire        mgmt_tvalid;
    wire        mgmt_tlast;
    wire        mgmt_tready;

    wire [31:0] retx_tdata;
    wire        retx_tvalid;
    wire        retx_tlast;
    wire        retx_tready;

    // =======================================================
    // [Rev 3.1 - Fix OISL-MGMT-001 (D06)] MGMT SNAPSHOT STORAGE & REPLAY
    // Captures the 478-word (1912B) MGMT frame during initial transmission
    // and replays the identical snapshot when retransmitted via Path 11 (RETX).
    // =======================================================
    localparam [8:0] MGMT_FRAME_WORDS = 9'd478; // 477 payload words + 1 CRC-32 word

    (* ram_style = "block" *) reg [31:0] mgmt_snap_ram [0:511];
    reg [15:0] mgmt_slot_bitmap;
    reg        mgmt_cap_active;
    reg [8:0]  mgmt_cap_idx;
    reg        mgmt_retx_active;
    reg [8:0]  mgmt_retx_idx;

    wire is_mgmt_write_req  = ddr4_write_req  && (payload_mux_sel == 2'b10);
    wire is_mgmt_read_req   = ddr4_read_req   && mgmt_slot_bitmap[ddr4_addr[3:0]];
    wire is_mgmt_delete_req = ddr4_delete_req && mgmt_slot_bitmap[ddr4_addr[3:0]];

    // Forward only DATA-slot requests to u_fso_payload's DATA wrapper
    wire data_ddr4_write_req  = ddr4_write_req  && !is_mgmt_write_req;
    wire data_ddr4_read_req   = ddr4_read_req   && !is_mgmt_read_req;
    wire data_ddr4_delete_req = ddr4_delete_req && !is_mgmt_delete_req;

    wire mgmt_word_beat = (payload_mux_sel == 2'b10) && mgmt_tvalid && mgmt_tready;
    wire mux_retx_tready;

    always @(posedge clk) begin
        if (mgmt_word_beat && (mgmt_cap_Active_w)) begin
            mgmt_snap_ram[mgmt_cap_idx_w] <= mgmt_tdata;
        end
    end

    wire       mgmt_cap_Active_w = mgmt_cap_active || is_mgmt_write_req;
    wire [8:0] mgmt_cap_idx_w    = is_mgmt_write_req ? 9'd0 : mgmt_cap_idx;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mgmt_slot_bitmap <= 16'd0;
            mgmt_cap_active  <= 1'b0;
            mgmt_cap_idx     <= 9'd0;
            mgmt_retx_active <= 1'b0;
            mgmt_retx_idx    <= 9'd0;
        end else begin
            // Track physical slot ownership for MGMT transactions
            if (is_mgmt_write_req) begin
                mgmt_slot_bitmap[ddr4_addr[3:0]] <= 1'b1;
                mgmt_cap_active                  <= 1'b1;
                mgmt_cap_idx                     <= 9'd0;
            end
            if (is_mgmt_delete_req) begin
                mgmt_slot_bitmap[ddr4_addr[3:0]] <= 1'b0;
            end

            // Advance capture pointer across all 478 words of the initial MGMT frame
            if (mgmt_word_beat && mgmt_cap_Active_w) begin
                if (mgmt_tlast || (mgmt_cap_idx_w == (MGMT_FRAME_WORDS - 9'd1))) begin
                    mgmt_cap_active <= 1'b0;
                    mgmt_cap_idx    <= 9'd0;
                end else begin
                    mgmt_cap_idx    <= mgmt_cap_idx_w + 9'd1;
                end
            end

            // Replay stored 478-word MGMT snapshot when retransmission is requested
            if (is_mgmt_read_req) begin
                mgmt_retx_active <= 1'b1;
                mgmt_retx_idx    <= 9'd0;
            end else if (mgmt_retx_active && mux_retx_tready) begin
                if (mgmt_retx_idx == (MGMT_FRAME_WORDS - 9'd1)) begin
                    mgmt_retx_active <= 1'b0;
                    mgmt_retx_idx    <= 9'd0;
                end else begin
                    mgmt_retx_idx    <= mgmt_retx_idx + 9'd1;
                end
            end
        end
    end

    wire [31:0] mux_retx_tdata  = mgmt_retx_active ? mgmt_snap_ram[mgmt_retx_idx] : retx_tdata;
    wire        mux_retx_tvalid = mgmt_retx_active ? 1'b1                         : retx_tvalid;
    wire        mux_retx_tlast  = mgmt_retx_active ? (mgmt_retx_idx == (MGMT_FRAME_WORDS - 9'd1)) : retx_tlast;
    assign      retx_tready     = mgmt_retx_active ? 1'b0                         : mux_retx_tready;

    // 1. DATA & RETRANSMIT CAPSULE (Path 01 & Path 11)
    fso_payload u_fso_payload (
        .clk                (clk),
        .rst_n              (rst_n),
        .s_axis_eth_tdata   (s_axis_eth_tdata),
        .s_axis_eth_tvalid  (s_axis_eth_tvalid),
        .s_axis_eth_tlast   (s_axis_eth_tlast),
        .s_axis_eth_tready  (s_axis_eth_tready),
        .seg_valid_bytes    (seg_valid_bytes),
        .ddr4_write_req     (data_ddr4_write_req),
        .ddr4_read_req      (data_ddr4_read_req),
        .ddr4_delete_req    (data_ddr4_delete_req),
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

    // 2. IDLE PRBS CAPSULE (Path 00 - Seeded by TXFN + 1)
    fso_idle_generator u_fso_idle_generator (
        .clk              (clk),
        .rst_n            (rst_n),
        .txfn_in          (txfn_in),
        .m_axis_tdata     (idle_tdata),
        .m_axis_tvalid    (idle_tvalid),
        .m_axis_tlast     (idle_tlast),
        .m_axis_tready    (idle_tready),
        .idle_start_valid (idle_start_valid),
        .idle_start_ready (idle_start_ready)
    );

    // 3. 1HZ MANAGEMENT TELEMETRY CAPSULE (Path 10)
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

    // 4. 4-TO-1 PAYLOAD MULTIPLEXER [Rev 2.9 - Fix B01: Exact fso_payload_mux Port Map]
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
        .s_retx_tdata    (mux_retx_tdata),
        .s_retx_tvalid   (mux_retx_tvalid),
        .s_retx_tlast    (mux_retx_tlast),
        .s_retx_tready   (mux_retx_tready),
        .m_axis_tdata    (m_axis_fso_tdata),
        .m_axis_tvalid   (m_axis_fso_tvalid),
        .m_axis_tlast    (m_axis_fso_tlast),
        .m_axis_tready   (m_axis_fso_tready)
    );

endmodule