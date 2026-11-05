`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : SDA Encoder Grand Top Module.

Revision History:
  - Rev 1.0 (Initial) : SDA Encoder top-level integration.
  - Rev 2.2 (2026-10-28 14:55 KST) : Added 'seg_valid_bytes [10:0]' input port 
    and forwarded it to u_eth_fso_framer for dynamic packet length encapsulation.
  - Rev 2.5 (2026-10-29 16:42 KST) : [Audit Fix R19 - ARQ Feedback CDC Synchronizer]
    Added 2-stage (* ASYNC_REG = "TRUE" *) synchronizer registers (arq_rxfn_sync1/2,
    arq_ack_sync1/2, arq_valid_sync1/2) in the clk_gth domain to safely transfer the
    closed-loop ARQ feedback transaction from the receiver clock domain.
  - Rev 2.7 (2026-10-30 01:55 KST) : [Audit Fix N05 & N06 - Coherent Edge-Qualified CDC & Peer ACK Routing]
    1. [Fix N06]: Upgraded ARQ feedback CDC from independent bit sampling to a 
       3-stage edge-qualified coherent capture: when the synchronized valid signal 
       rises (arq_valid_sync2 && !arq_valid_sync3), the settled 16-bit frame number 
       and ACK bit are atomically latched into 'arq_rxfn_coherent' and 'arq_ack_coherent'
       alongside a 1-cycle 'arq_valid_pulse'.
    2. [Fix N05]: Added optional 'peer_rxfn_in', 'peer_ack_in', and 'peer_ack_valid_in'
       ports with matching coherent CDC synchronization to support independent local 
       and remote peer ARQ feedback paths in u_eth_fso_framer.
  - Rev 2.8 (2026-10-30 11:45 KST) : [Audit Fix A09 & A18 - Toggle-Handshake CDC Event Capture & 14-Bit Metadata]
    1. [Fix A09]: Upgraded the ARQ feedback CDC interface to an Event-Driven Toggle 
       Synchronizer with Source Holding Latches ('src_arq_toggle', 'src_arq_rxfn_hold', 
       'src_arq_ack_hold' triggered on posedge rx_ack_valid_in).
    2. [Fix A18]: Widened 'seg_valid_bytes' port to 14 bits ([13:0]) to match 
       eth_rx_front_end_top.v and ethernet_fso_framer.v with zero width warnings.
  - Rev 2.9 (2026-10-30 18:25 KST) : [Audit Fix B14 - 4-Entry Event FIFO Ring Buffer CDC]
    Upgraded the ARQ feedback CDC from a 1-bit toggle to a 4-Entry Event Ring Buffer 
    ('src_arq_rxfn_q[0:3]', 'src_arq_ack_q[0:3]', and 3-bit write pointer 'src_arq_wr_ptr')
    synchronized across 2 (* ASYNC_REG = "TRUE" *) stages into 'clk_gth' and drained 
    sequentially by 'dst_arq_rd_ptr'.
  - Rev 3.0 (2026-10-30 23:35 KST) : [Audit Fix B14 - 16-Entry Gray-Coded Async FIFO & Continuous Read-Pointer Return]
    Expanded the ARQ and Peer feedback CDC queues from 4 entries to 16 entries 
    ('src_arq_rxfn_q[0:15]', 'src_arq_ack_q[0:15]') with 5-bit Gray-coded write and 
    read pointers ('src_arq_wr_gray', 'dst_arq_rd_gray').
  - Rev 3.1 (2026-10-31 14:00 KST) : [Audit Fix OISL-CDC-001 (B14 / D05) - Synchronous Source-Clock 32+4 CDC FIFO & Readiness Handshake]
    1. [Fix OISL-CDC-001 Clocking]: Replaced control-edge clocking ('posedge arq_valid_clean')
       and combinational clock muxing ('src_sync_clk') with true source-clock
       synchronous capture under the explicit contract '1 valid cycle = 1 event'.
    2. [Fix OISL-CDC-001 Capacity & Strict Ordering]: Sized each CDC channel to a 32-Entry
       6-bit Gray-coded Async FIFO backed by a 4-Entry Source Pending Buffer ('arq_pend_*',
       'peer_pend_*') with strict oldest-first priority.
    3. [Fix OISL-CDC-001 Reset Readiness Handshake & Flush Telemetry]: Implemented dual-domain
       post-reset readiness handshaking ('src_local_ready' <-> 'dst_local_ready') and
       persistent non-empty flush counters.
  - Rev 3.2 (2026-11-01 15:49 KST) : [Baseline C02 - Explicit RX Feedback Clock Domain & ARQ Timer Propagation]
    1. Added dedicated 'clk_feedback' input port (connected to rx0_clk at top level)
       and 2-stage per-domain reset synchronizers ('feedback_reset_sync' -> 'feedback_rst_n'
       and 'feedback_dst_reset_sync' -> 'feedback_dst_rst_n') for the 32-entry feedback FIFOs.
    2. Propagated explicit ARQ timer parameters (ARQ_SIM_SCALE_ENABLE, ARQ_HOLDOFF_CFG,
       ARQ_HOLDOFF_MULT, ARQ_MAX_RETX, ARQ_HOLDOFF_TICKS) to u_eth_fso_framer.
===========================================================================
*/

module sda_encoder #(
    parameter SIM_MODE             = 1,
    parameter LOOPBACK_ARQ_DIRECT  = 1,
    parameter ARQ_SIM_SCALE_ENABLE = (SIM_MODE != 0),
    parameter [7:0]  ARQ_HOLDOFF_CFG   = 8'd255,
    parameter integer ARQ_HOLDOFF_MULT = 16,
    parameter [2:0]  ARQ_MAX_RETX      = 3'd5,
    parameter [15:0] ARQ_HOLDOFF_TICKS = 16'd500
)(
    input  wire        clk_feedback, // RX domain: local CRC and peer header feedback
    input  wire        clk_logic,    // 200.0 MHz Source Logic Clock
    input  wire        clk_gth,      // 312.5 MHz Continuous GTH Clock
    input  wire        rst_n,

    input  wire [31:0] s_axis_eth_tdata,
    input  wire        s_axis_eth_tvalid,
    input  wire        s_axis_eth_tlast,
    output wire        s_axis_eth_tready,
    input  wire [13:0] seg_valid_bytes,  // [Rev 2.8 - Fix A18] Full 14-bit length metadata

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

    // Local RX CRC Feedback (or shared loopback feedback)
    input  wire [15:0] rx_rxfn_in,      
    input  wire        rx_ack_in,       
    input  wire        rx_ack_valid_in,

    // Optional Remote Peer Header ACK Feedback
    input  wire [15:0] peer_rxfn_in,
    input  wire        peer_ack_in,
    input  wire        peer_ack_valid_in,

    output wire [31:0] tx_fso_data_out,
    output wire        tx_fso_valid_out,
    output wire        eth_data_error_flag
);

    // =======================================================
    // [Rev 3.1 & Rev 3.2 - Fix OISL-CDC-001] 32-ENTRY GRAY-CODED ASYNC FIFO
    // + 4-ENTRY STRICT-ORDER SOURCE PENDING BUFFER + PER-DOMAIN RESET SYNC
    // =======================================================
    function [5:0] bin2gray6(input [5:0] b);
        begin
            bin2gray6 = (b >> 1) ^ b;
        end
    endfunction

    // Asynchronous assertion, synchronous release in each feedback clock domain.
    (* ASYNC_REG = "TRUE" *) reg [1:0] feedback_reset_sync, feedback_dst_reset_sync;
    always @(posedge clk_feedback or negedge rst_n)
        if (!rst_n) feedback_reset_sync <= 2'b00;
        else        feedback_reset_sync <= {feedback_reset_sync[0], 1'b1};

    always @(posedge clk_gth or negedge rst_n)
        if (!rst_n) feedback_dst_reset_sync <= 2'b00;
        else        feedback_dst_reset_sync <= {feedback_dst_reset_sync[0], 1'b1};

    wire feedback_rst_n     = feedback_reset_sync[1];
    wire feedback_dst_rst_n = feedback_dst_reset_sync[1];

    wire        arq_valid_clean  = (rx_ack_valid_in === 1'b1);
    wire [15:0] arq_rxfn_clean   = (^rx_rxfn_in === 1'bx) ? 16'd0 : rx_rxfn_in;
    wire        arq_ack_clean    = (rx_ack_in === 1'b1);

    wire        peer_valid_clean = (peer_ack_valid_in === 1'b1);
    wire [15:0] peer_rxfn_clean  = (^peer_rxfn_in === 1'bx) ? 16'd0 : peer_rxfn_in;
    wire        peer_ack_clean   = (peer_ack_in === 1'b1);

    // Dual-Domain Readiness Handshake & Return Gray Read-Pointer Synchronizers
    reg        src_local_ready;
    reg        dst_local_ready;

    (* ASYNC_REG = "TRUE" *) reg src_sees_dst_ready_s1, src_sees_dst_ready_s2;
    (* ASYNC_REG = "TRUE" *) reg dst_sees_src_ready_s1, dst_sees_src_ready_s2;

    wire src_fifo_ready = src_local_ready && src_sees_dst_ready_s2;
    wire dst_fifo_ready = dst_local_ready && dst_sees_src_ready_s2;

    reg [5:0] dst_arq_rd_bin,  dst_arq_rd_gray;
    reg [5:0] dst_peer_rd_bin, dst_peer_rd_gray;

    (* ASYNC_REG = "TRUE" *) reg [5:0] src_arq_rd_gray_s1,  src_arq_rd_gray_s2;
    (* ASYNC_REG = "TRUE" *) reg [5:0] src_peer_rd_gray_s1, src_peer_rd_gray_s2;

    always @(posedge clk_feedback or negedge feedback_rst_n) begin
        if (!feedback_rst_n) begin
            src_local_ready       <= 1'b0;
            src_sees_dst_ready_s1 <= 1'b0;
            src_sees_dst_ready_s2 <= 1'b0;
            src_arq_rd_gray_s1    <= 6'd0;
            src_arq_rd_gray_s2    <= 6'd0;
            src_peer_rd_gray_s1   <= 6'd0;
            src_peer_rd_gray_s2   <= 6'd0;
        end else begin
            src_local_ready       <= 1'b1;
            src_sees_dst_ready_s1 <= dst_local_ready;
            src_sees_dst_ready_s2 <= src_sees_dst_ready_s1;
            src_arq_rd_gray_s1    <= dst_arq_rd_gray;
            src_arq_rd_gray_s2    <= src_arq_rd_gray_s1;
            src_peer_rd_gray_s1   <= dst_peer_rd_gray;
            src_peer_rd_gray_s2   <= src_peer_rd_gray_s1;
        end
    end

    // 1. Source 32-Slot Main Event FIFO + 4-Slot Ordered Pending Buffer (Local RX Feedback)
    reg [5:0]  src_arq_wr_bin;
    reg [5:0]  src_arq_wr_gray;
    reg [15:0] src_arq_rxfn_q [0:31];
    reg        src_arq_ack_q  [0:31];

    reg [15:0] arq_pend_rxfn_q [0:3];
    reg        arq_pend_ack_q  [0:3];
    reg [1:0]  arq_pend_wr_ptr;
    reg [1:0]  arq_pend_rd_ptr;
    reg [2:0]  arq_pend_count;

    reg [15:0] arq_cdc_overflow_cnt;
    reg [15:0] arq_cdc_nonempty_flush_cnt = 16'd0; // Persistent across reset flushes
    integer    q_i;

    // Standard 6-bit Gray-code FIFO Full Comparison (MSBs [5:4] inverted, LSBs [3:0] equal)
    wire       src_arq_full      = !src_fifo_ready ||
                                   (src_arq_wr_gray == {~src_arq_rd_gray_s2[5:4], src_arq_rd_gray_s2[3:0]});
    wire [5:0] src_arq_next_bin  = src_arq_wr_bin + 6'd1;
    wire       arq_had_queued    = (src_arq_wr_gray != src_arq_rd_gray_s2) || (arq_pend_count > 3'd0);

    always @(posedge clk_feedback or negedge feedback_rst_n) begin
        if (!feedback_rst_n) begin
            if (arq_had_queued)
                arq_cdc_nonempty_flush_cnt <= arq_cdc_nonempty_flush_cnt + 16'd1;
            src_arq_wr_bin       <= 6'd0;
            src_arq_wr_gray      <= 6'd0;
            arq_pend_wr_ptr      <= 2'd0;
            arq_pend_rd_ptr      <= 2'd0;
            arq_pend_count       <= 3'd0;
            arq_cdc_overflow_cnt <= 16'd0;
            for (q_i = 0; q_i < 32; q_i = q_i + 1) begin
                src_arq_rxfn_q[q_i] <= 16'd0;
                src_arq_ack_q[q_i]  <= 1'b0;
            end
            for (q_i = 0; q_i < 4; q_i = q_i + 1) begin
                arq_pend_rxfn_q[q_i] <= 16'd0;
                arq_pend_ack_q[q_i]  <= 1'b0;
            end
        end else begin
            // [Rev 3.1 - Fix OISL-CDC-001 Poin 4.1]: Strict Oldest-First Priority
            if (arq_pend_count > 3'd0) begin
                if (!src_arq_full) begin
                    src_arq_rxfn_q[src_arq_wr_bin[4:0]] <= arq_pend_rxfn_q[arq_pend_rd_ptr];
                    src_arq_ack_q[src_arq_wr_bin[4:0]]  <= arq_pend_ack_q[arq_pend_rd_ptr];
                    src_arq_wr_bin                      <= src_arq_next_bin;
                    src_arq_wr_gray                     <= bin2gray6(src_arq_next_bin);
                    arq_pend_rd_ptr                     <= arq_pend_rd_ptr + 2'd1;

                    if (arq_valid_clean) begin
                        arq_pend_rxfn_q[arq_pend_wr_ptr] <= arq_rxfn_clean;
                        arq_pend_ack_q[arq_pend_wr_ptr]  <= arq_ack_clean;
                        arq_pend_wr_ptr                  <= arq_pend_wr_ptr + 2'd1;
                    end else begin
                        arq_pend_count <= arq_pend_count - 3'd1;
                    end
                end else if (arq_valid_clean) begin
                    if (arq_pend_count < 3'd4) begin
                        arq_pend_rxfn_q[arq_pend_wr_ptr] <= arq_rxfn_clean;
                        arq_pend_ack_q[arq_pend_wr_ptr]  <= arq_ack_clean;
                        arq_pend_wr_ptr                  <= arq_pend_wr_ptr + 2'd1;
                        arq_pend_count                   <= arq_pend_count + 3'd1;
                    end else begin
                        arq_cdc_overflow_cnt <= arq_cdc_overflow_cnt + 16'd1;
                    end
                end
            end else if (arq_valid_clean) begin
                if (!src_arq_full) begin
                    src_arq_rxfn_q[src_arq_wr_bin[4:0]] <= arq_rxfn_clean;
                    src_arq_ack_q[src_arq_wr_bin[4:0]]  <= arq_ack_clean;
                    src_arq_wr_bin                      <= src_arq_next_bin;
                    src_arq_wr_gray                     <= bin2gray6(src_arq_next_bin);
                end else begin
                    arq_pend_rxfn_q[arq_pend_wr_ptr] <= arq_rxfn_clean;
                    arq_pend_ack_q[arq_pend_wr_ptr]  <= arq_ack_clean;
                    arq_pend_wr_ptr                  <= arq_pend_wr_ptr + 2'd1;
                    arq_pend_count                   <= 3'd1;
                end
            end
        end
    end

    // 2. Source 32-Slot Main Event FIFO + 4-Slot Ordered Pending Buffer (Remote Peer Header ACK)
    reg [5:0]  src_peer_wr_bin;
    reg [5:0]  src_peer_wr_gray;
    reg [15:0] src_peer_rxfn_q [0:31];
    reg        src_peer_ack_q  [0:31];

    reg [15:0] peer_pend_rxfn_q [0:3];
    reg        peer_pend_ack_q  [0:3];
    reg [1:0]  peer_pend_wr_ptr;
    reg [1:0]  peer_pend_rd_ptr;
    reg [2:0]  peer_pend_count;

    reg [15:0] peer_cdc_overflow_cnt;
    reg [15:0] peer_cdc_nonempty_flush_cnt = 16'd0;
    integer    p_i;

    wire       src_peer_full     = !src_fifo_ready ||
                                   (src_peer_wr_gray == {~src_peer_rd_gray_s2[5:4], src_peer_rd_gray_s2[3:0]});
    wire [5:0] src_peer_next_bin = src_peer_wr_bin + 6'd1;
    wire       peer_had_queued   = (src_peer_wr_gray != src_peer_rd_gray_s2) || (peer_pend_count > 3'd0);

    always @(posedge clk_feedback or negedge feedback_rst_n) begin
        if (!feedback_rst_n) begin
            if (peer_had_queued)
                peer_cdc_nonempty_flush_cnt <= peer_cdc_nonempty_flush_cnt + 16'd1;
            src_peer_wr_bin       <= 6'd0;
            src_peer_wr_gray      <= 6'd0;
            peer_pend_wr_ptr      <= 2'd0;
            peer_pend_rd_ptr      <= 2'd0;
            peer_pend_count       <= 3'd0;
            peer_cdc_overflow_cnt <= 16'd0;
            for (p_i = 0; p_i < 32; p_i = p_i + 1) begin
                src_peer_rxfn_q[p_i] <= 16'd0;
                src_peer_ack_q[p_i]  <= 1'b0;
            end
            for (p_i = 0; p_i < 4; p_i = p_i + 1) begin
                peer_pend_rxfn_q[p_i] <= 16'd0;
                peer_pend_ack_q[p_i]  <= 1'b0;
            end
        end else begin
            if (peer_pend_count > 3'd0) begin
                if (!src_peer_full) begin
                    src_peer_rxfn_q[src_peer_wr_bin[4:0]] <= peer_pend_rxfn_q[peer_pend_rd_ptr];
                    src_peer_ack_q[src_peer_wr_bin[4:0]]  <= peer_pend_ack_q[peer_pend_rd_ptr];
                    src_peer_wr_bin                       <= src_peer_next_bin;
                    src_peer_wr_gray                      <= bin2gray6(src_peer_next_bin);
                    peer_pend_rd_ptr                      <= peer_pend_rd_ptr + 2'd1;

                    if (peer_valid_clean) begin
                        peer_pend_rxfn_q[peer_pend_wr_ptr] <= peer_rxfn_clean;
                        peer_pend_ack_q[peer_pend_wr_ptr]  <= peer_ack_clean;
                        peer_pend_wr_ptr                   <= peer_pend_wr_ptr + 2'd1;
                    end else begin
                        peer_pend_count <= peer_pend_count - 3'd1;
                    end
                end else if (peer_valid_clean) begin
                    if (peer_pend_count < 3'd4) begin
                        peer_pend_rxfn_q[peer_pend_wr_ptr] <= peer_rxfn_clean;
                        peer_pend_ack_q[peer_pend_wr_ptr]  <= peer_ack_clean;
                        peer_pend_wr_ptr                   <= peer_pend_wr_ptr + 2'd1;
                        peer_pend_count                    <= peer_pend_count + 3'd1;
                    end else begin
                        peer_cdc_overflow_cnt <= peer_cdc_overflow_cnt + 16'd1;
                    end
                end
            end else if (peer_valid_clean) begin
                if (!src_peer_full) begin
                    src_peer_rxfn_q[src_peer_wr_bin[4:0]] <= peer_rxfn_clean;
                    src_peer_ack_q[src_peer_wr_bin[4:0]]  <= peer_ack_clean;
                    src_peer_wr_bin                       <= src_peer_next_bin;
                    src_peer_wr_gray                      <= bin2gray6(src_peer_next_bin);
                end else begin
                    peer_pend_rxfn_q[peer_pend_wr_ptr] <= peer_rxfn_clean;
                    peer_pend_ack_q[peer_pend_wr_ptr]  <= peer_ack_clean;
                    peer_pend_wr_ptr                   <= peer_pend_wr_ptr + 2'd1;
                    peer_pend_count                    <= 3'd1;
                end
            end
        end
    end

    // 3. 2-Stage Gray-Pointer Destination Synchronizers & In-Order Drain in clk_gth
    (* ASYNC_REG = "TRUE" *) reg [5:0] arq_wr_gray_s1,  arq_wr_gray_s2;
    (* ASYNC_REG = "TRUE" *) reg [5:0] peer_wr_gray_s1, peer_wr_gray_s2;

    reg [15:0] arq_rxfn_coherent;
    reg        arq_ack_coherent;
    reg        arq_valid_pulse;

    reg [15:0] peer_rxfn_coherent;
    reg        peer_ack_coherent;
    reg        peer_valid_pulse;

    wire       dst_arq_empty      = !dst_fifo_ready || (dst_arq_rd_gray  == arq_wr_gray_s2);
    wire       dst_peer_empty     = !dst_fifo_ready || (dst_peer_rd_gray == peer_wr_gray_s2);
    wire [5:0] dst_arq_next_rd    = dst_arq_rd_bin  + 6'd1;
    wire [5:0] dst_peer_next_rd   = dst_peer_rd_bin + 6'd1;

    always @(posedge clk_gth or negedge feedback_dst_rst_n) begin
        if (!feedback_dst_rst_n) begin
            dst_local_ready       <= 1'b0;
            dst_sees_src_ready_s1 <= 1'b0;
            dst_sees_src_ready_s2 <= 1'b0;

            arq_wr_gray_s1        <= 6'd0;
            arq_wr_gray_s2        <= 6'd0;
            dst_arq_rd_bin        <= 6'd0;
            dst_arq_rd_gray       <= 6'd0;
            arq_rxfn_coherent     <= 16'd0;
            arq_ack_coherent      <= 1'b0;
            arq_valid_pulse       <= 1'b0;

            peer_wr_gray_s1       <= 6'd0;
            peer_wr_gray_s2       <= 6'd0;
            dst_peer_rd_bin       <= 6'd0;
            dst_peer_rd_gray      <= 6'd0;
            peer_rxfn_coherent    <= 16'd0;
            peer_ack_coherent     <= 1'b0;
            peer_valid_pulse      <= 1'b0;
        end else begin
            dst_local_ready       <= 1'b1;
            dst_sees_src_ready_s1 <= src_local_ready;
            dst_sees_src_ready_s2 <= dst_sees_src_ready_s1;

            // Synchronize 6-bit Gray write pointers into clk_gth domain
            arq_wr_gray_s1  <= src_arq_wr_gray;
            arq_wr_gray_s2  <= arq_wr_gray_s1;
            peer_wr_gray_s1 <= src_peer_wr_gray;
            peer_wr_gray_s2 <= peer_wr_gray_s1;

            if (!dst_arq_empty) begin
                arq_rxfn_coherent <= src_arq_rxfn_q[dst_arq_rd_bin[4:0]];
                arq_ack_coherent  <= src_arq_ack_q[dst_arq_rd_bin[4:0]];
                arq_valid_pulse   <= 1'b1;
                dst_arq_rd_bin    <= dst_arq_next_rd;
                dst_arq_rd_gray   <= bin2gray6(dst_arq_next_rd);
            end else begin
                arq_valid_pulse   <= 1'b0;
            end

            if (!dst_peer_empty) begin
                peer_rxfn_coherent <= src_peer_rxfn_q[dst_peer_rd_bin[4:0]];
                peer_ack_coherent  <= src_peer_ack_q[dst_peer_rd_bin[4:0]];
                peer_valid_pulse   <= 1'b1;
                dst_peer_rd_bin    <= dst_peer_next_rd;
                dst_peer_rd_gray   <= bin2gray6(dst_peer_next_rd);
            end else begin
                peer_valid_pulse   <= 1'b0;
            end
        end
    end

    wire [7:0]   framer_hdr_tdata; 
    wire         framer_hdr_tvalid;
    wire         framer_hdr_tlast;
    wire         framer_hdr_tready;

    wire [31:0]  framer_fso_tdata;
    wire         framer_fso_tvalid;
    wire         framer_fso_tlast;
    wire         framer_fso_tready;

    wire         cdc1_ready_flag;
    assign framer_hdr_tready = cdc1_ready_flag;
    assign framer_fso_tready = cdc1_ready_flag;

    wire         cdc1_hdr_dv;
    wire [7:0]   cdc1_hdr_data;
    wire         cdc1_load_dv;
    wire [63:0]  cdc1_load_data;

    wire         fec_valid;
    wire [95:0]  fec_data;

    wire [71:0]  preamble_data;

    wire         gb_valid;
    wire [127:0] gb_data;
    wire [15:0]  gb_keep;

    wire         cdc2_valid;
    wire [31:0]  cdc2_data;

    ethernet_fso_framer #(
        .LOOPBACK_ARQ_DIRECT  (LOOPBACK_ARQ_DIRECT),
        .ARQ_SIM_SCALE_ENABLE (ARQ_SIM_SCALE_ENABLE),
        .ARQ_HOLDOFF_CFG      (ARQ_HOLDOFF_CFG),
        .ARQ_HOLDOFF_MULT     (ARQ_HOLDOFF_MULT),
        .ARQ_MAX_RETX         (ARQ_MAX_RETX),
        .ARQ_HOLDOFF_TICKS    (ARQ_HOLDOFF_TICKS)
    ) u_eth_fso_framer (
        .clk                 (clk_gth),
        .rst_n               (rst_n),
        .s_axis_eth_tdata    (s_axis_eth_tdata),
        .s_axis_eth_tvalid   (s_axis_eth_tvalid),
        .s_axis_eth_tlast    (s_axis_eth_tlast),
        .s_axis_eth_tready   (s_axis_eth_tready),
        .seg_valid_bytes     (seg_valid_bytes),
        .mgmt_trigger_1hz    (mgmt_trigger_1hz),
        .rx_phy_ts_sec       (rx_phy_ts_sec),
        .rx_phy_ts_picosec   (rx_phy_ts_picosec),
        .tx_phy_ts_sec       (tx_phy_ts_sec),
        .tx_phy_ts_picosec   (tx_phy_ts_picosec),
        .range_meters        (range_meters),
        .range_ts_sec        (range_ts_sec),
        .range_ts_picosec    (range_ts_picosec),
        .ts_valid            (ts_valid),
        .tod_seconds_in      (tod_seconds_in),
        .fcch_opcode         (fcch_opcode),
        .fcch_pl             (fcch_pl),
        .rx_rxfn_in          (arq_rxfn_coherent),
        .rx_ack_in           (arq_ack_coherent),
        .rx_ack_valid_in     (arq_valid_pulse),
        .peer_rxfn_in        (peer_rxfn_coherent),
        .peer_ack_in         (peer_ack_coherent),
        .peer_ack_valid_in   (peer_valid_pulse),
        .m_axis_hdr_tdata    (framer_hdr_tdata),
        .m_axis_hdr_tvalid   (framer_hdr_tvalid),
        .m_axis_hdr_tlast    (framer_hdr_tlast),
        .m_axis_hdr_tready   (framer_hdr_tready),
        .m_axis_fso_tdata    (framer_fso_tdata),
        .m_axis_fso_tvalid   (framer_fso_tvalid),
        .m_axis_fso_tlast    (framer_fso_tlast),
        .m_axis_fso_tready   (framer_fso_tready),
        .eth_data_error_flag (eth_data_error_flag)
    );

    x_gth_logic u_cdc_tx_1 (
        .clk_gth             (clk_gth),
        .clk_logic           (clk_logic),
        .rst_n               (rst_n),
        .en_head             (framer_hdr_tvalid),
        .en_load             (framer_fso_tvalid),
        .header_in           (framer_hdr_tdata), 
        .payload_in          (framer_fso_tdata),
        .cdc_ready           (cdc1_ready_flag),
        .header_dv           (cdc1_hdr_dv),
        .header              (cdc1_hdr_data),
        .payload_dv          (cdc1_load_dv),
        .payload             (cdc1_load_data)
    );

    core_tx u_encoder_fec (
        .clk                 (clk_logic),
        .rst_n               (rst_n),
        .en_head             (cdc1_hdr_dv),
        .en_load             (cdc1_load_dv),
        .header              (cdc1_hdr_data),
        .payload             (cdc1_load_data),
        .flag                (fec_valid),
        .data_out            (fec_data)
    );

    preamble_gen u_preamble_gen (
        .preamble_out        (preamble_data)
    );

    mux_gearbox_128 u_mux_gearbox (
        .clk                 (clk_logic),
        .rst_n               (rst_n),
        .preamble_data       (preamble_data),
        .lpc_data            (fec_data),
        .lpc_valid           (fec_valid),
        .cdc_data            (gb_data),
        .cdc_valid           (gb_valid),
        .cdc_keep            (gb_keep)
    );

    x_logic_gth u_cdc_tx_2 (
        .clk_gth             (clk_gth),
        .clk_logic           (clk_logic),
        .rst_n               (rst_n),
        .en                  (1'b1),
        .data_in             (gb_data),
        .data_in_dv          (gb_valid),
        .cdc_keep            (gb_keep),
        .flag                (cdc2_valid),
        .data_out            (cdc2_data)
    );

    error_inject #(
        .SIM_MODE            (SIM_MODE)
    ) u_error_injector (
        .clk                 (clk_gth),
        .rst_n               (rst_n),
        .en                  (cdc2_valid),
        .data_in             (cdc2_data),
        .flag                (tx_fso_valid_out),
        .data_out            (tx_fso_data_out)
    );

endmodule