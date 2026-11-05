`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_cdc3_rx_gth_logic
Description  : Standalone Verification Testbench for Clock Domain Crossing 3 
               (rx_gth_logic.v + cross_gth_logic.xci).
               
               WAVEFORM GROUPS:
               1. Data In from GTH RX (312.5 MHz, 32-bit Continuous):
                  - clk_gth, gth_rx_dv, gth_rx_data[31:0], in_byte_stream[7:0],
                    in_clk_cnt (1..780), in_byte_cnt (1..3117), in_frame_id (1..4)
               2. Data Out from CDC 3 (200.0 MHz, 128-bit):
                  - clk_logic, cdc3_flag_out, cdc3_data_out[127:0],
                    out_clk_cnt (1..499 @ 200 MHz), out_word128_cnt (1..780),
                    out_byte_stream[7:0], out_frame_byte_cnt (1..3117),
                    out_total_bytes (1..12468), out_frame_id (1..4)

               Revision Notes:
               - [Rev 2026-10-21 13:45 KST]: Initialized total_word_idx = 0 
                 at t=0 in the initial block to eliminate the red 'X' value 
                 prior to 158.400 ns.
               - [Rev 2.0 - 2026-10-27 15:20 KST - ETRI Audit Item 1 Alignment]:
                 Updated 'get_frame_byte' (Bytes 1..9) from the simulation 
                 marker (55_55_55_55_55_55_55_55_D5) to the official SDA OISL 
                 v2.1.2 Table 2-8 72-bit Preamble (72'h77_AD_5B_58_43_64_1E_2E_26, 
                 MSB transmitted first) and added automatic verification of 
                 the extracted 128-bit words.
               - [Rev 2.1 - 2026-11-05 15:30 KST - Full 12,468-Byte Port Scoreboard & Watchdog]:
                 Added a full 12,468-byte reference scoreboard ('exp_in_bytes[0:12479]')
                 recording every input byte accepted on 'gth_rx_dv && gth_rx_data'
                 and verifying all 12,468 target output bytes unpacked directly from
                 the 128-bit output ports 'cdc3_flag_out' and 'cdc3_data_out'.
               - [Rev 2.2 - 2026-11-05 15:55 KST - Audit Section 2, 3 & 5 Closure]:
                 1. [Audit Sec. 2]: Appended 3 follow-on 32-bit words (12 follow-on
                    bytes) after the 4 target frames (3,117 target words = 12,468B +
                    3 follow-on words = 12B -> 3,120 total 32-bit words = 12,480B) so
                    the 780th 128-bit FIFO word commits naturally without RTL zero-flushing.
                    Separated input counters into 'in_target_words'/'in_target_bytes'
                    (3,117W / 12,468B) and 'in_follow_on_words'/'in_follow_on_bytes' (3W / 12B).
                 2. [Audit Sec. 3]: Accumulated per-byte mismatches within each 128-bit
                    output cycle using a blocking temporary integer ('word_mismatch_tmp')
                    before updating 'byte_mismatch_cnt' so multi-byte errors in a single
                    cycle are counted accurately.
                 3. [Audit Sec. 5]: Separated actual 128-bit port transfer timestamps
                    ('port_first_word_ns', 'port_last_word_ns', 'port_transfer_span_us'
                    measured directly on 'cdc3_flag_out' at 'posedge clk_logic') from
                    the visual byte-unpacker schedule metrics ('OISL_Frame_Duration_us').
===========================================================================
*/

module tb_cdc3_rx_gth_logic();

    reg clk_gth;   // 312.5 MHz (Period = 3.2 ns)
    reg clk_logic; // 200.0 MHz (Period = 5.0 ns)
    reg rst_n;

    // Group 1: Data In from GTH RX (312.5 MHz, 32-bit)
    reg         gth_rx_dv;
    reg  [31:0] gth_rx_data;
    reg  [7:0]  in_byte_stream;
    reg  [11:0] in_byte_cnt;    // Counts 1 to 3117 per target frame
    reg  [15:0] in_clk_cnt;     // Counts 1 to 780 per target frame (312.5 MHz)
    reg  [31:0] in_frame_id;    // Active Input Target Frame ID (1, 2, 3, 4; 0 during follow-on)

    // Group 2: Data Out from CDC 3 (200.0 MHz, 128-bit)
    wire         cdc3_flag_out;
    wire [127:0] cdc3_data_out;
    wire [15:0]  out_clk_cnt        = u_cdc3.out_clk_cnt;     // Counts 1 to 499 per frame (200 MHz)
    wire [15:0]  out_word128_cnt    = u_cdc3.out_word128_cnt; // Counts 1 to 780 (128-bit words)
    wire [7:0]   out_byte_stream    = u_cdc3.byte_out;        // 1-by-1 unpacked byte
    wire [11:0]  out_frame_byte_cnt = u_cdc3.frame_byte_cnt;  // Counts 1 to 3117 per frame
    wire [15:0]  out_total_bytes    = u_cdc3.out_total_bytes; // Counts 1 to 12468
    wire [31:0]  out_frame_id       = u_cdc3.frame_out_id;    // Active Output Frame ID (1, 2, 3, 4)

    // DUT Instantiation
    rx_gth_logic u_cdc3 (
        .clk_gth   (clk_gth),
        .clk_logic (clk_logic),
        .rst_n     (rst_n),
        .en        (gth_rx_dv),
        .data_in   (gth_rx_data),
        .flag      (cdc3_flag_out),
        .data_out  (cdc3_data_out)
    );

    // Clocks & Watchdog Timeout
    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;   // 312.5 MHz
    end

    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic; // 200.0 MHz
    end

    initial begin
        #200000;
        $fatal(1, "\n[TIMEOUT ERROR] tb_cdc3_rx_gth_logic did not complete within 200 us!\n");
    end

    // Frame Byte Pattern Function
    // [Rev 2.0 - 2026-10-27 15:20 KST] Bytes 1..9 updated to SDA OISL Table 2-8 Preamble:
    // 72'h77_AD_5B_58_43_64_1E_2E_26 (MSB 8'h77 transmitted first down to LSB 8'h26)
    function [7:0] get_frame_byte(input [31:0] f_idx, input [11:0] b_idx);
        begin
            case (b_idx)
                12'd1:                      get_frame_byte = 8'h77;
                12'd2:                      get_frame_byte = 8'hAD;
                12'd3:                      get_frame_byte = 8'h5B;
                12'd4:                      get_frame_byte = 8'h58;
                12'd5:                      get_frame_byte = 8'h43;
                12'd6:                      get_frame_byte = 8'h64;
                12'd7:                      get_frame_byte = 8'h1E;
                12'd8:                      get_frame_byte = 8'h2E;
                12'd9:                      get_frame_byte = 8'h26;
                12'd10:                     get_frame_byte = 8'hAA;
                12'd11:                     get_frame_byte = 8'hBB;
                12'd12:                     get_frame_byte = 8'hCC;
                12'd13:                     get_frame_byte = f_idx[7:0];
                12'd3105, 12'd3106:         get_frame_byte = 8'h99;
                12'd3107, 12'd3108:         get_frame_byte = 8'h88;
                12'd3109, 12'd3110:         get_frame_byte = 8'h77;
                12'd3111, 12'd3112:         get_frame_byte = 8'h66;
                12'd3113, 12'd3114:         get_frame_byte = 8'h55;
                12'd3115, 12'd3116:         get_frame_byte = 8'h44;
                12'd3117:                   get_frame_byte = 8'h33;
                default:                    get_frame_byte = b_idx[7:0];
            endcase
        end
    endfunction

    // =======================================================
    // FULL 12,468-BYTE TARGET SCOREBOARD & SEPARATED STIMULUS COUNTERS
    // - Target 4-frame stimulus : 3,117 words (32b) = 12,468 bytes
    // - Post-target follow-on   :     3 words (32b) =     12 bytes
    // - Total FIFO stimulus     : 3,120 words (32b) = 12,480 bytes (780 x 128b words)
    // =======================================================
    reg  [7:0]  exp_in_bytes [0:16383];
    integer     in_target_words_q       = 0;
    integer     in_target_bytes_q       = 0;
    integer     in_follow_on_words_q    = 0;
    integer     in_follow_on_bytes_q    = 0;
    integer     in_total_bytes_q        = 0;

    integer     out_port_words128_q     = 0;
    integer     out_port_target_bytes_q = 0;
    integer     out_follow_on_bytes_q   = 0;
    integer     byte_mismatch_cnt       = 0;
    integer     follow_on_mismatch_cnt  = 0;
    integer     word_mismatch_tmp       = 0;
    integer     follow_mismatch_tmp     = 0;
    integer     b_k;

    wire        in_is_target_now        = gth_rx_dv && (in_target_words_q < 3117);
    wire        in_is_follow_on_now     = gth_rx_dv && (in_target_words_q >= 3117);
    wire [31:0] in_target_words         = in_target_words_q    + (in_is_target_now    ? 32'd1 : 32'd0);
    wire [31:0] in_target_bytes         = in_target_bytes_q    + (in_is_target_now    ? 32'd4 : 32'd0);
    wire [31:0] in_follow_on_words      = in_follow_on_words_q + (in_is_follow_on_now ? 32'd1 : 32'd0);
    wire [31:0] in_follow_on_bytes      = in_follow_on_bytes_q + (in_is_follow_on_now ? 32'd4 : 32'd0);
    wire [31:0] in_total_stimulus_bytes = in_total_bytes_q     + (gth_rx_dv           ? 32'd4 : 32'd0);
    wire [31:0] in_accepted_bytes       = in_target_bytes; // Kept for WCFG compatibility (0..12468 target bytes)

    wire [31:0] out_port_words128       = out_port_words128_q + (cdc3_flag_out ? 32'd1 : 32'd0);
    wire [31:0] out_step_target_bytes   = !cdc3_flag_out ? 32'd0 :
                                          (out_port_target_bytes_q + 16 <= 12468) ? 32'd16 :
                                          (out_port_target_bytes_q < 12468) ? (12468 - out_port_target_bytes_q) : 32'd0;
    wire [31:0] out_port_target_bytes   = out_port_target_bytes_q + out_step_target_bytes;

    // Actual 128-bit Output Port Transfer Timestamps (Audit Section 5)
    real port_first_word_ns    = 0.0;
    real port_last_word_ns     = 0.0;
    real port_transfer_span_us = 0.0;

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            in_target_words_q    <= 0;
            in_target_bytes_q    <= 0;
            in_follow_on_words_q <= 0;
            in_follow_on_bytes_q <= 0;
            in_total_bytes_q     <= 0;
        end else if (gth_rx_dv) begin
            exp_in_bytes[in_total_bytes_q + 0] <= gth_rx_data[31:24];
            exp_in_bytes[in_total_bytes_q + 1] <= gth_rx_data[23:16];
            exp_in_bytes[in_total_bytes_q + 2] <= gth_rx_data[15:8];
            exp_in_bytes[in_total_bytes_q + 3] <= gth_rx_data[7:0];
            in_total_bytes_q                   <= in_total_bytes_q + 4;

            if (in_target_words_q < 3117) begin
                in_target_words_q <= in_target_words_q + 1;
                in_target_bytes_q <= in_target_bytes_q + 4;
            end else begin
                in_follow_on_words_q <= in_follow_on_words_q + 1;
                in_follow_on_bytes_q <= in_follow_on_bytes_q + 4;
            end
        end
    end

    // [Audit Sec. 3] Blocking per-word mismatch accumulation so multiple byte errors in one cycle are all counted
    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            out_port_words128_q     <= 0;
            out_port_target_bytes_q <= 0;
            out_follow_on_bytes_q   <= 0;
            byte_mismatch_cnt       <= 0;
            follow_on_mismatch_cnt  <= 0;
            port_first_word_ns      <= 0.0;
            port_last_word_ns       <= 0.0;
            port_transfer_span_us   <= 0.0;
        end else if (cdc3_flag_out) begin
            if (out_port_words128_q == 0)
                port_first_word_ns <= $realtime;
            if (out_port_words128_q == 779) begin
                port_last_word_ns     <= $realtime;
                port_transfer_span_us <= ($realtime - port_first_word_ns) / 1000.0;
            end

            word_mismatch_tmp   = 0;
            follow_mismatch_tmp = 0;
            for (b_k = 0; b_k < 16; b_k = b_k + 1) begin
                if (((out_port_words128_q * 16) + b_k) < 12468) begin
                    if ((^cdc3_data_out[127 - (b_k * 8) -: 8] === 1'bx) ||
                        (cdc3_data_out[127 - (b_k * 8) -: 8] !== exp_in_bytes[(out_port_words128_q * 16) + b_k])) begin
                        word_mismatch_tmp = word_mismatch_tmp + 1;
                    end
                end else if (((out_port_words128_q * 16) + b_k) < 12480) begin
                    if ((^cdc3_data_out[127 - (b_k * 8) -: 8] === 1'bx) ||
                        (cdc3_data_out[127 - (b_k * 8) -: 8] !== exp_in_bytes[(out_port_words128_q * 16) + b_k])) begin
                        follow_mismatch_tmp = follow_mismatch_tmp + 1;
                    end
                end
            end

            byte_mismatch_cnt      <= byte_mismatch_cnt + word_mismatch_tmp;
            follow_on_mismatch_cnt <= follow_on_mismatch_cnt + follow_mismatch_tmp;
            out_port_words128_q    <= out_port_words128_q + 1;

            if (out_port_target_bytes_q + 16 <= 12468) begin
                out_port_target_bytes_q <= out_port_target_bytes_q + 16;
            end else if (out_port_target_bytes_q < 12468) begin
                out_port_target_bytes_q <= 12468;
                out_follow_on_bytes_q   <= out_follow_on_bytes_q + 12;
            end
        end
    end

    integer total_word_idx;
    integer b0_abs, b1_abs, b2_abs, b3_abs;
    reg [7:0] byte0, byte1, byte2, byte3;

    task step_input_byte(input [7:0] b_val, input is_clk_edge);
        begin
            in_byte_stream <= b_val;
            if (in_frame_id == 32'd0) begin
                in_frame_id <= 32'd1;
                in_byte_cnt <= 12'd1;
                in_clk_cnt  <= 16'd1;
            end else if (in_byte_cnt == 12'd3117) begin
                in_frame_id <= in_frame_id + 32'd1;
                in_byte_cnt <= 12'd1;
                in_clk_cnt  <= 16'd1;
            end else begin
                in_byte_cnt <= in_byte_cnt + 12'd1;
                if (is_clk_edge)
                    in_clk_cnt <= in_clk_cnt + 16'd1;
            end
        end
    endtask

    initial begin
        rst_n          = 1'b0;
        gth_rx_dv      = 1'b0;
        gth_rx_data    = 32'd0;
        in_byte_stream = 8'd0;
        in_byte_cnt    = 12'd0;
        in_clk_cnt     = 16'd0;
        in_frame_id    = 32'd0;
        total_word_idx = 0;

        #100;
        rst_n = 1'b1;

        wait(u_cdc3.wr_rst_busy == 1'b0 && u_cdc3.rd_rst_busy == 1'b0);
        repeat (10) @(posedge clk_gth);

        // 1. Send 3,117 Target 32-Bit Words (4 x 3,117B = 12,468 Target Bytes)
        for (total_word_idx = 0; total_word_idx < 3117; total_word_idx = total_word_idx + 1) begin
            b0_abs = total_word_idx * 4;
            b1_abs = total_word_idx * 4 + 1;
            b2_abs = total_word_idx * 4 + 2;
            b3_abs = total_word_idx * 4 + 3;

            byte0 = get_frame_byte((b0_abs / 3117) + 1, (b0_abs % 3117) + 1);
            byte1 = get_frame_byte((b1_abs / 3117) + 1, (b1_abs % 3117) + 1);
            byte2 = get_frame_byte((b2_abs / 3117) + 1, (b2_abs % 3117) + 1);
            byte3 = get_frame_byte((b3_abs / 3117) + 1, (b3_abs % 3117) + 1);

            @(posedge clk_gth);
            gth_rx_dv   <= 1'b1;
            gth_rx_data <= {byte0, byte1, byte2, byte3};

            step_input_byte(byte0, 1'b1);
            #0.8 step_input_byte(byte1, 1'b0);
            #0.8 step_input_byte(byte2, 1'b0);
            #0.8 step_input_byte(byte3, 1'b0);
        end

        // 2. [Audit Sec. 2] Send 3 Follow-On 32-Bit Words (12 Bytes) after Frame 4
        //    so the 780th 128-bit FIFO word (12,468 + 12 = 12,480B) commits naturally
        for (total_word_idx = 3117; total_word_idx < 3120; total_word_idx = total_word_idx + 1) begin
            b0_abs = total_word_idx * 4;
            b1_abs = total_word_idx * 4 + 1;
            b2_abs = total_word_idx * 4 + 2;
            b3_abs = total_word_idx * 4 + 3;

            byte0 = get_frame_byte(32'd5, (b0_abs % 3117) + 1);
            byte1 = get_frame_byte(32'd5, (b1_abs % 3117) + 1);
            byte2 = get_frame_byte(32'd5, (b2_abs % 3117) + 1);
            byte3 = get_frame_byte(32'd5, (b3_abs % 3117) + 1);

            @(posedge clk_gth);
            gth_rx_dv      <= 1'b1;
            gth_rx_data    <= {byte0, byte1, byte2, byte3};
            // Keep target frame counters at 0 during the 3 post-target follow-on words
            in_byte_stream <= 8'd0;
            in_byte_cnt    <= 12'd0;
            in_clk_cnt     <= 16'd0;
            in_frame_id    <= 32'd0;
        end

        @(posedge clk_gth);
        gth_rx_dv      <= 1'b0;
        gth_rx_data    <= 32'd0;
        in_byte_stream <= 8'd0;
        in_byte_cnt    <= 12'd0;
        in_clk_cnt     <= 16'd0;
        in_frame_id    <= 32'd0;
    end

    // =======================================================
    // VISUAL UNPACKER SCHEDULE METRICS (0.8 ns/byte Visual Monitor)
    // Note per Audit Section 5: These metrics represent the scheduled
    // 0.8 ns/byte visual unpacker window ('out_frame_id'), whereas actual
    // 128-bit port transfer timestamps are recorded in 'port_first_word_ns'
    // and 'port_last_word_ns'.
    // =======================================================
    real last_gth_edge_ns;
    real measured_gth_period_ns;
    real measured_byte_time_ns;

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
        last_gth_edge_ns              = 0.0;
        measured_gth_period_ns        = 0.0;
        measured_byte_time_ns         = 0.0;
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

    always @(posedge clk_gth) begin
        if (last_gth_edge_ns > 0.0) begin
            measured_gth_period_ns = $realtime - last_gth_edge_ns;
            measured_byte_time_ns  = measured_gth_period_ns / 4.0;
        end
        last_gth_edge_ns = $realtime;
    end

    always @(out_frame_id) begin
        if (out_frame_id >= 32'd1 && out_frame_id <= 32'd4) begin
            if (out_frame_id > 32'd1 && chk_frame_started[out_frame_id - 1] && !chk_frame_done[out_frame_id - 1]) begin
                obs_time_end_ns       = $realtime;
                obs_frame_duration_us = (obs_time_end_ns - chk_frame_start_ns[out_frame_id - 1]) / 1000.0;
                timing_diff_ns        = (obs_time_end_ns >= chk_exp_end_ns[out_frame_id - 1]) ?
                                        (obs_time_end_ns - chk_exp_end_ns[out_frame_id - 1]) :
                                        (chk_exp_end_ns[out_frame_id - 1] - obs_time_end_ns);
                if (timing_diff_ns > 0.01)
                    timing_mismatch_cnt = timing_mismatch_cnt + 1;
                chk_frame_done[out_frame_id - 1] = 1'b1;
                timing_checked_frames            = timing_checked_frames + 1;
            end

            chk_frame_started[out_frame_id]  = 1'b1;
            chk_frame_start_ns[out_frame_id] = $realtime;
            chk_exp_end_ns[out_frame_id]     = $realtime + (3117.0 * measured_byte_time_ns);

            time_start = chk_frame_start_ns[out_frame_id];
            time_end   = chk_exp_end_ns[out_frame_id];

            OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
            OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
            OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
            OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

            $display("---------------------------------------------------------------");
            $display(" [CDC 3 VISUAL MONITOR] FRAME %0d ACTIVE (3117 Bytes Scheduled Unpack)", out_frame_id);
            $display(" vis_time_start : %0.1f ns | vis_time_end : %0.1f ns", time_start, time_end);
            $display(" Vis Duration   : %0.6f us", OISL_Frame_Duration_us);
            $display(" Effective Rate : %0.6f Mbps", OISL_Effective_Data_Rate_Mbps);
            $display(" Frame Rate     : %0.6f kHz  | FCCH Rate: %0.6f Mbps", OISL_Frame_Rate_kHz, OISL_FCCH_Mbps);
            $display("---------------------------------------------------------------");
        end else if (out_frame_id == 32'd0) begin
            if (chk_frame_started[4] && !chk_frame_done[4]) begin
                obs_time_end_ns       = $realtime;
                obs_frame_duration_us = (obs_time_end_ns - chk_frame_start_ns[4]) / 1000.0;
                timing_diff_ns        = (obs_time_end_ns >= chk_exp_end_ns[4]) ?
                                        (obs_time_end_ns - chk_exp_end_ns[4]) :
                                        (chk_exp_end_ns[4] - obs_time_end_ns);
                if (timing_diff_ns > 0.01)
                    timing_mismatch_cnt = timing_mismatch_cnt + 1;
                chk_frame_done[4]     = 1'b1;
                timing_checked_frames = timing_checked_frames + 1;
            end
            time_start                    = 0.0;
            time_end                      = 0.0;
            OISL_Frame_Duration_us        = 0.0;
            OISL_Effective_Data_Rate_Mbps = 0.0;
            OISL_Frame_Rate_kHz           = 0.0;
            OISL_FCCH_Mbps                = 0.0;
        end
    end

    initial begin
        wait(out_port_words128_q == 780);
        wait(out_total_bytes == 16'd12468);
        wait(out_frame_id == 32'd0);
        #500;
        $display("\n======================================================================");
        $display(" CDC 3 (rx_gth_logic) PORT-LEVEL VERIFICATION REPORT (AUDIT SEC. 1-5)");
        $display(" -> Target Input (4 Frames)    : %0d Words (32b) = %0d Bytes (Expected: 3117W / 12468B)",
                 in_target_words_q, in_target_bytes_q);
        $display(" -> Follow-On Input After Fr.4 : %0d Words (32b) = %0d Bytes (Expected: 3W / 12B)",
                 in_follow_on_words_q, in_follow_on_bytes_q);
        $display(" -> Total Stimulus In          : %0d Words (32b) = %0d Bytes (Expected: 3120W / 12480B)",
                 in_target_words_q + in_follow_on_words_q, in_total_bytes_q);
        $display(" -> FIFO Output 128-Bit Words  : %0d Words (128b) = %0d Bytes (Expected: 780W / 12480B)",
                 out_port_words128_q, out_port_words128_q * 16);
        $display(" -> Target Bytes Compared      : %0d Bytes (Target Mismatches: %0d, Follow-On Mismatches: %0d)",
                 out_port_target_bytes_q, byte_mismatch_cnt, follow_on_mismatch_cnt);
        $display(" -> Actual Port Transfer Window: Word 1 @ %0.1f ns -> Word 780 @ %0.1f ns (Span: %0.6f us)",
                 port_first_word_ns, port_last_word_ns, port_transfer_span_us);
        $display(" -> Visual Unpacker Schedule   : %0d Frames @ 2.493600 us/frame (Schedule Mismatches: %0d)",
                 timing_checked_frames, timing_mismatch_cnt);
        if (in_target_words_q == 3117 && in_target_bytes_q == 12468 &&
            in_follow_on_words_q == 3 && in_follow_on_bytes_q == 12 &&
            in_total_bytes_q == 12480 && out_port_words128_q == 780 &&
            out_port_target_bytes_q == 12468 && byte_mismatch_cnt == 0 &&
            follow_on_mismatch_cnt == 0 && timing_checked_frames == 4 && timing_mismatch_cnt == 0) begin
            $display(" -> RESULT: [PASS] 780 x 128b words (12,480B total) carrying 12,468 target bytes + 12 follow-on bytes verified with 0 mismatches.");
        end else begin
            $fatal(1, " -> RESULT: [FAIL] CDC 3 byte/word count, timing, or data comparison mismatch!");
        end
        $display("======================================================================\n");
        $finish;
    end

endmodule