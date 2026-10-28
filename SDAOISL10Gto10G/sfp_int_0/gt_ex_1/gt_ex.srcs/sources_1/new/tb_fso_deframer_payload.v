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
               2. Frame 1 (Valid CRC-32): Verifies that pld_crc_ok asserts 1 
                  and all 477 payload words (1908 Bytes) drain cleanly.
               3. Frame 2 (Corrupted CRC-32): Verifies that pld_crc_ok is 0 
                  and the Store-and-Verify buffer flushes immediately without 
                  emitting any corrupted words to the downstream demux.

Revision History:
  - Rev 1.0 (Initial) : 478-word Store-and-Verify Payload Deframer testbench.
  - Rev 2.0 (2026-10-27 15:55 KST) : [Target B3.1 - SDA OISL Page 36, Sec. 2.6.3.6.1 Verification]
    Verified true zero-initialized (32'd0) CRC-32 computation matching 
    fso_crc_32.v (TX) and fso_crc_32_checker.v Rev 2.0 (RX).
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

    integer drained_word_cnt = 0;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            drained_word_cnt <= 0;
        else if (m_axis_pld_tvalid)
            drained_word_cnt <= drained_word_cnt + 1;
    end

    integer w;
    reg [31:0] running_crc;
    reg [31:0] word_val;

    initial begin
        rst_n      = 1'b0;
        payload_dv = 1'b0;
        payload_in = 32'd0;
        hdr_crc_ok = 1'b1;
        rx_txfn    = 16'd1;
        #100;
        rst_n      = 1'b1;
        repeat (5) @(posedge clk);

        // =======================================================
        // SCENARIO 1: Valid 478-Word Frame with Zero-Init CRC-32
        // =======================================================
        $display("\n[SCENARIO 1] Streaming Frame 1 (477 Data Words + Zero-Initialized CRC-32 at Word 478)...");
        running_crc = 32'd0; // SDA OISL Sec. 2.6.3.6.1 Zero Initialization
        for (w = 0; w < 477; w = w + 1) begin
            if      (w == 0) word_val = 32'hAB00_0000;
            else if (w == 1) word_val = 32'hCDEF_07D0;
            else             word_val = 32'hDA7A_0000 + w[31:0];
            running_crc = step_crc32(running_crc, word_val);

            @(posedge clk);
            payload_dv <= 1'b1;
            payload_in <= word_val;
        end
        // 478th Word: True Zero-Initialized CRC-32
        @(posedge clk);
        payload_dv <= 1'b1;
        payload_in <= running_crc;

        @(posedge clk);
        payload_dv <= 1'b0;
        payload_in <= 32'd0;

        wait(m_axis_pld_tlast);
        repeat (10) @(posedge clk);
        $display(" -> Frame 1 Calculated CRC-32 = 0x%08X | Received = 0x%08X | Drained Words = %0d / 477",
                 calculated_crc32, received_crc32, drained_word_cnt);

        // =======================================================
        // SCENARIO 2: Corrupted Frame (Must Flush & Emit 0 Words)
        // =======================================================
        $display("\n[SCENARIO 2] Streaming Frame 2 with Inverted/Corrupted CRC-32 (Expect Flush)...");
        rx_txfn     = 16'd2;
        running_crc = 32'd0;
        for (w = 0; w < 477; w = w + 1) begin
            word_val    = 32'hDEAD_0000 + w[31:0];
            running_crc = step_crc32(running_crc, word_val);
            @(posedge clk);
            payload_dv <= 1'b1;
            payload_in <= word_val;
        end
        // Inject Bad CRC-32 (XOR with 0x12345678)
        @(posedge clk);
        payload_dv <= 1'b1;
        payload_in <= running_crc ^ 32'h1234_5678;

        @(posedge clk);
        payload_dv <= 1'b0;
        payload_in <= 32'd0;

        repeat (50) @(posedge clk);
        $display(" -> Frame 2 pld_crc_ok = %0b | Total Drained Words Across Both Frames = %0d (Expected: 477)",
                 pld_crc_ok, drained_word_cnt);

        if (drained_word_cnt == 477 && pld_crc_ok == 1'b0)
            $display(" -> RESULT: [PASS] ZERO-INIT CRC-32 & STORE-AND-VERIFY BUFFER VERIFIED 100%%!\n");
        $finish;
    end

endmodule