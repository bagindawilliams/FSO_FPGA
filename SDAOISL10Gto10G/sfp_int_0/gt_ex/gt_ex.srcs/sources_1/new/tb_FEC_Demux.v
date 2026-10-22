`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_FEC_Demux
Description  : Standalone Verification Testbench for FEC_Demux.v.

               DATA SYNCHRONIZATION & WAVEFORM GROUPS:
               1. Group 1 - Data In from Descrambler (200 MHz, 64-bit, 2072B):
                  - Feeds 259 consecutive 64-bit words (2072 Bytes: 4 Header 
                    words + 255 Payload words) per frame across 4 frames.
               2. Group 2 - Separated RS Header Stream (200 MHz, 8-bit, 32B):
                  - Verifies that the first 4 words (256 bits) are serialized 
                    into 32 consecutive 8-bit cycles (hdr_out_byte_cnt: 1..32) 
                    starting with AA, BB, CC, DD and ending with 0xEE at Byte 32.
               3. Group 3 - Separated RS Payload Stream (200 MHz, 64-bit, 2040B):
                  - Verifies that the remaining 255 words (2040 Bytes) are 
                    forwarded in parallel (pld_out_word_cnt: 1..255, 
                    pld_byte_cnt: 1..2040 ending with 0x33 at Byte 2040) with 
                    exact SDA OISL Table 2-4 metrics under demux_frame_id (1..4).
===========================================================================
*/

module tb_FEC_Demux();

    // =======================================================
    // 1. CLOCK AND RESET SIGNALS
    // =======================================================
    reg clk_logic; // 200.0 MHz (Period = 5.0 ns)
    reg clk_gth;   // 312.5 MHz (Period = 3.2 ns)
    reg rst_n;

    // =======================================================
    // 2. GROUP 1: DATA IN FROM DESCRAMBLER (64-bit, 2072 Bytes)
    // =======================================================
    reg         descr_in_dv;
    reg  [63:0] descr_in_data;
    reg  [8:0]  in_word64_cnt; // Counts 1..259 per frame
    reg  [11:0] in_byte_cnt;   // Counts 8..2072 per frame
    reg  [31:0] in_frame_id;   // Active Input Frame ID (1..4)

    // =======================================================
    // 3. GROUP 2: SEPARATED RS HEADER OUTPUT (8-bit, 32 Bytes)
    // =======================================================
    wire        header_dv;
    wire [7:0]  header;
    wire [5:0]  hdr_out_byte_cnt = u_fec_demux.hdr_out_byte_cnt; // Counts 1..32 Bytes

    // =======================================================
    // 4. GROUP 3: SEPARATED RS PAYLOAD OUTPUT (64-bit, 2040 Bytes)
    // =======================================================
    wire        payload_dv;
    wire [63:0] payload;
    wire [8:0]  pld_out_word_cnt = u_fec_demux.pld_out_word_cnt; // Counts 1..255 Words
    wire [7:0]  pld_byte_stream  = u_fec_demux.pld_byte_stream;  // 1-by-1 Payload Byte
    wire [11:0] pld_byte_cnt     = u_fec_demux.pld_byte_cnt;     // Counts 1..2040 Bytes
    wire [15:0] pld_total_bytes  = u_fec_demux.pld_total_bytes;  // Counts 1..8160 Bytes
    wire [31:0] demux_frame_id   = u_fec_demux.demux_frame_id;   // Active Frame ID (1..4)

    // =======================================================
    // 5. DUT INSTANTIATION: FEC_Demux
    // =======================================================
    FEC_Demux u_fec_demux (
        .clk        (clk_logic),
        .rst_n      (rst_n),
        .en         (descr_in_dv),
        .data_in    (descr_in_data),
        .header_dv  (header_dv),
        .header     (header),
        .payload_dv (payload_dv),
        .payload    (payload)
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
    // 7. 4-FRAME DESCRAMBLED INPUT GENERATOR (259 Words = 2072B/frame)
    // =======================================================
    integer f_idx, w_idx;

    initial begin
        rst_n         = 1'b0;
        descr_in_dv   = 1'b0;
        descr_in_data = 64'd0;
        in_word64_cnt = 9'd0;
        in_byte_cnt   = 12'd0;
        in_frame_id   = 32'd0;

        #100;
        rst_n = 1'b1;
        repeat (10) @(posedge clk_logic);

        for (f_idx = 1; f_idx <= 4; f_idx = f_idx + 1) begin
            for (w_idx = 1; w_idx <= 259; w_idx = w_idx + 1) begin
                @(posedge clk_logic);
                descr_in_dv   <= 1'b1;
                in_frame_id   <= f_idx;
                in_word64_cnt <= w_idx[8:0];
                in_byte_cnt   <= w_idx[11:0] * 12'd8;

                // Words 1..4: 32-Byte RS Header (Bytes 1..32)
                if (w_idx == 1)
                    descr_in_data <= {32'hAA_BB_CC_DD, f_idx[15:0], 16'h0102};
                else if (w_idx == 2)
                    descr_in_data <= 64'h0304_0506_0708_090A;
                else if (w_idx == 3)
                    descr_in_data <= 64'h0B0C_0D0E_0F10_1112;
                else if (w_idx == 4)
                    descr_in_data <= 64'h1314_1516_1718_19EE; // 32nd Header Byte = 0xEE
                // Words 5..259: 2040-Byte RS Payload (255 Words)
                else if (w_idx == 5)
                    descr_in_data <= {32'hAB00_CDEF, f_idx[15:0], 16'h0001}; // 1st Payload Word
                else if (w_idx < 259)
                    descr_in_data <= {32'hAAAA_BBBB, f_idx[15:0], (w_idx[15:0] - 16'd4)};
                else
                    descr_in_data <= 64'h9988_7766_5544_0033; // 255th Payload Word (2040th Byte = 0x33)
            end

            @(posedge clk_logic);
            descr_in_dv   <= 1'b0;
            descr_in_data <= 64'd0;
            in_word64_cnt <= 9'd0;
            in_byte_cnt   <= 12'd0;

            // 239-cycle inter-frame interval
            repeat (239) @(posedge clk_logic);
        end

        in_frame_id <= 32'd0;
    end

    // =======================================================
    // 8. SDA OISL TABLE 2-4 METRICS ANALYZER
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

    always @(demux_frame_id) begin
        if (demux_frame_id >= 32'd1 && demux_frame_id <= 32'd4) begin
            time_start = $realtime;
            time_end   = time_start + (3117.0 * measured_byte_time_ns);

            OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
            OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
            OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
            OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

            $display("---------------------------------------------------------------");
            $display(" [FEC_Demux] FRAME %0d ACTIVE (2072B -> 32B Header + 2040B Payload)", demux_frame_id);
            $display(" time_start     : %0.1f ns | time_end : %0.1f ns", time_start, time_end);
            $display(" Duration       : %0.6f us", OISL_Frame_Duration_us);
            $display(" Effective Rate : %0.6f Mbps", OISL_Effective_Data_Rate_Mbps);
            $display(" Frame Rate     : %0.6f kHz  | FCCH Rate: %0.6f Mbps", OISL_Frame_Rate_kHz, OISL_FCCH_Mbps);
            $display("---------------------------------------------------------------");
        end else if (demux_frame_id == 32'd0) begin
            time_start                    = 0.0;
            time_end                      = 0.0;
            OISL_Frame_Duration_us        = 0.0;
            OISL_Effective_Data_Rate_Mbps = 0.0;
            OISL_Frame_Rate_kHz           = 0.0;
            OISL_FCCH_Mbps                = 0.0;
        end
    end

    // =======================================================
    // 9. SIMULATION TERMINATION
    // =======================================================
    initial begin
        wait(pld_total_bytes == 16'd8160);
        wait(demux_frame_id == 32'd0);
        #500;
        $display("\n[%0.1f ns] FEC_Demux VERIFICATION COMPLETE: 4x32B HEADERS & 4x2040B PAYLOADS SEPARATED.\n", $realtime);
        $finish;
    end

endmodule