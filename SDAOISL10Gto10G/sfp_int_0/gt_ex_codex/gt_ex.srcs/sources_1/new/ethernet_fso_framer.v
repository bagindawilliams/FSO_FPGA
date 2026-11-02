`timescale 1ns / 1ps

/*
Revision BASELINE10-APPLY-C02-01 | 2026-11-01T15:49:41.899581+09:00 (Asia/Seoul, UTC+09:00)
PM-approved application of the reviewed C02 simulation baseline.
Functional change: Combine explicit timer propagation with C02 scheduling admission: a valid-only header must not start before CDC readiness. This is the final combined revision, not the earlier timer-only variant.
Effect: preserve the demonstrated two-packet DATA/IDLE/MGMT, FEC and ARQ
behavior; admission latency and buffering remain within the tested scope.
Evidence: RELEASE09 run1344 acceptance, run1420 FEC/peer regression,
and run1513 header contract; Vivado/XSim 2025.2. These are candidate-run
results, not results of a new official-source execution.
This revision entry is documentation-only relative to the tested final
candidate. Earlier module descriptions, attributions and revision notes
are retained. Historical behavior is not a claim about this active version.
Hardware timing, reset/CDC signoff and board testing remain separate.
*/
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
               - [Rev 2.0 - 2026-10-27 04:26 KST - Target B5.3 Audit Fix]:
                 1. Fixed 'active_ts_applies' encoding per SDA OISL Table 2-9 & 
                    Section 2.6.3.3.4 (Page 24 & 26): value 3'b000 indicates that 
                    TX_TS applies to the CURRENT frame (when ts_valid == 1'b1).
                 2. Added pending ACK/NAK holding registers (pending_ack_valid, 
                    pending_ack, pending_rxfn) so that any 1-cycle 'rx_ack_valid_in' 
                    pulse arriving while a frame is mid-transmission (frame_busy == 1) 
                    is captured and held until the next 'tx_trigger_gen' fires.
               - [Rev 2.2 - 2026-10-28 14:55 KST]: Connected 'seg_valid_bytes' [10:0]
                 from XGMII Front-End Segmenter to u_fso_payload_top.
               - [Rev 2.5 - 2026-10-29 15:19 KST - Audit Fix R06]:
                 Added segment-boundary stall guard ('seg_in_progress') so that once a 
                 475-word Ethernet segment begins entering u_fso_payload_top, it is 
                 never truncated mid-segment when the 4th tracker slot fills up. This 
                 ensures all 478 words of the 4th DATA frame complete cleanly and 
                 allows IDLE frames to advance the frame-granular holdoff timer.
               - [Rev 2.6 - 2026-10-30 00:55 KST - Audit Fix N04]:
                 Qualified 'fso_data_valid' to u_arq_tx_controller with buffered 
                 DATA FIFO availability ('u_fso_payload_top.data_tvalid') or unstarted
                 ingress segment availability, preventing a completed 475-word segment 
                 from re-triggering an empty DATA frame after its final word.
               - [Rev 2.7 - 2026-10-30 01:55 KST - Audit Fix N05 & N13]:
                 1. [Fix N13]: Added exact modulo-10^12 picosecond rollover 
                    (ONE_SEC_PICOSEC = 40'd1_000_000_000_000) and modulo-60 second 
                    carry ('compensated_tod_sec') when adding TX_PIPE_LATENCY_PS, 
                    and fixed 'active_ts_applies' to 3'b000 (current frame association).
                 2. [Fix N05]: Added dedicated 'peer_rxfn_in', 'peer_ack_in', and 
                    'peer_ack_valid_in' ports alongside parameter 'LOOPBACK_ARQ_DIRECT'.
               - [Rev 2.8 - 2026-10-30 11:45 KST - Audit Fix A11 & A18]:
                 1. [Fix A11]: Enforced strictly exclusive selection on 'LOOPBACK_ARQ_DIRECT'
                    (1 = tracker driven exclusively by local 'rx_*_in'; 0 = tracker driven 
                    exclusively by remote 'peer_*_in') and upgraded the outbound Header 
                    ACK holder to an 8-deep FIFO queue ('ack_q_rxfn', 'ack_q_bit').
                 2. [Fix A18]: Widened 'seg_valid_bytes' port to 14 bits ([13:0]) to match
                    fso_payload_top.v and sda_encoder.v with zero width warnings.
               - [Rev 2.9 - 2026-10-30 18:25 KST - Audit Fix B17 - Simultaneous Push/Pop Full ACK Queue]:
                 Updated 'ack_q_push' condition to '((ack_q_count < 4'd8) || ack_q_pop)'
                 so a new ACK arriving on the same clock cycle that a full queue pops an
                 entry is accepted seamlessly without loss, and added 'ack_q_overflow_cnt'
                 telemetry observability.
               - [Rev 3.1 - 2026-10-31 14:00 KST - Audit Fix OISL-IDLE-001 (D03) - Explicit IDLE Start & TXFN Latch]:
                 1. [Fix OISL-IDLE-001]: Preserved the full scheduler priority policy in
                    'u_arq_tx_controller' (Retransmission -> MGMT -> DATA -> IDLE) while
                    adding an explicit 'idle_start_valid' / 'idle_start_ready' handshake
                    and latched 'idle_txfn_committed' register when an IDLE frame is scheduled
                    ('tx_trigger_gen && (payload_mux_sel == 2'b00)').
                 2. Bound the IDLE generator start handshake so IDLE payload generation never
                    prefetches with a stale DATA TXFN before an IDLE slot is scheduled.
===========================================================================
*/

module ethernet_fso_framer #(
    // Deterministic delay from Header latch to first Preamble bit exiting GTH TX (in picoseconds)
    parameter [39:0] TX_PIPE_LATENCY_PS  = 40'd2_313_200,
    parameter        LOOPBACK_ARQ_DIRECT = 1,
    parameter        ARQ_SIM_SCALE_ENABLE = 1,
    parameter [15:0] ARQ_HOLDOFF_TICKS = 16'd500,
    parameter [7:0] ARQ_HOLDOFF_CFG = 8'd255,
    parameter integer ARQ_HOLDOFF_MULT = 16,
    parameter [2:0] ARQ_MAX_RETX = 3'd5
)(
    input  wire        clk,
    input  wire        rst_n,

    // -------------------------------------------------------
    // 1. INPUT: Ethernet Data & 14-Bit Length Metadata from XGMII Front-End Segmenter
    // -------------------------------------------------------
    input  wire [31:0] s_axis_eth_tdata,
    input  wire        s_axis_eth_tvalid,
    input  wire        s_axis_eth_tlast,
    output wire        s_axis_eth_tready,
    input  wire [13:0] seg_valid_bytes,  // [Rev 2.8 - Fix A18] Full 14-bit length metadata

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
    // 3. INPUT: ARQ Feedback (Local RX CRC Feedback & Remote Peer Header ACK)
    // -------------------------------------------------------
    input  wire [15:0] rx_rxfn_in,       // Local RX CRC-verified frame number (or loopback shared)
    input  wire        rx_ack_in,        // Local RX CRC ACK/NAK status
    input  wire        rx_ack_valid_in,  // Local RX CRC feedback valid
    input  wire [15:0] peer_rxfn_in,     // Remote peer ACK frame number from RX Header
    input  wire        peer_ack_in,      // Remote peer ACK/NAK bit from RX Header
    input  wire        peer_ack_valid_in,// Remote peer ACK valid bit from RX Header

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

    // [Rev 2.5 - Fix R06] Track active 475-word ingress segment so tx_stall_mac only
    // gates NEW segments at segment boundaries and never truncates an active segment!
    reg seg_in_progress;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            seg_in_progress <= 1'b0;
        end else if (s_axis_eth_tvalid && s_axis_eth_tready) begin
            if (s_axis_eth_tlast)
                seg_in_progress <= 1'b0;
            else
                seg_in_progress <= 1'b1;
        end
    end

    wire eff_stall_ingress     = tx_stall_mac && !seg_in_progress;
    assign s_axis_eth_tready   = payload_eth_tready && !eff_stall_ingress;
    assign eth_data_error_flag = 1'b0;
    assign m_axis_hdr_tlast    = 1'b0;

    wire hdr_sys_busy;
    reg  payload_streaming;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) payload_streaming <= 1'b0;
        else if (tx_trigger_gen) payload_streaming <= 1'b1;
        else if (m_axis_fso_tvalid && m_axis_fso_tready && m_axis_fso_tlast) payload_streaming <= 1'b0;
    end

    // Only a committed frame may consume/offer payload. Otherwise the DATA FIFO
    // could drain the next frame before its header and ARQ write request exist.
    wire payload_valid_raw, payload_last_raw;
    assign m_axis_fso_tvalid = payload_valid_raw && payload_streaming;
    assign m_axis_fso_tlast = payload_last_raw && payload_streaming;
    wire frame_busy = hdr_sys_busy || payload_streaming;

    // [Rev 2.6 - Fix N04] Signal new DATA availability to scheduler only when either:
    // (a) fifo_data in u_fso_payload_top already holds buffered DATA words (data_tvalid), OR
    // (b) a new ingress segment is waiting at s_axis_eth_tvalid before streaming starts.
    wire fifo_data_has_frame = u_fso_payload_top.data_tvalid;
    wire new_data_seg_ready  = (chk_eth_tvalid && !seg_in_progress) || fifo_data_has_frame;

    // =======================================================
    // [Rev 3.1 - Fix OISL-IDLE-001 (D03)] EXPLICIT IDLE START-COMMIT HANDSHAKE
    // Hold 'idle_start_valid_q' and 'idle_txfn_committed' when the scheduler triggers
    // an IDLE frame ('payload_mux_sel == 2'b00') until accepted by u_fso_idle_generator.
    // =======================================================
    reg         idle_start_valid_q;
    reg  [15:0] idle_txfn_committed;
    wire        idle_gen_start_ready;
    wire        idle_trigger_now     = tx_trigger_gen && (payload_mux_sel == 2'b00);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            idle_start_valid_q  <= 1'b0;
            idle_txfn_committed <= 16'd0;
        end else begin
            if (idle_trigger_now) begin
                idle_txfn_committed <= tx_txfn_out;
                // If generator is already ready on the trigger cycle, handshake completes immediately;
                // otherwise hold idle_start_valid_q high until idle_gen_start_ready asserts.
                idle_start_valid_q  <= !idle_gen_start_ready;
            end else if (idle_start_valid_q && idle_gen_start_ready) begin
                idle_start_valid_q  <= 1'b0;
            end
        end
    end

    wire        eff_idle_start_valid = idle_trigger_now || idle_start_valid_q;
    wire [15:0] eff_payload_txfn     = idle_trigger_now ? tx_txfn_out :
                                       (idle_start_valid_q ? idle_txfn_committed : tx_txfn_out);

    // Explicit start handshake is propagated through fso_payload_top ports below.


    // =======================================================
    // [Rev 2.8 & Rev 2.9 - Fix A11 & B17] 8-DEEP OUTBOUND HEADER ACK QUEUE
    // =======================================================
    reg [15:0] ack_q_rxfn [0:7];
    reg        ack_q_bit  [0:7];
    reg [2:0]  ack_q_wr_ptr;
    reg [2:0]  ack_q_rd_ptr;
    reg [3:0]  ack_q_count;
    reg [15:0] ack_q_overflow_cnt;
    integer    q_idx;

    wire ack_q_pop  = tx_trigger_gen && (ack_q_count > 4'd0);
    // [Rev 2.9 - Fix B17] Accept new ACK when space is available OR when a full queue pops simultaneously
    wire ack_q_push = rx_ack_valid_in && ((ack_q_count < 4'd8) || ack_q_pop) &&
                      !(tx_trigger_gen && (ack_q_count == 4'd0));

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ack_q_wr_ptr       <= 3'd0;
            ack_q_rd_ptr       <= 3'd0;
            ack_q_count        <= 4'd0;
            ack_q_overflow_cnt <= 16'd0;
            for (q_idx = 0; q_idx < 8; q_idx = q_idx + 1) begin
                ack_q_rxfn[q_idx] <= 16'd0;
                ack_q_bit[q_idx]  <= 1'b0;
            end
        end else begin
            if (ack_q_push) begin
                ack_q_rxfn[ack_q_wr_ptr] <= rx_rxfn_in;
                ack_q_bit[ack_q_wr_ptr]  <= rx_ack_in;
                ack_q_wr_ptr             <= ack_q_wr_ptr + 3'd1;
            end else if (rx_ack_valid_in && (ack_q_count == 4'd8) && !ack_q_pop) begin
                ack_q_overflow_cnt       <= ack_q_overflow_cnt + 16'd1;
            end
            if (ack_q_pop) begin
                ack_q_rd_ptr <= ack_q_rd_ptr + 3'd1;
            end
            if (ack_q_push && !ack_q_pop)
                ack_q_count <= ack_q_count + 4'd1;
            else if (!ack_q_push && ack_q_pop)
                ack_q_count <= ack_q_count - 4'd1;
        end
    end

    wire [15:0] hdr_rxfn_mux      = (ack_q_count > 4'd0) ? ack_q_rxfn[ack_q_rd_ptr] : rx_rxfn_in;
    wire        hdr_ack_mux       = (ack_q_count > 4'd0) ? ack_q_bit[ack_q_rd_ptr]  : rx_ack_in;
    wire        hdr_ack_valid_mux = (ack_q_count > 4'd0) || rx_ack_valid_in;

    // [Rev 2.8 - Fix A11] Strictly exclusive parameter selection:
    // LOOPBACK_ARQ_DIRECT == 1 -> always local rx_*_in; 0 -> always remote peer_*_in
    wire [15:0] safe_peer_rxfn   = (^peer_rxfn_in === 1'bx) ? 16'd0 : peer_rxfn_in;
    wire        safe_peer_ack    = (peer_ack_in === 1'b1);
    wire        safe_peer_valid  = (peer_ack_valid_in === 1'b1);

    wire [15:0] tracker_rxfn_in  = LOOPBACK_ARQ_DIRECT ? rx_rxfn_in      : safe_peer_rxfn;
    wire        tracker_ack_in   = LOOPBACK_ARQ_DIRECT ? rx_ack_in       : safe_peer_ack;
    wire        tracker_valid_in = LOOPBACK_ARQ_DIRECT ? rx_ack_valid_in : safe_peer_valid;

    // =======================================================
    // [Rev 2.7 - Fix N13] EGRESS TIMESTAMP PREDICTION WITH 10^12 PS ROLLOVER & MOD-60 CARRY
    // =======================================================
    localparam [39:0] ONE_SEC_PICOSEC = 40'd1_000_000_000_000;

    wire [40:0] raw_egress_tx_ts       = {1'b0, tx_phy_ts_picosec} + {1'b0, TX_PIPE_LATENCY_PS};
    wire        tx_ts_sec_carry        = (raw_egress_tx_ts >= {1'b0, ONE_SEC_PICOSEC});
    wire [39:0] predicted_egress_tx_ts = tx_ts_sec_carry ?
                                         (raw_egress_tx_ts[39:0] - ONE_SEC_PICOSEC) :
                                         raw_egress_tx_ts[39:0];
    wire [5:0]  compensated_tod_sec    = tx_ts_sec_carry ?
                                         ((tod_seconds_in >= 6'd59) ? 6'd0 : (tod_seconds_in + 6'd1)) :
                                         tod_seconds_in;
    // SDA OISL Sec. 2.6.3.3.4: 3'b000 indicates TX_TS applies to the current frame
    wire [2:0]  active_ts_applies      = 3'b000;

    // =======================================================
    // B. ARQ TX CONTROLLER (The Orchestrator Brain)
    // =======================================================
    arq_tx_controller #(.SIM_SCALE_ENABLE(ARQ_SIM_SCALE_ENABLE),
        .HOLDOFF_TICKS(ARQ_HOLDOFF_TICKS),
        .ARQ_HOLDOFF_CFG(ARQ_HOLDOFF_CFG), .ARQ_HOLDOFF_MULT(ARQ_HOLDOFF_MULT),
        .ARQ_MAX_RETX(ARQ_MAX_RETX)) u_arq_tx_controller (
        .clk               (clk),
        .rst_n             (rst_n),
        .fso_data_valid    (new_data_seg_ready),
        .mgmt_tick_1hz     (mgmt_trigger_1hz),
        .header_gen_busy   (frame_busy || !m_axis_hdr_tready),
        
        .rx_rxfn_in        (tracker_rxfn_in),
        .rx_ack_in         (tracker_ack_in),
        .rx_ack_valid_in   (tracker_valid_in),
        
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
        .rxfn_in             (hdr_rxfn_mux),            
        .ack_in              (hdr_ack_mux),             
        .ack_valid_in        (hdr_ack_valid_mux),       
        .frame_type_in       (frame_type_out),
        
        // PNT, Timestamp Manager & Control/Status Manager (FCCH)
        .tx_ts_in            (predicted_egress_tx_ts),
        .tod_seconds_in      (compensated_tod_sec),
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
        .idle_start_valid (eff_idle_start_valid),
        .idle_start_ready (idle_gen_start_ready),
        .clk               (clk),
        .rst_n             (rst_n),
        
        .s_axis_eth_tdata  (chk_eth_tdata),
        .s_axis_eth_tvalid (chk_eth_tvalid && !eff_stall_ingress),
        .s_axis_eth_tlast  (chk_eth_tlast),
        .s_axis_eth_tready (payload_eth_tready),
        .seg_valid_bytes   (seg_valid_bytes),
        
        .payload_mux_sel   (payload_mux_sel),
        .txfn_in           (eff_payload_txfn),
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
        .m_axis_fso_tvalid (payload_valid_raw),
        .m_axis_fso_tlast  (payload_last_raw),
        .m_axis_fso_tready (m_axis_fso_tready && payload_streaming)
    );

endmodule