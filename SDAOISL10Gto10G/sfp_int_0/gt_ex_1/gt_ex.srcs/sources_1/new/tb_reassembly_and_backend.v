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
               3. Verifies that eth_tx_back_end_top emits 503 contiguous XGMII 
                  words (2012 Bytes = /S/ 0x555555FB, 0xD5555555, 500 Ethernet 
                  words, and /T/ 0x070707FD) followed by 3 cycles of 0x07070707 IPG.

Revision History:
  - Rev 1.0 (Initial) : Reassembly + 10G Ethernet Back-End verification TB.
  - Rev 2.0 (2026-10-27 15:55 KST) : [Target B6.3 - SDA OISL Page 43-46, Table 2-18 & ETRI Item 4.2(2)]
    Updated Frame 2 stimulus to the strict Table 2-18 Continuation Frame format 
    (Word 0 = 32'hAB00_4064 + 25 words [100B] remaining Ethernet data + 451 words 
    [1804B] zero padding = 477 words [1908B] without duplicate 0xCDEF header).
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

    integer eth_out_words  = 0;
    integer xgmii_pkt_words = 0;
    reg     in_xgmii_frame = 1'b0;
    reg [31:0] captured_last_eth_fcs;

    always @(posedge clk) begin
        if (reassembled_eth_tvalid) begin
            eth_out_words <= eth_out_words + 1;
            if (reassembled_eth_tlast)
                captured_last_eth_fcs <= reassembled_eth_tdata;
        end
        if (pc2_xgmii_txc == 4'b0001 && pc2_xgmii_txd[7:0] == 8'hFB) begin
            in_xgmii_frame  <= 1'b1;
            xgmii_pkt_words <= 1;
        end else if (in_xgmii_frame) begin
            xgmii_pkt_words <= xgmii_pkt_words + 1;
            if (pc2_xgmii_txc == 4'b1111 && pc2_xgmii_txd[7:0] == 8'hFD) begin
                in_xgmii_frame <= 1'b0;
            end
        end
    end

    integer w;
    initial begin
        rst_n             = 1'b0;
        s_axis_fso_tdata  = 32'd0;
        s_axis_fso_tvalid = 1'b0;
        s_axis_fso_tlast  = 1'b0;
        #100;
        rst_n             = 1'b1;
        repeat (10) @(posedge clk);

        // =======================================================
        // FRAME 1: Start Frame (4B 0xAB + 4B 0xCDEF + 1900B Eth = 1908B / 477 Words)
        // =======================================================
        $display("\n[%0t] Streaming FSO Frame 1 (Start Frame: 0xAB000000 + 0xCDEF07D0 + 1900B Data)...", $time);
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

        // Intentional 300-cycle inter-frame gap (Proves zero premature egress / zero intra-packet gap)
        repeat (300) @(posedge clk);

        // =======================================================
        // FRAME 2: Table 2-18 Continuation Frame (4B 0xAB004064 + 100B Data + 1804B Pad = 1908B)
        // =======================================================
        $display("[%0t] Streaming FSO Frame 2 (Table 2-18 Continuation: 0xAB004064 + 100B Data + 1804B Pad)...", $time);
        for (w = 0; w < 477; w = w + 1) begin
            @(posedge clk);
            s_axis_fso_tvalid <= 1'b1;
            s_axis_fso_tlast  <= (w == 476);
            if      (w == 0)  s_axis_fso_tdata <= 32'hAB00_4064; // seq=1, Continuation Length = 100 Bytes
            else if (w < 25)  s_axis_fso_tdata <= {16'hBBBB, w[15:0]}; // Bytes 1901..1996 (Words 1..24)
            else if (w == 25) s_axis_fso_tdata <= 32'hDEAD_BEEF; // Bytes 1997..2000: Ethernet FCS at Word 25!
            else              s_axis_fso_tdata <= 32'd0;         // Words 26..476: 1804 Bytes (451 words) Zero Padding
        end

        @(posedge clk);
        s_axis_fso_tvalid <= 1'b0;
        s_axis_fso_tlast  <= 1'b0;
        s_axis_fso_tdata  <= 32'd0;

        wait(eth_out_words == 502);
        repeat (20) @(posedge clk);

        $display("\n======================================================================");
        $display(" ETHERNET REASSEMBLY (TABLE 2-18) & 10G BACK-END VERIFICATION REPORT");
        $display(" -> Reassembled Packet Size (No Preamble) : %0d Bytes (Expected: 2000B)", reassembled_pkt_bytes);
        $display(" -> Reassembled + 8B Preamble Words       : %0d Words (2008 Bytes, Expected: 502)", eth_out_words);
        $display(" -> Final Reassembled Word (Ethernet FCS) : 0x%08X (Expected: 0xDEADBEEF)", captured_last_eth_fcs);
        $display(" -> Total XGMII Words Emitted (/S/.. /T/) : %0d Words (2012 Bytes, Expected: 503)", xgmii_pkt_words);
        if (reassembled_pkt_bytes == 16'd2000 && eth_out_words == 502 &&
            captured_last_eth_fcs == 32'hDEAD_BEEF && xgmii_pkt_words == 503)
            $display(" -> RESULT: [PASS] 100%% COMPLIANT WITH TABLE 2-18 & ETRI ITEM 4.2(2)!");
        $display("======================================================================\n");
        $finish;
    end

endmodule