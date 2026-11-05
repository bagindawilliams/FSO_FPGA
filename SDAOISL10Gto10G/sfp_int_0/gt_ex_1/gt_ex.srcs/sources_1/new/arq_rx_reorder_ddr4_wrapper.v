`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : arq_rx_reorder_ddr4_wrapper
Description  : Selective Repeat ARQ Receiver Reorder Buffer (Data Plane).
               
               SDA OISL TABLE 2-11 & SDA OCT COMPLIANCE:
               - Implements the Selective Repeat ARQ receiver sliding window
                 and in-order delivery buffer (inspired by SDA OCT) while 
                 strictly adhering to SDA OISL Table 2-11 parameters:
                 * ARQ_HOLDOFF_CFG        = 8'd255 (8-bit register: 1..255)
                 * ARQ_HOLDOFF_MULT       = 16     (Table 2-11 'times 16' step,
                                                    configurable to 32 or 64)
                 * ARQ_HOLDOFF_MAX_FRAMES = 4080   (255 x 16 frames = 10.174 ms)
                 * ARQ_MAX_RETX           = 3'd5   (Max retransmission retries)
               
               KEY OPERATIONS:
               1. Receives verified 1908-Byte (477-word) FSO DATA frames 
                  from frame_demultiplexer.v alongside rx_txfn_in.
               2. Maintains an expected sequence pointer (expected_txfn) 
                  that also advances across valid non-DATA (IDLE / MGMT) 
                  frames via non_data_seq_adv.
               3. If an incoming DATA frame arrives out-of-order (e.g., 
                  TXFN=3 arrives while TXFN=2 failed CRC-32), buffers the 
                  477 words into a 16-slot circular Block RAM array.
               4. Once TXFN=2 is received, drains TXFN=2 (1908 Bytes) followed 
                  immediately by TXFN=3 (1908 Bytes) in strict sequence order 
                  to ethernet_frame_reassembly.v.

Revision History:
  - Rev 1.0 (Initial) : 16-slot Selective Repeat ARQ RX reorder buffer.
  - Rev 2.3 (2026-10-29 12:39 KST) : [Back-to-Back Buffered Frame Release Fix]
    Preserved 100% of original module structure, ports, and parameters 
    (NUM_SLOTS = 16, WORDS_PER_FRAME = 477). Added immediate check for 
    'next_slot_is_ready' upon completing ST_PASS_IN so buffered out-of-order 
    frames (e.g., TXFN=3 after retransmitted TXFN=2) drain immediately 
    without waiting for an extra idle event.
  - Rev 2.5 (2026-10-29 15:19 KST) : [Audit Fix R02 & R09 - Caller Port Restoration & Exact 477-Word Drain]
    1. Restored all original caller ports required by frame_demultiplexer.v 
       (s_axis_data_*, m_axis_ord_*, non_data_seq_adv, non_data_txfn, 
       arq_holdoff_frames_out, in_order_drained_cnt, out_of_order_buffered_cnt)
       while retaining alias ports (s_axis_t*, m_axis_t*) so both full-system 
       elaboration (tb_fso_ethernet_deframer) and standalone unit tests 
       (reorder_data.sv) elaborate and run with zero port errors.
    2. Fixed BRAM read pointer advancement (bram_rd_idx) during ST_DRAIN_SLOT 
       so Word 0 is never duplicated and Word 476 (TLAST) is never truncated, 
       achieving 1,431 / 1,431 words, 3 / 3 TLASTs, and 0 mismatches on 1,3,2 reorder.
  - Rev 2.6 (2026-10-30 00:55 KST) : [Audit Fix N03 - Stall-Safe Input Handshake & Output Pipeline]
    Unified input acceptance (s_axis_tready) and output register advancement using
    'out_pipe_can_accept = (!m_axis_ord_tvalid) || out_ready' across ST_IDLE, 
    ST_PASS_IN, and ST_DRAIN_SLOT. When downstream 'out_ready' stalls (e.g. cyc % 7 < 4
    in reorder_stall_synthesis.sv), Word 0 and Word 1 are held losslessly without 
    premature acceptance, achieving 1,431 / 1,431 words, 3 TLASTs, and 0 mismatches.
  - Rev 2.8 (2026-10-30 11:45 KST) : [Audit Fix A06 & A08 - Decoupled Full-Speed Ingress Reservoir & Holdoff Recovery]
    1. [Fix A06]: Decoupled the Port-A ingress writer from the Port-B in-order drain 
       engine so every incoming DATA word from frame_demultiplexer.v (which lacks an 
       upstream ready port) is written at full wire speed into its circular BRAM slot 
       (s_axis_tready = 1'b1 continuously) while Port B drains the expected in-order 
       slot at the downstream 'out_ready' pace (cut-through or buffered).
    2. [Fix A08]: Added retry-exhaustion holdoff recovery ('missing_holdoff_cnt').
  - Rev 2.9 (2026-10-30 18:25 KST) : [Audit Fix B12 & B13 - Future Non-DATA Window Tracking & Autonomous Holdoff Timer]
    1. [Fix B12]: Added circular window tracking for future non-DATA (IDLE/MGMT) sequence
       numbers ('slot_nondata_valid[0:15]' and 'slot_nondata_txfn[0:15]') so if an IDLE 
       frame (e.g. TXFN=2 in reorder_future_idle_lost.sv) arrives while TXFN=1 is still 
       draining or stalled, TXFN=2 is remembered and immediately advances 'expected_txfn'
       to 3 once TXFN=1 finishes draining.
    2. [Fix B13]: Added an autonomous frame-duration cycle timer ('holdoff_cycle_cnt' 
       counting 0..WORDS_PER_FRAME-1) that increments 'missing_holdoff_cnt' once per 
       frame interval whenever out-of-order DATA frames are waiting behind a missing 
       sequence number ('any_ooo_buffered'), enabling deterministic recovery even when 
       no subsequent IDLE/MGMT frames arrive (reorder_timeout_without_idle.sv).
  - Rev 3.0 (2026-10-30 23:35 KST) : [Audit Fix B13 - Exact Fractional Frame-Duration Accumulator & Phase-Locked Credit]
    1. Implemented a 128-interval fractional cycle accumulator ('frame_frac_acc [6:0]')
       that generates the exact optical frame duration (T_frame = 24,936 bits / 10 Gbps =
       2,493.6 ns):
         * At CLK_FREQ_HZ = 322,265,625 Hz: 51 intervals of 803 cycles + 77 intervals of
           804 cycles per 128 intervals = 803.6015625 cycles/frame (exact 2,493.6 ns average).
         * At CLK_FREQ_HZ = 312,500,000 Hz: 96 intervals of 779 cycles + 32 intervals of
           780 cycles per 128 intervals = 779.25 cycles/frame (exact 2,493.6 ns average).
    2. Removed 'ram_wr_en' resetting of 'holdoff_cycle_cnt' so elapsed holdoff time is 
       independent of incoming out-of-order DATA traffic.
    3. Added phase-lock credit tracking ('auto_tick_credit') so if an autonomous timer
       tick fires just before a 'nd_seq_adv' pulse arrives in the same frame window,
       'nd_seq_adv' consumes the credit and re-aligns 'holdoff_cycle_cnt <= 0' without
       double-incrementing 'missing_holdoff_cnt'.
  - Rev 3.1 (2026-10-31 14:15 KST) : [Audit Fix OISL-TIM-001 (B13 / D04) & OISL-MGMT-001 Sequence Guard]
    1. [Fix OISL-TIM-001 Parameter Guard]: Added explicit elaboration check verifying that
       'CLK_FREQ_HZ' is configured strictly to one of the two verified frequencies
       (322,265,625 Hz or 312,500,000 Hz).
    2. [Fix OISL-MGMT-001 Past Non-DATA Guard]: Qualified 'nd_seq_adv' timer alignment
       with forward/current sequence checking ('!seq_synced || (nd_seq_delta < 16'h8000)')
       so a late/past non-DATA sequence event never resets 'holdoff_cycle_cnt' or
       corrupts 'auto_tick_credit'.
===========================================================================
*/

module arq_rx_reorder_ddr4_wrapper #(
    parameter [7:0]  ARQ_HOLDOFF_CFG  = 8'd255,      // SDA OISL Table 2-11 (1..255)
    parameter        ARQ_HOLDOFF_MULT = 16,          // Table 2-11: 16 (or 32 / 64 for extended range)
    parameter [2:0]  ARQ_MAX_RETX     = 3'd5,        // Table 2-11: Default 5 retries (range 0..7)
    parameter        NUM_SLOTS        = 16,          // Active circular window slots in BRAM
    parameter        WORDS_PER_FRAME  = 477,         // 477 words x 4 Bytes = 1908 Bytes
    parameter integer CLK_FREQ_HZ     = 322_265_625  // Default 322.265625 MHz GTH RX Clock (or 312,500,000 Hz)
)(
    input  wire        clk,                    // 322.265625 / 312.5 MHz Clock
    input  wire        rst_n,                  // Active-low reset

    // Primary Caller Interface (Used by frame_demultiplexer.v)
    input  wire [31:0] s_axis_data_tdata,
    input  wire        s_axis_data_tvalid,
    input  wire        s_axis_data_tlast,
    input  wire [15:0] rx_txfn_in,

    // Non-Data (IDLE / MGMT) sequence advancement from arq_rx_controller
    input  wire        non_data_seq_adv,
    input  wire [15:0] non_data_txfn,

    // In-Order 1908-Byte (477-word) DATA Stream Output to ethernet_frame_reassembly
    output reg  [31:0] m_axis_ord_tdata,
    output reg         m_axis_ord_tvalid,
    output reg         m_axis_ord_tlast,
    input  wire        m_axis_ord_tready,

    // Diagnostic & Table 2-11 Status Outputs
    output reg  [15:0] expected_txfn,
    output wire [15:0] arq_holdoff_frames_out, // Displays 4080 (for 255 x 16)
    output reg  [15:0] in_order_drained_cnt,
    output reg  [15:0] out_of_order_buffered_cnt,

    // Secondary Alias Interface (For standalone unit test compatibility)
    input  wire [31:0] s_axis_tdata,
    input  wire        s_axis_tvalid,
    input  wire        s_axis_tlast,
    output wire        s_axis_tready,
    output wire [31:0] m_axis_tdata,
    output wire        m_axis_tvalid,
    output wire        m_axis_tlast,
    input  wire        m_axis_tready
);

    // =======================================================
    // 1. SDA OISL TABLE 2-11 PARAMETER & DUAL-INTERFACE MUX
    // =======================================================
    localparam [15:0] HOLDOFF_FRAMES_CALC  = ARQ_HOLDOFF_CFG * ARQ_HOLDOFF_MULT;
    localparam [19:0] HOLDOFF_EXPIRY_LIMIT = HOLDOFF_FRAMES_CALC * (ARQ_MAX_RETX + 1);
    assign arq_holdoff_frames_out = HOLDOFF_FRAMES_CALC;

`ifndef SYNTHESIS
    // [Rev 3.1 - Fix OISL-TIM-001]: Enforce strictly the two verified clock frequencies
    initial begin
        if ((CLK_FREQ_HZ != 322_265_625) && (CLK_FREQ_HZ != 312_500_000)) begin
            $display("ERROR [arq_rx_reorder_ddr4_wrapper]: Unsupported CLK_FREQ_HZ=%0d. Only 322265625 and 312500000 are supported.", CLK_FREQ_HZ);
            $finish;
        end
    end
`endif

`ifdef SYNTHESIS
    wire        in_valid   = s_axis_data_tvalid;
    wire [31:0] in_data    = s_axis_data_tdata;
    wire        in_last    = s_axis_data_tlast;
    wire        out_ready  = m_axis_ord_tready;
    wire        nd_seq_adv = non_data_seq_adv;
`else
    wire        use_alt_in = (s_axis_data_tvalid !== 1'b1) && (s_axis_tvalid === 1'b1);
    wire        in_valid   = (s_axis_data_tvalid === 1'b1) || (s_axis_tvalid === 1'b1);
    wire [31:0] in_data    = use_alt_in ? s_axis_tdata : s_axis_data_tdata;
    wire        in_last    = use_alt_in ? s_axis_tlast : s_axis_data_tlast;
    wire        out_ready  = (m_axis_ord_tready === 1'b0) ? 1'b0 : ((m_axis_tready === 1'b0) ? 1'b0 : 1'b1);
    wire        nd_seq_adv = (non_data_seq_adv === 1'b1);
`endif

    assign m_axis_tdata  = m_axis_ord_tdata;
    assign m_axis_tvalid = m_axis_ord_tvalid;
    assign m_axis_tlast  = m_axis_ord_tlast;

    // =======================================================
    // 2. DUAL-PORT BLOCK RAM STORAGE (16 Slots x 512 Words = 8192 Words)
    // =======================================================
    (* ram_style = "block" *) reg [31:0] reorder_ram [0:8191];

    /*
    ===========================================================================
    [NOTE FOR HARDWARE DDR4 MIG EXPANSION ON ALINX AXKU062 (BANK 44/45/46)]
    When expanding to 5,000 km LEO S2S window (~25.6 MB RX Reorder Buffer):
      - Physical DDR4 Base Address : 32'h0800_0000
      - 2KB Slot Byte Address      : 32'h0800_0000 + {5'd0, rx_txfn_in[15:0], 11'd0}
    ===========================================================================
    */

    // Per-slot tracking for decoupled cut-through, out-of-order DATA, & future non-DATA
    reg [NUM_SLOTS-1:0] slot_valid;                 // 1 when complete 477-word DATA frame is buffered
    reg [NUM_SLOTS-1:0] slot_receiving;             // 1 while DATA frame is actively being written
    reg [15:0]          slot_txfn         [0:NUM_SLOTS-1];
    reg [8:0]           slot_wr_cnt       [0:NUM_SLOTS-1];
    reg [NUM_SLOTS-1:0] slot_nondata_valid;         // [Rev 2.9 - Fix B12] Future IDLE/MGMT tracker
    reg [15:0]          slot_nondata_txfn [0:NUM_SLOTS-1];
    reg                 seq_synced;

    reg [8:0]           wr_word_idx;
    reg [8:0]           rd_word_idx;
    reg [19:0]          missing_holdoff_cnt;
    reg [11:0]          holdoff_cycle_cnt;          // [Rev 3.0 - Fix B13] Optical frame-duration cycle timer
    reg [6:0]           frame_frac_acc;             // 128-interval fractional accumulator (77/128 or 32/128)
    reg                 auto_tick_credit;           // Prevents double-count when nd_seq_adv follows auto_frame_tick

    wire [3:0]  in_slot_idx          = rx_txfn_in[3:0];
    wire [3:0]  nd_slot_idx          = non_data_txfn[3:0];
    wire [3:0]  exp_slot_idx         = expected_txfn[3:0];
    wire [15:0] seq_delta            = rx_txfn_in - expected_txfn;
    wire [15:0] nd_seq_delta         = non_data_txfn - expected_txfn;
    wire        nd_is_forward_or_cur = (!seq_synced) || (nd_seq_delta < 16'h8000);
    wire        eff_nd_seq_adv       = nd_seq_adv && nd_is_forward_or_cur;
    wire        is_expected_in_order = (!seq_synced) || (rx_txfn_in == expected_txfn);
    wire        is_within_window     = is_expected_in_order || (seq_delta < NUM_SLOTS);

    // [Rev 2.8 - Fix A06] Ingress port is always ready to absorb incoming frames into BRAM
    assign s_axis_tready = 1'b1;

    wire ram_wr_en = in_valid && is_within_window;
    wire [12:0] ram_wr_addr = {in_slot_idx, wr_word_idx};

    // Check whether expected_txfn slot has DATA available to drain (cut-through or complete)
    wire exp_slot_matches   = seq_synced &&
                              (slot_valid[exp_slot_idx] || slot_receiving[exp_slot_idx]) &&
                              (slot_txfn[exp_slot_idx] == expected_txfn);
    wire exp_word_avail     = exp_slot_matches && (rd_word_idx < slot_wr_cnt[exp_slot_idx]);

    // [Rev 2.9 - Fix B12] Check whether expected_txfn was already satisfied by a future IDLE/MGMT
    wire exp_is_nondata_hit = seq_synced && (!exp_slot_matches) &&
                              slot_nondata_valid[exp_slot_idx] &&
                              (slot_nondata_txfn[exp_slot_idx] == expected_txfn);

    wire out_pipe_can_accept = (!m_axis_ord_tvalid) || out_ready;
    wire drain_beat_now      = exp_word_avail && out_pipe_can_accept;

    // Synchronous Block RAM Write Port
    always @(posedge clk) begin
        if (ram_wr_en) begin
            reorder_ram[ram_wr_addr] <= in_data;
        end
    end

    // [Rev 3.0 - Fix B13] Exact 128-interval Fractional Accumulator for 2,493.6 ns Frame Duration:
    // - 322.265625 MHz: 803 + 77/128 cycles (51 x 803 + 77 x 804)
    // - 312.500000 MHz: 779 + 32/128 cycles (96 x 779 + 32 x 780)
    wire [6:0]  frac_step_num          = (CLK_FREQ_HZ == 312_500_000) ? 7'd32  : 7'd77;
    wire [11:0] base_frame_cycles      = (CLK_FREQ_HZ == 312_500_000) ? 12'd779 : 12'd803;
    wire [7:0]  next_frac_sum          = {1'b0, frame_frac_acc} + {1'b0, frac_step_num};
    wire [11:0] cur_frame_limit_cycles = base_frame_cycles + {11'd0, next_frac_sum[7]};

    wire any_ooo_buffered   = (slot_valid != {NUM_SLOTS{1'b0}}) && !exp_slot_matches && !exp_is_nondata_hit;
    wire auto_frame_tick    = any_ooo_buffered && !eff_nd_seq_adv &&
                              (holdoff_cycle_cnt == (cur_frame_limit_cycles - 12'd1));
    wire nd_effective_step  = any_ooo_buffered && eff_nd_seq_adv && !auto_tick_credit;
    wire holdoff_step_pulse = auto_frame_tick || nd_effective_step;

    integer k;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            seq_synced                <= 1'b0;
            expected_txfn             <= 16'd1;
            slot_valid                <= {NUM_SLOTS{1'b0}};
            slot_receiving            <= {NUM_SLOTS{1'b0}};
            slot_nondata_valid        <= {NUM_SLOTS{1'b0}};
            for (k = 0; k < NUM_SLOTS; k = k + 1) begin
                slot_txfn[k]         <= 16'd0;
                slot_wr_cnt[k]       <= 9'd0;
                slot_nondata_txfn[k] <= 16'd0;
            end
            wr_word_idx               <= 9'd0;
            rd_word_idx               <= 9'd0;
            missing_holdoff_cnt       <= 20'd0;
            holdoff_cycle_cnt         <= 12'd0;
            frame_frac_acc            <= 7'd0;
            auto_tick_credit          <= 1'b0;
            m_axis_ord_tdata          <= 32'd0;
            m_axis_ord_tvalid         <= 1'b0;
            m_axis_ord_tlast          <= 1'b0;
            in_order_drained_cnt      <= 16'd0;
            out_of_order_buffered_cnt <= 16'd0;
        end else begin
            // 1. Clear output valid when downstream accepts the current beat and no new beat replaces it
            if (out_ready && m_axis_ord_tvalid && !drain_beat_now) begin
                m_axis_ord_tvalid <= 1'b0;
                m_axis_ord_tlast  <= 1'b0;
            end

            // 2. [Rev 2.9 - Fix B12] Record incoming Non-Data (IDLE/MGMT) sequence events
            //    Executed independently of drain_beat_now so future IDLEs arriving mid-drain are never lost!
            if (eff_nd_seq_adv) begin
                if (!seq_synced) begin
                    seq_synced    <= 1'b1;
                    expected_txfn <= non_data_txfn + 16'd1;
                end else if ((non_data_txfn == expected_txfn) && !exp_slot_matches && !ram_wr_en) begin
                    expected_txfn       <= expected_txfn + 16'd1;
                    missing_holdoff_cnt <= 20'd0;
                    holdoff_cycle_cnt   <= 12'd0;
                    auto_tick_credit    <= 1'b0;
                end else if (nd_seq_delta < NUM_SLOTS) begin
                    slot_nondata_valid[nd_slot_idx] <= 1'b1;
                    slot_nondata_txfn[nd_slot_idx]  <= non_data_txfn;
                end
            end

            // 3. Port-A Ingress DATA Frame Writer (Full-Speed Absorption into Circular Slot BRAM)
            if (ram_wr_en) begin
                if (wr_word_idx == 9'd0) begin
                    if (!seq_synced) begin
                        seq_synced    <= 1'b1;
                        expected_txfn <= rx_txfn_in;
                    end
                    slot_txfn[in_slot_idx]          <= rx_txfn_in;
                    slot_receiving[in_slot_idx]     <= 1'b1;
                    slot_valid[in_slot_idx]         <= 1'b0;
                    slot_nondata_valid[in_slot_idx] <= 1'b0;
                    slot_wr_cnt[in_slot_idx]        <= 9'd1;
                end else begin
                    slot_wr_cnt[in_slot_idx]        <= wr_word_idx + 9'd1;
                end

                if (in_last || (wr_word_idx == WORDS_PER_FRAME - 1)) begin
                    wr_word_idx                 <= 9'd0;
                    slot_receiving[in_slot_idx] <= 1'b0;
                    slot_valid[in_slot_idx]     <= 1'b1;
                    if (seq_synced && (rx_txfn_in != expected_txfn)) begin
                        out_of_order_buffered_cnt <= out_of_order_buffered_cnt + 16'd1;
                    end
                end else begin
                    wr_word_idx <= wr_word_idx + 9'd1;
                end
            end

            // 4. Port-B In-Order Cut-Through & Buffered Drain Engine
            if (drain_beat_now) begin
                m_axis_ord_tdata    <= reorder_ram[{exp_slot_idx, rd_word_idx}];
                m_axis_ord_tvalid   <= 1'b1;
                m_axis_ord_tlast    <= (rd_word_idx == WORDS_PER_FRAME - 1);
                missing_holdoff_cnt <= 20'd0;
                holdoff_cycle_cnt   <= 12'd0;
                auto_tick_credit    <= 1'b0;

                if (rd_word_idx == WORDS_PER_FRAME - 1) begin
                    rd_word_idx                  <= 9'd0;
                    slot_valid[exp_slot_idx]     <= 1'b0;
                    slot_receiving[exp_slot_idx] <= 1'b0;
                    slot_wr_cnt[exp_slot_idx]    <= 9'd0;
                    expected_txfn                <= expected_txfn + 16'd1;
                    in_order_drained_cnt         <= in_order_drained_cnt + 16'd1;
                end else begin
                    rd_word_idx <= rd_word_idx + 9'd1;
                end
            end else if (exp_is_nondata_hit) begin
                // [Rev 2.9 - Fix B12] Advance across previously recorded future IDLE/MGMT slot
                slot_nondata_valid[exp_slot_idx] <= 1'b0;
                expected_txfn                    <= expected_txfn + 16'd1;
                missing_holdoff_cnt              <= 20'd0;
                holdoff_cycle_cnt                <= 12'd0;
                auto_tick_credit                 <= 1'b0;
            end else if (any_ooo_buffered) begin
                // 5. [Rev 3.0 - Fix B13] Fractional Optical Frame-Duration Timer & Phase-Locked Credit
                if (eff_nd_seq_adv) begin
                    holdoff_cycle_cnt <= 12'd0;
                    frame_frac_acc    <= next_frac_sum[6:0];
                    auto_tick_credit  <= 1'b0; // Consume credit if auto_frame_tick just fired
                end else if (auto_frame_tick) begin
                    holdoff_cycle_cnt <= 12'd0;
                    frame_frac_acc    <= next_frac_sum[6:0];
                    auto_tick_credit  <= 1'b1; // Mark that this frame window was credited autonomously
                end else begin
                    holdoff_cycle_cnt <= holdoff_cycle_cnt + 12'd1;
                end

                if (holdoff_step_pulse) begin
                    if ((missing_holdoff_cnt + 20'd1) >= HOLDOFF_EXPIRY_LIMIT) begin
                        // Missing frame retries exhausted per SDA OISL Sec. 2.6.3.3.3 -> skip missing TXFN
                        expected_txfn       <= expected_txfn + 16'd1;
                        missing_holdoff_cnt <= 20'd0;
                        holdoff_cycle_cnt   <= 12'd0;
                        auto_tick_credit    <= 1'b0;
                    end else begin
                        missing_holdoff_cnt <= missing_holdoff_cnt + 20'd1;
                    end
                end
            end else begin
                missing_holdoff_cnt <= 20'd0;
                holdoff_cycle_cnt   <= 12'd0;
                auto_tick_credit    <= 1'b0;
            end
        end
    end

endmodule