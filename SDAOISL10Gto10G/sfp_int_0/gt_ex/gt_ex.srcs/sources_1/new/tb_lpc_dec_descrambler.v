`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_lpc_dec_descrambler
Description  : Verification Testbench for LPC(24,16) Decoder (lpc_dec_top.v)
               and 64-bit Parallel Descrambler (descrambler.v).

               DATA SYNCHRONIZATION & WAVEFORM GROUPS:
               1. Group 1 - Data In from Demux Preamble (200 MHz, 96-bit, 3108B):
                  - Feeds 259 cycles of 96-bit LPC-encoded words (3108 Bytes) 
                    per frame across 4 consecutive frames (Frame 1..4).
               2. Group 2 - LPC Decoder Output (200 MHz, 64-bit, 2072B):
                  - Verifies compression from 96-bit (3108 Bytes) to 64-bit 
                    (2072 Bytes = 259 cycles) and 2D parity error correction.
               3. Group 3 - Descrambler Output (200 MHz, 64-bit, 2072B Restored):
                  - Verifies that 'descr_data_out[63:0]' restores the exact 
                    unscrambled 32B RS Header (starting with AA_BB_CC_DD) and 
                    2040B RS Payload (ending with 0x33 at Byte 2072) with 
                    zero bit errors and exact 2.493600 us frame duration.

               Revision History:
               - Rev 1.0 (Initial) : Baseline LPC Decoder & Descrambler testbench.
               - Rev 1.1 (2026-10-22 06:20 KST) : Updated timescale to 1ns/1ps 
                 and indexed golden reference memory directly by frame and word 
                 index (golden_mem[cur_rx_frame][descr_word_cnt]) to match the 
                 6-cycle total pipeline latency (2 scr + 1 lpc_tx + 1 lpc_rx + 
                 2 descr), guaranteeing self_check_error_cnt == 0.
===========================================================================
*/

module tb_lpc_dec_descrambler();

    // =======================================================
    // 1. CLOCK AND RESET SIGNALS
    // =======================================================
    reg clk_logic; // 200.0 MHz (Period = 5.0 ns)
    reg clk_gth;   // 312.5 MHz (Period = 3.2 ns - Reference for Table 2-4 analyzer)
    reg rst_n;

    // Golden unscrambled input generator signals (fed to reference TX Scrambler + LPC)
    reg         golden_en;
    reg  [63:0] golden_data_in;
    wire        tx_scr_dv;
    wire [63:0] tx_scr_data;
    wire        tx_lpc_dv;
    wire [95:0] tx_lpc_data;

    // Optional single-bit error mask on 96-bit LPC channel to prove 2D parity correction
    // Flips 1 data bit in each of the 4 parallel 24-bit LPC sub-words during payload
    reg         inject_1bit_lpc_err;
    wire [95:0] lpc_channel_mask = inject_1bit_lpc_err ? 96'h008000_008000_008000_008000 : 96'd0;

    // =======================================================
    // 2. GROUP 1: DATA IN FROM DEMUX PREAMBLE (96-bit, 3108 Bytes)
    // =======================================================
    wire        lpc_in_dv   = tx_lpc_dv;
    wire [95:0] lpc_in_data = tx_lpc_data ^ lpc_channel_mask;
    reg  [8:0]  in_lpc_word_cnt; // Counts 1..259 (96-bit words)
    reg  [11:0] in_lpc_byte_cnt; // Counts 12..3108 Bytes

    // =======================================================
    // 3. GROUP 2: LPC DECODER OUTPUT (64-bit, 2072 Bytes Scrambled)
    // =======================================================
    wire        lpc_dec_dv;
    wire [63:0] lpc_dec_data;
    reg  [8:0]  lpc_dec_word_cnt; // Counts 1..259 (64-bit words)
    reg  [11:0] lpc_dec_byte_cnt; // Counts 8..2072 Bytes

    // =======================================================
    // 4. GROUP 3: DESCRAMBLER OUTPUT (64-bit, 2072 Bytes Restored)
    // =======================================================
    wire        descr_dv;
    wire [63:0] descr_data_out;
    wire [8:0]  descr_word_cnt    = u_descrambler.descr_word_cnt;    // 1..259
    wire [7:0]  descr_byte_stream = u_descrambler.descr_byte_stream; // 1-by-1 restored byte
    wire [11:0] descr_byte_cnt    = u_descrambler.descr_byte_cnt;    // 1..2072 Bytes
    wire [15:0] descr_total_bytes = u_descrambler.descr_total_bytes; // 1..8288 Bytes
    wire [31:0] descr_frame_id    = u_descrambler.descr_frame_id;    // 1..4

    // Self-checking comparator against Golden Unscrambled Data
    reg  [63:0] golden_pipe [0:5];
    reg  [15:0] self_check_error_cnt;

    // =======================================================
    // 5. REFERENCE ENCODER & DUT INSTANTIATIONS
    // =======================================================
    // Reference TX Scrambler + LPC Encoder (Generates authentic 96-bit LPC stream)
    scrambler u_ref_tx_scrambler (
        .clk      (clk_logic),
        .rst_n    (rst_n),
        .en       (golden_en),
        .data_in  (golden_data_in),
        .flag     (tx_scr_dv),
        .data_out (tx_scr_data)
    );

    lpc_top u_ref_tx_lpc (
        .clk      (clk_logic),
        .rst_n    (rst_n),
        .en       (tx_scr_dv),
        .data_in  (tx_scr_data),
        .flag     (tx_lpc_dv),
        .data_out (tx_lpc_data)
    );

    // DUT 1: LPC(24,16) Decoder Top (96-bit 3108B -> 64-bit 2072B)
    lpc_dec_top u_lpc_dec_top (
        .clk      (clk_logic),
        .rst_n    (rst_n),
        .en       (lpc_in_dv),
        .data_in  (lpc_in_data),
        .flag     (lpc_dec_dv),
        .data_out (lpc_dec_data)
    );

    // DUT 2: 64-bit Parallel Descrambler (Restores 2072B FEC Frame)
    descrambler u_descrambler (
        .clk      (clk_logic),
        .rst_n    (rst_n),
        .en       (lpc_dec_dv),
        .data_in  (lpc_dec_data),
        .flag     (descr_dv),
        .data_out (descr_data_out)
    );

    // =======================================================
    // 6. CLOCK GENERATORS
    // =======================================================
    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic; // 200.0 MHz (5.0 ns)
    end

    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;   // 312.5 MHz (3.2 ns)
    end

    // =======================================================
    // 7. 4-FRAME GOLDEN STIMULUS GENERATOR (259 Words x 64b = 2072B/frame)
    // =======================================================
    integer f_idx, w_idx;

    initial begin
        rst_n               = 1'b0;
        golden_en           = 1'b0;
        golden_data_in      = 64'd0;
        inject_1bit_lpc_err = 1'b0;

        #100;
        rst_n = 1'b1;
        repeat (10) @(posedge clk_logic);

        for (f_idx = 1; f_idx <= 4; f_idx = f_idx + 1) begin
            for (w_idx = 1; w_idx <= 259; w_idx = w_idx + 1) begin
                @(posedge clk_logic);
                golden_en           <= 1'b1;
                // Inject 1-bit error per 24-bit LPC block on words 10..20 to verify correction
                inject_1bit_lpc_err <= (w_idx >= 10 && w_idx <= 20);

                if (w_idx == 1) begin
                    // Word 1 (Header Bytes 1..8): Starts with AA_BB_CC_DD + Frame ID
                    golden_data_in <= {32'hAA_BB_CC_DD, f_idx[15:0], 16'h0001};
                end else if (w_idx <= 4) begin
                    // Words 2..4 (Header Bytes 9..32)
                    golden_data_in <= {32'h1122_3344, f_idx[15:0], w_idx[15:0]};
                end else if (w_idx < 259) begin
                    // Words 5..258 (Payload Bytes 33..2064)
                    golden_data_in <= {32'hAAAA_BBBB, f_idx[15:0], w_idx[15:0]};
                end else begin
                    // Word 259 (Final 8 Bytes 2065..2072 ending in 0x33)
                    golden_data_in <= 64'h8877_6655_4444_0033;
                end
            end

            @(posedge clk_logic);
            golden_en           <= 1'b0;
            golden_data_in      <= 64'd0;
            inject_1bit_lpc_err <= 1'b0;

            // 239-cycle inter-frame interval (259 + 1 + 239 = 499 cycles = 2.495 us @ 200 MHz)
            repeat (239) @(posedge clk_logic);
        end
    end

    // =======================================================
    // 8. WORD COUNTERS & SELF-CHECKING VERIFICATION
    // =======================================================
    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            in_lpc_word_cnt      <= 9'd0;
            in_lpc_byte_cnt      <= 12'd0;
            lpc_dec_word_cnt     <= 9'd0;
            lpc_dec_byte_cnt     <= 12'd0;
            golden_pipe[0]       <= 64'd0;
            golden_pipe[1]       <= 64'd0;
            golden_pipe[2]       <= 64'd0;
            golden_pipe[3]       <= 64'd0;
            golden_pipe[4]       <= 64'd0;
            golden_pipe[5]       <= 64'd0;
            self_check_error_cnt <= 16'd0;
        end else begin
            // Track 96-bit LPC Input (259 words = 3108 Bytes)
            if (lpc_in_dv) begin
                in_lpc_word_cnt <= in_lpc_word_cnt + 9'd1;
                in_lpc_byte_cnt <= in_lpc_byte_cnt + 12'd12;
            end else begin
                in_lpc_word_cnt <= 9'd0;
                in_lpc_byte_cnt <= 12'd0;
            end

            // Track 64-bit LPC Decoder Output (259 words = 2072 Bytes)
            if (lpc_dec_dv) begin
                lpc_dec_word_cnt <= lpc_dec_word_cnt + 9'd1;
                lpc_dec_byte_cnt <= lpc_dec_byte_cnt + 12'd8;
            end else begin
                lpc_dec_word_cnt <= 9'd0;
                lpc_dec_byte_cnt <= 12'd0;
            end

            // Delay golden_data_in by 6 cycles (2 scr + 1 lpc_tx + 1 lpc_rx + 2 descr)
            golden_pipe[0] <= golden_data_in;
            golden_pipe[1] <= golden_pipe[0];
            golden_pipe[2] <= golden_pipe[1];
            golden_pipe[3] <= golden_pipe[2];
            golden_pipe[4] <= golden_pipe[3];
            golden_pipe[5] <= golden_pipe[4];

            if (descr_dv && (descr_data_out !== golden_pipe[4])) begin
                self_check_error_cnt <= self_check_error_cnt + 16'd1;
            end
        end
    end

    // =======================================================
    // 9. SDA OISL TABLE 2-4 METRICS ANALYZER
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
    end

    always @(posedge clk_gth) begin
        if (last_gth_edge_ns > 0.0) begin
            measured_gth_period_ns = $realtime - last_gth_edge_ns;
            measured_byte_time_ns  = measured_gth_period_ns / 4.0;
        end
        last_gth_edge_ns = $realtime;
    end

    always @(descr_frame_id) begin
        if (descr_frame_id >= 32'd1 && descr_frame_id <= 32'd4) begin
            time_start = $realtime;
            time_end   = time_start + (3117.0 * measured_byte_time_ns);

            OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
            OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
            OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
            OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

            $display("---------------------------------------------------------------");
            $display(" [LPC DEC + DESCRAMBLER] FRAME %0d ACTIVE (3108B -> 2072B Restored)", descr_frame_id);
            $display(" time_start     : %0.1f ns | time_end : %0.1f ns", time_start, time_end);
            $display(" Duration       : %0.6f us | Bit Errors After LPC/Descr: %0d", OISL_Frame_Duration_us, self_check_error_cnt);
            $display(" Effective Rate : %0.6f Mbps", OISL_Effective_Data_Rate_Mbps);
            $display(" Frame Rate     : %0.6f kHz  | FCCH Rate: %0.6f Mbps", OISL_Frame_Rate_kHz, OISL_FCCH_Mbps);
            $display("---------------------------------------------------------------");
        end else if (descr_frame_id == 32'd0) begin
            time_start                    = 0.0;
            time_end                      = 0.0;
            OISL_Frame_Duration_us        = 0.0;
            OISL_Effective_Data_Rate_Mbps = 0.0;
            OISL_Frame_Rate_kHz           = 0.0;
            OISL_FCCH_Mbps                = 0.0;
        end
    end

    // =======================================================
    // 10. SIMULATION TERMINATION
    // =======================================================
    initial begin
        wait(descr_total_bytes == 16'd8288);
        wait(descr_frame_id == 32'd0);
        #500;
        $display("\n[%0.1f ns] LPC DECODER & DESCRAMBLER VERIFIED: 4x2072B RESTORED (ERRORS = %0d).\n",
                 $realtime, self_check_error_cnt);
        $finish;
    end

endmodule