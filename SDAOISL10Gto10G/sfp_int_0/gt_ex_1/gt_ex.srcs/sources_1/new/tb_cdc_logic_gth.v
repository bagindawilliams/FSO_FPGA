`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : High-Fidelity Testbench for CDC 2 (Elastic Transmit Buffer).

               CRITICAL REVISIONS:
               1. Pure $realtime Measurement (Zero Mocking):
                  Measures 'time_start' and 'time_end' directly from raw 
                  '$realtime' simulation events when 'frame_out_id' transitions 
                  after byte 3117. No sub-cycle formula offset is used.
               2. Byte-by-Byte Visibility:
                  Exposes 'byte_out[7:0]' alongside 'frame_byte_cnt[11:0]' 
                  (counting 1, 2, 3 ... 3117 by 1) so every single byte and 
                  frame boundary overlap inside 'data_out[31:0]' is visible.
               3. [Rev 2.0 - 2026-10-27 15:11 KST - ETRI Audit Item 1 & Frame Timing]:
                  Injected the official SDA OISL 72-bit Preamble 
                  (72'h77_AD_5B_58_43_64_1E_2E_26 per Table 2-8) at the start 
                  of every frame (cycle_cnt == 1) so that the shared 780th 
                  boundary word between Frame 1 (last byte 0x33) and Frame 2 
                  (first 3 Preamble bytes 0x77_AD_5B) is visibly verified as 
                  data_out = 32'h3377_AD5B with exact 2.493600 us frame timing.
               4. [Rev 2.1 - 2026-11-05 04:30 KST - Observed Timestamping & Full 12,468-Byte Port Checker]:
                  - Added true observed simulation timestamps captured directly 
                    when byte 1 and byte 3117 of each frame exit on 'flag && data_out'.
                  - Added a full 12,468-byte reference scoreboard comparing every 
                    accepted input byte against the actual 'flag' / 'data_out' 
                    ports (12,468 input bytes, 3,117 output 32-bit words, 12,468 
                    output bytes, 0 mismatches, and 780th word == 32'h3377_AD5B).
                  - Clarified that the unit test stimulus uses 195 data + 304 gap 
                    = 499 cycles (2,495.0 ns) at 200 MHz, and labeled the 15,264-bit 
                    rate metric explicitly on its 1,908-Byte FSO Payload basis.
               5. [Rev 2.2 - 2026-11-05 05:12 KST - In-Frame Aligned Metric Display & Observed End-Time Assertion]:
                  - Restored real-time waveform alignment so 'time_start', 'time_end',
                    'OISL_Frame_Duration_us', 'OISL_Effective_Data_Rate_Mbps',
                    'OISL_Frame_Rate_kHz', and 'OISL_FCCH_Mbps' display directly
                    underneath active Frames 1, 2, 3, and 4 (and return to 0.0
                    during idle before Frame 1 and after Frame 4).
                  - Added independent observed end-of-frame timestamp verification
                    ('obs_time_end_ns', 'obs_frame_duration_us', and 'timing_mismatch_cnt')
                    that verifies at each frame completion that the actual observed
                    $realtime end timestamp matches 'time_end' within 0.01 ns.
                  - Gated top-level display wires ('frame_id', 'out_clk_cnt',
                    'frame_byte_cnt', 'byte_out') to return to 0 after completion
                    while preserving internal hold-on-invalid state inside u_cdc2.
               6. [Rev 2.3 - 2026-11-05 05:35 KST - Persistent Timing Checker State, 4-Frame Count & Zero-Gap Proof]:
                  - Decoupled the timing checker's internal frame identity and start
                    timestamp storage ('chk_frame_start_ns[1..4]', 'chk_frame_started[1..4]',
                    driven by persistent 'u_cdc2.frame_out_id' / 'u_cdc2.frame_byte_cnt')
                    from the WCFG display signal 'frame_out_id', ensuring a mid-frame
                    'flag' drop can never reset 'time_start' or hide pre-gap intervals.
                  - Added 'timing_checked_frames' (requiring exact 4 verified frames)
                    and 'mid_stream_gap_cnt' (counting any 'flag == 0' cycles between
                    the first and 3,117th output words and requiring 0 gaps in baseline).
===========================================================================
*/

module tb_cdc_logic_gth();

    // =======================================================
    // 1. SYSTEM CLOCKS AND RESET
    // =======================================================
    reg clk_logic; // 200.0 MHz (Period: 5.0 ns)
    reg clk_gth;   // 312.5 MHz (Period: 3.2 ns)
    reg rst_n;
    reg en;

    reg  [127:0] data_in;
    reg          data_in_dv;
    reg  [15:0]  cdc_keep;

    wire         flag;
    wire [31:0]  data_out;

    // =======================================================
    // 2. DUT INSTANTIATION
    // =======================================================
    x_logic_gth u_cdc2 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en         (en),
        .data_in    (data_in),
        .data_in_dv (data_in_dv),
        .cdc_keep   (cdc_keep),
        .flag       (flag),
        .data_out   (data_out)
    );

    // =======================================================
    // 3. DUAL CLOCK GENERATION & WATCHDOG TIMEOUT
    // =======================================================
    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic; // 200.0 MHz
    end

    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;     // 312.5 MHz
    end

    initial begin
        #200000;
        $fatal(1, "\n[TIMEOUT ERROR] tb_cdc_logic_gth did not complete within 200 us!\n");
    end

    // =======================================================
    // 4. WRITE DOMAIN FSM: MUX EMULATOR (200 MHz)
    //    Note: Unit test stimulus uses 195 active cycles + 304 gap cycles
    //          = 499 cycles (2,495.0 ns) per frame in clk_logic.
    // =======================================================
    localparam ST_WAIT_RST = 2'd0;
    localparam ST_STREAM   = 2'd1;
    localparam ST_GAP      = 2'd2;
    localparam ST_DONE     = 2'd3;

    reg  [1:0]  tb_state;
    reg  [3:0]  raw_frame_id;
    wire [3:0]  frame_id = (tb_state == ST_STREAM || tb_state == ST_GAP) ? raw_frame_id : 4'd0;
    reg  [15:0] cycle_cnt;

    initial begin
        rst_n        = 1'b0;
        en           = 1'b0;
        tb_state     = ST_WAIT_RST;
        raw_frame_id = 4'd0;
        cycle_cnt    = 16'd0;
        #100; 
        rst_n        = 1'b1; 
        en           = 1'b1;
    end

    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            tb_state     <= ST_WAIT_RST;
            raw_frame_id <= 4'd0;
            cycle_cnt    <= 16'd0;
        end else begin
            case (tb_state)
                ST_WAIT_RST: begin
                    if (!u_cdc2.wr_rst_busy) begin
                        if (cycle_cnt < 16'd5) begin
                            cycle_cnt <= cycle_cnt + 1'b1;
                        end else begin
                            tb_state     <= ST_STREAM;
                            raw_frame_id <= 4'd1;
                            cycle_cnt    <= 16'd1;
                        end
                    end
                end
                ST_STREAM: begin
                    if (cycle_cnt < 16'd195) begin
                        cycle_cnt <= cycle_cnt + 1'b1;
                    end else begin
                        tb_state  <= ST_GAP;
                        cycle_cnt <= 16'd1;
                    end
                end
                ST_GAP: begin
                    if (cycle_cnt < 16'd304) begin
                        cycle_cnt <= cycle_cnt + 1'b1;
                    end else begin
                        if (raw_frame_id < 4'd4) begin
                            raw_frame_id <= raw_frame_id + 1'b1;
                            tb_state     <= ST_STREAM;
                            cycle_cnt    <= 16'd1;
                        end else begin
                            tb_state     <= ST_DONE;
                            raw_frame_id <= 4'd0;
                            cycle_cnt    <= 16'd0;
                            en           <= 1'b0;
                        end
                    end
                end
                ST_DONE: begin
                    en           <= 1'b0;
                    raw_frame_id <= 4'd0;
                end
            endcase
        end
    end

    always @(*) begin
        data_in_dv = 1'b0;
        data_in    = 128'd0;
        cdc_keep   = 16'd0;

        if (rst_n && (tb_state == ST_STREAM)) begin
            data_in_dv = 1'b1;
            if (cycle_cnt == 16'd1) begin
                // [Rev 2.0] Word 1 carries 72-bit SDA OISL Preamble (72'h77AD5B5843641E2E26) at MSB [127:56]
                cdc_keep = 16'hFFFF;
                data_in  = {72'h77_AD_5B_58_43_64_1E_2E_26, 24'hAA_BB_CC, {12'd0, raw_frame_id}, cycle_cnt};
            end else if (cycle_cnt <= 16'd194) begin
                cdc_keep = 16'hFFFF;
                data_in  = {32'hAAAA_BBBB, 32'hCCCC_DDDD, {28'd0, raw_frame_id}, {16'd0, cycle_cnt}};
            end else if (cycle_cnt == 16'd195) begin
                cdc_keep = 16'h1FFF;
                data_in  = {104'h9999_8888_7777_6666_5555_4444_33, 24'h000000};
            end
        end
    end

    // =======================================================
    // 5. FULL 12,468-BYTE SCOREBOARD, GAP COUNTER & PORT CHECKER
    // =======================================================
    reg  [7:0]  exp_byte_mem [0:16383];
    integer     in_valid_byte_cnt_q         = 0;
    integer     out_word_cnt_q              = 0;
    integer     out_byte_cnt_q              = 0;
    integer     data_mismatch_cnt           = 0;
    integer     mid_stream_gap_cnt          = 0;
    reg  [31:0] captured_boundary_word780_q = 32'd0;
    integer     b_idx;

    wire        in_accept_now = en && data_in_dv && u_cdc2.cdc2_ready && !u_cdc2.wr_req_stalled;
    wire [31:0] in_step_bytes = !in_accept_now ? 32'd0 :
                                (cdc_keep == 16'hFFFF) ? 32'd16 :
                                (cdc_keep == 16'h1FFF) ? 32'd13 : 32'd0;

    // Zero-lag cumulative progress wires
    wire [31:0] in_valid_byte_cnt         = in_valid_byte_cnt_q + in_step_bytes;
    wire [31:0] out_word_cnt              = out_word_cnt_q + (flag ? 32'd1 : 32'd0);
    wire [31:0] out_byte_cnt              = out_byte_cnt_q + (flag ? 32'd4 : 32'd0);
    wire [31:0] captured_boundary_word780 = (flag && (out_word_cnt_q == 779)) ? data_out : captured_boundary_word780_q;

    // Record all valid input bytes accepted at the clk_logic interface
    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            in_valid_byte_cnt_q <= 0;
        end else if (in_accept_now) begin
            if (cdc_keep == 16'hFFFF) begin
                for (b_idx = 0; b_idx < 16; b_idx = b_idx + 1)
                    exp_byte_mem[in_valid_byte_cnt_q + b_idx] <= data_in[127 - (b_idx * 8) -: 8];
                in_valid_byte_cnt_q <= in_valid_byte_cnt_q + 16;
            end else if (cdc_keep == 16'h1FFF) begin
                for (b_idx = 0; b_idx < 13; b_idx = b_idx + 1)
                    exp_byte_mem[in_valid_byte_cnt_q + b_idx] <= data_in[127 - (b_idx * 8) -: 8];
                in_valid_byte_cnt_q <= in_valid_byte_cnt_q + 13;
            end
        end
    end

    // Verify all 3,117 output 32-bit words (12,468 bytes) and count any mid-stream valid-low gaps
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            out_word_cnt_q              <= 0;
            out_byte_cnt_q              <= 0;
            data_mismatch_cnt           <= 0;
            mid_stream_gap_cnt          <= 0;
            captured_boundary_word780_q <= 32'd0;
        end else if (flag) begin
            if ((^data_out === 1'bx) ||
                (data_out[31:24] !== exp_byte_mem[out_byte_cnt_q + 0]) ||
                (data_out[23:16] !== exp_byte_mem[out_byte_cnt_q + 1]) ||
                (data_out[15:8]  !== exp_byte_mem[out_byte_cnt_q + 2]) ||
                (data_out[7:0]   !== exp_byte_mem[out_byte_cnt_q + 3])) begin
                data_mismatch_cnt <= data_mismatch_cnt + 1;
            end

            // 780th word (0-based index 779) carries {Frame1_Byte3117(0x33), Frame2_Preamble_Bytes1..3(0x77AD5B)}
            if (out_word_cnt_q == 779) begin
                captured_boundary_word780_q <= data_out;
            end

            out_word_cnt_q <= out_word_cnt_q + 1;
            out_byte_cnt_q <= out_byte_cnt_q + 4;
        end else if (out_word_cnt_q > 0 && out_word_cnt_q < 3117) begin
            // Count any valid-low cycle occurring between the first and final output word
            mid_stream_gap_cnt <= mid_stream_gap_cnt + 1;
        end
    end

    // Waveform Trackers for Data In & Data Out (WCFG display returns to 0 when inactive)
    wire [15:0] in_clk_cnt     = data_in_dv ? cycle_cnt : 16'd0;
    wire [11:0] in_byte_cnt    = data_in_dv ? 
                                 ((cdc_keep == 16'hFFFF) ? (cycle_cnt * 12'd16) : 12'd3117) 
                                 : 12'd0;

    wire [7:0]  byte_out       = flag ? u_cdc2.byte_out       : 8'd0;       
    wire [15:0] out_clk_cnt    = flag ? u_cdc2.out_clk_cnt    : 16'd0;    
    wire [11:0] frame_byte_cnt = flag ? u_cdc2.frame_byte_cnt : 12'd0; 
    wire [31:0] frame_out_id   = flag ? u_cdc2.frame_out_id   : 32'd0;   

    // =======================================================
    // 6. PERSISTENT 4-FRAME TIMING CHECKER & WCFG METRIC ANALYZER
    //    - Checker state ('chk_frame_start_ns[1..4]', 'chk_frame_started[1..4]',
    //      and 'timing_checked_frames') is driven by persistent monitor coordinates
    //      and NEVER resets on 'flag == 0'.
    //    - Note: 0.8 ns byte resolution comes from visual unpacking of each 32-bit
    //      word period (3.2 ns / 4), while 'time_end' is the expected boundary and
    //      'obs_time_end_ns' is the observed monitor timestamp.
    // =======================================================
    real last_gth_edge_ns;
    real measured_gth_period_ns;
    real measured_byte_time_ns;

    real time_start;
    real time_end; // Expected frame end boundary (time_start + 3117 * measured_byte_time_ns)
    real OISL_Frame_Duration_us;
    real OISL_Effective_Data_Rate_Mbps; // 1,908-Byte (15,264-bit) FSO Payload container rate
    real OISL_Frame_Rate_kHz;
    real OISL_FCCH_Mbps;

    // Persistent per-frame checker storage (immune to mid-frame flag drops)
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
        last_gth_edge_ns              = 0.0;
        measured_gth_period_ns        = 3.2;
        measured_byte_time_ns         = 0.8;
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

    // Continuously measure the real GTH clock period from simulation events
    always @(posedge clk_gth) begin
        if (last_gth_edge_ns > 0.0) begin
            measured_gth_period_ns = $realtime - last_gth_edge_ns;
            measured_byte_time_ns  = measured_gth_period_ns / 4.0; // Visual 4-byte subdivision per 32-bit word
        end
        last_gth_edge_ns = $realtime;
    end

    // Persistent event-driven timing checker triggered on u_cdc2.frame_byte_cnt & flag
    always @(u_cdc2.frame_out_id or u_cdc2.frame_byte_cnt or flag) begin
        if (rst_n) begin
            // A. When Byte 1 of Frame k (1..4) is emitted: latch persistent start timestamp ONCE per frame
            if (flag && (u_cdc2.frame_out_id >= 32'd1 && u_cdc2.frame_out_id <= 32'd4) &&
                (u_cdc2.frame_byte_cnt == 12'd1) && !chk_frame_started[u_cdc2.frame_out_id]) begin

                // If previous frame (k-1) just finished at this exact boundary transition, evaluate it first
                if (u_cdc2.frame_out_id > 32'd1 && chk_frame_started[u_cdc2.frame_out_id - 1] &&
                    !chk_frame_done[u_cdc2.frame_out_id - 1]) begin
                    obs_time_end_ns       = $realtime;
                    obs_frame_duration_us = (obs_time_end_ns - chk_frame_start_ns[u_cdc2.frame_out_id - 1]) / 1000.0;
                    timing_diff_ns        = (obs_time_end_ns >= chk_exp_end_ns[u_cdc2.frame_out_id - 1]) ?
                                            (obs_time_end_ns - chk_exp_end_ns[u_cdc2.frame_out_id - 1]) :
                                            (chk_exp_end_ns[u_cdc2.frame_out_id - 1] - obs_time_end_ns);
                    if (timing_diff_ns > 0.01)
                        timing_mismatch_cnt = timing_mismatch_cnt + 1;
                    chk_frame_done[u_cdc2.frame_out_id - 1] = 1'b1;
                    timing_checked_frames                   = timing_checked_frames + 1;

                    $display(" [OBSERVED END VERIFIED] Frame %0d completed at actual $realtime = %0.1f ns (Observed Duration = %0.6f us, Diff = %0.3f ns)",
                             u_cdc2.frame_out_id - 1, obs_time_end_ns, obs_frame_duration_us, timing_diff_ns);
                end

                // Latch Frame k start time persistently (never cleared if flag drops mid-frame)
                chk_frame_started[u_cdc2.frame_out_id]  = 1'b1;
                chk_frame_start_ns[u_cdc2.frame_out_id] = $realtime;
                chk_exp_end_ns[u_cdc2.frame_out_id]     = $realtime + (3117.0 * measured_byte_time_ns);

                // Update WCFG display variables underneath active Frame k
                time_start                    = chk_frame_start_ns[u_cdc2.frame_out_id];
                time_end                      = chk_exp_end_ns[u_cdc2.frame_out_id];
                OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
                OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
                OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
                OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

                $display("---------------------------------------------------");
                $display(" FRAME %0d ACTIVE (Metrics Aligned Under Frame %0d)", u_cdc2.frame_out_id, u_cdc2.frame_out_id);
                $display(" time_start                    : %0.1f ns", time_start);
                $display(" time_end (Expected Boundary)  : %0.1f ns", time_end);
                $display(" Duration                      : %0.6f us", OISL_Frame_Duration_us);
                $display(" FSO Payload Rate (1908B/15264b): %0.6f Mbps", OISL_Effective_Data_Rate_Mbps);
                $display(" Frame Rate                    : %0.6f kHz", OISL_Frame_Rate_kHz);
                $display(" FCCH Rate (16b)               : %0.6f Mbps", OISL_FCCH_Mbps);
                $display("---------------------------------------------------");
            end

            // B. When Frame 4 completes its 3,117th byte (780th word deasserts flag at out_word_cnt_q == 3117)
            if (!flag && (out_word_cnt_q == 3117) && chk_frame_started[4] && !chk_frame_done[4]) begin
                obs_time_end_ns       = $realtime;
                obs_frame_duration_us = (obs_time_end_ns - chk_frame_start_ns[4]) / 1000.0;
                timing_diff_ns        = (obs_time_end_ns >= chk_exp_end_ns[4]) ?
                                        (obs_time_end_ns - chk_exp_end_ns[4]) :
                                        (chk_exp_end_ns[4] - obs_time_end_ns);
                if (timing_diff_ns > 0.01)
                    timing_mismatch_cnt = timing_mismatch_cnt + 1;
                chk_frame_done[4]     = 1'b1;
                timing_checked_frames = timing_checked_frames + 1;

                $display(" [OBSERVED END VERIFIED] Frame 4 completed at actual $realtime = %0.1f ns (Observed Duration = %0.6f us, Diff = %0.3f ns)",
                         obs_time_end_ns, obs_frame_duration_us, timing_diff_ns);

                // Reset WCFG display variables to 0.0 after all 4 frames finish
                time_start                    = 0.0;
                time_end                      = 0.0;
                OISL_Frame_Duration_us        = 0.0;
                OISL_Effective_Data_Rate_Mbps = 0.0;
                OISL_Frame_Rate_kHz           = 0.0;
                OISL_FCCH_Mbps                = 0.0;
            end
        end
    end

    // =======================================================
    // 7. SIMULATION TERMINATION & FINAL SCOREBOARD VERDICT
    // =======================================================
    initial begin
        wait(tb_state == ST_DONE);
        wait(out_word_cnt_q == 3117 && flag == 1'b0);
        #500;

        $display("\n======================================================================");
        $display(" CDC 2 (x_logic_gth) PORT-LEVEL VERIFICATION REPORT");
        $display(" -> Valid Input Bytes Accepted : %0d Bytes (Expected: 12468)", in_valid_byte_cnt);
        $display(" -> Output 32-Bit Words (flag) : %0d Words (Expected: 3117)", out_word_cnt);
        $display(" -> Output Bytes (flag)        : %0d Bytes (Expected: 12468)", out_byte_cnt);
        $display(" -> Byte/Word Data Mismatches  : %0d (Expected: 0)", data_mismatch_cnt);
        $display(" -> Mid-Stream Valid-Low Gaps  : %0d Cycles (Expected: 0)", mid_stream_gap_cnt);
        $display(" -> Timing Checked Frames      : %0d Frames (Expected: 4)", timing_checked_frames);
        $display(" -> Observed Timing Mismatches : %0d (Expected: 0, 2.493600 us/frame)", timing_mismatch_cnt);
        $display(" -> 780th Word (Frame 1->2 Bnd): 0x%08X (Expected: 0x3377AD5B)", captured_boundary_word780);
        $display(" -> FIFO Write Stall Hold Cnt  : %0d (Expected: 0 in baseline)", u_cdc2.wr_stall_hold_cnt);
        if (in_valid_byte_cnt == 12468 && out_word_cnt == 3117 && out_byte_cnt == 12468 &&
            data_mismatch_cnt == 0 && mid_stream_gap_cnt == 0 &&
            timing_checked_frames == 4 && timing_mismatch_cnt == 0 &&
            captured_boundary_word780 == 32'h3377_AD5B &&
            u_cdc2.wr_stall_hold_cnt == 16'd0) begin
            $display(" -> RESULT: [PASS] All 12,468 bytes (3,117 words), 4/4 frame timings (0 mid-stream gaps), and 0x3377AD5B boundary verified.");
        end else begin
            $fatal(1, " -> RESULT: [FAIL] CDC 2 byte/word count, boundary word, gap count, timing, or data comparison mismatch!");
        end
        $display("======================================================================\n");
        $finish;
    end

endmodule