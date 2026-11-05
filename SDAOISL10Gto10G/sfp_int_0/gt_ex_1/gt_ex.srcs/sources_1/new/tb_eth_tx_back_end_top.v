`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_eth_tx_back_end_top
Description  : Standalone Verification Testbench for eth_tx_back_end_top.v
               (eth_mac_packing_tx + xgmii_tx_formatter) at 312.5 MHz.

               Revision History:
               - Rev 1.0 (Initial) : Basic stimulus testbench for eth_tx_back_end_top.
               - Rev 1.1 (2026-10-22 07:09 KST) :
                 1. Preserved original module/instance names and port structure.
                 2. Upgraded input stimulus to feed an authentic 502-word 
                    (2008-Byte) Ethernet frame (2 words [8B] Preamble 
                    0x55555555_555555D5 + 500 words [2000B] Jumbo Ethernet 
                    Packet ending in FCS 0xDEADBEEF).
                 3. Added zero-lag waveform counters for input (in_word_cnt 
                    1..502, in_byte_cnt 4..2008) and XGMII output 
                    (xgmii_word_cnt 1..502, xgmii_byte_cnt 4..2008).
               - Rev 2.0 (2026-11-04 11:30 KST) : [Back-to-Back 2x2000B Packet & Hardware Bridge Gap Proof]
                 1. Extended stimulus to transmit two identical 502-word (2008-Byte) 
                    Jumbo Ethernet frames ("Kookmin FSO " + FCS 0xDEADBEEF) separated 
                    by the 4-cycle DR_IPG gap for uut (RUN_MODE = 1).
                 2. Added a parallel companion verification chain (u_hw_bridge_verify -> 
                    u_hw_packing -> u_hw_formatter) with OUTPUT_PACKET_GAP_CYCLES = 4 
                    where Packet 2 is pre-queued in eth_packet_cdc while Packet 1 is still 
                    draining, automatically proving the 4-cycle destination gap (m_valid == 0), 
                    /T/ emission, and zero lost preamble words in a single simulation run.
               - Rev 2.1 (2026-11-04 11:55 KST) : [Audit Handshake Fix & Full Word-by-Word XGMII Checker]
                 1. Fixed handshake contract on u_hw_packing by driving '.mux_valid' with 
                    'hw_bridge_xfer_valid = (hw_bridge_m_valid && hw_bridge_m_ready)' so 
                    packing only accepts words when an actual ready/valid transfer occurs 
                    after the initial pre-queue hold.
                 2. Added word-by-word XGMII data/control verification for both uut and 
                    u_hw_bridge_verify, plus assertions that dropped_packets, overflow_words, 
                    and underflow_count all equal 0.
               - Rev 2.2 (2026-11-04 12:05 KST) : [XPM FIFO Reset Busy Wait Alignment]
                 Waits for xpm_fifo_async reset busy flags (!wb && !rb && !lwb && !lrb) 
                 inside u_hw_bridge_verify to deassert after rst_n release before 
                 injecting Packet 1, ensuring Packet 1 is admitted with zero dropped 
                 packets and zero overflow words in Vivado XSim.
               - Rev 2.3 (2026-11-04 13:45 KST) : [Symmetric 502-Word / 2008-Byte Dynamic Counters]
                 Standardized all waveform and summary packet counters to count pure 
                 active Preamble + Ethernet payload words (0 when IDLE or during /T/, 
                 1..502 words / 4..2008 bytes during frame transmission, scaling 
                 dynamically with any input packet length) while keeping /T/ (0xFD) 
                 verification active in the background checker.
               - Rev 2.4 (2026-11-04 13:58 KST) : [Added 1-Byte-per-1-Byte Sub-Cycle Counters]
                 Added sub-cycle 1-Byte-per-1-Byte counters (in_byte_1b_cnt, 
                 xgmii_byte_1b_cnt, and hw_xgmii_byte_1b_cnt) stepping 1, 2, 3, 4...2008 
                 every 0.8 ns alongside the Clock and Byte-per-Clock counters.
               - Rev 2.5 (2026-11-04 17:30 KST) : [Waveform Cleanup & Gated FWFT Display]
                 1. Removed redundant/lagging helper signals (_q, _raw, loop_w, loop_pkt) 
                    so only the 3 synchronized zero-lag counters (_clk_cnt, _byte_clk_cnt, 
                    _byte_1b_cnt) appear per interface.
                 2. Gated 'hw_bridge_m_data' display with 'hw_bridge_xfer_valid' so FWFT 
                    pre-fall-through data does not appear on the bus while m_ready == 0.
                 3. Extended post-completion idle window to 150 cycles so final packet 
                    counters (sim_pkt_cnt=2, hw_pkt_cnt=2, 502 words) are clearly visible.
               - Rev 2.6 (2026-11-04 17:45 KST) : [Grouped Bus-to-Counter Ordering & Zero-Lag Summary Latch]
                 Ordered signal declarations so each bus (data_in, xgmii_txd, 
                 hw_bridge_m_data, hw_pack_data, hw_xgmii_txd) is immediately followed 
                 by its own 3-metric counter trio in Vivado Objects, and added 3-metric 
                 counters for hw_bridge_m_data (hw_bridge_clk_cnt, hw_bridge_byte_clk_cnt, 
                 hw_bridge_byte_1b_cnt).
===========================================================================
*/

module tb_eth_tx_back_end_top();
    reg clk;
    reg rst_n;

    // Sub-cycle 0.8 ns byte stepper (1 -> 2 -> 3 -> 4 inside each 3.2 ns word clock)
    reg [2:0] sub_byte_step = 3'd1;
    always @(posedge clk) begin
        sub_byte_step <= 3'd1;
        #0.8 sub_byte_step <= 3'd2;
        #0.8 sub_byte_step <= 3'd3;
        #0.8 sub_byte_step <= 3'd4;
    end

    // =========================================================================
    // GROUP 1: INPUT STREAM TO BACK-END (data_in + 3 Counters: 1..502 / 4..2008 / 1..2008)
    // =========================================================================
    reg         en              = 1'b0;
    reg  [31:0] data_in         = 32'd0;
    reg  [15:0] in_clk_cnt      = 16'd0;
    reg  [15:0] in_byte_clk_cnt = 16'd0;
    wire [15:0] in_byte_1b_cnt  = en ? (((in_clk_cnt - 16'd1) * 16'd4) + {13'd0, sub_byte_step}) : 16'd0;

    // =========================================================================
    // GROUP 2: DIRECT XGMII OUTPUT (uut, RUN_MODE=1) + 3 Counters (0 on IDLE & /T/)
    // =========================================================================
    wire [31:0] xgmii_txd;
    wire [3:0]  xgmii_txc;
    wire         xgmii_active       = (xgmii_txc != 4'b1111);
    reg  [15:0] raw_xgmii_idx      = 16'd0;
    wire [15:0] xgmii_clk_cnt      = xgmii_active ? (raw_xgmii_idx + 16'd1) : 16'd0;
    wire [15:0] xgmii_byte_clk_cnt = xgmii_active ? ((raw_xgmii_idx + 16'd1) * 16'd4) : 16'd0;
    wire [15:0] xgmii_byte_1b_cnt  = xgmii_active ? ((raw_xgmii_idx * 16'd4) + {13'd0, sub_byte_step}) : 16'd0;

    // =========================================================================
    // GROUP 3: HARDWARE CDC BRIDGE OUTPUT (hw_bridge_m_data + 3 Counters)
    // =========================================================================
    reg         hw_bridge_m_ready    = 1'b0;
    wire [31:0] hw_bridge_raw_m_data;
    wire        hw_bridge_m_valid;
    wire        hw_bridge_m_last;
    wire        hw_bridge_xfer_valid = hw_bridge_m_valid && hw_bridge_m_ready;
    wire [31:0] hw_bridge_m_data     = hw_bridge_xfer_valid ? hw_bridge_raw_m_data : 32'd0;
    reg  [15:0] raw_hw_bridge_idx    = 16'd0;
    wire [15:0] hw_bridge_clk_cnt      = hw_bridge_xfer_valid ? (raw_hw_bridge_idx + 16'd1) : 16'd0;
    wire [15:0] hw_bridge_byte_clk_cnt = hw_bridge_xfer_valid ? ((raw_hw_bridge_idx + 16'd1) * 16'd4) : 16'd0;
    wire [15:0] hw_bridge_byte_1b_cnt  = hw_bridge_xfer_valid ? ((raw_hw_bridge_idx * 16'd4) + {13'd0, sub_byte_step}) : 16'd0;
    wire [31:0] hw_dropped_pkts, hw_overflow_words, hw_underflow_cnt;
    wire [12:0] hw_source_occ;

    // =========================================================================
    // GROUP 4: HARDWARE PACKING OUTPUT (hw_pack_data + 3 Counters)
    // =========================================================================
    wire [31:0] hw_pack_data;
    wire        hw_pack_valid;
    reg  [15:0] raw_hw_pack_idx      = 16'd0;
    wire [15:0] hw_pack_clk_cnt      = hw_pack_valid ? (raw_hw_pack_idx + 16'd1) : 16'd0;
    wire [15:0] hw_pack_byte_clk_cnt = hw_pack_valid ? ((raw_hw_pack_idx + 16'd1) * 16'd4) : 16'd0;
    wire [15:0] hw_pack_byte_1b_cnt  = hw_pack_valid ? ((raw_hw_pack_idx * 16'd4) + {13'd0, sub_byte_step}) : 16'd0;

    // =========================================================================
    // GROUP 5: HARDWARE XGMII OUTPUT (hw_xgmii_txd + 3 Counters, 100% Aligned with hw_xgmii_txd!)
    // =========================================================================
    wire [31:0] hw_xgmii_txd;
    wire [3:0]  hw_xgmii_txc;
    wire        hw_xgmii_active       = (hw_xgmii_txc != 4'b1111);
    reg  [15:0] raw_hw_xgmii_idx      = 16'd0;
    wire [15:0] hw_xgmii_clk_cnt      = hw_xgmii_active ? (raw_hw_xgmii_idx + 16'd1) : 16'd0;
    wire [15:0] hw_xgmii_byte_clk_cnt = hw_xgmii_active ? ((raw_hw_xgmii_idx + 16'd1) * 16'd4) : 16'd0;
    wire [15:0] hw_xgmii_byte_1b_cnt  = hw_xgmii_active ? ((raw_hw_xgmii_idx * 16'd4) + {13'd0, sub_byte_step}) : 16'd0;

    // =========================================================================
    // GROUP 6: SCOREBOARD SUMMARY COUNTERS
    // =========================================================================
    integer sim_pkt_cnt       = 0;
    integer sim_pkt1_words    = 0;
    integer sim_pkt2_words    = 0;
    integer sim_xgmii_err_cnt = 0;

    integer hw_pkt_cnt        = 0;
    integer hw_pkt1_words     = 0;
    integer hw_pkt2_words     = 0;
    integer hw_xgmii_err_cnt  = 0;
    integer measured_hw_gap   = 0;

    wire        txp_unused, txn_unused;
    wire [15:0] hw_tx_word_cnt_unused, hw_tx_byte_cnt_unused;
    reg         hw_xfer_d1      = 1'b0;
    reg         counting_hw_gap = 1'b0;
    integer     hw_gap_counter  = 0;

    // 1. Primary DUT: eth_tx_back_end_top in Simulation Mode (RUN_MODE = 1)
    eth_tx_back_end_top #(
        .RUN_MODE (1)
    ) uut (
        .clk       (clk),
        .rst_n     (rst_n),
        .data_in   (data_in),
        .en        (en),
        .xgmii_txd (xgmii_txd),
        .xgmii_txc (xgmii_txc),
        .refclk_p  (1'b0),
        .refclk_n  (1'b1),
        .reset     (~rst_n),
        .dclk      (clk),
        .txp       (txp_unused),
        .txn       (txn_unused)
    );

    // 2. Parallel Hardware Bridge Verification Chain (eth_packet_cdc with OUTPUT_PACKET_GAP_CYCLES = 4)
    eth_packet_cdc #(
        .DATA_WIDTH               (32),
        .DATA_DEPTH               (4096),
        .MAX_PACKET_WORDS         (512),
        .END_ON_VALID_GAP         (1),
        .OUTPUT_PACKET_GAP_CYCLES (4)
    ) u_hw_bridge_verify (
        .s_clk            (clk),
        .s_rst_n          (rst_n),
        .m_clk            (clk),
        .m_rst_n          (rst_n),
        .s_data           (data_in),
        .s_valid          (en),
        .s_last           (1'b0),
        .m_data           (hw_bridge_raw_m_data),
        .m_valid          (hw_bridge_m_valid),
        .m_last           (hw_bridge_m_last),
        .m_ready          (hw_bridge_m_ready),
        .dropped_packets  (hw_dropped_pkts),
        .overflow_words   (hw_overflow_words),
        .underflow_count  (hw_underflow_cnt),
        .source_occupancy (hw_source_occ)
    );

    eth_mac_packing_tx u_hw_packing (
        .clk         (clk),
        .rst_n       (rst_n),
        .mux_data    (hw_bridge_m_data),
        .mux_valid   (hw_bridge_xfer_valid),
        .pack_data   (hw_pack_data),
        .pack_valid  (hw_pack_valid),
        .tx_word_cnt (hw_tx_word_cnt_unused),
        .tx_byte_cnt (hw_tx_byte_cnt_unused)
    );

    xgmii_tx_formatter u_hw_formatter (
        .clk       (clk),
        .rst_n     (rst_n),
        .mac_data  (hw_pack_data),
        .mac_valid (hw_pack_valid),
        .xgmii_txd (hw_xgmii_txd),
        .xgmii_txc (hw_xgmii_txc)
    );

    always #1.6 clk = ~clk; // 312.5 MHz (Period = 3.2 ns)

    // Watchdog Timeout Guard
    initial begin
        #100000;
        $fatal(1, "\n[TIMEOUT ERROR] tb_eth_tx_back_end_top did not complete within 100 us!\n");
    end

    // Helper function for the 502-word (2008-Byte) Jumbo Frame ("Kookmin FSO " + FCS 0xDEADBEEF)
    function [31:0] get_eth_word502(input integer idx);
        begin
            case (idx)
                0:   get_eth_word502 = 32'h5555_5555; // Preamble Word 1 (Bytes 1..4)
                1:   get_eth_word502 = 32'h5555_55D5; // Preamble + SFD Word 2 (Bytes 5..8)
                2:   get_eth_word502 = 32'hDA01_0203; // Dest MAC [47:16]
                3:   get_eth_word502 = 32'h0405_5A01; // Dest MAC [15:0] + Src MAC [47:32]
                4:   get_eth_word502 = 32'h0203_0405; // Src MAC [31:0]
                5:   get_eth_word502 = 32'h0800_4500; // EtherType IPv4 (0x0800)
                11:  get_eth_word502 = 32'h4B6F_6F6B; // ASCII "Kook"
                12:  get_eth_word502 = 32'h6D69_6E20; // ASCII "min "
                13:  get_eth_word502 = 32'h4653_4F20; // ASCII "FSO "
                501: get_eth_word502 = 32'hDEAD_BEEF; // 502nd Word (Byte 2008): Ethernet FCS
                default: get_eth_word502 = 32'hA0A0_B0B0 + idx;
            endcase
        end
    endfunction

    // Expected 36-bit {txc, txd} XGMII word for index 0..502
    function [35:0] get_expected_xgmii503(input integer x_idx);
        reg [31:0] w_in;
        begin
            if (x_idx == 0) begin
                get_expected_xgmii503 = {4'b0001, 32'h5555_55FB}; // /S/ + 3B Preamble
            end else if (x_idx == 1) begin
                get_expected_xgmii503 = {4'b0000, 32'hD555_5555}; // 3B Preamble + SFD
            end else if (x_idx <= 501) begin
                w_in = get_eth_word502(x_idx);
                get_expected_xgmii503 = {4'b0000, w_in};
            end else begin
                get_expected_xgmii503 = {4'b1111, 32'h0707_07FD}; // /T/ Terminate
            end
        end
    endfunction

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            raw_xgmii_idx      <= 16'd0;
            raw_hw_bridge_idx  <= 16'd0;
            raw_hw_pack_idx    <= 16'd0;
            raw_hw_xgmii_idx   <= 16'd0;
            sim_pkt_cnt        <= 0;
            sim_pkt1_words     <= 0;
            sim_pkt2_words     <= 0;
            sim_xgmii_err_cnt  <= 0;
            hw_pkt_cnt         <= 0;
            hw_pkt1_words      <= 0;
            hw_pkt2_words      <= 0;
            hw_xgmii_err_cnt   <= 0;
            hw_xfer_d1         <= 1'b0;
            counting_hw_gap    <= 1'b0;
            hw_gap_counter     <= 0;
            measured_hw_gap    <= 0;
        end else begin
            // 1. Track Simulation Mode (uut) XGMII words & word-by-word content (502 words = 2008B)
            if (xgmii_active) begin
                if ({xgmii_txc, xgmii_txd} !== get_expected_xgmii503(raw_xgmii_idx))
                    sim_xgmii_err_cnt <= sim_xgmii_err_cnt + 1;
                raw_xgmii_idx <= raw_xgmii_idx + 16'd1;
            end else begin
                if ((xgmii_txc == 4'b1111) && (xgmii_txd[7:0] == 8'hFD)) begin
                    if ({xgmii_txc, xgmii_txd} !== get_expected_xgmii503(502))
                        sim_xgmii_err_cnt <= sim_xgmii_err_cnt + 1;
                    sim_pkt_cnt <= sim_pkt_cnt + 1;
                    if (sim_pkt_cnt == 0) sim_pkt1_words <= raw_xgmii_idx;
                    else                  sim_pkt2_words <= raw_xgmii_idx;
                end
                raw_xgmii_idx <= 16'd0;
            end

            // 2. Track Hardware Bridge output index (resets on m_last or when valid==0)
            if (hw_bridge_xfer_valid) begin
                if (hw_bridge_m_last)
                    raw_hw_bridge_idx <= 16'd0;
                else
                    raw_hw_bridge_idx <= raw_hw_bridge_idx + 16'd1;
            end else begin
                raw_hw_bridge_idx <= 16'd0;
            end

            // 3. Track Hardware Bridge Packing index
            if (hw_pack_valid)
                raw_hw_pack_idx <= raw_hw_pack_idx + 16'd1;
            else
                raw_hw_pack_idx <= 16'd0;

            // 4. Track Hardware Bridge (u_hw_bridge_verify) 4-cycle m_valid=0 gap when m_ready==1
            hw_xfer_d1 <= hw_bridge_xfer_valid;
            if (hw_xfer_d1 && !hw_bridge_xfer_valid && hw_bridge_m_ready && (hw_pkt_cnt == 0)) begin
                counting_hw_gap <= 1'b1;
                hw_gap_counter  <= 1;
            end else if (counting_hw_gap) begin
                if (!hw_bridge_xfer_valid) begin
                    hw_gap_counter <= hw_gap_counter + 1;
                end else begin
                    measured_hw_gap <= hw_gap_counter;
                    counting_hw_gap <= 1'b0;
                end
            end

            // 5. Track Hardware Bridge XGMII words & word-by-word content (502 words = 2008B)
            if (hw_xgmii_active) begin
                if ({hw_xgmii_txc, hw_xgmii_txd} !== get_expected_xgmii503(raw_hw_xgmii_idx))
                    hw_xgmii_err_cnt <= hw_xgmii_err_cnt + 1;
                raw_hw_xgmii_idx <= raw_hw_xgmii_idx + 16'd1;
            end else begin
                if ((hw_xgmii_txc == 4'b1111) && (hw_xgmii_txd[7:0] == 8'hFD)) begin
                    if ({hw_xgmii_txc, hw_xgmii_txd} !== get_expected_xgmii503(502))
                        hw_xgmii_err_cnt <= hw_xgmii_err_cnt + 1;
                    hw_pkt_cnt <= hw_pkt_cnt + 1;
                    if (hw_pkt_cnt == 0) hw_pkt1_words <= raw_hw_xgmii_idx;
                    else                 hw_pkt2_words <= raw_hw_xgmii_idx;
                end
                raw_hw_xgmii_idx <= 16'd0;
            end
        end
    end

    integer i   = 0;
    integer pkt = 0;

    initial begin
        clk               = 0;
        rst_n             = 0;
        data_in           = 32'd0;
        en                = 0;
        in_clk_cnt        = 16'd0;
        in_byte_clk_cnt   = 16'd0;
        hw_bridge_m_ready = 1'b0;
        i                 = 0;
        pkt               = 0;
        
        #50;
        rst_n = 1;
        // Wait until xpm_fifo_async inside u_hw_bridge_verify exits reset busy (!wb && !rb && !lwb && !lrb)
        repeat (5) @(posedge clk);
        wait(!u_hw_bridge_verify.wb && !u_hw_bridge_verify.rb &&
             !u_hw_bridge_verify.lwb && !u_hw_bridge_verify.lrb);
        repeat (5) @(posedge clk);

        // Send TWO identical 502-word (2008-Byte) Jumbo Ethernet Frames back-to-back
        // separated by the 4-cycle DR_IPG gap (matching ethernet_frame_reassembly output).
        for (pkt = 1; pkt <= 2; pkt = pkt + 1) begin
            for (i = 0; i < 502; i = i + 1) begin
                @(posedge clk);
                en              <= 1'b1;
                in_clk_cnt      <= i[15:0] + 16'd1;
                in_byte_clk_cnt <= (i[15:0] + 16'd1) * 16'd4;
                data_in         <= get_eth_word502(i);

                if ((pkt == 2) && (i == 250))
                    hw_bridge_m_ready <= 1'b1;
            end

            // 4-cycle DR_IPG between Packet 1 and Packet 2
            repeat (4) begin
                @(posedge clk);
                data_in         <= 32'd0;
                en              <= 1'b0;
                in_clk_cnt      <= 16'd0;
                in_byte_clk_cnt <= 16'd0;
                i               <= 0;
            end
        end
        pkt <= 0;

        wait(sim_pkt_cnt == 2 && hw_pkt_cnt == 2);
        repeat (150) @(posedge clk);

        $display("\n======================================================================");
        $display(" 10G ETHERNET TX BACK-END & HARDWARE CDC BRIDGE VERIFICATION REPORT");
        $display(" -> [RUN_MODE=1 Direct]   Pkt1 & Pkt2 Frame Size  : %0d, %0d Words (Expected: 502 each = 2008B)",
                 sim_pkt1_words, sim_pkt2_words);
        $display(" -> [RUN_MODE=1 Direct]   XGMII Word/Control Errs : %0d (Expected: 0)",
                 sim_xgmii_err_cnt);
        $display(" -> [RUN_MODE=0 Bridge]   Pkt1 & Pkt2 Frame Size  : %0d, %0d Words (Expected: 502 each = 2008B)",
                 hw_pkt1_words, hw_pkt2_words);
        $display(" -> [RUN_MODE=0 Bridge]   XGMII Word/Control Errs : %0d (Expected: 0)",
                 hw_xgmii_err_cnt);
        $display(" -> [RUN_MODE=0 Bridge]   Measured m_valid=0 Gap  : %0d Cycles (Expected: 4 Cycles)",
                 measured_hw_gap);
        $display(" -> [RUN_MODE=0 Bridge]   Dropped/Overflow/Underf : %0d / %0d / %0d (Expected: 0 / 0 / 0)",
                 hw_dropped_pkts, hw_overflow_words, hw_underflow_cnt);
        if (sim_pkt1_words == 502 && sim_pkt2_words == 502 && sim_xgmii_err_cnt == 0 &&
            hw_pkt1_words  == 502 && hw_pkt2_words  == 502 && hw_xgmii_err_cnt  == 0 &&
            measured_hw_gap == 4  && hw_dropped_pkts == 0  && hw_overflow_words == 0 &&
            hw_underflow_cnt == 0)
            $display(" -> RESULT: [PASS] BOTH RUN_MODE=1 AND HARDWARE CDC BRIDGE (GAP=4) VERIFIED!");
        else
            $fatal(1, " -> RESULT: [FAIL] XGMII word count, content, or hardware bridge gap mismatch!");
        $display("======================================================================\n");
        $finish;
    end

endmodule