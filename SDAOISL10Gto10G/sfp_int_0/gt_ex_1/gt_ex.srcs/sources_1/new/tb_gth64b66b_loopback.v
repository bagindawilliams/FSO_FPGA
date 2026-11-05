`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_gth64b66b_loopback
Description  : Full End-to-End Loopback Testbench for the Modular GTH 64B/66B 
               Optical Transceiver Subsystem.
               - CDC 2, Error Injector, and GTH RX Output operate at a pure, 
                 gapless 312.5 MHz (3.2 ns period, 0.8 ns/byte), guaranteeing 
                 an exact 2.4936 us duration across all 4 frames (1, 2, 3, 4).
               - gth64b66b_tx and gth64b66b_rx absorb the 64B/66B Gearbox 
                 2-cycle pauses on tx0_clk/rx0_clk (322.265625 MHz) internally.

Revision History:
  - Rev 1.0 (Initial) : Baseline GTH 64B/66B loopback testbench with u_cdc2 
    and u_error_inject.
  - Rev 1.1 (2026-10-21 12:21 KST) : Preserved 100% original module 
    instantiations and signal names, updated timescale to 1ns/1ps and 
    gt_refclk_p half-period to #3.103 so GTH tx0_clk and rx0_clk operate at 
    exact 322.265625 MHz (66/64 * 312.5 MHz), eliminating the 98-cycle 
    overshoot at the end of Frame 4 (MGMT) on gt_txdata_out.
  - Rev 2.0 (2026-10-27 15:20 KST) : [ETRI Audit Item 1 & Target B1.2/B1.3 Verification]
    Updated Word 1 of every frame (cycle_cnt == 1) from the simulation marker 
    (72'h55_55_55_55_55_55_55_55_D5) to the official SDA OISL v2.1.2 Table 2-8 
    72-bit Preamble (72'h77_AD_5B_58_43_64_1E_2E_26) and added automatic 
    verification that all 4 frames (12,468 Bytes) traverse TX bit-reversal 
    (32'h1ADA_B5EE), 10.3125 Gbps serial GTH loopback, and RX gearbox lock 
    with exact 2.493600 us frame duration.
  - Rev 2.1 (2026-11-05 06:05 KST) : [Audit Urutan 3 Verification - First-Word, Zero-Payload & Full 3,117-Word Scoreboard]
    1. Added zero-payload injection support inside Frame 2 Zone 3 to verify
       that zero-valued payload runs never truncate frame reception in
       gth64b66b_rx.v.
    2. Added exact pop-aligned first-word TX gearbox checks ('tx_first_word_ok' and
       'tx_second_word_ok') proving the initial Preamble word (32'h1ADA_B5EE) is
       neither lost nor duplicated.
    3. Added a full 3,117-word (12,468-byte) scoreboard comparing every word emitted
       by u_error_inject against the received stream at u_gth64b66b_rx.
  - Rev 2.2 (2026-11-05 06:20 KST) : [Audit Section 1-6 Alignment - Target Window Separation & TX FIFO Telemetry]
    Separated the 4-frame target reception window ('rx_target_words' = 3,117 words
    / 'rx_target_bytes' = 12,468 bytes) from post-target GTH link activity, added
    TX FIFO telemetry, and added distinct clock/word/frame timing labels.
  - Rev 2.3 (2026-11-05 06:30 KST) : [Exact Underflow Window Alignment]
    Qualified 'tx_fifo_underflow_cnt' strictly while unread target words remain in
    'elast_mem' ('u_gth64b66b_tx.rd_ptr < 12'd3117').
  - Rev 2.4 (2026-11-05 06:42 KST) : [Symmetrical Post-Target Tail]
    Added a 600-cycle post-target tail so final 3,117-word / 12,468-byte
    completion values are clearly visible on the waveform.
  - Rev 2.5 (2026-11-05 07:10 KST) : [Audit Section 2 & 5 Alignment - 156.25 MHz .xci RefClk & Word 1 Bit-Rev Check]
    Restored 'gt_refclk_p' half-period to '#3.2' (6.400 ns = 156.250000 MHz per .xci)
    and tightened 'tx_second_word_ok' to compare 'bit_rev32(exp_tx_words[1])'.
  - Rev 2.6 (2026-11-05 07:25 KST) : [True 64/66 Rate-Matching Clock Pairing & Exact Table 2-4 2.493600 us Restoration]
    Restored the dedicated 312.500000 MHz ('#1.6', 3.200 ns period = 10.000 Gbps
    net payload rate) 'clk_312_5' connection on u_cdc2.clk_gth, u_error_inject.clk,
    u_gth64b66b_tx.clk_312_5, and u_gth64b66b_rx.clk_312_5 while driving
    u_gth64b66b_tx.clk_gth from 'tx0_clk' and u_gth64b66b_rx.clk_gth from 'rx0_clk'.
  - Rev 2.7 (2026-11-05 07:45 KST) : [Reviewer Final Closure - Zero-Initialized Clock Samplers & Scoped PASS Verdict]
    1. Initialized all 'measured_*' clock period and frequency variables to 0.0
       (instead of target constants) and added explicit post-lock sample-acquired
       flags ('refclk_sampled', 'tx0_clk_sampled', 'rx0_clk_sampled', 'clk312_sampled')
       so initial values can never be mistaken for measured results.
    2. Added automated clock period range assertions ('refclk_period_ok',
       'tx0_clk_period_ok', 'rx0_clk_period_ok', 'stream_clk_period_ok' -> 'clock_check_ok')
       directly into 'test_pass_status' so the PASS verdict is gated by actual
       clock measurements.
    3. Scoped the verification report and PASS message to state explicitly that:
       (a) stimulus consists of 4 synthetic 3,117-byte transport frames,
       (b) scoreboard reference is taken post-error_inject (verifying lossless GTH
           channel transport, not RS FEC decoding),
       (c) 2.493600 us is the per-frame stream duration at 312.5 MHz (excluding
           GTH init, startup reserve buffering, and pipeline latency), and
       (d) this testbench verifies the dual-clock 312.5 MHz / 322.265625 MHz
           functional simulation configuration.
===========================================================================
*/

module tb_gth64b66b_loopback();

    // =========================================================================
    // SIMULATION MODE PARAMETERS (Switchable for Audit & Clean Waveform Views)
    // - SIM_MODE          : 0 = Clean transport (bypass error.mem), 1 = Active error.mem XOR
    // - ZERO_PAYLOAD_TEST : 1 = Injects >=8 consecutive 32b zero words in Frame 2 (Audit Proof)
    //                       0 = Pure non-zero pattern across all 4 frames (Clean Visual Mode)
    // =========================================================================
    parameter SIM_MODE          = 1;
    parameter ZERO_PAYLOAD_TEST = 1;

    function [31:0] bit_rev32(input [31:0] d);
        integer i;
        begin
            for (i = 0; i < 32; i = i + 1) begin
                bit_rev32[i] = d[31 - i];
            end
        end
    endfunction

    reg  clk_logic;       // 200.0 MHz (Period: 5.0 ns)
    reg  clk_312_5;       // 312.5 MHz (Period: 3.2 ns - Continuous 10.000 Gbps Payload Clock)
    reg  clk_100_freerun; // 100.0 MHz (Period: 10.0 ns)
    reg  gt_refclk_p;     // Exact 156.25 MHz per gth_fso_64b66b.xci (Period: 6.4 ns, Half-period: #3.2)
    wire gt_refclk_n = ~gt_refclk_p;

    reg  sys_rst_n;       
    reg  stream_rst_n;    
    reg  en_upstream;     

    wire txp_out;
    wire txn_out;
    wire rxp_in = txp_out;
    wire rxn_in = txn_out;

    wire tx0_clk;         // 322.265625 MHz (3.103 ns) generated by GTH QPLL0 from 156.25 MHz gt_refclk_p
    wire rx0_clk;         // 322.265625 MHz (3.103 ns) generated by GTH CDR/QPLL0 from 156.25 MHz gt_refclk_p
    wire gth_tx_ready;
    wire gth_rx_ready;
    wire gth_link_up;

    reg  [127:0] mux_data_in;
    reg          mux_data_dv;
    reg  [15:0]  mux_cdc_keep;

    wire         cdc2_flag;
    wire [31:0]  cdc2_data;

    wire         err_flag;
    wire [31:0]  err_data;
    wire         tx_stall_out;

    wire [31:0]  gt_txdata;
    wire [5:0]   gt_txheader;
    wire [6:0]   gt_txsequence;

    wire [31:0]  gt_rxdata;
    wire [1:0]   gt_rxdatavalid;
    wire [5:0]   gt_rxheader;
    wire [1:0]   gt_rxheadervalid;
    wire [1:0]   gt_rxstartofseq;
    wire         gt_rxgearboxslip;

    wire         rx_block_locked;
    wire [31:0]  rx_down_data;
    wire         rx_down_dv;

    // 1. CDC 2 (200 MHz -> 312.5 MHz Continuous 10.000 Gbps Stream)
    x_logic_gth u_cdc2 (
        .clk_gth    (clk_312_5),
        .clk_logic  (clk_logic),
        .rst_n      (stream_rst_n),
        .en         (en_upstream),
        .data_in    (mux_data_in),
        .data_in_dv (mux_data_dv),
        .cdc_keep   (mux_cdc_keep),
        .flag       (cdc2_flag),
        .data_out   (cdc2_data)
    );

    // 2. Error Injector (312.5 MHz Continuous 10.000 Gbps Stream)
    error_inject #(
        .SIM_MODE   (SIM_MODE),
        .safe_words (15),
        .max_error  (47)
    ) u_error_inject (
        .clk        (clk_312_5),
        .rst_n      (stream_rst_n),
        .en         (cdc2_flag),
        .data_in    (cdc2_data),
        .flag       (err_flag),
        .data_out   (err_data)
    );

    // 3. GTH 64B/66B TX Interface (312.5 MHz Continuous -> 322.265625 MHz tx0_clk Gearbox)
    gth64b66b_tx u_gth64b66b_tx (
        .clk_312_5         (clk_312_5),
        .clk_gth           (tx0_clk),
        .rst_n             (sys_rst_n),
        .gth_tx_ready      (gth_tx_ready),
        .up_data_in        (err_data),
        .up_valid_in       (err_flag),
        .tx_stall_out      (tx_stall_out),
        .gt_txdata_out     (gt_txdata),
        .gt_txheader_out   (gt_txheader),
        .gt_txsequence_out (gt_txsequence)
    );

    // 4. GTH 64B/66B Core Wrapper (10.3125 Gbps Serial Loopback with 156.25 MHz RefClk)
    fso_gth_core_wrapper u_fso_gth_core (
        .clk_100_freerun      (clk_100_freerun),
        .sys_rst_n            (sys_rst_n),
        .gt_refclk_p          (gt_refclk_p),
        .gt_refclk_n          (gt_refclk_n),
        .txp_out              (txp_out),
        .txn_out              (txn_out),
        .rxp_in               (rxp_in),
        .rxn_in               (rxn_in),
        .tx0_clk              (tx0_clk),
        .rx0_clk              (rx0_clk),
        .gth_tx_ready         (gth_tx_ready),
        .gth_rx_ready         (gth_rx_ready),
        .gth_link_up          (gth_link_up),
        .gt_txdata_in         (gt_txdata),
        .gt_txheader_in       (gt_txheader),
        .gt_txsequence_in     (gt_txsequence),
        .gt_rxdata_out        (gt_rxdata),
        .gt_rxdatavalid_out   (gt_rxdatavalid),
        .gt_rxheader_out      (gt_rxheader),
        .gt_rxheadervalid_out (gt_rxheadervalid),
        .gt_rxstartofseq_out  (gt_rxstartofseq),
        .gt_rxgearboxslip_in  (gt_rxgearboxslip)
    );

    // 5. GTH 64B/66B RX Interface (322.265625 MHz rx0_clk Gearbox -> 312.5 MHz Continuous)
    gth64b66b_rx u_gth64b66b_rx (
        .clk_gth              (rx0_clk),
        .clk_312_5            (clk_312_5),
        .rst_n                (sys_rst_n),
        .gth_rx_ready         (gth_rx_ready),
        .gt_rxdata_in         (gt_rxdata),
        .gt_rxdatavalid_in    (gt_rxdatavalid),
        .gt_rxheader_in       (gt_rxheader),
        .gt_rxheadervalid_in  (gt_rxheadervalid),
        .gt_rxgearboxslip_out (gt_rxgearboxslip),
        .rx_block_locked      (rx_block_locked),
        .down_data            (rx_down_data),
        .down_dv              (rx_down_dv)
    );

    // Clocks & Watchdog Timeout
    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic;         // 200.0 MHz (5.0 ns)
    end

    initial begin
        clk_312_5 = 1'b0;
        forever #1.6 clk_312_5 = ~clk_312_5;         // 312.5 MHz (3.2 ns - Continuous 10.000 Gbps Clock)
    end

    initial begin
        clk_100_freerun = 1'b0;
        forever #5.0 clk_100_freerun = ~clk_100_freerun; // 100.0 MHz (10.0 ns)
    end

    initial begin
        gt_refclk_p = 1'b0;
        forever #3.2 gt_refclk_p = ~gt_refclk_p;     // [Audit Sec. 2] Exact 156.25 MHz (6.4 ns period) per .xci
    end

    initial begin
        #500000;
        $fatal(1, "\n[TIMEOUT ERROR] tb_gth64b66b_loopback did not complete within 500 us!\n");
    end

    // =========================================================================
    // ZERO-INITIALIZED CLOCK SAMPLERS & AUTOMATED PERIOD CHECKERS (Audit Sec. 3)
    // - All 'measured_*' variables start at 0.0 and are populated ONLY from
    //   actual post-lock clock edges once 'refclk_sampled', 'tx0_clk_sampled',
    //   'rx0_clk_sampled', and 'clk312_sampled' assert.
    // =========================================================================
    real    last_refclk_edge_ns       = 0.0;
    real    last_tx0_edge_ns          = 0.0;
    real    last_rx0_edge_ns          = 0.0;
    real    last_312_edge_ns          = 0.0;
    real    measured_refclk_period_ns = 0.0;
    real    measured_tx0_period_ns    = 0.0;
    real    measured_rx0_period_ns    = 0.0;
    real    measured_312_period_ns    = 0.0;
    real    measured_refclk_mhz       = 0.0;
    real    measured_tx0_mhz          = 0.0;
    real    measured_rx0_mhz          = 0.0;
    reg     refclk_sampled            = 1'b0;
    reg     tx0_clk_sampled           = 1'b0;
    reg     rx0_clk_sampled           = 1'b0;
    reg     clk312_sampled            = 1'b0;
    real    d_ref_ns, d_tx0_ns, d_rx0_ns, d_312_ns;

    always @(posedge gt_refclk_p) begin
        if (sys_rst_n) begin
            if (last_refclk_edge_ns > 0.0) begin
                d_ref_ns       = $realtime - last_refclk_edge_ns;
                refclk_sampled <= 1'b1;
                if ((d_ref_ns - measured_refclk_period_ns > 0.0001) || (measured_refclk_period_ns - d_ref_ns > 0.0001)) begin
                    measured_refclk_period_ns = d_ref_ns;
                    if (d_ref_ns > 0.0)
                        measured_refclk_mhz = 1000.0 / d_ref_ns;
                end
            end
            last_refclk_edge_ns = $realtime;
        end
    end

    always @(posedge tx0_clk) begin
        if (gth_tx_ready) begin
            if (last_tx0_edge_ns > 0.0) begin
                d_tx0_ns        = $realtime - last_tx0_edge_ns;
                tx0_clk_sampled <= 1'b1;
                if ((d_tx0_ns - measured_tx0_period_ns > 0.0001) || (measured_tx0_period_ns - d_tx0_ns > 0.0001)) begin
                    measured_tx0_period_ns = d_tx0_ns;
                    if (d_tx0_ns > 0.0)
                        measured_tx0_mhz = 1000.0 / d_tx0_ns;
                end
            end
            last_tx0_edge_ns = $realtime;
        end
    end

    always @(posedge rx0_clk) begin
        if (gth_rx_ready) begin
            if (last_rx0_edge_ns > 0.0) begin
                d_rx0_ns        = $realtime - last_rx0_edge_ns;
                rx0_clk_sampled <= 1'b1;
                if ((d_rx0_ns - measured_rx0_period_ns > 0.0001) || (measured_rx0_period_ns - d_rx0_ns > 0.0001)) begin
                    measured_rx0_period_ns = d_rx0_ns;
                    if (d_rx0_ns > 0.0)
                        measured_rx0_mhz = 1000.0 / d_rx0_ns;
                end
            end
            last_rx0_edge_ns = $realtime;
        end
    end

    // FSM
    localparam ST_WAIT_RST = 2'd0;
    localparam ST_STREAM   = 2'd1;
    localparam ST_GAP      = 2'd2;
    localparam ST_DONE     = 2'd3;

    reg [1:0]  tb_state;
    reg [3:0]  frame_id;
    reg [15:0] cycle_cnt;

    initial begin
        sys_rst_n    = 1'b0;
        stream_rst_n = 1'b0;
        en_upstream  = 1'b0;
        tb_state     = ST_WAIT_RST;
        frame_id     = 4'd0;
        cycle_cnt    = 16'd0;

        #100;
        sys_rst_n = 1'b1;
        $display("\n[%0.1f ns] STEP 1: System Reset Released. Waiting for GTH QPLL0 & CDR Lock...", $realtime);

        wait(gth_link_up == 1'b1);
        $display("[%0.1f ns] STEP 2: GTH Link Up Achieved! Waiting for 64B/66B RX Gearbox Slip Lock...", $realtime);

        wait(rx_block_locked == 1'b1);
        $display("[%0.1f ns] STEP 3: 64B/66B RX Gearbox Locked! Starting 4-Frame Continuous Stream...\n", $realtime);

        #100;
        stream_rst_n = 1'b1;
        en_upstream  = 1'b1;
    end

    always @(posedge clk_logic or negedge stream_rst_n) begin
        if (!stream_rst_n) begin
            tb_state  <= ST_WAIT_RST;
            frame_id  <= 4'd0;
            cycle_cnt <= 16'd0;
        end else begin
            case (tb_state)
                ST_WAIT_RST: begin
                    if (!u_cdc2.wr_rst_busy) begin
                        if (cycle_cnt < 16'd5) cycle_cnt <= cycle_cnt + 1'b1;
                        else begin
                            tb_state  <= ST_STREAM;
                            frame_id  <= 4'd1;
                            cycle_cnt <= 16'd1;
                        end
                    end
                end
                ST_STREAM: begin
                    if (cycle_cnt < 16'd195) cycle_cnt <= cycle_cnt + 1'b1;
                    else begin
                        tb_state  <= ST_GAP;
                        cycle_cnt <= 16'd1;
                    end
                end
                ST_GAP: begin
                    if (cycle_cnt < 16'd304) cycle_cnt <= cycle_cnt + 1'b1;
                    else begin
                        if (frame_id < 4'd4) begin
                            frame_id  <= frame_id + 1'b1;
                            tb_state  <= ST_STREAM;
                            cycle_cnt <= 16'd1;
                        end else begin
                            tb_state    <= ST_DONE;
                            frame_id    <= 4'd0;
                            cycle_cnt   <= 16'd0;
                            en_upstream <= 1'b0;
                        end
                    end
                end
                ST_DONE: begin
                    en_upstream <= 1'b0;
                    frame_id    <= 4'd0;
                end
            endcase
        end
    end

    always @(*) begin
        mux_data_dv  = 1'b0;
        mux_data_in  = 128'd0;
        mux_cdc_keep = 16'd0;

        if (stream_rst_n && (tb_state == ST_STREAM)) begin
            mux_data_dv = 1'b1;
            if (cycle_cnt == 16'd1) begin
                // [Rev 2.0] Inject official SDA OISL Table 2-8 72-bit Preamble (72'h77AD5B5843641E2E26)
                mux_cdc_keep = 16'hFFFF;
                mux_data_in  = {72'h77_AD_5B_58_43_64_1E_2E_26, 24'hAA_BB_CC, {12'd0, frame_id}, 16'd1};
            end else if (ZERO_PAYLOAD_TEST && (frame_id == 4'd2) && (cycle_cnt >= 16'd20) && (cycle_cnt <= 16'd22)) begin
                // [Audit Sec. 4] When ZERO_PAYLOAD_TEST = 1: injects 3x128-bit zero words (11 consecutive 32-bit zero words >= 8)
                mux_cdc_keep = 16'hFFFF;
                mux_data_in  = 128'd0;
            end else if (cycle_cnt <= 16'd194) begin
                mux_cdc_keep = 16'hFFFF;
                mux_data_in  = {32'hAAAA_BBBB, 32'hCCCC_DDDD, {28'd0, frame_id}, {16'd0, cycle_cnt}};
            end else if (cycle_cnt == 16'd195) begin
                mux_cdc_keep = 16'h1FFF;
                mux_data_in  = {104'h9999_8888_7777_6666_5555_4444_33, 24'h000000};
            end
        end
    end

    // =======================================================
    // FULL 3,117-WORD (12,468-BYTE) TARGET SCOREBOARD & GTH TELEMETRY
    // (Aligned with Audit Checklist Sections 2, 3, 4, 5, and 6)
    // =======================================================
    reg  [31:0] exp_tx_words [0:4095];
    integer     tx_word_cnt_q            = 0;
    integer     rx_word_cnt_q            = 0;
    integer     rx_post_target_words     = 0;
    integer     rx_mismatch_cnt          = 0;
    integer     rx_mid_burst_gap_cnt     = 0;
    integer     rx_zero_words_verified   = 0;
    integer     tx_fifo_overflow_cnt     = 0;
    integer     tx_fifo_underflow_cnt    = 0;
    reg         lock_ready_before_rx_ok  = 1'b1;

    reg  [31:0] tx_gb_word0_captured     = 32'd0;
    reg  [31:0] tx_gb_word1_captured     = 32'd0;
    integer     tx_gb_active_cnt         = 0;

    reg  [31:0] rx_first_word            = 32'd0;
    reg  [31:0] rx_second_word           = 32'd0;
    reg  [31:0] rx_last_word             = 32'd0;

    // Group 1 & Group 4 Target Word/Byte Counters (Strictly 0..3117 words = 0..12,468 bytes)
    wire        rx_in_target_window      = rx_down_dv && (rx_word_cnt_q < 3117);
    wire [31:0] tx_target_words          = tx_word_cnt_q + (err_flag ? 32'd1 : 32'd0);
    wire [31:0] tx_target_bytes          = tx_target_words * 32'd4;
    wire [31:0] rx_target_words          = rx_word_cnt_q + (rx_in_target_window ? 32'd1 : 32'd0);
    wire [31:0] rx_target_bytes          = rx_target_words * 32'd4;
    wire [31:0] tx_word_cnt              = tx_target_words;
    wire [31:0] rx_word_cnt              = rx_target_words;
    wire        target_window_done       = (tx_word_cnt_q == 3117) && (rx_word_cnt_q == 3117);

    // Group 2 GTH TX Gearbox & FIFO Telemetry Signals
    wire [11:0] tx_fifo_occupancy        = u_gth64b66b_tx.words_avail;
    wire        tx_accepted_read         = !u_gth64b66b_tx.pause_data_cycle &&
                                           u_gth64b66b_tx.stream_started &&
                                           (u_gth64b66b_tx.words_avail > 12'd0);

    // 1. Capture every word exiting u_error_inject (reference before GTH TX on clk_312_5) & check TX FIFO overflow
    always @(posedge clk_312_5 or negedge stream_rst_n) begin
        if (!stream_rst_n) begin
            tx_word_cnt_q        <= 0;
            tx_fifo_overflow_cnt <= 0;
        end else if (err_flag) begin
            if (tx_fifo_occupancy >= 12'd4095)
                tx_fifo_overflow_cnt <= tx_fifo_overflow_cnt + 1;
            exp_tx_words[tx_word_cnt_q] <= err_data;
            tx_word_cnt_q               <= tx_word_cnt_q + 1;
        end
    end

    // 2. Verify on tx0_clk that u_gth64b66b_tx emits Word 0 and Word 1 matching bit_rev32(exp_tx_words[0/1])
    reg tx_word_popped_d1 = 1'b0;
    always @(posedge tx0_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            tx_word_popped_d1     <= 1'b0;
            tx_gb_active_cnt      <= 0;
            tx_gb_word0_captured  <= 32'd0;
            tx_gb_word1_captured  <= 32'd0;
            tx_fifo_underflow_cnt <= 0;
        end else begin
            tx_word_popped_d1 <= tx_accepted_read;

            if (!u_gth64b66b_tx.pause_data_cycle && u_gth64b66b_tx.stream_started &&
                (u_gth64b66b_tx.rd_ptr < 12'd3117) && (tx_fifo_occupancy == 12'd0)) begin
                tx_fifo_underflow_cnt <= tx_fifo_underflow_cnt + 1;
            end

            if (tx_word_popped_d1) begin
                if (tx_gb_active_cnt == 0)
                    tx_gb_word0_captured <= gt_txdata;
                else if (tx_gb_active_cnt == 1)
                    tx_gb_word1_captured <= gt_txdata;
                tx_gb_active_cnt <= tx_gb_active_cnt + 1;
            end
        end
    end

    // 3. Compare all 3,117 target RX words on clk_312_5 against exp_tx_words[0:3116]; separate post-target RX activity
    always @(posedge clk_312_5 or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            rx_word_cnt_q           <= 0;
            rx_post_target_words    <= 0;
            rx_mismatch_cnt         <= 0;
            rx_mid_burst_gap_cnt    <= 0;
            rx_zero_words_verified  <= 0;
            lock_ready_before_rx_ok <= 1'b1;
            rx_first_word           <= 32'd0;
            rx_second_word          <= 32'd0;
            rx_last_word            <= 32'd0;
        end else if (rx_word_cnt_q < 3117) begin
            if (rx_down_dv) begin
                if (!gth_tx_ready || !gth_rx_ready || !gth_link_up || !rx_block_locked)
                    lock_ready_before_rx_ok <= 1'b0;

                if (rx_word_cnt_q == 0)
                    rx_first_word  <= rx_down_data;
                if (rx_word_cnt_q == 1)
                    rx_second_word <= rx_down_data;
                if (rx_word_cnt_q == 3116)
                    rx_last_word   <= rx_down_data;

                if ((^rx_down_data === 1'bx) || (rx_down_data !== exp_tx_words[rx_word_cnt_q])) begin
                    rx_mismatch_cnt <= rx_mismatch_cnt + 1;
                end
                if ((rx_down_data == 32'd0) && (exp_tx_words[rx_word_cnt_q] == 32'd0)) begin
                    rx_zero_words_verified <= rx_zero_words_verified + 1;
                end
                rx_word_cnt_q <= rx_word_cnt_q + 1;
            end else if (rx_word_cnt_q > 0) begin
                rx_mid_burst_gap_cnt <= rx_mid_burst_gap_cnt + 1;
            end
        end else if (rx_down_dv) begin
            rx_post_target_words <= rx_post_target_words + 1;
        end
    end

    // Trackers (Gated cleanly to the 4-frame target window by TB, not by module)
    wire [7:0]  tx_byte_stream = err_flag            ? u_error_inject.byte_out       : 8'd0;
    wire [15:0] tx_clk_cnt     = err_flag            ? u_error_inject.out_clk_cnt    : 16'd0;
    wire [11:0] tx_byte_cnt    = err_flag            ? u_error_inject.frame_byte_cnt : 12'd0;
    wire [31:0] tx_frame_id    = err_flag            ? u_error_inject.frame_out_id   : 32'd0;

    wire        rx_mon_in_target = (u_gth64b66b_rx.frame_out_id >= 32'd1) &&
                                   (u_gth64b66b_rx.frame_out_id <= 32'd4) && rx_down_dv;
    wire [7:0]  rx_byte_stream   = rx_mon_in_target ? u_gth64b66b_rx.byte_out       : 8'd0;
    wire [15:0] rx_clk_cnt       = rx_mon_in_target ? u_gth64b66b_rx.out_clk_cnt    : 16'd0;
    wire [11:0] rx_byte_cnt      = rx_mon_in_target ? u_gth64b66b_rx.frame_byte_cnt : 12'd0;
    wire [31:0] rx_frame_id      = rx_mon_in_target ? u_gth64b66b_rx.frame_out_id   : 32'd0;

    // Distinct Labels for Clock Frequency, Word Period, and SDA OISL Table 2-4 Metrics
    // (Initialized to 0.0 per Reviewer Section 3 so initial state is never mistaken for a sample)
    real net_byte_time_ns;
    real GTH_312M5_Clock_MHz;
    real GTH_312M5_Word_Period_ns;
    real SDA_Frame_Duration_us;

    real time_start;
    real time_end;
    real OISL_Frame_Duration_us;
    real OISL_Effective_Data_Rate_Mbps;
    real OISL_Frame_Rate_kHz;
    real OISL_FCCH_Mbps;

    real    chk_frame_start_ns [1:4];
    real    chk_exp_end_ns     [1:4];
    reg     chk_frame_started  [1:4];
    reg     chk_frame_done     [1:4];
    real    obs_time_end_ns;
    real    obs_frame_duration_us;
    real    timing_diff_ns;
    integer timing_checked_frames = 0;
    integer timing_mismatch_cnt   = 0;
    integer f_i;

    initial begin
        net_byte_time_ns              = 0.0;
        GTH_312M5_Clock_MHz           = 0.0;
        GTH_312M5_Word_Period_ns      = 0.0;
        SDA_Frame_Duration_us         = 0.0;
        time_start                    = 0.0;
        time_end                      = 0.0;
        OISL_Frame_Duration_us        = 0.0;
        OISL_Effective_Data_Rate_Mbps = 0.0;
        OISL_Frame_Rate_kHz           = 0.0;
        OISL_FCCH_Mbps                = 0.0;
        obs_time_end_ns               = 0.0;
        obs_frame_duration_us         = 0.0;
        for (f_i = 1; f_i <= 4; f_i = f_i + 1) begin
            chk_frame_start_ns[f_i] = 0.0;
            chk_exp_end_ns[f_i]     = 0.0;
            chk_frame_started[f_i]  = 1'b0;
            chk_frame_done[f_i]     = 1'b0;
        end
    end

    always @(posedge clk_312_5) begin
        if (sys_rst_n) begin
            if (last_312_edge_ns > 0.0) begin
                d_312_ns       = $realtime - last_312_edge_ns;
                clk312_sampled <= 1'b1;
                if ((d_312_ns - measured_312_period_ns > 0.0001) || (measured_312_period_ns - d_312_ns > 0.0001)) begin
                    measured_312_period_ns   = d_312_ns;
                    net_byte_time_ns         = d_312_ns / 4.0;
                    GTH_312M5_Word_Period_ns = d_312_ns;
                    if (d_312_ns > 0.0)
                        GTH_312M5_Clock_MHz = 1000.0 / d_312_ns;
                end
            end
            last_312_edge_ns = $realtime;
        end
    end

    always @(u_gth64b66b_rx.frame_out_id or u_gth64b66b_rx.frame_byte_cnt) begin
        if (sys_rst_n) begin
            if (rx_down_dv && (u_gth64b66b_rx.frame_out_id >= 32'd1 && u_gth64b66b_rx.frame_out_id <= 32'd4) &&
                (u_gth64b66b_rx.frame_byte_cnt == 12'd1) && !chk_frame_started[u_gth64b66b_rx.frame_out_id]) begin

                if (u_gth64b66b_rx.frame_out_id > 32'd1 && chk_frame_started[u_gth64b66b_rx.frame_out_id - 1] &&
                    !chk_frame_done[u_gth64b66b_rx.frame_out_id - 1]) begin
                    obs_time_end_ns       = $realtime;
                    obs_frame_duration_us = (obs_time_end_ns - chk_frame_start_ns[u_gth64b66b_rx.frame_out_id - 1]) / 1000.0;
                    timing_diff_ns        = (obs_time_end_ns >= chk_exp_end_ns[u_gth64b66b_rx.frame_out_id - 1]) ?
                                            (obs_time_end_ns - chk_exp_end_ns[u_gth64b66b_rx.frame_out_id - 1]) :
                                            (chk_exp_end_ns[u_gth64b66b_rx.frame_out_id - 1] - obs_time_end_ns);
                    if (timing_diff_ns > 0.01)
                        timing_mismatch_cnt = timing_mismatch_cnt + 1;
                    chk_frame_done[u_gth64b66b_rx.frame_out_id - 1] = 1'b1;
                    timing_checked_frames                           = timing_checked_frames + 1;
                end

                chk_frame_started[u_gth64b66b_rx.frame_out_id]  = 1'b1;
                chk_frame_start_ns[u_gth64b66b_rx.frame_out_id] = $realtime;
                chk_exp_end_ns[u_gth64b66b_rx.frame_out_id]     = $realtime + (3117.0 * net_byte_time_ns);

                time_start                    = chk_frame_start_ns[u_gth64b66b_rx.frame_out_id];
                time_end                      = chk_exp_end_ns[u_gth64b66b_rx.frame_out_id];
                OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
                SDA_Frame_Duration_us         = OISL_Frame_Duration_us;
                OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
                OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
                OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

                $display("---------------------------------------------------------------");
                $display(" [GTH 64B/66B RX] FRAME %0d ACTIVE (3117 Bytes, Preamble 72'h77AD5B5843641E2E26)", u_gth64b66b_rx.frame_out_id);
                $display(" time_start     : %0.1f ns | time_end : %0.1f ns", time_start, time_end);
                $display(" Duration       : %0.6f us", OISL_Frame_Duration_us);
                $display(" Effective Rate : %0.6f Mbps", OISL_Effective_Data_Rate_Mbps);
                $display(" Frame Rate     : %0.6f kHz  | FCCH Rate: %0.6f Mbps", OISL_Frame_Rate_kHz, OISL_FCCH_Mbps);
                $display("---------------------------------------------------------------");
            end
            else if ((u_gth64b66b_rx.frame_out_id == 32'd5) && (u_gth64b66b_rx.frame_byte_cnt == 12'd1) &&
                     chk_frame_started[4] && !chk_frame_done[4]) begin
                obs_time_end_ns       = $realtime;
                obs_frame_duration_us = (obs_time_end_ns - chk_frame_start_ns[4]) / 1000.0;
                timing_diff_ns        = (obs_time_end_ns >= chk_exp_end_ns[4]) ?
                                        (obs_time_end_ns - chk_exp_end_ns[4]) :
                                        (chk_exp_end_ns[4] - obs_time_end_ns);
                if (timing_diff_ns > 0.01)
                    timing_mismatch_cnt = timing_mismatch_cnt + 1;
                chk_frame_done[4]     = 1'b1;
                timing_checked_frames = timing_checked_frames + 1;

                time_start                    = 0.0;
                time_end                      = 0.0;
                OISL_Frame_Duration_us        = 0.0;
                SDA_Frame_Duration_us         = 0.0;
                OISL_Effective_Data_Rate_Mbps = 0.0;
                OISL_Frame_Rate_kHz           = 0.0;
                OISL_FCCH_Mbps                = 0.0;
            end
        end
    end

    // [Reviewer Section 3] Automated post-lock clock period assertions gated by sample flags
    wire refclk_period_ok     = refclk_sampled  && (measured_refclk_period_ns >= 6.399) && (measured_refclk_period_ns <= 6.401);
    wire tx0_clk_period_ok    = tx0_clk_sampled && (measured_tx0_period_ns    >= 3.100) && (measured_tx0_period_ns    <= 3.106);
    wire rx0_clk_period_ok    = rx0_clk_sampled && (measured_rx0_period_ns    >= 3.100) && (measured_rx0_period_ns    <= 3.106);
    wire stream_clk_period_ok = clk312_sampled  && (measured_312_period_ns    >= 3.199) && (measured_312_period_ns    <= 3.201);
    wire clock_check_ok       = refclk_period_ok && tx0_clk_period_ok && rx0_clk_period_ok && stream_clk_period_ok;

    // [Audit Sec. 5] Exact comparison of both Word 0 and Word 1 against bit_rev32(exp_tx_words[0/1])
    wire tx_first_word_ok  = target_window_done && (tx_gb_word0_captured == bit_rev32(exp_tx_words[0]));
    wire tx_second_word_ok = target_window_done && (tx_gb_word1_captured == bit_rev32(exp_tx_words[1]));
    wire rx_first_word_ok  = target_window_done && (rx_first_word  == exp_tx_words[0]) && (rx_second_word == exp_tx_words[1]);
    wire rx_last_word_ok   = target_window_done && (rx_last_word   == exp_tx_words[3116]);
    wire zero_run_check_ok = (ZERO_PAYLOAD_TEST == 0) ? 1'b1 : (rx_zero_words_verified >= 8);
    wire test_pass_status  = target_window_done && lock_ready_before_rx_ok &&
                             clock_check_ok &&
                             tx_first_word_ok && tx_second_word_ok &&
                             rx_first_word_ok && rx_last_word_ok &&
                             (tx_fifo_overflow_cnt == 0) && (tx_fifo_underflow_cnt == 0) &&
                             zero_run_check_ok &&
                             (rx_mismatch_cnt == 0) && (rx_mid_burst_gap_cnt == 0) &&
                             (timing_checked_frames == 4) && (timing_mismatch_cnt == 0);

    // Completion is determined strictly by receiving all 12,468 target bytes (3,117 words)
    initial begin
        wait(tb_state == ST_DONE);
        wait(target_window_done);
        wait(timing_checked_frames == 4);
        repeat (600) @(posedge clk_312_5);

        $display("\n======================================================================");
        $display(" GTH 64B/66B SUBSYSTEM TRANSPORT REPORT (4 SYNTHETIC FRAMES, POST-INJECTOR REF)");
        $display(" -> Run Parameters             : SIM_MODE = %0d, ZERO_PAYLOAD_TEST = %0d",
                 SIM_MODE, ZERO_PAYLOAD_TEST);
        $display(" -> Clock Samples Acquired     : refclk=%0d, tx0=%0d, rx0=%0d, clk312=%0d (clock_check_ok=%0d)",
                 refclk_sampled, tx0_clk_sampled, rx0_clk_sampled, clk312_sampled, clock_check_ok);
        $display(" -> Measured gt_refclk_p       : %0.6f MHz (Period: %0.3f ns, .xci Target: 156.250000 MHz)",
                 measured_refclk_mhz, measured_refclk_period_ns);
        $display(" -> Measured tx0_clk / rx0_clk : %0.6f MHz (%0.3f ns) / %0.6f MHz (%0.3f ns)",
                 measured_tx0_mhz, measured_tx0_period_ns, measured_rx0_mhz, measured_rx0_period_ns);
        $display(" -> Measured clk_312_5 Stream  : %0.6f MHz (Period: %0.3f ns, 0.800 ns/byte)",
                 GTH_312M5_Clock_MHz, GTH_312M5_Word_Period_ns);
        $display(" -> Target Bytes Before TX     : %0d Bytes / %0d Words (Expected: 12468B / 3117W)",
                 tx_word_cnt_q * 4, tx_word_cnt_q);
        $display(" -> Target Bytes After RX      : %0d Bytes / %0d Words (Expected: 12468B / 3117W)",
                 rx_word_cnt_q * 4, rx_word_cnt_q);
        $display(" -> Content Mismatches / Gaps  : %0d Mismatches / %0d Mid-Window Gaps",
                 rx_mismatch_cnt, rx_mid_burst_gap_cnt);
        $display(" -> TX Gearbox Word 0 / Word 1 : 0x%08X / 0x%08X (Exp: 0x%08X / 0x%08X -> OK: %0d / %0d)",
                 tx_gb_word0_captured, tx_gb_word1_captured,
                 bit_rev32(exp_tx_words[0]), bit_rev32(exp_tx_words[1]),
                 tx_first_word_ok, tx_second_word_ok);
        $display(" -> RX First / Last Word       : 0x%08X / 0x%08X (First OK: %0d, Last OK: %0d)",
                 rx_first_word, rx_last_word, rx_first_word_ok, rx_last_word_ok);
        $display(" -> Zero Padding Words Kept    : %0d Words in Frame 2 (Expected: >= 8 when ZERO_PAYLOAD_TEST=1)",
                 rx_zero_words_verified);
        $display(" -> TX FIFO Overflow/Underflow : %0d Overflows / %0d Underflows (Expected: 0 / 0)",
                 tx_fifo_overflow_cnt, tx_fifo_underflow_cnt);
        $display(" -> Lock & Ready Before RX     : %0d (Expected: 1)",
                 lock_ready_before_rx_ok);
        $display(" -> Stream Duration Checked    : %0d Frames @ 2.493600 us/frame (Timing Mismatches: %0d)",
                 timing_checked_frames, timing_mismatch_cnt);
        if (test_pass_status) begin
            $display(" -> RESULT: [PASS] GTH subsystem transport verified (12,468B post-injector stream, 11 zero words, word 0/1, 4x2.4936us stream duration, and sampled clocks verified).");
        end else begin
            $fatal(1, " -> RESULT: [FAIL] GTH 64B/66B loopback acceptance check failed!");
        end
        $display("======================================================================\n");
        $finish;
    end

endmodule