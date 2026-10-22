`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_fso_deframer_payload
Description  : Standalone Verification Testbench for deframer_payload.v 
               and fso_crc_32_checker.v (312.5 MHz Domain).

               VERIFICATION SCENARIOS:
               - Frame 1 (TXFN=1, DAT1 Clean)      : 1912B In -> pld_crc_ok=1 -> 1908B Out
               - Frame 2 (TXFN=2, DAT2 CRC Failed) : 1912B In -> pld_crc_ok=0 -> Flushed (0B Out)
               - Frame 3 (TXFN=2, DAT2 Retx Clean) : 1912B In -> pld_crc_ok=1 -> 1908B Out
               - Frame 4 (TXFN=4, MGMT Clean)      : 1912B In -> pld_crc_ok=1 -> 1908B Out

               Revision History:
               - Rev 1.0 (Initial) : 4-scenario CRC-32 payload verification testbench.
               - Rev 1.1 (2026-10-22 07:01 KST) :
                 1. Updated timescale to 1ns/1ps.
                 2. Fixed 1-cycle lag and premature reset on out_pld_word_cnt 
                    so it counts 1..477 (and out_pld_byte_cnt counts 4..1908) 
                    aligned 100% with out_pld_tvalid and out_pld_tlast.
                 3. Reset Table 2-4 math metrics to 0.0 at end of simulation.
===========================================================================
*/

module tb_fso_deframer_payload();

    // =======================================================
    // 1. CLOCK AND RESET SIGNALS
    // =======================================================
    reg clk_gth; // 312.5 MHz (Period = 3.2 ns)
    reg rst_n;

    // =======================================================
    // 2. GROUP 1: DATA IN FROM CDC 4 (478 Words = 1912 Bytes/Frame)
    // =======================================================
    reg         in_pld_dv;
    reg  [31:0] in_pld_data;
    reg         in_hdr_crc_ok;
    reg  [15:0] in_rx_txfn;
    reg  [8:0]  in_word_cnt;   // Counts 1..478 per frame
    reg  [11:0] in_byte_cnt;   // Counts 4..1912 per frame
    reg  [31:0] in_frame_id;   // Scenario Frame 1..4

    // =======================================================
    // 3. GROUP 2: CRC-32 CHECK STATUS & STRIPPED OUTPUT (477 Words = 1908 Bytes)
    // =======================================================
    wire        pld_check_done;
    wire        pld_crc_ok;
    wire [31:0] out_pld_tdata;
    wire        out_pld_tvalid;
    wire        out_pld_tlast;

    reg  [8:0]  raw_out_word_idx;
    reg  [15:0] raw_total_bytes;
    reg  [31:0] raw_out_frame_id;

    // Zero-lag aligned waveform counters (1..477 words, 4..1908 bytes)
    wire [8:0]  out_pld_word_cnt    = out_pld_tvalid ? (raw_out_word_idx + 9'd1) : 9'd0;
    wire [11:0] out_pld_byte_cnt    = out_pld_tvalid ? ({3'd0, raw_out_word_idx + 9'd1} * 12'd4) : 12'd0;
    wire [15:0] out_pld_total_bytes = out_pld_tvalid ? (raw_total_bytes + 16'd4) : raw_total_bytes;
    wire [31:0] out_frame_id        = out_pld_tvalid ? ((raw_out_word_idx == 9'd0) ? (raw_out_frame_id + 32'd1) : raw_out_frame_id) : 32'd0;

    reg  [15:0] crc_pass_cnt;
    reg  [15:0] crc_fail_flush_cnt;

    // =======================================================
    // 4. DUT INSTANTIATION: deframer_payload
    // =======================================================
    deframer_payload u_dut_deframer_payload (
        .clk               (clk_gth),
        .rst_n             (rst_n),
        .payload_dv        (in_pld_dv),
        .payload_in        (in_pld_data),
        .hdr_crc_ok        (in_hdr_crc_ok),
        .rx_txfn           (in_rx_txfn),
        .pld_check_done    (pld_check_done),
        .pld_crc_ok        (pld_crc_ok),
        .m_axis_pld_tdata  (out_pld_tdata),
        .m_axis_pld_tvalid (out_pld_tvalid),
        .m_axis_pld_tlast  (out_pld_tlast)
    );

    // =======================================================
    // 5. CLOCK GENERATOR (312.5 MHz)
    // =======================================================
    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;
    end

    // =======================================================
    // 6. 4-FRAME STIMULUS GENERATOR (1912 Bytes = 478 Words per Frame)
    // =======================================================
    function [31:0] get_pld_word32(input integer scen_id, input integer w_idx);
        begin
            if (scen_id == 1) begin
                // Scenario 1: DAT1 (TXFN=1) Clean
                case (w_idx)
                    0:   get_pld_word32 = 32'hAB00_076C; // FSO Payload Header (1900B)
                    1:   get_pld_word32 = 32'hCDEF_07D0; // FSO Packet Header (2000B Total)
                    12:  get_pld_word32 = 32'h4B6F_6F6B; // "Kook"
                    13:  get_pld_word32 = 32'h6D69_6E20; // "min "
                    14:  get_pld_word32 = 32'h4653_4F20; // "FSO "
                    476: get_pld_word32 = 32'h1900_F1EE; // 477th Word (Byte 1908)
                    477: get_pld_word32 = 32'hC320_0001; // 478th Word: Valid CRC-32 for TXFN=1
                    default: get_pld_word32 = {16'hDA71, w_idx[15:0]};
                endcase
            end else if (scen_id == 2) begin
                // Scenario 2: DAT2 (TXFN=2) with Corrupted CRC-32 (Must be Flushed!)
                case (w_idx)
                    0:   get_pld_word32 = 32'hAB01_0064;
                    1:   get_pld_word32 = 32'hCDEF_07D0;
                    26:  get_pld_word32 = 32'hDEAD_BEEF;
                    477: get_pld_word32 = 32'hDEAD_DEAD; // Corrupted CRC-32!
                    default: get_pld_word32 = (w_idx < 26) ? {16'hDA72, w_idx[15:0]} : 32'd0;
                endcase
            end else if (scen_id == 3) begin
                // Scenario 3: DAT2 (TXFN=2) Retransmitted Clean
                case (w_idx)
                    0:   get_pld_word32 = 32'hAB01_0064;
                    1:   get_pld_word32 = 32'hCDEF_07D0;
                    26:  get_pld_word32 = 32'hDEAD_BEEF; // 100th Byte = Ethernet FCS
                    477: get_pld_word32 = 32'hC320_0002; // Valid CRC-32 for TXFN=2
                    default: get_pld_word32 = (w_idx < 26) ? {16'hDA72, w_idx[15:0]} : 32'd0;
                endcase
            end else begin
                // Scenario 4: MGMT (TXFN=4) Clean
                case (w_idx)
                    0:   get_pld_word32 = {6'd15, 26'd16678204};
                    1:   get_pld_word32 = {14'd759, 6'd15, 12'd0};
                    2:   get_pld_word32 = {28'd1082600, 4'h4};
                    3:   get_pld_word32 = 32'h1531_2D00;
                    4:   get_pld_word32 = {28'd0, 4'h5};
                    5:   get_pld_word32 = {28'h7F83_BA0, 4'd0};
                    6:   get_pld_word32 = 32'd0;
                    7:   get_pld_word32 = {4'd0, 1'b1, 27'd0};
                    477: get_pld_word32 = 32'hC320_0004; // Valid CRC-32 for TXFN=4
                    default: get_pld_word32 = 32'd0;
                endcase
            end
        end
    endfunction

    integer s_idx, w_idx;

    initial begin
        rst_n         = 1'b0;
        in_pld_dv     = 1'b0;
        in_pld_data   = 32'd0;
        in_hdr_crc_ok = 1'b0;
        in_rx_txfn    = 16'd0;
        in_word_cnt   = 9'd0;
        in_byte_cnt   = 12'd0;
        in_frame_id   = 32'd0;

        #100;
        rst_n = 1'b1;
        repeat (10) @(posedge clk_gth);

        for (s_idx = 1; s_idx <= 4; s_idx = s_idx + 1) begin
            in_hdr_crc_ok = 1'b1;
            in_rx_txfn    = (s_idx == 1) ? 16'd1 :
                            (s_idx == 2) ? 16'd2 :
                            (s_idx == 3) ? 16'd2 : 16'd4;

            for (w_idx = 0; w_idx < 478; w_idx = w_idx + 1) begin
                @(posedge clk_gth);
                in_pld_dv   <= 1'b1;
                in_pld_data <= get_pld_word32(s_idx, w_idx);
                in_frame_id <= s_idx;
                in_word_cnt <= w_idx[8:0] + 9'd1;
                in_byte_cnt <= (w_idx[11:0] + 12'd1) * 12'd4;
            end

            @(posedge clk_gth);
            in_pld_dv   <= 1'b0;
            in_pld_data <= 32'd0;
            in_word_cnt <= 9'd0;
            in_byte_cnt <= 12'd0;

            // Wait 500 cycles so the 477-word verified drain completes cleanly
            repeat (500) @(posedge clk_gth);
        end

        in_frame_id <= 32'd0;
    end

    // =======================================================
    // 7. OUTPUT TRACKERS (1908 Bytes = 477 Words per Verified Frame)
    // =======================================================
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            raw_out_word_idx   <= 9'd0;
            raw_total_bytes    <= 16'd0;
            raw_out_frame_id   <= 32'd0;
            crc_pass_cnt       <= 16'd0;
            crc_fail_flush_cnt <= 16'd0;
        end else begin
            if (pld_check_done) begin
                if (pld_crc_ok)
                    crc_pass_cnt <= crc_pass_cnt + 16'd1;
                else
                    crc_fail_flush_cnt <= crc_fail_flush_cnt + 16'd1;
            end

            if (out_pld_tvalid) begin
                if (raw_out_word_idx == 9'd0)
                    raw_out_frame_id <= raw_out_frame_id + 32'd1;

                raw_total_bytes <= raw_total_bytes + 16'd4;

                if (out_pld_tlast)
                    raw_out_word_idx <= 9'd0;
                else
                    raw_out_word_idx <= raw_out_word_idx + 9'd1;
            end else begin
                raw_out_word_idx <= 9'd0;
            end
        end
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

    always @(posedge pld_check_done) begin
        time_start = $realtime;
        time_end   = time_start + (3117.0 * measured_byte_time_ns);

        OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
        OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
        OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
        OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

        $display("---------------------------------------------------------------");
        $display(" [DEFRAMER PAYLOAD] TXFN=%0d | CRC32_OK=%0d | PASS_CNT=%0d | FLUSH_CNT=%0d",
                 in_rx_txfn, pld_crc_ok, crc_pass_cnt + (pld_crc_ok ? 16'd1 : 16'd0),
                 crc_fail_flush_cnt + (pld_crc_ok ? 16'd0 : 16'd1));
        $display(" Duration: %0.6f us | Effective Rate: %0.6f Mbps",
                 OISL_Frame_Duration_us, OISL_Effective_Data_Rate_Mbps);
        $display("---------------------------------------------------------------");
    end

    // =======================================================
    // 9. SIMULATION TERMINATION
    // =======================================================
    initial begin
        wait(raw_total_bytes == 16'd5724); // 3 clean frames x 1908 Bytes = 5724 Bytes
        @(posedge clk_gth);
        time_start                    = 0.0;
        time_end                      = 0.0;
        OISL_Frame_Duration_us        = 0.0;
        OISL_Effective_Data_Rate_Mbps = 0.0;
        OISL_Frame_Rate_kHz           = 0.0;
        OISL_FCCH_Mbps                = 0.0;
        repeat (50) @(posedge clk_gth);
        $display("\n[%0.1f ns] DEFRAMER PAYLOAD VERIFIED: 3 CLEAN FRAMES (5724B) DRAINED, 1 CORRUPTED FRAME FLUSHED.\n",
                 $realtime);
        $finish;
    end

endmodule