`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : High-Precision SDA OISL Testbench for CDC 1 (x_gth_logic.v).

               CRITICAL REVISION:
               - Redesigned the stimulus generator using a pure FSM approach.
               - Eliminated all off-by-one index shifting bugs.
               - Achieved absolute True Zero-Gap streaming (en_head and en_load 
                 never drop to 0 between frames unless backpressured).
               - SDA OISL Geometry Compliance (16-Byte Header & 478-Word Payload).

               Scenario (4 Sequential Frames):
               - Frame 1: DATA (1912B) - First 1900B of Jumbo Eth
               - Frame 2: DATA (1912B) - Remaining 100B Eth + Padding
               - Frame 3: IDLE (1912B) - PRBS Filler
               - Frame 4: MGMT (1912B) - Telemetry

Revision History:
  - Rev 1.0 (Initial) : 4-frame Zero-Gap CDC 1 testbench.
  - Rev 2.0 (2026-10-27 15:11 KST) : [Target B2 Verification - C_PRELOAD_LATENCY = 2 Alignment]
    1. Aligned Header byte 1 (d0 = TXFN[7:0]) and byte 2 (d1 = TXFN[15:8]) with 
       SDA OISL Table 2-10 LSB-first ordering.
    2. Added automatic boundary value verification proving that with the +2 
       latency fix in x_gth_logic.v Rev 2.0:
       - Header Byte 1  is {4'd0, frame_id} (no leading 8'h00 shift!)
       - Header Byte 16 is 8'hC2 (CRC-16 LSB is never truncated!)
       - Payload Word 1 is 64'hAB00_0000_CDEF_07D0 (FSO Headers intact!)
       - Payload Word 239 [31:0] is 32'hC3C3_C3C3 (CRC-32 trailer is never truncated!)
  - Rev 2.1 (2026-11-01 15:49 KST) : [Audit Fix - Signal Case Alignment]
    Corrected the identifier capitalization typo on line 127 from 
    'out_header_Byte_idx' to 'out_header_byte_idx' so the 16th header byte 
    CRC-16 tail check ('hdr_crc16_tail_ok_cnt == 4') evaluates properly.
  - Rev 2.2 (2026-11-05 04:30 KST) : [Full-Transfer Scoreboard, Watchdog Timeout & Scoped Verdict]
    1. Added reference capture memories ('exp_hdr_mem[0:63]' and 'exp_pld_mem[0:1911]')
       recording every header byte and 32-bit payload word accepted by u_cdc_tx_1,
       and verified every single output transfer (all 64 header bytes and all 956
       64-bit payload words) against the expected FIFO sequence ('hdr_mismatch_cnt == 0'
       and 'pld_mismatch_cnt == 0').
    2. Added a simulation watchdog timeout guard and replaced passive '[FAIL]' logging
       with '$fatal(1, ...)' on any count or content mismatch.
    3. Scoped the testbench verdict to state explicitly that the 'DAT1/DAT2/IDLE/MGMT'
       labels represent synthetic 4-frame transport patterns verifying CDC 1 width
       conversion and +2 latency alignment.
  - Rev 2.3 (2026-11-05 04:50 KST) : [Zero-Lag Waveform Counter & Active Frame ID Alignment]
    Added zero-lag active transfer index wires and read-domain frame indicators.
  - Rev 2.4 (2026-11-05 05:00 KST) : [Zero-Lag Cumulative Progress & Full-Frame Read Window Alignment]
    1. Defined 'verified_header_bytes', 'verified_payload_words', 'hdr_crc16_tail_ok_cnt',
       and 'pld_crc32_tail_ok_cnt' as zero-lag cumulative counters ('total_q + (dv ? 1 : 0)')
       so they increment immediately on the active clock edge (1..16, 17..32, 33..48,
       49..64 and 1..239, 240..478, 479..717, 718..956 with zero 1-cycle lag) while
       holding their completed totals (16/32/48/64, 239/478/717/956, and 1/2/3/4)
       cleanly between bursts in full-timeline waveform views.
    2. Kept per-burst counters ('out_header_byte_idx' 1..16 and 'out_payload_word_idx'
       1..239) at 0 whenever 'header_dv' / 'payload_dv' is low, and aligned 'out_frame_id'
       with 'u_cdc_tx_1.state == ACTIVE' so each read frame displays continuously.
===========================================================================
*/

module tb_x_gth_logic();

    // =======================================================
    // 1. SYSTEM CLOCKS AND RESET
    // =======================================================
    reg clk_gth;   // Fast Write Domain Clock : 312.5 MHz (Period: 3.2 ns)
    reg clk_logic; // Slow Read Domain Clock  : 200.0 MHz (Period: 5.0 ns)
    reg rst_n;

    // =======================================================
    // 2. DEVICE UNDER TEST (DUT) SIGNALS
    // =======================================================
    reg         en_head;
    reg  [7:0]  header_in;
    reg         en_load;
    reg  [31:0] payload_in;

    wire        cdc_ready;
    wire        header_dv;
    wire [7:0]  header_out;
    wire        payload_dv;
    wire [63:0] payload_out;

    // =======================================================
    // 3. VISUALIZATION AND TRACKING VARIABLES (For Vivado)
    //    Note: 'DAT1/DAT2/IDLE/MGMT' labels identify the 4 synthetic
    //          transport test frames for CDC 1 verification.
    // =======================================================
    localparam ST_INIT   = 2'd0;
    localparam ST_STREAM = 2'd1;
    localparam ST_DONE   = 2'd2;
    reg  [1:0]  tb_state;

    // ASCII String to dynamically display Write-Domain Frame Type (Set Radix to ASCII)
    reg  [31:0] mux_frame_type_str; 

    // Write-Domain Frame Tracker (0 before start & after completion; 1 to 4 during ST_STREAM)
    reg  [3:0]  raw_in_frame_id;
    wire [3:0]  current_frame_id = (tb_state == ST_STREAM) ? raw_in_frame_id : 4'd0;

    // --- INPUT INDICES (0 when inactive; 1..16 and 1..478 during active transfers) ---
    reg  [4:0]  raw_hdr_in_idx;     // 0..15 during active 16-byte header, 16 when parked
    reg  [15:0] raw_pld_in_idx;     // 0..477 during active 478-word payload
    wire        hdr_in_active       = en_head && !u_cdc_tx_1.head_full && !u_cdc_tx_1.head_wr_rst_busy;
    wire        pld_in_active       = en_load && cdc_ready;
    wire [4:0]  header_byte_index   = hdr_in_active ? (raw_hdr_in_idx + 5'd1)  : 5'd0;
    wire [15:0] payload_word_index  = pld_in_active ? (raw_pld_in_idx + 16'd1) : 16'd0;

    // --- OUTPUT INDICES & ZERO-LAG WAVEFORM VISUALIZERS ---
    // Persistent internal registers (Hold value when valid is low per Audit guideline)
    reg  [4:0]  out_header_cnt_reg;
    reg  [7:0]  out_payload_cnt_reg;
    reg  [31:0] total_hdr_bytes_q;
    reg  [31:0] total_pld_words_q;
    reg  [31:0] hdr_crc16_tail_ok_q;
    reg  [31:0] pld_crc32_tail_ok_q;
    reg  [2:0]  out_pld_frame_idx_q;

    // Per-Frame Output Counters (0 when valid is low; 1..16 and 1..239 when valid is high)
    wire [4:0]  out_header_byte_idx    = header_dv  ? (out_header_cnt_reg + 5'd1)  : 5'd0;
    wire [7:0]  out_payload_word_idx   = payload_dv ? (out_payload_cnt_reg + 8'd1) : 8'd0;

    wire        hdr_tail_hit_now       = header_dv  && (out_header_byte_idx == 5'd16)   && (header_out == 8'hC2);
    wire        pld_tail_hit_now       = payload_dv && (out_payload_word_idx == 8'd239) && (payload_out[31:0] == 32'hC3C3_C3C3);

    // Zero-Lag Cumulative Progress Counters:
    // - Update on the exact active clock edge (word 1 = 1, word 239 = 239; byte 1 of frame 2 = 17, byte 16 = 32)
    // - Hold completed totals (16 -> 32 -> 48 -> 64, 239 -> 478 -> 717 -> 956, 1 -> 2 -> 3 -> 4) between bursts
    wire [31:0] verified_header_bytes  = total_hdr_bytes_q   + (header_dv        ? 32'd1 : 32'd0);
    wire [31:0] verified_payload_words = total_pld_words_q   + (payload_dv       ? 32'd1 : 32'd0);
    wire [31:0] hdr_crc16_tail_ok_cnt  = hdr_crc16_tail_ok_q + (hdr_tail_hit_now ? 32'd1 : 32'd0);
    wire [31:0] pld_crc32_tail_ok_cnt  = pld_crc32_tail_ok_q + (pld_tail_hit_now ? 32'd1 : 32'd0);

    // Read-Domain Active Frame ID & Label (follows u_cdc_tx_1.state == ACTIVE: 1..4 during active frame, 0 when IDLE)
    wire        rd_frame_active        = (u_cdc_tx_1.state == 3'b010);
    wire [3:0]  out_frame_id           = rd_frame_active ? ({1'b0, out_pld_frame_idx_q} + 4'd1) : 4'd0;
    wire [31:0] out_frame_type_str     = (out_frame_id == 4'd1) ? "DAT1" :
                                         (out_frame_id == 4'd2) ? "DAT2" :
                                         (out_frame_id == 4'd3) ? "IDLE" :
                                         (out_frame_id == 4'd4) ? "MGMT" : "WAIT";

    // Reference Scoreboard Memories & Error Counters
    reg  [7:0]  exp_hdr_mem [0:127];
    reg  [31:0] exp_pld_mem [0:2047];
    integer     wr_hdr_ptr       = 0;
    integer     wr_pld_ptr       = 0;
    integer     hdr_mismatch_cnt = 0;
    integer     pld_mismatch_cnt = 0;

    // =======================================================
    // 4. DUT INSTANTIATION
    // =======================================================
    x_gth_logic u_cdc_tx_1 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en_head    (en_head),
        .en_load    (en_load),
        .header_in  (header_in),
        .payload_in (payload_in),
        .cdc_ready  (cdc_ready),
        .header_dv  (header_dv),
        .header     (header_out),
        .payload_dv (payload_dv),
        .payload    (payload_out)
    );

    // =======================================================
    // 5. CLOCK GENERATION, TIMEOUT GUARD & FULL SCOREBOARD
    // =======================================================
    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth; // 312.5 MHz
    end

    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic; // 200.0 MHz
    end

    // Watchdog Timeout Guard
    initial begin
        #200000;
        $fatal(1, "\n[TIMEOUT ERROR] tb_x_gth_logic did not complete within 200 us!\n");
    end

    // Capture every stimulus byte/word accepted by the DUT in clk_gth domain
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            wr_hdr_ptr <= 0;
            wr_pld_ptr <= 0;
        end else begin
            if (hdr_in_active) begin
                exp_hdr_mem[wr_hdr_ptr] <= header_in;
                wr_hdr_ptr              <= wr_hdr_ptr + 1;
            end
            if (pld_in_active) begin
                exp_pld_mem[wr_pld_ptr] <= payload_in;
                wr_pld_ptr              <= wr_pld_ptr + 1;
            end
        end
    end

    // Sequential Tracker & Full-Transfer Comparator in clk_logic domain
    // (Indices hold their values when header_dv / payload_dv is low)
    wire [63:0] exp_pld_word64 = {exp_pld_mem[total_pld_words_q * 2],
                                  exp_pld_mem[total_pld_words_q * 2 + 1]};

    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            out_header_cnt_reg  <= 5'd0;
            out_payload_cnt_reg <= 8'd0;
            total_hdr_bytes_q   <= 32'd0;
            total_pld_words_q   <= 32'd0;
            hdr_mismatch_cnt    <= 0;
            pld_mismatch_cnt    <= 0;
            hdr_crc16_tail_ok_q <= 32'd0;
            pld_crc32_tail_ok_q <= 32'd0;
            out_pld_frame_idx_q <= 3'd0;
        end else begin
            // Track & Compare Header (16 Bytes: d0..d15 per frame, 64 Bytes total)
            if (header_dv) begin
                if (header_out !== exp_hdr_mem[total_hdr_bytes_q])
                    hdr_mismatch_cnt <= hdr_mismatch_cnt + 1;

                if (out_header_cnt_reg == 5'd15)
                    out_header_cnt_reg <= 5'd0;
                else
                    out_header_cnt_reg <= out_header_cnt_reg + 5'd1;

                total_hdr_bytes_q <= total_hdr_bytes_q + 32'd1;
                if (hdr_tail_hit_now)
                    hdr_crc16_tail_ok_q <= hdr_crc16_tail_ok_q + 32'd1;
            end

            // Track & Compare Payload (239 Words @ 64-bit = 1912 Bytes per frame, 956 Words total)
            if (payload_dv) begin
                if (payload_out !== exp_pld_word64)
                    pld_mismatch_cnt <= pld_mismatch_cnt + 1;

                if (out_payload_cnt_reg == 8'd238)
                    out_payload_cnt_reg <= 8'd0;
                else
                    out_payload_cnt_reg <= out_payload_cnt_reg + 8'd1;

                total_pld_words_q <= total_pld_words_q + 32'd1;
                if (pld_tail_hit_now)
                    pld_crc32_tail_ok_q <= pld_crc32_tail_ok_q + 32'd1;
            end

            if (u_cdc_tx_1.state == 3'b100) begin // END state of each read frame
                out_pld_frame_idx_q <= out_pld_frame_idx_q + 3'd1;
            end
        end
    end

    // =======================================================
    // 6. MAIN SCENARIO: TWO-PROCESS FSM ARCHITECTURE
    // =======================================================
    // --- PROCESS 1: SEQUENTIAL LOGIC (Index & State Management) ---
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            tb_state        <= ST_INIT;
            raw_in_frame_id <= 4'd1;
            raw_hdr_in_idx  <= 5'd0;
            raw_pld_in_idx  <= 16'd0;
        end else begin
            case (tb_state)
                ST_INIT: begin
                    // Wait for CDC FIFOs to assert ready before transmitting
                    if (cdc_ready) begin
                        tb_state        <= ST_STREAM;
                        raw_in_frame_id <= 4'd1;
                        raw_hdr_in_idx  <= 5'd0;
                        raw_pld_in_idx  <= 16'd0;
                    end
                end

                ST_STREAM: begin
                    // Backpressure Check: Hold indices if CDC is not ready
                    if (cdc_ready) begin
                        
                        // 1. Advance Payload Index (0..477 -> 478 Words)
                        if (raw_pld_in_idx < 16'd477) begin
                            raw_pld_in_idx <= raw_pld_in_idx + 16'd1;
                        end else begin
                            // End of Frame Reached
                            if (raw_in_frame_id < 4'd4) begin
                                // Zero-Gap Transition to next frame
                                raw_in_frame_id <= raw_in_frame_id + 4'd1;
                                raw_pld_in_idx  <= 16'd0;
                                raw_hdr_in_idx  <= 5'd0;
                            end else begin
                                // All 4 frames transmitted
                                tb_state        <= ST_DONE;
                                raw_pld_in_idx  <= 16'd0;
                                raw_hdr_in_idx  <= 5'd16;
                            end
                        end

                        // 2. Advance Header Index (0..15 -> 16 Bytes, then park at 16)
                        if ((raw_pld_in_idx < 16'd477) && (raw_hdr_in_idx < 5'd16)) begin
                            raw_hdr_in_idx <= raw_hdr_in_idx + 5'd1;
                        end
                    end
                end

                ST_DONE: begin
                    raw_hdr_in_idx <= 5'd16;
                    raw_pld_in_idx <= 16'd0;
                end
            endcase
        end
    end

    // --- PROCESS 2: COMBINATIONAL LOGIC (Data Injection) ---
    always @(*) begin
        // Default Assignments (Prevents Latches)
        en_head            = 1'b0;
        header_in          = 8'd0;
        en_load            = 1'b0;
        payload_in         = 32'd0;
        mux_frame_type_str = "WAIT";

        if (tb_state == ST_STREAM) begin
            
            // Apply combinational Backpressure to signals
            if (cdc_ready) begin
                
                // --- MUX IDENTIFIER FOR WAVEFORM ---
                if      (raw_in_frame_id == 4'd1) mux_frame_type_str = "DAT1"; 
                else if (raw_in_frame_id == 4'd2) mux_frame_type_str = "DAT2"; 
                else if (raw_in_frame_id == 4'd3) mux_frame_type_str = "IDLE"; 
                else                              mux_frame_type_str = "MGMT"; 

                // --- HEADER DATA MAPPING (Cycles 1 to 16 per Table 2-10) ---
                if (raw_hdr_in_idx < 5'd16) begin
                    en_head = 1'b1;
                    case (raw_hdr_in_idx + 5'd1)
                        5'd1:  header_in = {4'd0, raw_in_frame_id};     // d0: TXFN[7:0] (LSB)
                        5'd2:  header_in = 8'h00;                       // d1: TXFN[15:8] (MSB)
                        5'd15: header_in = 8'hC1;                       // d14: CRC-16 MSB
                        5'd16: header_in = 8'hC2;                       // d15: CRC-16 LSB
                        default: header_in = 8'hAA;                     // Dummy PNT/Config
                    endcase
                end

                // --- PAYLOAD DATA MAPPING (Cycles 1 to 478) ---
                if (raw_pld_in_idx <= 16'd477) begin
                    en_load = 1'b1;
                    case (raw_pld_in_idx + 16'd1)
                        16'd1:   payload_in = 32'hAB00_0000; // FSO Payload Header (Table 2-18)
                        16'd2:   payload_in = 32'hCDEF_07D0; // FSO Packet Header (Len = 2000B)
                        16'd478: payload_in = 32'hC3C3_C3C3; // FSO CRC-32 Tail
                        default: begin
                            // Main Data Body Patterns
                            if (raw_in_frame_id == 4'd1 || raw_in_frame_id == 4'd2) 
                                payload_in = 32'hDA7A_DA7A; // DATA Pattern
                            else if (raw_in_frame_id == 4'd3)             
                                payload_in = 32'h1D1E_1D1E; // IDLE Pattern
                            else                                
                                payload_in = 32'hA1A1_A1A1; // MGMT Pattern
                        end
                    endcase
                end
            end // End if (cdc_ready)
            else begin
                // If CDC asserts Backpressure, freeze data (TREADY=0 behavior)
                mux_frame_type_str = "HOLD";
            end
        end 
        else if (tb_state == ST_DONE) begin
            mux_frame_type_str = "DONE";
        end
    end

    // =======================================================
    // 7. EVALUATION & VERIFICATION REPORT
    // =======================================================
    initial begin
        rst_n = 1'b0;
        #100; rst_n = 1'b1;

        // Wait for FSM to complete injection and all 4 frames to drain on clk_logic
        wait(tb_state == ST_DONE);
        wait(total_hdr_bytes_q == 32'd64 && total_pld_words_q == 32'd956);
        wait(!header_dv && !payload_dv && !rd_frame_active);
        #500;

        $display("\n=======================================================");
        $display(" CDC 1 (x_gth_logic) TRANSPORT & +2 LATENCY REPORT");
        $display(" (4 Synthetic Frames: 4x16B Header & 4x478W 32b Payload)");
        $display("=======================================================");
        
        $display(" 1. HEADER DOMAIN CROSSING (8-bit -> 8-bit, Latency +2)");
        $display("    Accepted In / Captured Out : %0d / %0d Bytes (Expected: 64 / 64)",
                 wr_hdr_ptr, verified_header_bytes);
        $display("    Byte Mismatches / Tail OK  : %0d Mismatches / %0d of 4 Tails (0xC2)",
                 hdr_mismatch_cnt, hdr_crc16_tail_ok_cnt);

        $display("\n 2. PAYLOAD ASYMMETRIC CROSSING (32-bit -> 64-bit, Latency +2)");
        $display("    Accepted In / Captured Out : %0d (32b) / %0d (64b) Words (Expected: 1912 / 956)",
                 wr_pld_ptr, verified_payload_words);
        $display("    Word Mismatches / Tail OK  : %0d Mismatches / %0d of 4 Tails (0xC3C3C3C3)",
                 pld_mismatch_cnt, pld_crc32_tail_ok_cnt);

        if (wr_hdr_ptr == 64 && verified_header_bytes == 32'd64 && hdr_mismatch_cnt == 0 && hdr_crc16_tail_ok_cnt == 32'd4 &&
            wr_pld_ptr == 1912 && verified_payload_words == 32'd956 && pld_mismatch_cnt == 0 && pld_crc32_tail_ok_cnt == 32'd4) begin
            $display("\n -> RESULT: [PASS] CDC 1 64B header and 956-word (64b) payload transfers matched stimulus with 0 mismatches.");
        end else begin
            $fatal(1, "\n -> RESULT: [FAIL] CDC 1 transfer count or data comparison mismatch!");
        end
        $display("=======================================================\n");

        $finish;
    end

endmodule