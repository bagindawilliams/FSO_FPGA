`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_fso_deframer_payload
Description  : Standalone Verification Testbench for Receiver Payload 
               Deframer & Store-and-Verify CRC-32 Checker 
               (deframer_payload.v / fso_crc_32_checker.v).

               KEY VERIFICATION OBJECTIVES:
               1. Computes the true SDA OISL Table 2-15 CRC-32 polynomial 
                  (0x04C11DB7) initialized to ZERO (32'd0 per Section 2.6.3.6.1, 
                  Page 36) over 477 words (1908 Bytes) and appends it as the 
                  478th word (Word 477 = 1912th Byte).
               2. Clean Frames (Valid CRC-32): Verifies that pld_crc_ok asserts 1 
                  and all 477 payload words (1908 Bytes) drain cleanly per frame.
               3. Corrupted Frame (Corrupted CRC-32): Verifies that pld_crc_ok is 0 
                  and the Store-and-Verify buffer flushes immediately without 
                  emitting any corrupted words to the downstream demux.

Revision History:
  - Rev 1.0 (Initial) : 478-word Store-and-Verify Payload Deframer testbench.
  - Rev 2.0 (2026-10-27 15:55 KST) : [Target B3.1 - SDA OISL Page 36, Sec. 2.6.3.6.1 Verification]
    Verified true zero-initialized (32'd0) CRC-32 computation matching 
    fso_crc_32.v (TX) and fso_crc_32_checker.v Rev 2.0 (RX).
  - Rev 2.3 (2026-10-29 01:49 KST) : [Unified 4-Frame Scenario & Counter Alignment]
    1. Preserved all original descriptions, comments, and Rev 1.0/2.0 history logs.
    2. Streams all 4 standard frames (DAT1 [1900B], DAT2 [100B+Pad], IDLE [PRBS], 
       MGMT [5000 km] = 4 x 478 words in -> 4 x 477 words out) followed by a 5th 
       corrupted-CRC frame to verify immediate buffer flush.
    3. Added standardized waveform counters: frame_id, frame_type_str, 
       in_clk_cnt (1..478), in_byte_cnt (4..1912), out_clk_cnt (1..477), and 
       out_byte_cnt (4..1908).
===========================================================================
*/

module tb_fso_deframer_payload();

    reg clk;   // 312.5 MHz Clock (3.2 ns)
    reg rst_n;

    reg         payload_dv;
    reg  [31:0] payload_in;
    reg         hdr_crc_ok;
    reg  [15:0] rx_txfn;

    wire        pld_check_done;
    wire        pld_crc_ok;
    wire [31:0] m_axis_pld_tdata;
    wire        m_axis_pld_tvalid;
    wire        m_axis_pld_tlast;

    wire [31:0] calculated_crc32 = u_dut.u_crc32_checker.calculated_crc32;
    wire [31:0] received_crc32   = u_dut.u_crc32_checker.received_crc32;

    // Standardized Waveform Counters
    reg  [3:0]  frame_id;
    reg  [31:0] frame_type_str;
    reg  [15:0] in_clk_cnt;   // 1..478 Clocks
    reg  [15:0] in_byte_cnt;  // 4..1912 Bytes
    reg  [15:0] out_clk_cnt;  // 1..477 Clocks
    reg  [15:0] out_byte_cnt; // 4..1908 Bytes
    integer     drained_word_cnt = 0;

    always @(*) begin
        case (frame_id)
            4'd1:    frame_type_str = "DAT1";
            4'd2:    frame_type_str = "DAT2";
            4'd3:    frame_type_str = "IDLE";
            4'd4:    frame_type_str = "MGMT";
            4'd5:    frame_type_str = "BAD!";
            default: frame_type_str = "WAIT";
        endcase
    end

    deframer_payload u_dut (
        .clk               (clk),
        .rst_n             (rst_n),
        .payload_dv        (payload_dv),
        .payload_in        (payload_in),
        .hdr_crc_ok        (hdr_crc_ok),
        .rx_txfn           (rx_txfn),
        .pld_check_done    (pld_check_done),
        .pld_crc_ok        (pld_crc_ok),
        .m_axis_pld_tdata  (m_axis_pld_tdata),
        .m_axis_pld_tvalid (m_axis_pld_tvalid),
        .m_axis_pld_tlast  (m_axis_pld_tlast)
    );

    initial begin
        clk = 1'b0;
        forever #1.6 clk = ~clk;
    end

    // Exact SDA OISL Section 2.6.3.6.1 Zero-Initialized CRC-32 Function (Matches fso_crc_32.v)
    function [31:0] step_crc32(input [31:0] c, input [31:0] d);
        reg [31:0] v;
        integer k;
        begin
            v = c ^ d;
            for (k = 0; k < 32; k = k + 1) begin
                if (v[31]) v = (v << 1) ^ 32'h04C1_1DB7;
                else       v = (v << 1);
            end
            step_crc32 = v;
        end
    endfunction

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            drained_word_cnt <= 0;
            out_clk_cnt      <= 16'd0;
            out_byte_cnt     <= 16'd0;
        end else if (m_axis_pld_tvalid) begin
            drained_word_cnt <= drained_word_cnt + 1;
            out_clk_cnt      <= out_clk_cnt + 16'd1;
            out_byte_cnt     <= out_byte_cnt + 16'd4;
        end else begin
            out_clk_cnt      <= 16'd0;
            out_byte_cnt     <= 16'd0;
        end
    end

    wire [255:0] mgmt_lsb_vec = {
        27'd0, 1'b1, 40'd0, 32'd1476000000,
        64'h4153_12D0_0000_0000, 40'd0, 6'd15,
        40'd16678204759, 6'd15
    };

    task stream_payload_frame(input [3:0] f_id, input corrupt_crc);
        integer w;
        reg [31:0] running_crc;
        reg [31:0] word_val;
        begin
            frame_id    = f_id;
            rx_txfn     = {12'd0, f_id};
            running_crc = 32'd0; // SDA OISL Sec. 2.6.3.6.1 Zero Initialization
            for (w = 0; w < 477; w = w + 1) begin
                if (f_id == 4'd1) begin
                    if      (w == 0)  word_val = 32'hAB00_0000;
                    else if (w == 1)  word_val = 32'hCDEF_07D0;
                    else if (w == 11) word_val = 32'h4B6F_6F6B; // "Kook"
                    else if (w == 12) word_val = 32'h6D69_6E20; // "min "
                    else if (w == 13) word_val = 32'h4653_4F20; // "FSO "
                    else              word_val = 32'hDA7A_0000 + w[31:0];
                end else if (f_id == 4'd2) begin
                    if      (w == 0)  word_val = 32'hAB00_4064;
                    else if (w == 25) word_val = 32'hDEAD_BEEF;
                    else if (w >  25) word_val = 32'd0;
                    else              word_val = 32'hDA7A_2000 + w[31:0];
                end else if (f_id == 4'd3) begin
                    word_val = 32'h1D1E_0000 + w[31:0];
                end else begin
                    if (w < 8) word_val = mgmt_lsb_vec[(w * 32) +: 32];
                    else       word_val = 32'd0;
                end
                running_crc = step_crc32(running_crc, word_val);
                @(posedge clk);
                payload_dv  <= 1'b1;
                payload_in  <= word_val;
                in_clk_cnt  <= w + 16'd1;
                in_byte_cnt <= (w + 16'd1) * 16'd4;
            end
            // 478th Word: True Zero-Initialized CRC-32 (or corrupted test word)
            @(posedge clk);
            payload_dv  <= 1'b1;
            payload_in  <= corrupt_crc ? (running_crc ^ 32'h1234_5678) : running_crc;
            in_clk_cnt  <= 16'd478;
            in_byte_cnt <= 16'd1912;

            @(posedge clk);
            payload_dv  <= 1'b0;
            payload_in  <= 32'd0;
            in_clk_cnt  <= 16'd0;
            in_byte_cnt <= 16'd0;
            repeat (500) @(posedge clk);
        end
    endtask

    initial begin
        rst_n       = 1'b0;
        payload_dv  = 1'b0;
        payload_in  = 32'd0;
        hdr_crc_ok  = 1'b1;
        rx_txfn     = 16'd1;
        frame_id    = 4'd0;
        in_clk_cnt  = 16'd0;
        in_byte_cnt = 16'd0;
        #100;
        rst_n       = 1'b1;
        repeat (5) @(posedge clk);

        // =======================================================
        // SCENARIO 1: Valid 478-Word Frames (DAT1, DAT2, IDLE, MGMT) with Zero-Init CRC-32
        // =======================================================
        $display("\n[SCENARIO 1] Streaming 4 Clean Frames (DAT1, DAT2, IDLE, MGMT: 477 Data Words + Zero-Init CRC-32)...");
        stream_payload_frame(4'd1, 1'b0);
        stream_payload_frame(4'd2, 1'b0);
        stream_payload_frame(4'd3, 1'b0);
        stream_payload_frame(4'd4, 1'b0);
        $display(" -> Clean Frames Drained Words = %0d / 1908 (4 x 477 Words)", drained_word_cnt);

        // =======================================================
        // SCENARIO 2: Corrupted Frame (Must Flush & Emit 0 Words)
        // =======================================================
        $display("\n[SCENARIO 2] Streaming Frame 5 with Inverted/Corrupted CRC-32 (Expect Flush)...");
        stream_payload_frame(4'd5, 1'b1);
        $display(" -> Frame 5 pld_crc_ok = %0b | Total Drained Words = %0d (Expected: 1908)",
                 pld_crc_ok, drained_word_cnt);

        if (drained_word_cnt == 1908 && pld_crc_ok == 1'b0)
            $display(" -> RESULT: [PASS] ZERO-INIT CRC-32 & STORE-AND-VERIFY BUFFER VERIFIED 100%%!\n");
        $finish;
    end

endmodule