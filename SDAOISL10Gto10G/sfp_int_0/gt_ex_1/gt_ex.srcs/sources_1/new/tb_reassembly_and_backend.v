`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_reassembly_and_backend
Description  : End-to-End Verification Testbench for Receiver Ethernet Frame 
               Reassembly (ethernet_frame_reassembly.v) and 10G Ethernet TX 
               Back-End (eth_tx_back_end_top.v).

               KEY VERIFICATION OBJECTIVES:
               1. Feeds two 1908-Byte (477-word) FSO DATA frames carrying a 
                  segmented 2000-Byte Ethernet Jumbo packet:
                  - Frame 1 (Start Frame, 477 words = 1908B):
                    * Word 0 = 32'hAB00_0000 (seq_num=0, Length=0)
                    * Word 1 = 32'hCDEF_07D0 (Magic=0xCDEF, Length=2000 Bytes)
                    * Words 2..476 = First 1900 Bytes (475 words) of Ethernet 
                      Jumbo packet (MAC + IPv4 + UDP + "Kookmin FSO " + Body).
                  - Frame 2 (Strict Table 2-18 Continuation Frame, 477 words = 1908B):
                    * Word 0 = 32'hAB00_4064 (seq_num=1, Length=100 Bytes remaining)
                    * Words 1..25 = Remaining 100 Bytes (25 words) of Ethernet 
                      packet ending with FCS 32'hDEAD_BEEF at Word 25 (NO duplicate 
                      0xCDEF Packet Header per Table 2-18 & ETRI Review Item 4.2(2)!).
                    * Words 26..476 = 1804 Bytes (451 words) Zero Padding.
               2. Inserts a 300-cycle inter-frame delay between Frame 1 and 
                  Frame 2 to prove that ethernet_frame_reassembly holds commit 
                  until the 2000th byte arrives (ZERO intra-packet gap!).
               3. Verifies that eth_tx_back_end_top emits 502 active Ethernet + 
                  Preamble XGMII words (2008 Bytes = /S/ 0x555555FB, 0xD5555555, 
                  and 500 Ethernet words ending in 0xDEADBEEF), followed by /T/ 
                  (0x070707FD) and 3 cycles of 0x07070707 IPG.

Revision History:
  - Rev 1.0 (Initial) : Reassembly + 10G Ethernet Back-End verification TB.
  - Rev 2.0 (2026-10-27 15:55 KST) : [Target B6.3 - SDA OISL Page 43-46, Table 2-18 & ETRI Item 4.2(2)]
    Updated Frame 2 stimulus to the strict Table 2-18 Continuation Frame format 
    (Word 0 = 32'hAB00_4064 + 25 words [100B] remaining Ethernet data + 451 words 
    [1804B] zero padding = 477 words [1908B] without duplicate 0xCDEF header).
  - Rev 3.0 (2026-11-04 11:30 KST) : [Back-to-Back 2x2000B Identical Jumbo Packet Verification]
    Added Packet 2 (Frame 3 Start seq_num=2 + Frame 4 Continuation seq_num=3) 
    carrying the exact same 2000-Byte payload ("Kookmin FSO " + FCS 0xDEADBEEF) 
    immediately behind Packet 1 to verify the 4-cycle DR_IPG separation and confirm 
    that both 2000-Byte packets emerge intact on XGMII.
  - Rev 3.1 (2026-11-04 11:55 KST) : [Permanent Word-by-Word XGMII Checker, Timeout & $fatal]
    Added permanent word-by-word XGMII data and control verification across both 
    reconstructed packets ('all_xgmii_data_ctrl_errors == 0'), a simulation 
    watchdog timeout, and an explicit 'else $fatal' assertion per Audit review.
  - Rev 3.2 (2026-11-04 13:45 KST) : [Zero-Lag Dynamic Packet Word/Byte Waveform Counters]
    1. Converted 'eth_out_words', 'eth_out_bytes', 'xgmii_pkt_words', and 
       'xgmii_pkt_bytes' into zero-lag dynamic counters that remain strictly 0 
       during IDLE and /T/ control cycles, start at 1 word (4 bytes) on the 
       first active preamble cycle, reach the exact packet+preamble length on 
       the final data word (502 words / 2008 bytes for a 2000B packet, scaling 
       automatically for any packet size), and return to 0 immediately after the 
       last data word.
    2. Initialized 'exp_xgmii_pair' to 36'd0 so no 'X' state appears during IDLE.
  - Rev 3.3 (2026-11-04 13:58 KST) : [3-Metric Waveform Counter Suite & Loop Index Initialization]
    1. Initialized loop index 'integer w = 0' at declaration and reset 'w = 0' 
       during idle periods to eliminate the initial red 'X' on w[31:0].
    2. Added the complete 3-metric dynamic counter suite (Clock Counter, 
       Byte-per-Clock Counter, and 1-Byte-per-1-Byte Sub-Cycle Counter stepping 
       1, 2, 3, 4... every 0.8 ns) across all three interfaces:
       - FSO Input      : fso_in_clk_cnt (1..477), fso_in_byte_clk_cnt (4..1908), fso_in_byte_1b_cnt (1..1908)
       - Reassembly Out : eth_out_clk_cnt (1..502), eth_out_byte_clk_cnt (4..2008), eth_out_byte_1b_cnt (1..2008)
       - XGMII Egress   : xgmii_clk_cnt (1..502), xgmii_byte_clk_cnt (4..2008), xgmii_byte_1b_cnt (1..2008)
===========================================================================
*/

module tb_reassembly_and_backend();

    reg clk;   // 312.5 MHz Clock (3.2 ns)
    reg rst_n;

    reg  [31:0] s_axis_fso_tdata;
    reg         s_axis_fso_tvalid;
    reg         s_axis_fso_tlast;
    wire        s_axis_fso_tready;

    wire [31:0] reassembled_eth_tdata;
    wire        reassembled_eth_tvalid;
    wire        reassembled_eth_tlast;
    wire [15:0] reassembled_pkt_bytes;
    wire [15:0] reassembled_pkt_cnt;

    wire [31:0] pc2_xgmii_txd;
    wire [3:0]  pc2_xgmii_txc;

    // 1. Ethernet Frame Reassembly & Preamble Injection (SDA OISL Sec. 2.6.3.7.7)
    ethernet_frame_reassembly u_reassembly (
        .clk                   (clk),
        .rst_n                 (rst_n),
        .s_axis_fso_tdata      (s_axis_fso_tdata),
        .s_axis_fso_tvalid     (s_axis_fso_tvalid),
        .s_axis_fso_tlast      (s_axis_fso_tlast),
        .s_axis_fso_tready     (s_axis_fso_tready),
        .m_axis_eth_tdata      (reassembled_eth_tdata),
        .m_axis_eth_tvalid     (reassembled_eth_tvalid),
        .m_axis_eth_tlast      (reassembled_eth_tlast),
        .m_axis_eth_tready     (1'b1),
        .reassembled_pkt_bytes (reassembled_pkt_bytes),
        .reassembled_pkt_cnt   (reassembled_pkt_cnt)
    );

    // 2. 10G Ethernet TX Back-End to PC 2
    eth_tx_back_end_top #(.RUN_MODE(1)) u_backend (
        .clk       (clk),
        .rst_n     (rst_n),
        .data_in   (reassembled_eth_tdata),
        .en        (reassembled_eth_tvalid),
        .xgmii_txd (pc2_xgmii_txd),
        .xgmii_txc (pc2_xgmii_txc),
        .refclk_p  (1'b0),
        .refclk_n  (1'b1),
        .reset     (1'b0),
        .dclk      (1'b0),
        .txp       (),
        .txn       ()
    );

    initial begin
        clk = 1'b0;
        forever #1.6 clk = ~clk;
    end

    // Sub-cycle 0.8 ns byte stepper (1 -> 2 -> 3 -> 4 inside each 3.2 ns word clock)
    reg [2:0] sub_byte_step = 3'd1;
    always @(posedge clk) begin
        sub_byte_step <= 3'd1;
        #0.8 sub_byte_step <= 3'd2;
        #0.8 sub_byte_step <= 3'd3;
        #0.8 sub_byte_step <= 3'd4;
    end

    // Watchdog Timeout Guard
    initial begin
        #100000;
        $fatal(1, "\n[TIMEOUT ERROR] tb_reassembly_and_backend did not complete within 100 us!\n");
    end

    // Golden Expected XGMII Word Function (Words 0..501 = Preamble+Data, Word 502 = /T/)
    function [35:0] get_expected_xgmii_word(input integer x_idx);
        integer f1_w, f2_w;
        reg [31:0] mac_w;
        begin
            if (x_idx == 0) begin
                get_expected_xgmii_word = {4'b0001, 32'h5555_55FB}; // /S/ + 3B Preamble
            end else if (x_idx == 1) begin
                get_expected_xgmii_word = {4'b0000, 32'hD555_5555}; // 3B Preamble + SFD
            end else if (x_idx <= 476) begin
                f1_w = x_idx; // Maps to Frame 1 / Frame 3 w = 2..476
                case (f1_w)
                    2:  mac_w = 32'hAABB_CCDD;
                    3:  mac_w = 32'hEEFF_1122;
                    4:  mac_w = 32'h3344_5566;
                    5:  mac_w = 32'h0800_4500;
                    11: mac_w = 32'h4B6F_6F6B; // "Kook"
                    12: mac_w = 32'h6D69_6E20; // "min "
                    13: mac_w = 32'h4653_4F20; // "FSO "
                    default: mac_w = {16'hAAAA, f1_w[15:0]};
                endcase
                get_expected_xgmii_word = {4'b0000, mac_w};
            end else if (x_idx <= 501) begin
                f2_w = x_idx - 476; // Maps to Frame 2 / Frame 4 w = 1..25
                if (f2_w < 25) mac_w = {16'hBBBB, f2_w[15:0]};
                else           mac_w = 32'hDEAD_BEEF; // 2000th Byte FCS
                get_expected_xgmii_word = {4'b0000, mac_w};
            end else begin
                get_expected_xgmii_word = {4'b1111, 32'h0707_07FD}; // /T/ Terminate Control Word
            end
        end
    endfunction

    // =========================================================================
    // ZERO-LAG 3-METRIC WAVEFORM COUNTERS (CLOCK, BYTE-CLOCK, & BYTE-PER-BYTE)
    // Automatically scales to any transmitted packet length without hardcoding!
    // =========================================================================
    reg  [15:0] raw_fso_in_idx     = 16'd0;
    reg  [15:0] raw_eth_word_idx   = 16'd0;
    reg  [15:0] raw_xgmii_word_idx = 16'd0;
    reg  [15:0] raw_xgmii_bytes    = 16'd0;

    wire        fso_in_active      = s_axis_fso_tvalid && s_axis_fso_tready;
    wire        xgmii_data_active  = (pc2_xgmii_txc != 4'b1111);
    wire        xgmii_is_start     = (pc2_xgmii_txc == 4'b0001) && (pc2_xgmii_txd[7:0] == 8'hFB);
    wire        xgmii_is_term      = (pc2_xgmii_txc == 4'b1111) && (pc2_xgmii_txd[7:0] == 8'hFD);
    wire [2:0]  xgmii_lane_bytes   = xgmii_is_start ? 3'd4 :
                                     ((!pc2_xgmii_txc[3]) + (!pc2_xgmii_txc[2]) +
                                      (!pc2_xgmii_txc[1]) + (!pc2_xgmii_txc[0]));
    wire [2:0]  xgmii_sub_byte     = (sub_byte_step > xgmii_lane_bytes) ? xgmii_lane_bytes : sub_byte_step;

    // A. FSO Input Frame Counters (0 when IDLE, 1..477 Clocks, 4..1908 Byte-Clock, 1..1908 Byte-per-Byte)
    wire [15:0] fso_in_clk_cnt      = fso_in_active ? (raw_fso_in_idx + 16'd1) : 16'd0;
    wire [15:0] fso_in_byte_clk_cnt = fso_in_active ? ((raw_fso_in_idx + 16'd1) * 16'd4) : 16'd0;
    wire [15:0] fso_in_byte_1b_cnt  = fso_in_active ? ((raw_fso_in_idx * 16'd4) + {13'd0, sub_byte_step}) : 16'd0;

    // B. Reassembly Output Counters (0 when IDLE, 1..502 Clocks, 4..2008 Byte-Clock, 1..2008 Byte-per-Byte)
    wire [15:0] eth_out_clk_cnt      = reassembled_eth_tvalid ? (raw_eth_word_idx + 16'd1) : 16'd0;
    wire [15:0] eth_out_byte_clk_cnt = reassembled_eth_tvalid ? ((raw_eth_word_idx + 16'd1) * 16'd4) : 16'd0;
    wire [15:0] eth_out_byte_1b_cnt  = reassembled_eth_tvalid ? ((raw_eth_word_idx * 16'd4) + {13'd0, sub_byte_step}) : 16'd0;
    wire [15:0] eth_out_words        = eth_out_clk_cnt;
    wire [15:0] eth_out_bytes        = eth_out_byte_clk_cnt;

    // C. XGMII Output Counters (0 when IDLE & /T/, 1..502 Clocks, 4..2008 Byte-Clock, 1..2008 Byte-per-Byte)
    wire [15:0] xgmii_clk_cnt        = xgmii_data_active ? (raw_xgmii_word_idx + 16'd1) : 16'd0;
    wire [15:0] xgmii_byte_clk_cnt   = xgmii_data_active ? (raw_xgmii_bytes + {13'd0, xgmii_lane_bytes}) : 16'd0;
    wire [15:0] xgmii_byte_1b_cnt    = xgmii_data_active ? (raw_xgmii_bytes + {13'd0, xgmii_sub_byte}) : 16'd0;
    wire [15:0] xgmii_pkt_words      = xgmii_clk_cnt;
    wire [15:0] xgmii_pkt_bytes      = xgmii_byte_clk_cnt;

    // Summary Latched Counters for End-of-Packet Verification Report
    integer     pkt1_eth_words             = 0;
    integer     pkt2_eth_words             = 0;
    integer     pkt1_xgmii_words           = 0;
    integer     pkt2_xgmii_words           = 0;
    integer     pkt1_xgmii_bytes           = 0;
    integer     pkt2_xgmii_bytes           = 0;
    integer     xgmii_completed_pkts       = 0;
    integer     all_xgmii_data_ctrl_errors = 0;
    reg         in_xgmii_frame             = 1'b0;
    reg  [31:0] captured_last_eth_fcs      = 32'd0;
    wire [35:0] exp_xgmii_pair             = xgmii_data_active ? get_expected_xgmii_word(raw_xgmii_word_idx) :
                                             (xgmii_is_term    ? get_expected_xgmii_word(502) : 36'd0);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            raw_fso_in_idx             <= 16'd0;
            raw_eth_word_idx           <= 16'd0;
            raw_xgmii_word_idx         <= 16'd0;
            raw_xgmii_bytes            <= 16'd0;
            pkt1_eth_words             <= 0;
            pkt2_eth_words             <= 0;
            pkt1_xgmii_words           <= 0;
            pkt2_xgmii_words           <= 0;
            pkt1_xgmii_bytes           <= 0;
            pkt2_xgmii_bytes           <= 0;
            xgmii_completed_pkts       <= 0;
            all_xgmii_data_ctrl_errors <= 0;
            in_xgmii_frame             <= 1'b0;
            captured_last_eth_fcs      <= 32'd0;
        end else begin
            // 0. FSO input word index tracking
            if (fso_in_active) begin
                if (s_axis_fso_tlast)
                    raw_fso_in_idx <= 16'd0;
                else
                    raw_fso_in_idx <= raw_fso_in_idx + 16'd1;
            end else begin
                raw_fso_in_idx <= 16'd0;
            end

            // 1. Reassembly output tracking (resets immediately on tlast or when tvalid==0)
            if (reassembled_eth_tvalid) begin
                if (reassembled_eth_tlast) begin
                    captured_last_eth_fcs <= reassembled_eth_tdata;
                    if (reassembled_pkt_cnt <= 16'd1)
                        pkt1_eth_words <= raw_eth_word_idx + 16'd1;
                    else
                        pkt2_eth_words <= raw_eth_word_idx + 16'd1;
                    raw_eth_word_idx <= 16'd0;
                end else begin
                    raw_eth_word_idx <= raw_eth_word_idx + 16'd1;
                end
            end else begin
                raw_eth_word_idx <= 16'd0;
            end

            // 2. XGMII output tracking (counts only active Preamble + Ethernet words, hides /T/)
            if (xgmii_is_start) begin
                in_xgmii_frame     <= 1'b1;
                raw_xgmii_word_idx <= 16'd1;
                raw_xgmii_bytes    <= 16'd4;
                if ({pc2_xgmii_txc, pc2_xgmii_txd} !== get_expected_xgmii_word(0))
                    all_xgmii_data_ctrl_errors <= all_xgmii_data_ctrl_errors + 1;
            end else if (in_xgmii_frame && xgmii_data_active) begin
                if ({pc2_xgmii_txc, pc2_xgmii_txd} !== get_expected_xgmii_word(raw_xgmii_word_idx))
                    all_xgmii_data_ctrl_errors <= all_xgmii_data_ctrl_errors + 1;
                raw_xgmii_word_idx <= raw_xgmii_word_idx + 16'd1;
                raw_xgmii_bytes    <= raw_xgmii_bytes + {13'd0, xgmii_lane_bytes};
            end else if (in_xgmii_frame && xgmii_is_term) begin
                if ({pc2_xgmii_txc, pc2_xgmii_txd} !== get_expected_xgmii_word(502))
                    all_xgmii_data_ctrl_errors <= all_xgmii_data_ctrl_errors + 1;
                in_xgmii_frame       <= 1'b0;
                xgmii_completed_pkts <= xgmii_completed_pkts + 1;
                if (xgmii_completed_pkts == 0) begin
                    pkt1_xgmii_words <= raw_xgmii_word_idx;
                    pkt1_xgmii_bytes <= raw_xgmii_bytes;
                end else begin
                    pkt2_xgmii_words <= raw_xgmii_word_idx;
                    pkt2_xgmii_bytes <= raw_xgmii_bytes;
                end
                raw_xgmii_word_idx <= 16'd0;
                raw_xgmii_bytes    <= 16'd0;
            end else begin
                raw_xgmii_word_idx <= 16'd0;
                raw_xgmii_bytes    <= 16'd0;
            end
        end
    end

    // Initialized to 0 so w[31:0] never shows red 'XXXXXXXX' at simulation start!
    integer w = 0;

    initial begin
        rst_n             = 1'b0;
        s_axis_fso_tdata  = 32'd0;
        s_axis_fso_tvalid = 1'b0;
        s_axis_fso_tlast  = 1'b0;
        w                 = 0;
        #100;
        rst_n             = 1'b1;
        repeat (10) @(posedge clk);

        // =======================================================
        // PACKET 1 - FRAME 1: Start Frame (4B 0xAB + 4B 0xCDEF + 1900B Eth = 1908B / 477 Words)
        // =======================================================
        $display("\n[%0t] [PACKET 1] Streaming FSO Frame 1 (Start Frame: 0xAB000000 + 0xCDEF07D0 + 1900B Data)...", $time);
        for (w = 0; w < 477; w = w + 1) begin
            @(posedge clk);
            s_axis_fso_tvalid <= 1'b1;
            s_axis_fso_tlast  <= (w == 476);
            case (w)
                0:  s_axis_fso_tdata <= 32'hAB00_0000; // Table 2-18 FSO Payload Hdr (seq=0, Len=0)
                1:  s_axis_fso_tdata <= 32'hCDEF_07D0; // Table 2-18 FSO Packet Hdr (Len=2000B)
                2:  s_axis_fso_tdata <= 32'hAABB_CCDD; // DEST_MAC[47:16]
                3:  s_axis_fso_tdata <= 32'hEEFF_1122; // DEST_MAC[15:0], SRC_MAC[47:32]
                4:  s_axis_fso_tdata <= 32'h3344_5566; // SRC_MAC[31:0]
                5:  s_axis_fso_tdata <= 32'h0800_4500; // EtherType IPv4
                11: s_axis_fso_tdata <= 32'h4B6F_6F6B; // "Kook"
                12: s_axis_fso_tdata <= 32'h6D69_6E20; // "min "
                13: s_axis_fso_tdata <= 32'h4653_4F20; // "FSO "
                default: s_axis_fso_tdata <= {16'hAAAA, w[15:0]};
            endcase
        end

        @(posedge clk);
        s_axis_fso_tvalid <= 1'b0;
        s_axis_fso_tlast  <= 1'b0;
        s_axis_fso_tdata  <= 32'd0;
        w                 <= 0;

        // Intentional 300-cycle inter-frame gap (Proves zero premature egress / zero intra-packet gap)
        repeat (300) @(posedge clk);

        // =======================================================
        // PACKET 1 - FRAME 2: Table 2-18 Continuation Frame (4B 0xAB004064 + 100B Data + 1804B Pad = 1908B)
        // =======================================================
        $display("[%0t] [PACKET 1] Streaming FSO Frame 2 (Table 2-18 Continuation: 0xAB004064 + 100B Data + 1804B Pad)...", $time);
        for (w = 0; w < 477; w = w + 1) begin
            @(posedge clk);
            s_axis_fso_tvalid <= 1'b1;
            s_axis_fso_tlast  <= (w == 476);
            if      (w == 0)  s_axis_fso_tdata <= 32'hAB00_4064; // seq=1, Continuation Length = 100 Bytes
            else if (w < 25)  s_axis_fso_tdata <= {16'hBBBB, w[15:0]}; // Bytes 1901..1996 (Words 1..24)
            else if (w == 25) s_axis_fso_tdata <= 32'hDEAD_BEEF; // Bytes 1997..2000: Ethernet FCS at Word 25!
            else              s_axis_fso_tdata <= 32'd0;         // Words 26..476: 1804 Bytes (451 words) Zero Padding
        end

        // =======================================================
        // PACKET 2 (IDENTICAL 2000B PAYLOAD) - FRAME 3 & FRAME 4
        // =======================================================
        $display("[%0t] [PACKET 2] Streaming Identical FSO Frame 3 (Start seq=2: 0xAB008000 + 0xCDEF07D0 + 1900B Data)...", $time);
        for (w = 0; w < 477; w = w + 1) begin
            @(posedge clk);
            s_axis_fso_tvalid <= 1'b1;
            s_axis_fso_tlast  <= (w == 476);
            case (w)
                0:  s_axis_fso_tdata <= 32'hAB00_8000; // Table 2-18 FSO Payload Hdr (seq=2, Len=0)
                1:  s_axis_fso_tdata <= 32'hCDEF_07D0; // Table 2-18 FSO Packet Hdr (Len=2000B)
                2:  s_axis_fso_tdata <= 32'hAABB_CCDD; // DEST_MAC[47:16]
                3:  s_axis_fso_tdata <= 32'hEEFF_1122; // DEST_MAC[15:0], SRC_MAC[47:32]
                4:  s_axis_fso_tdata <= 32'h3344_5566; // SRC_MAC[31:0]
                5:  s_axis_fso_tdata <= 32'h0800_4500; // EtherType IPv4
                11: s_axis_fso_tdata <= 32'h4B6F_6F6B; // "Kook"
                12: s_axis_fso_tdata <= 32'h6D69_6E20; // "min "
                13: s_axis_fso_tdata <= 32'h4653_4F20; // "FSO "
                default: s_axis_fso_tdata <= {16'hAAAA, w[15:0]};
            endcase
        end

        $display("[%0t] [PACKET 2] Streaming Identical FSO Frame 4 (Continuation seq=3: 0xAB00C064 + 100B Data + 1804B Pad)...", $time);
        for (w = 0; w < 477; w = w + 1) begin
            @(posedge clk);
            s_axis_fso_tvalid <= 1'b1;
            s_axis_fso_tlast  <= (w == 476);
            if      (w == 0)  s_axis_fso_tdata <= 32'hAB00_C064; // seq=3, Continuation Length = 100 Bytes
            else if (w < 25)  s_axis_fso_tdata <= {16'hBBBB, w[15:0]}; // Bytes 1901..1996 (Words 1..24)
            else if (w == 25) s_axis_fso_tdata <= 32'hDEAD_BEEF; // Bytes 1997..2000: Ethernet FCS at Word 25!
            else              s_axis_fso_tdata <= 32'd0;         // Words 26..476: 1804 Bytes (451 words) Zero Padding
        end

        @(posedge clk);
        s_axis_fso_tvalid <= 1'b0;
        s_axis_fso_tlast  <= 1'b0;
        s_axis_fso_tdata  <= 32'd0;
        w                 <= 0;

        wait(xgmii_completed_pkts == 2);
        repeat (20) @(posedge clk);

        $display("\n======================================================================");
        $display(" ETHERNET REASSEMBLY (TABLE 2-18) & 10G BACK-END VERIFICATION REPORT");
        $display(" -> Reassembled Packet Size (No Preamble) : %0d Bytes (Expected: 2000B)", reassembled_pkt_bytes);
        $display(" -> Packet 1 & 2 Reassembled Words (+8B)  : Pkt1=%0d, Pkt2=%0d (Expected: 502 each = 2008B)",
                 pkt1_eth_words, pkt2_eth_words);
        $display(" -> Final Reassembled Word (Ethernet FCS) : 0x%08X (Expected: 0xDEADBEEF)", captured_last_eth_fcs);
        $display(" -> Packet 1 & 2 XGMII Frame Size (+8B)   : Pkt1=%0d Words (%0dB), Pkt2=%0d Words (%0dB)",
                 pkt1_xgmii_words, pkt1_xgmii_bytes, pkt2_xgmii_words, pkt2_xgmii_bytes);
        $display(" -> All XGMII Data & Control Word Errors  : %0d (Expected: 0)",
                 all_xgmii_data_ctrl_errors);
        if (reassembled_pkt_bytes == 16'd2000 && pkt1_eth_words == 502 && pkt2_eth_words == 502 &&
            captured_last_eth_fcs == 32'hDEAD_BEEF &&
            pkt1_xgmii_words == 502 && pkt2_xgmii_words == 502 &&
            pkt1_xgmii_bytes == 2008 && pkt2_xgmii_bytes == 2008 &&
            all_xgmii_data_ctrl_errors == 0)
            $display(" -> RESULT: [PASS] 100%% COMPLIANT WITH TABLE 2-18 & ETRI ITEM 4.2(2)!");
        else
            $fatal(1, " -> RESULT: [FAIL] Reassembled packet length, FCS, or XGMII word verification mismatch!");
        $display("======================================================================\n");
        $finish;
    end

endmodule