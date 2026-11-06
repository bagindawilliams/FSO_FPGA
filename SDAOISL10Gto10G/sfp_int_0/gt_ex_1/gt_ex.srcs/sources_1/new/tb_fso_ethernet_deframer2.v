`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_fso_ethernet_deframer2
Description  : Extended End-to-End Subsystem Verification Testbench from
               CDC 4 (rx_logic_gth: 200.0 MHz -> 312.5 MHz) through
               FSO Ethernet Deframer (CRC-16, CRC-32, ARQ RX Controller,
               Frame Demultiplexer, IDLE Discard, MGMT Extraction, and
               Selective Repeat ARQ Reorder Buffer) to Ethernet Frame
               Reassembly (Table 2-18 De-Segmenter & 8B Preamble Injector).

               DUT CHAIN VERIFIED (MATCHES RECEIVER ARCHITECTURE DIAGRAM):
               1. CDC 4 (rx_logic_gth.v) :
                  Bridges 200.0 MHz core_rx output (16B Header @ 8-bit,
                  1912B Payload @ 64-bit / 239 cycles) to 312.5 MHz
                  Deframer domain (16B Header @ 8-bit, 1912B Payload @
                  32-bit / 478 cycles).
                  Note: Uses 312.5 MHz read clock matching the CDC 4 unit
                  design (whereas top-level uses ~322.265625 MHz rx0_clk).
               2. FSO Ethernet Deframer (fso_ethernet_deframer.v) :
                  - deframer_header    : Table 2-15 CRC-16 check & 14B parser
                  - deframer_payload   : Table 2-15 CRC-32 check & 477W FIFO
                  - arq_rx_controller  : Trusted-header ACK/NAK & sequence ctrl
                  - frame_demultiplexer: Routes verified 477W (1908B) payload to:
                      * idle_discard.v                (2'b00 IDLE)
                      * mgmt_extraction.v             (2'b10 MGMT -> 5,000 km)
                      * arq_rx_reorder_ddr4_wrapper.v (2'b01 DATA -> 16-slot BRAM)
               3. Ethernet Frame Reassembly (ethernet_frame_reassembly.v) :
                  Strips Table 2-18 FSO headers (0xAB / 0xCDEF) and 1,804B
                  continuation padding, reassembles 1,900B (DAT1) + 100B (DAT2)
                  = 2,000B MAC payload, prepends 8B Ethernet Preamble + SFD
                  (32'h5555_5555, 32'h5555_55D5), and outputs 2,008B (502W)
                  Ethernet frames with 4-cycle DR_IPG separation.

               SELECTABLE TEST MODES (PARAMETER TEST_MODE = 0, 1, or 2):
               - TEST_MODE = 0 (Clean Mode - In-Order Without Out-of-Order Holding):
                 Streams 6 clean frames:
                 TXFN=1 (DAT1_A, fso_seq=0, 1900B) -> TXFN=2 (DAT2_A, fso_seq=1, 100B) ->
                 TXFN=3 (DAT1_B, fso_seq=2, 1900B) -> TXFN=4 (IDLE) ->
                 TXFN=5 (MGMT 5,000 km)            -> TXFN=6 (DAT2_B, fso_seq=3, 100B).
                 Proves in-order delivery (1 -> 2 -> 3 -> 6) with zero out-of-order
                 holding (reorder_ooo_buf_cnt == 0) and 2 x 502-word (1,004W = 4,016B,
                 4,000B MAC) reassembly with 0 mismatches.
               - TEST_MODE = 1 (Directed 9-Byte Payload Error & ARQ Reorder Recovery):
                 Injects a directed 9-byte payload error burst into the first attempt
                 of TXFN=2 (DAT2_A). Proves:
                 * CRC-32 failure detection (pld_crc_ok=0) & NAK(2) generation
                 * Out-of-order arrival of TXFN=3 (DAT1_B) -> ACK(3) & buffering in
                   ARQ RX Reorder RAM while Packet A remains held in Reassembly (0 pkts out)
                 * Concurrent IDLE discard (TXFN=4) & MGMT 5,000 km extraction (TXFN=5, ACK(5))
                 * Pre-retransmission checkpoint verification (477W to Reassembly, 0 pkts out,
                   TXFN=3 held in RAM, expected_txfn=2, 1 IDLE discarded, 1 MGMT valid)
                 * Stimulus-driven retransmission of clean TXFN=2 (DAT2_A) -> ACK(2) &
                   immediate back-to-back in-order release of TXFN=2 followed by buffered
                   TXFN=3, then TXFN=6!
               - TEST_MODE = 2 (Header CRC-16 Error + Payload CRC-32 Error & Recovery):
                 Precedes the TEST_MODE=1 sequence on TXFN=2 with a corrupted-header
                 attempt (1-bit flip in protected header field, clean payload). Proves
                 that corrupted headers (hdr_crc_ok=0) are silently ignored without
                 emitting false ACK/NAK or corrupting Reorder/Reassembly state, followed
                 by payload-error NAK(2) and full 2-packet recovery.

Revision History:
  - Rev 1.0 (2026-11-06 01:15 KST) : Initial 3-mode CDC 4 -> Deframer -> Reassembly TB.
  - Rev 1.1 (2026-11-06 02:10 KST) : Aligned ASCII marker capture to words 12..14.
  - Rev 1.2 (2026-11-06 04:10 KST) : [Audit Final Freeze Closure - CDC 4 Read/Write Counter Equality & Mode 0 Zero-OOO Enforcement]
    1. Added explicit CDC 4 read/write counter equality checks ('exp_cdc4_hdr_rd ==
       exp_cdc4_hdr_wr' and 'exp_cdc4_pld_rd == exp_cdc4_pld_wr') to the PASS condition
       so every stimulated header byte and payload word is proven to have exited CDC 4
       and been compared by the scoreboard.
    2. Added '((TEST_MODE != 0) || (reorder_ooo_buf_cnt == 0))' to the PASS condition
       and printed 'OooBufCnt' and 'InOrderDrainedCnt' in the console report.
    3. Clarified report labels for 'CleanPldRejectedOnCorruptHdr', 'MappedTXFN'
       (derived from payload Word 0 'fso_seq'), and 'StimulusFCS'.
===========================================================================
*/

module tb_fso_ethernet_deframer2 #(
    // =====================================================================
    // SELECT TEST MODE HERE (0, 1, or 2):
    //   0 = Clean Mode (6 attempts -> 2 packets, 0 out-of-order holding)
    //   1 = Directed 9-Byte Payload Error on DAT2_A & ARQ Reorder Recovery (7 attempts)
    //   2 = Header CRC-16 Error + Directed 9-Byte Payload Error & Recovery (8 attempts)
    // =====================================================================
    parameter integer TEST_MODE = 0
)();

    // =====================================================================
    // 1. CLOCKS, RESET & WATCHDOG TIMEOUT
    //    - clk_logic : 200.0 MHz (5.0 ns period) -> Write side of CDC 4
    //    - clk_gth   : 312.5 MHz (3.2 ns period) -> Read side of CDC 4, Deframer & Reassembly
    // =====================================================================
    reg clk_logic;
    reg clk_gth;
    reg rst_n;

    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic; // 200.0 MHz
    end

    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;     // 312.5 MHz
    end

    initial begin
        #300000;
        $fatal(1, "\n[WATCHDOG TIMEOUT] tb_fso_ethernet_deframer2 (TEST_MODE=%0d) did not complete within 300 us!\n", TEST_MODE);
    end

    wire [127:0] test_mode_str = (TEST_MODE == 0) ? "MODE0_CLEAN_INO " :
                                 (TEST_MODE == 1) ? "MODE1_PLD_ERR_RO" :
                                                    "MODE2_HDR_PLD_RO";

    // =====================================================================
    // 2. DUT INTERCONNECT WIRES (CDC 4 -> DEFRAMER -> REASSEMBLY)
    // =====================================================================
    // 2.1 Stimulus -> CDC 4 (200.0 MHz Domain, modeling core_rx output)
    reg         cdc4_en_head    = 1'b0;
    reg         cdc4_en_load    = 1'b0;
    reg  [7:0]  cdc4_header_in  = 8'd0;
    reg  [63:0] cdc4_payload_in = 64'd0;
    reg  [31:0] stim_label_str  = "IDLE";

    // 2.2 CDC 4 -> FSO Ethernet Deframer (312.5 MHz Domain)
    wire        cdc4_header_dv;
    wire [7:0]  cdc4_header_out;
    wire        cdc4_payload_dv;
    wire [31:0] cdc4_payload_out;

    // 2.3 FSO Ethernet Deframer -> Ethernet Frame Reassembly (312.5 MHz Domain)
    wire [31:0] defr_m_axis_tdata;
    wire        defr_m_axis_tvalid;
    wire        defr_m_axis_tlast;
    wire        defr_m_axis_tready;

    wire [15:0] local_fb_rxfn;
    wire        local_fb_ack;
    wire        local_fb_ack_valid;
    wire [15:0] peer_rxfn_out;
    wire        peer_ack_out;
    wire        peer_ack_valid_out;

    wire        hdr_crc_ok;
    wire        pld_crc_ok;
    wire [15:0] rx_txfn;
    wire [1:0]  rx_frame_type;
    wire [39:0] rx_tx_ts;
    wire [3:0]  rx_fcch_op;
    wire [15:0] rx_fcch_pl;
    wire [63:0] mgmt_range_meters;
    wire        mgmt_telemetry_valid;
    wire [15:0] expected_txfn;

    // 2.4 Ethernet Frame Reassembly Output (312.5 MHz Domain, 502 words = 2008B/pkt)
    wire [31:0] reasm_eth_tdata;
    wire        reasm_eth_tvalid;
    wire        reasm_eth_tlast;
    reg         reasm_eth_tready = 1'b1;
    wire [15:0] reassembled_pkt_bytes;
    wire [15:0] reassembled_pkt_cnt;

    // =====================================================================
    // 3. PRODUCTION MODULE INSTANTIATIONS (CDC 4 -> DEFRAMER -> REASSEMBLY)
    // =====================================================================

    // 3.1 Clock Domain Crossing 4 (rx_logic_gth.v: 200.0 MHz -> 312.5 MHz)
    rx_logic_gth u_cdc4 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en_head    (cdc4_en_head),
        .en_load    (cdc4_en_load),
        .header_in  (cdc4_header_in),
        .payload_in (cdc4_payload_in),
        .header_dv  (cdc4_header_dv),
        .header     (cdc4_header_out),
        .payload_dv (cdc4_payload_dv),
        .payload    (cdc4_payload_out)
    );

    // 3.2 FSO Ethernet Deframer (CRC-16, CRC-32, ARQ RX, Demux, IDLE Discard, MGMT, Reorder RAM)
    //     Configure Reorder Wrapper CLK_FREQ_HZ to 312,500,000 Hz matching clk_gth
    defparam u_deframer_top.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.CLK_FREQ_HZ = 312_500_000;

    fso_ethernet_deframer u_deframer_top (
        .clk                  (clk_gth),
        .rst_n                (rst_n),
        .s_axis_hdr_tvalid    (cdc4_header_dv),
        .s_axis_hdr_tdata     (cdc4_header_out),
        .s_axis_fso_tvalid    (cdc4_payload_dv),
        .s_axis_fso_tdata     (cdc4_payload_out),
        .m_axis_fso_tdata     (defr_m_axis_tdata),
        .m_axis_fso_tvalid    (defr_m_axis_tvalid),
        .m_axis_fso_tlast     (defr_m_axis_tlast),
        .m_axis_fso_tready    (defr_m_axis_tready),
        .local_fb_rxfn        (local_fb_rxfn),
        .local_fb_ack         (local_fb_ack),
        .local_fb_ack_valid   (local_fb_ack_valid),
        .peer_rxfn_out        (peer_rxfn_out),
        .peer_ack_out         (peer_ack_out),
        .peer_ack_valid_out   (peer_ack_valid_out),
        .hdr_crc_ok           (hdr_crc_ok),
        .pld_crc_ok           (pld_crc_ok),
        .rx_txfn              (rx_txfn),
        .rx_frame_type        (rx_frame_type),
        .rx_tx_ts             (rx_tx_ts),
        .rx_fcch_op           (rx_fcch_op),
        .rx_fcch_pl           (rx_fcch_pl),
        .mgmt_range_meters    (mgmt_range_meters),
        .mgmt_telemetry_valid (mgmt_telemetry_valid),
        .expected_txfn        (expected_txfn)
    );

    // 3.3 Ethernet Frame Reassembly (Table 2-18 De-Segmenter + 8B Preamble Injector)
    ethernet_frame_reassembly u_reassembly (
        .clk                   (clk_gth),
        .rst_n                 (rst_n),
        .s_axis_fso_tdata      (defr_m_axis_tdata),
        .s_axis_fso_tvalid     (defr_m_axis_tvalid),
        .s_axis_fso_tlast      (defr_m_axis_tlast),
        .s_axis_fso_tready     (defr_m_axis_tready),
        .m_axis_eth_tdata      (reasm_eth_tdata),
        .m_axis_eth_tvalid     (reasm_eth_tvalid),
        .m_axis_eth_tlast      (reasm_eth_tlast),
        .m_axis_eth_tready     (reasm_eth_tready),
        .reassembled_pkt_bytes (reassembled_pkt_bytes),
        .reassembled_pkt_cnt   (reassembled_pkt_cnt)
    );

    // =====================================================================
    // 4. WAVEFORM PROBES FOR EACH DIAGRAM BLOCK (IDLE DISCARD, MGMT, REORDER RAM)
    // =====================================================================
    wire        hdr_check_done_evt      = u_deframer_top.u_deframer.hdr_check_done;
    wire        pld_check_done_evt      = u_deframer_top.u_deframer.pld_check_done;
    wire        verified_pld_tvalid     = u_deframer_top.u_deframer.verified_pld_tvalid;
    wire [31:0] verified_pld_tdata      = u_deframer_top.u_deframer.verified_pld_tdata;
    wire        verified_pld_tlast      = u_deframer_top.u_deframer.verified_pld_tlast;

    // Frame Demultiplexer Branch Probes
    wire        demux_idle_tvalid       = u_deframer_top.u_deframer.u_frame_demultiplexer.u_idle_discard.s_axis_idle_tvalid;
    wire [31:0] demux_idle_tdata        = u_deframer_top.u_deframer.u_frame_demultiplexer.u_idle_discard.s_axis_idle_tdata;
    wire [15:0] idle_discard_frame_cnt  = u_deframer_top.u_deframer.u_frame_demultiplexer.idle_frame_cnt;

    wire        demux_mgmt_tvalid       = u_deframer_top.u_deframer.u_frame_demultiplexer.u_mgmt_extraction.s_axis_mgmt_tvalid;
    wire [31:0] demux_mgmt_tdata        = u_deframer_top.u_deframer.u_frame_demultiplexer.u_mgmt_extraction.s_axis_mgmt_tdata;
    wire [15:0] mgmt_extract_frame_cnt  = u_deframer_top.u_deframer.u_frame_demultiplexer.mgmt_frame_cnt;

    wire        reorder_in_tvalid       = u_deframer_top.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.s_axis_data_tvalid;
    wire [31:0] reorder_in_tdata        = u_deframer_top.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.s_axis_data_tdata;
    wire [15:0] reorder_slot_valid_bmp  = u_deframer_top.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.slot_valid;
    wire [15:0] reorder_ooo_buf_cnt     = u_deframer_top.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.out_of_order_buffered_cnt;
    wire [15:0] reorder_in_order_cnt    = u_deframer_top.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.in_order_drained_cnt;

    // Reassembly Internal Progress Probes
    wire [12:0] reasm_buf_used_words    = u_reassembly.buf_used;
    wire [10:0] reasm_commit_pkt_cnt    = u_reassembly.commit_pkt_cnt;
    wire [15:0] reasm_rem_pkt_bytes     = u_reassembly.rem_pkt_bytes;

    // =====================================================================
    // 5. REFERENCE CRC-16 / CRC-32 & KOOKMIN FSO PACKET A / PACKET B GENERATORS
    // =====================================================================
    // Zero-Initialized Table 2-15 CRC-16 (x^16 + x^12 + x^5 + 1)
    function [15:0] step_crc16(input [15:0] q, input [7:0] d);
        reg [15:0] nxt;
        begin
            nxt[0]  = d[0] ^ d[4] ^ q[8]  ^ q[12];
            nxt[1]  = d[1] ^ d[5] ^ q[9]  ^ q[13];
            nxt[2]  = d[2] ^ d[6] ^ q[10] ^ q[14];
            nxt[3]  = d[3] ^ d[7] ^ q[11] ^ q[15];
            nxt[4]  = d[4] ^ q[12];
            nxt[5]  = d[0] ^ d[4] ^ d[5] ^ q[8]  ^ q[12] ^ q[13];
            nxt[6]  = d[1] ^ d[5] ^ d[6] ^ q[9]  ^ q[13] ^ q[14];
            nxt[7]  = d[2] ^ d[6] ^ d[7] ^ q[10] ^ q[14] ^ q[15];
            nxt[8]  = d[3] ^ d[7] ^ q[0]  ^ q[11] ^ q[15];
            nxt[9]  = d[4] ^ q[1]  ^ q[12];
            nxt[10] = d[5] ^ q[2]  ^ q[13];
            nxt[11] = d[6] ^ q[3]  ^ q[14];
            nxt[12] = d[0] ^ d[4] ^ d[7] ^ q[4]  ^ q[8]  ^ q[12] ^ q[15];
            nxt[13] = d[1] ^ d[5] ^ q[5]  ^ q[9]  ^ q[13];
            nxt[14] = d[2] ^ d[6] ^ q[6]  ^ q[10] ^ q[14];
            nxt[15] = d[3] ^ d[7] ^ q[7]  ^ q[11] ^ q[15];
            step_crc16 = nxt;
        end
    endfunction

    // Zero-Initialized Table 2-15 CRC-32 (0x04C11DB7)
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

    // Table 2-14 LSB-First Telemetry Vector (5,000,000.0 m = 64'h4153_12D0_0000_0000)
    wire [255:0] mgmt_lsb_vec = {
        27'd0, 1'b1, 40'd0, 32'd1476000000,
        64'h4153_12D0_0000_0000, 40'd0, 6'd15,
        40'd16678204759, 6'd15
    };

    // Frame Catalog IDs (1..6):
    //   1 = DAT1_A (TXFN=1, fso_seq=0, First 1,900B of Packet A, "Kookmin FSO ")
    //   2 = DAT2_A (TXFN=2, fso_seq=1, Last 100B of Packet A, StimulusFCS 0xDEADBEEF + 1,804B Pad)
    //   3 = DAT1_B (TXFN=3, fso_seq=2, First 1,900B of Packet B, "Kookmin FSO " + Pkt B tag)
    //   4 = IDLE_4 (TXFN=4, IDLE payload)
    //   5 = MGMT_5 (TXFN=5, MGMT 5,000 km telemetry payload)
    //   6 = DAT2_B (TXFN=6, fso_seq=3, Last 100B of Packet B, StimulusFCS 0xDEADBEEF + 1,804B Pad)
    function [63:0] get_clean_info_word64(input integer cat_id, input integer w64_idx);
        reg [31:0] p_tag;
        begin
            p_tag = (cat_id == 3 || cat_id == 6) ? 32'h0002_0000 : 32'h0000_0000;
            if (cat_id == 1 || cat_id == 3) begin
                // DAT1_A (fso_seq=0 -> 0xAB000000) or DAT1_B (fso_seq=2 -> 0xAB008000)
                if      (w64_idx == 1) get_clean_info_word64 = (cat_id == 1) ? 64'hAB00_0000_CDEF_07D0 : 64'hAB00_8000_CDEF_07D0;
                else if (w64_idx == 2) get_clean_info_word64 = (cat_id == 1) ? 64'hAABB_CCDD_EEFF_1122 : 64'hAABB_CCDD_EEFF_2233;
                else if (w64_idx == 7) get_clean_info_word64 = 64'h4B6F_6F6B_6D69_6E20; // "Kookmin "
                else if (w64_idx == 8) get_clean_info_word64 = {32'h4653_4F20, (32'hAAAA_000E ^ p_tag)}; // "FSO "
                else                   get_clean_info_word64 = {(32'hAAAA_0000 ^ p_tag) + w64_idx[31:0],
                                                                (32'hBBBB_0000 ^ p_tag) + w64_idx[31:0]};
            end else if (cat_id == 2 || cat_id == 6) begin
                // DAT2_A (fso_seq=1, rem=100B -> 0xAB004064) or DAT2_B (fso_seq=3, rem=100B -> 0xAB00C064)
                if      (w64_idx == 1)  get_clean_info_word64 = (cat_id == 2) ? 64'hAB00_4064_AAAA_0001 : 64'hAB00_C064_AAAA_0201;
                else if (w64_idx == 13) get_clean_info_word64 = {(32'hAAAA_0018 ^ p_tag), 32'hDEAD_BEEF}; // 100th Byte Stimulus FCS at 32b Word 25
                else if (w64_idx > 13)  get_clean_info_word64 = 64'd0; // 1,804B Zero Padding
                else                    get_clean_info_word64 = {(32'hAAAA_0100 ^ p_tag) + w64_idx[31:0],
                                                                 (32'hBBBB_0100 ^ p_tag) + w64_idx[31:0]};
            end else if (cat_id == 5) begin
                // MGMT_5: Table 2-14 Satellite Range 5,000 km (0x415312D000000000)
                if      (w64_idx == 1) get_clean_info_word64 = {mgmt_lsb_vec[31:0],    mgmt_lsb_vec[63:32]};
                else if (w64_idx == 2) get_clean_info_word64 = {mgmt_lsb_vec[95:64],   mgmt_lsb_vec[127:96]};
                else if (w64_idx == 3) get_clean_info_word64 = {mgmt_lsb_vec[159:128], mgmt_lsb_vec[191:160]};
                else if (w64_idx == 4) get_clean_info_word64 = {mgmt_lsb_vec[223:192], mgmt_lsb_vec[255:224]};
                else                   get_clean_info_word64 = 64'd0;
            end else begin
                // IDLE_4: Baseline deterministic IDLE pattern
                get_clean_info_word64 = 64'h1D1E_1D1E_1D1E_1D1E ^ {48'd0, w64_idx[15:0]};
            end
        end
    endfunction

    function [31:0] get_clean_info_word32(input integer cat_id, input integer w32_idx);
        reg [63:0] w64_tmp;
        begin
            w64_tmp = get_clean_info_word64(cat_id, (w32_idx / 2) + 1);
            get_clean_info_word32 = (w32_idx[0] == 1'b0) ? w64_tmp[63:32] : w64_tmp[31:0];
        end
    endfunction

    // =====================================================================
    // 6. EXPECTED SCOREBOARD TABLES (CDC 4, DEFRAMER 1,908W, REASSEMBLY 1,004W)
    // =====================================================================
    // 6.1 Expected CDC 4 Outputs (Records every attempt including intentional errors)
    reg [7:0]  exp_cdc4_hdr_mem [0:255];
    reg [31:0] exp_cdc4_pld_mem [0:4095];
    integer    exp_cdc4_hdr_wr = 0, exp_cdc4_hdr_rd = 0;
    integer    exp_cdc4_pld_wr = 0, exp_cdc4_pld_rd = 0;

    // 6.2 Expected Deframer In-Order DATA Output (4 segments x 477W = 1,908 words: Cat 1, 2, 3, 6)
    reg [31:0] exp_defr_data_mem [0:1907];

    // 6.3 Expected Ethernet Reassembly Output (2 packets x 502W = 1,004 words, 4,000B MAC)
    reg [31:0] exp_reasm_eth_mem [0:1003];

    integer init_w;
    initial begin
        // Populate Expected Deframer In-Order 1,908 Words (Order: DAT1_A[1] -> DAT2_A[2] -> DAT1_B[3] -> DAT2_B[6])
        for (init_w = 0; init_w < 477; init_w = init_w + 1) begin
            exp_defr_data_mem[0   + init_w] = get_clean_info_word32(1, init_w);
            exp_defr_data_mem[477 + init_w] = get_clean_info_word32(2, init_w);
            exp_defr_data_mem[954 + init_w] = get_clean_info_word32(3, init_w);
            exp_defr_data_mem[1431+ init_w] = get_clean_info_word32(6, init_w);
        end

        // Populate Expected Reassembly 1,004 Words (Packet A = Words 0..501, Packet B = Words 502..1003)
        // Packet A (8B Preamble + 475W from DAT1_A[w32 2..476] + 25W from DAT2_A[w32 1..25])
        exp_reasm_eth_mem[0] = 32'h5555_5555;
        exp_reasm_eth_mem[1] = 32'h5555_55D5;
        for (init_w = 0; init_w < 475; init_w = init_w + 1)
            exp_reasm_eth_mem[2 + init_w] = get_clean_info_word32(1, 2 + init_w);
        for (init_w = 0; init_w < 25; init_w = init_w + 1)
            exp_reasm_eth_mem[477 + init_w] = get_clean_info_word32(2, 1 + init_w);

        // Packet B (8B Preamble + 475W from DAT1_B[w32 2..476] + 25W from DAT2_B[w32 1..25])
        exp_reasm_eth_mem[502] = 32'h5555_5555;
        exp_reasm_eth_mem[503] = 32'h5555_55D5;
        for (init_w = 0; init_w < 475; init_w = init_w + 1)
            exp_reasm_eth_mem[504 + init_w] = get_clean_info_word32(3, 2 + init_w);
        for (init_w = 0; init_w < 25; init_w = init_w + 1)
            exp_reasm_eth_mem[979 + init_w] = get_clean_info_word32(6, 1 + init_w);
    end

    // =====================================================================
    // 7. 200.0 MHz CDC 4 STIMULUS TASK (MODELS core_rx OUTPUT)
    //    - Builds clean 16B Header (with true CRC-16) & 478W Payload (with true CRC-32)
    //    - Applies optional 1-bit Header error (after CRC-16) or Directed 9-Byte
    //      Payload error on Lane 2 [23:16] of 64-bit words 2..10 (after CRC-32,
    //      preserving segmentation header on word 1)
    // =====================================================================
    integer total_frame_attempts    = 0;
    integer directed_pld_err_bytes  = 0;
    integer directed_hdr_err_bits   = 0;

    task send_frame_via_cdc4(
        input integer      cat_id,
        input [15:0]       txfn_val,
        input [1:0]        ftype_val,
        input              inject_hdr_err,
        input              inject_pld_9byte_err,
        input [31:0]       label_ascii
    );
        reg [7:0]  hdr_bytes [0:15];
        reg [31:0] pld_words32 [0:477];
        reg [63:0] pld_words64 [0:238];
        reg [15:0] crc16_v;
        reg [31:0] crc32_v;
        integer    i;
        begin
            // 1. Construct Clean 14-Byte Header & Compute Zero-Init Table 2-15 CRC-16
            hdr_bytes[0]  = txfn_val[7:0];
            hdr_bytes[1]  = txfn_val[15:8];
            hdr_bytes[2]  = 8'hCD;
            hdr_bytes[3]  = 8'hAB;
            hdr_bytes[4]  = {4'b1111, 1'b1, 1'b1, ftype_val};
            hdr_bytes[5]  = 8'h55;
            hdr_bytes[6]  = 8'h44;
            hdr_bytes[7]  = 8'h33;
            hdr_bytes[8]  = 8'h22;
            hdr_bytes[9]  = 8'h11;
            hdr_bytes[10] = {2'b11, 6'd15};
            hdr_bytes[11] = {1'b1, 3'b000, 4'hA};
            hdr_bytes[12] = 8'h88;
            hdr_bytes[13] = 8'h99;

            crc16_v = 16'd0;
            for (i = 0; i < 14; i = i + 1)
                crc16_v = step_crc16(crc16_v, hdr_bytes[i]);
            hdr_bytes[14] = crc16_v[15:8];
            hdr_bytes[15] = crc16_v[7:0];

            // 2. Construct Clean 477-Word Payload & Compute Zero-Init Table 2-15 CRC-32
            crc32_v = 32'd0;
            for (i = 0; i < 477; i = i + 1) begin
                pld_words32[i] = get_clean_info_word32(cat_id, i);
                crc32_v        = step_crc32(crc32_v, pld_words32[i]);
            end
            pld_words32[477] = crc32_v;

            // Pack into 239 x 64-bit words for CDC 4 200 MHz write port
            for (i = 0; i < 239; i = i + 1)
                pld_words64[i] = {pld_words32[2 * i], pld_words32[2 * i + 1]};

            // 3. Apply Post-CRC Directed Error Injection
            if (inject_hdr_err) begin
                // Flip 1 bit in protected header byte 5 (TX_TS[7:0]) after CRC-16 is computed
                hdr_bytes[5]          = hdr_bytes[5] ^ 8'h01;
                directed_hdr_err_bits = directed_hdr_err_bits + 1;
                $display(" [%0.1f ns] [INJECT HEADER ERROR] Attempt #%0d (TXFN=%0d): Flipped 1 bit in Header byte 5 (0x55 -> 0x%02X)",
                         $realtime, total_frame_attempts + 1, txfn_val, hdr_bytes[5]);
            end

            if (inject_pld_9byte_err) begin
                // Directed 9-Byte Error Injection on byte lane [23:16] of 64-bit words idx 1..9
                // (Corresponds to 32-bit odd words 3, 5, 7, 9, 11, 13, 15, 17, 19; preserves Word 0/1 segmentation header)
                for (i = 1; i <= 9; i = i + 1) begin
                    pld_words64[i][23:16]       = pld_words64[i][23:16] ^ 8'hFF;
                    pld_words32[2*i + 1][23:16] = pld_words32[2*i + 1][23:16] ^ 8'hFF;
                    directed_pld_err_bytes      = directed_pld_err_bytes + 1;
                end
                $display(" [%0.1f ns] [INJECT PAYLOAD ERROR] Attempt #%0d (TXFN=%0d): Injected directed 9-byte error across 64b words 2..10 lane[23:16] (32b words 3,5..19)",
                         $realtime, total_frame_attempts + 1, txfn_val);
            end

            // 4. Record Expected CDC 4 Output Stream (Includes Intentional Corruptions)
            for (i = 0; i < 16; i = i + 1) begin
                exp_cdc4_hdr_mem[exp_cdc4_hdr_wr] = hdr_bytes[i];
                exp_cdc4_hdr_wr                   = exp_cdc4_hdr_wr + 1;
            end
            for (i = 0; i < 478; i = i + 1) begin
                exp_cdc4_pld_mem[exp_cdc4_pld_wr] = pld_words32[i];
                exp_cdc4_pld_wr                   = exp_cdc4_pld_wr + 1;
            end

            total_frame_attempts = total_frame_attempts + 1;

            // 5. Drive 200.0 MHz CDC 4 Write Interface (16 Header cycles, 239 Payload cycles)
            for (i = 0; i < 239; i = i + 1) begin
                @(posedge clk_logic);
                stim_label_str  <= label_ascii;
                cdc4_en_head    <= (i < 16);
                cdc4_header_in  <= (i < 16) ? hdr_bytes[i] : 8'd0;
                cdc4_en_load    <= 1'b1;
                cdc4_payload_in <= pld_words64[i];
            end
            @(posedge clk_logic);
            stim_label_str  <= "WAIT";
            cdc4_en_head    <= 1'b0;
            cdc4_header_in  <= 8'd0;
            cdc4_en_load    <= 1'b0;
            cdc4_payload_in <= 64'd0;

            // Wait for CDC 4 read window (502 clk_gth cycles) + deframer processing margin
            repeat (360) @(posedge clk_logic);
        end
    endtask

    // =====================================================================
    // 8. MULTI-STAGE SCOREBOARDS & EVENT-DRIVEN CHECKERS (312.5 MHz)
    // =====================================================================
    integer cdc4_hdr_mismatch_cnt       = 0;
    integer cdc4_pld_mismatch_cnt       = 0;

    integer hdr_crc_pass_cnt            = 0;
    integer hdr_crc_fail_cnt            = 0;
    integer pld_crc_pass_cnt            = 0;
    integer pld_crc_fail_cnt            = 0;
    integer pld_fail_on_valid_hdr_cnt   = 0;
    integer pld_fail_on_corrupt_hdr_cnt = 0;

    integer local_fb_total_cnt          = 0;
    integer local_fb_seq_err_cnt        = 0;
    reg [15:0] fb_log_rxfn [0:15];
    reg        fb_log_ack  [0:15];

    integer defr_data_words_checked     = 0;
    integer defr_data_word_mismatches   = 0;
    integer defr_data_frames_drained    = 0;
    integer defr_tlast_err_cnt          = 0;
    reg [15:0] drained_frame_order [0:7];

    integer reasm_words_checked         = 0;
    integer reasm_word_mismatches       = 0;
    integer reasm_pkt_done_cnt          = 0;
    integer reasm_tlast_err_cnt         = 0;
    integer reasm_pkt_words_ok [0:1];
    integer reasm_pkt_tlast_ok [0:1];
    reg [95:0] reasm_pkt0_ascii         = 96'd0;
    reg [95:0] reasm_pkt1_ascii         = 96'd0;
    reg [31:0] reasm_pkt0_fcs           = 32'd0;
    reg [31:0] reasm_pkt1_fcs           = 32'd0;

    integer mgmt_valid_cnt              = 0;
    integer mgmt_range_mismatch_cnt     = 0;
    reg [63:0] mgmt_range_captured      = 64'd0;

    // Pre-Retransmission Checkpoint Storage (Audit Point 5)
    integer chk_defr_words_to_reasm     = 0;
    integer chk_reasm_pkts_out          = 0;
    reg [15:0] chk_reorder_slot_valid   = 16'd0;
    integer chk_reorder_ooo_cnt         = 0;
    reg [15:0] chk_expected_txfn        = 16'd0;
    integer chk_idle_frames_done        = 0;
    integer chk_mgmt_events_done        = 0;
    reg [63:0] chk_mgmt_range_val       = 64'd0;
    reg     checkpoint_verified_ok      = 1'b0;

    integer cur_pkt_idx, cur_pkt_word;

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            exp_cdc4_hdr_rd             <= 0;
            exp_cdc4_pld_rd             <= 0;
            cdc4_hdr_mismatch_cnt       <= 0;
            cdc4_pld_mismatch_cnt       <= 0;
            hdr_crc_pass_cnt            <= 0;
            hdr_crc_fail_cnt            <= 0;
            pld_crc_pass_cnt            <= 0;
            pld_crc_fail_cnt            <= 0;
            pld_fail_on_valid_hdr_cnt   <= 0;
            pld_fail_on_corrupt_hdr_cnt <= 0;
            local_fb_total_cnt          <= 0;
            local_fb_seq_err_cnt        <= 0;
            defr_data_words_checked     <= 0;
            defr_data_word_mismatches   <= 0;
            defr_data_frames_drained    <= 0;
            defr_tlast_err_cnt          <= 0;
            reasm_words_checked         <= 0;
            reasm_word_mismatches       <= 0;
            reasm_pkt_done_cnt          <= 0;
            reasm_tlast_err_cnt         <= 0;
            reasm_pkt_words_ok[0]       <= 0;
            reasm_pkt_words_ok[1]       <= 0;
            reasm_pkt_tlast_ok[0]       <= 0;
            reasm_pkt_tlast_ok[1]       <= 0;
            mgmt_valid_cnt              <= 0;
            mgmt_range_mismatch_cnt     <= 0;
            mgmt_range_captured         <= 64'd0;
        end else begin
            // 8.1 CDC 4 Output Scoreboard (Verifies all emitted header bytes & payload words)
            if (cdc4_header_dv) begin
                if ((^cdc4_header_out === 1'bx) || (cdc4_header_out !== exp_cdc4_hdr_mem[exp_cdc4_hdr_rd]))
                    cdc4_hdr_mismatch_cnt <= cdc4_hdr_mismatch_cnt + 1;
                exp_cdc4_hdr_rd <= exp_cdc4_hdr_rd + 1;
            end
            if (cdc4_payload_dv) begin
                if ((^cdc4_payload_out === 1'bx) || (cdc4_payload_out !== exp_cdc4_pld_mem[exp_cdc4_pld_rd]))
                    cdc4_pld_mismatch_cnt <= cdc4_pld_mismatch_cnt + 1;
                exp_cdc4_pld_rd <= exp_cdc4_pld_rd + 1;
            end

            // 8.2 Event-Driven Header CRC-16 & Payload CRC-32 Counters (Sampled on check_done)
            if (hdr_check_done_evt) begin
                if (hdr_crc_ok === 1'b1) hdr_crc_pass_cnt <= hdr_crc_pass_cnt + 1;
                else                     hdr_crc_fail_cnt <= hdr_crc_fail_cnt + 1;
            end
            if (pld_check_done_evt) begin
                if (pld_crc_ok === 1'b1) begin
                    pld_crc_pass_cnt <= pld_crc_pass_cnt + 1;
                end else begin
                    pld_crc_fail_cnt <= pld_crc_fail_cnt + 1;
                    if (u_deframer_top.u_deframer.active_ing_hdr_ok === 1'b1)
                        pld_fail_on_valid_hdr_cnt <= pld_fail_on_valid_hdr_cnt + 1;
                    else
                        pld_fail_on_corrupt_hdr_cnt <= pld_fail_on_corrupt_hdr_cnt + 1;
                end
            end

            // 8.3 Local ARQ Feedback Sequence Checker (Audit Point 6)
            //     - Mode 0 (5 events): ACK(1), ACK(2), ACK(3), ACK(5), ACK(6)
            //     - Mode 1/2 (6 events): ACK(1), NAK(2), ACK(3), ACK(5), ACK(2), ACK(6)
            if (local_fb_ack_valid) begin
                fb_log_rxfn[local_fb_total_cnt] <= local_fb_rxfn;
                fb_log_ack[local_fb_total_cnt]  <= local_fb_ack;
                $display(" [%0.1f ns] [LOCAL ARQ FEEDBACK #%0d] RXFN=%0d | Status=%s",
                         $realtime, local_fb_total_cnt + 1, local_fb_rxfn, local_fb_ack ? "ACK(1)" : "NAK(0)");

                if (TEST_MODE == 0) begin
                    case (local_fb_total_cnt)
                        0: if (local_fb_rxfn !== 16'd1 || local_fb_ack !== 1'b1) local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                        1: if (local_fb_rxfn !== 16'd2 || local_fb_ack !== 1'b1) local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                        2: if (local_fb_rxfn !== 16'd3 || local_fb_ack !== 1'b1) local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                        3: if (local_fb_rxfn !== 16'd5 || local_fb_ack !== 1'b1) local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                        4: if (local_fb_rxfn !== 16'd6 || local_fb_ack !== 1'b1) local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                        default: local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                    endcase
                end else begin
                    case (local_fb_total_cnt)
                        0: if (local_fb_rxfn !== 16'd1 || local_fb_ack !== 1'b1) local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                        1: if (local_fb_rxfn !== 16'd2 || local_fb_ack !== 1'b0) local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                        2: if (local_fb_rxfn !== 16'd3 || local_fb_ack !== 1'b1) local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                        3: if (local_fb_rxfn !== 16'd5 || local_fb_ack !== 1'b1) local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                        4: if (local_fb_rxfn !== 16'd2 || local_fb_ack !== 1'b1) local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                        5: if (local_fb_rxfn !== 16'd6 || local_fb_ack !== 1'b1) local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                        default: local_fb_seq_err_cnt <= local_fb_seq_err_cnt + 1;
                    endcase
                end
                local_fb_total_cnt <= local_fb_total_cnt + 1;
            end

            // 8.4 Per-Event MGMT Telemetry Verification
            if (mgmt_telemetry_valid) begin
                mgmt_valid_cnt      <= mgmt_valid_cnt + 1;
                mgmt_range_captured <= mgmt_range_meters;
                if ((^mgmt_range_meters === 1'bx) || (mgmt_range_meters !== 64'h4153_12D0_0000_0000))
                    mgmt_range_mismatch_cnt <= mgmt_range_mismatch_cnt + 1;
            end

            // 8.5 Deframer In-Order DATA Stream Scoreboard (1,908 words = 4 segments x 477W on valid && ready)
            if (defr_m_axis_tvalid && defr_m_axis_tready) begin
                if (defr_data_words_checked >= 1908 || (^defr_m_axis_tdata === 1'bx) ||
                    (defr_m_axis_tdata !== exp_defr_data_mem[defr_data_words_checked])) begin
                    defr_data_word_mismatches <= defr_data_word_mismatches + 1;
                    $display(" [DEFRAMER DATA MISMATCH] Word #%0d: Exp=0x%08X, Got=0x%08X",
                             defr_data_words_checked, exp_defr_data_mem[defr_data_words_checked], defr_m_axis_tdata);
                end

                // Map Word 0 payload fso_seq (0..3) to known stimulus TXFN (1, 2, 3, 6)
                if ((defr_data_words_checked % 477) == 0) begin
                    case (defr_m_axis_tdata[23:14])
                        10'd0: drained_frame_order[defr_data_frames_drained] <= 16'd1; // DAT1_A (TXFN 1)
                        10'd1: drained_frame_order[defr_data_frames_drained] <= 16'd2; // DAT2_A (TXFN 2)
                        10'd2: drained_frame_order[defr_data_frames_drained] <= 16'd3; // DAT1_B (TXFN 3)
                        10'd3: drained_frame_order[defr_data_frames_drained] <= 16'd6; // DAT2_B (TXFN 6)
                        default: drained_frame_order[defr_data_frames_drained] <= 16'hFFFF;
                    endcase
                end

                // Strict 4-state TLAST check at word 476 of each 477-word segment
                if ((defr_data_words_checked % 477) == 476) begin
                    if (defr_m_axis_tlast !== 1'b1)
                        defr_tlast_err_cnt <= defr_tlast_err_cnt + 1;
                    defr_data_frames_drained <= defr_data_frames_drained + 1;
                end else begin
                    if (defr_m_axis_tlast !== 1'b0)
                        defr_tlast_err_cnt <= defr_tlast_err_cnt + 1;
                end

                defr_data_words_checked <= defr_data_words_checked + 1;
            end

            // 8.6 Ethernet Frame Reassembly Output Scoreboard (2 packets x 502W = 1,004 words on valid && ready)
            if (reasm_eth_tvalid && reasm_eth_tready) begin
                cur_pkt_idx  = reasm_words_checked / 502;
                cur_pkt_word = reasm_words_checked % 502;

                if (reasm_words_checked >= 1004 || (^reasm_eth_tdata === 1'bx) ||
                    (reasm_eth_tdata !== exp_reasm_eth_mem[reasm_words_checked])) begin
                    reasm_word_mismatches <= reasm_word_mismatches + 1;
                    $display(" [REASSEMBLY MISMATCH] Word #%0d (Pkt %0d Word %0d): Exp=0x%08X, Got=0x%08X",
                             reasm_words_checked, cur_pkt_idx + 1, cur_pkt_word,
                             exp_reasm_eth_mem[reasm_words_checked], reasm_eth_tdata);
                end else if (cur_pkt_idx < 2) begin
                    reasm_pkt_words_ok[cur_pkt_idx] <= reasm_pkt_words_ok[cur_pkt_idx] + 1;
                end

                // [Rev 1.1] Capture ASCII tag ("Kookmin FSO ") at 0-based words 12, 13, 14
                // (Words 0..1 = 8B Preamble, Words 2..11 = first 10 MAC words, Words 12..14 = "Kookmin FSO ")
                if (cur_pkt_idx == 0 && cur_pkt_word == 12) reasm_pkt0_ascii[95:64] <= reasm_eth_tdata;
                if (cur_pkt_idx == 0 && cur_pkt_word == 13) reasm_pkt0_ascii[63:32] <= reasm_eth_tdata;
                if (cur_pkt_idx == 0 && cur_pkt_word == 14) reasm_pkt0_ascii[31:0]  <= reasm_eth_tdata;
                if (cur_pkt_idx == 1 && cur_pkt_word == 12) reasm_pkt1_ascii[95:64] <= reasm_eth_tdata;
                if (cur_pkt_idx == 1 && cur_pkt_word == 13) reasm_pkt1_ascii[63:32] <= reasm_eth_tdata;
                if (cur_pkt_idx == 1 && cur_pkt_word == 14) reasm_pkt1_ascii[31:0]  <= reasm_eth_tdata;
                if (cur_pkt_idx == 0 && cur_pkt_word == 501) reasm_pkt0_fcs         <= reasm_eth_tdata;
                if (cur_pkt_idx == 1 && cur_pkt_word == 501) reasm_pkt1_fcs         <= reasm_eth_tdata;

                // Strict 4-state TLAST check on word 501 of each 502-word reassembled Ethernet packet
                if (cur_pkt_word == 501) begin
                    if (reasm_eth_tlast !== 1'b1)
                        reasm_tlast_err_cnt <= reasm_tlast_err_cnt + 1;
                    else if (cur_pkt_idx < 2)
                        reasm_pkt_tlast_ok[cur_pkt_idx] <= 1;
                    reasm_pkt_done_cnt <= reasm_pkt_done_cnt + 1;
                    $display(" [%0.1f ns] [REASSEMBLY COMPLETE] Ethernet Packet #%0d Released (502 Words = 2,008B = 8B Preamble + 2,000B MAC)",
                             $realtime, reasm_pkt_done_cnt + 1);
                end else begin
                    if (reasm_eth_tlast !== 1'b0)
                        reasm_tlast_err_cnt <= reasm_tlast_err_cnt + 1;
                end

                reasm_words_checked <= reasm_words_checked + 1;
            end
        end
    end

    // =====================================================================
    // 9. MAIN TEST SEQUENCE (TEST_MODE = 0, 1, or 2) & FINAL AUDIT REPORT
    // =====================================================================
    reg mode_crc_counts_ok;
    reg mode_fb_counts_ok;
    reg reorder_seq_ok;

    initial begin
        rst_n            = 1'b0;
        cdc4_en_head     = 1'b0;
        cdc4_en_load     = 1'b0;
        cdc4_header_in   = 8'd0;
        cdc4_payload_in  = 64'd0;
        reasm_eth_tready = 1'b1;
        #100;
        rst_n            = 1'b1;

        // Wait until CDC 4 async FIFOs exit reset busy
        wait(!u_cdc4.head_rd_rst_busy && !u_cdc4.load_rd_rst_busy);
        repeat (20) @(posedge clk_logic);

        $display("\n================================================================================");
        $display(" STARTING tb_fso_ethernet_deframer2 (CDC 4 -> DEFRAMER -> REORDER -> REASSEMBLY)");
        $display(" -> Selected TEST_MODE : %0d (%s)", TEST_MODE, test_mode_str);
        $display(" -> Clock Configuration: CDC 4 Write = 200.0 MHz | CDC 4 Read / Deframer / Reassembly = 312.5 MHz");
        $display("================================================================================\n");

        // -----------------------------------------------------------------
        // STEP 1: Send TXFN=1 (DAT1_A: First 1,900B of Packet A, Clean)
        // -----------------------------------------------------------------
        $display("--- [STEP 1] Sending TXFN=1 (DAT1_A: 1,900B of Packet A, fso_seq=0, Clean) ---");
        send_frame_via_cdc4(1, 16'd1, 2'b01, 1'b0, 1'b0, "DAT1");

        // -----------------------------------------------------------------
        // STEP 2: Send TXFN=2 (DAT2_A: Last 100B of Packet A, fso_seq=1)
        //   - Mode 0: Clean
        //   - Mode 1: Directed 9-Byte Payload Error -> NAK(2)
        //   - Mode 2: Attempt 2A with Corrupted Header (ignored) -> Attempt 2B with Directed 9-Byte Payload Error -> NAK(2)
        // -----------------------------------------------------------------
        if (TEST_MODE == 0) begin
            $display("--- [STEP 2] Sending TXFN=2 (DAT2_A: Last 100B of Packet A, fso_seq=1, Clean) ---");
            send_frame_via_cdc4(2, 16'd2, 2'b01, 1'b0, 1'b0, "DAT2");
        end else if (TEST_MODE == 1) begin
            $display("--- [STEP 2] Sending TXFN=2 (DAT2_A: Directed 9-Byte Payload Error -> Expect CRC-32 Fail & NAK(2)) ---");
            send_frame_via_cdc4(2, 16'd2, 2'b01, 1'b0, 1'b1, "ERRP");
        end else begin
            $display("--- [STEP 2A] Sending TXFN=2 (DAT2_A: Corrupted Header CRC-16 + Clean Payload -> Expect Silent Ignore) ---");
            send_frame_via_cdc4(2, 16'd2, 2'b01, 1'b1, 1'b0, "ERRH");
            $display("--- [STEP 2B] Sending TXFN=2 (DAT2_A: Valid Header + Directed 9-Byte Payload Error -> Expect NAK(2)) ---");
            send_frame_via_cdc4(2, 16'd2, 2'b01, 1'b0, 1'b1, "ERRP");
        end

        // -----------------------------------------------------------------
        // STEP 3: Send TXFN=3 (DAT1_B: First 1,900B of Packet B, fso_seq=2, Clean)
        // -----------------------------------------------------------------
        $display("--- [STEP 3] Sending TXFN=3 (DAT1_B: 1,900B of Packet B, fso_seq=2, Clean) ---");
        send_frame_via_cdc4(3, 16'd3, 2'b01, 1'b0, 1'b0, "DAT1");

        // -----------------------------------------------------------------
        // STEP 4: Send TXFN=4 (IDLE) & TXFN=5 (MGMT 5,000 km)
        // -----------------------------------------------------------------
        $display("--- [STEP 4] Sending TXFN=4 (IDLE) & TXFN=5 (MGMT 5,000 km) ---");
        send_frame_via_cdc4(4, 16'd4, 2'b00, 1'b0, 1'b0, "IDLE");
        send_frame_via_cdc4(5, 16'd5, 2'b10, 1'b0, 1'b0, "MGMT");

        // -----------------------------------------------------------------
        // STEP 5 (MODE 1 & 2): Event-Qualified Pre-Retransmission Checkpoint
        //   Wait until IDLE (idle_discard_frame_cnt==1) and MGMT (mgmt_valid_cnt==1)
        //   have completed processing, then snapshot and verify all 6 targets!
        // -----------------------------------------------------------------
        if (TEST_MODE != 0) begin
            wait(idle_discard_frame_cnt == 16'd1 && mgmt_valid_cnt == 1 && local_fb_total_cnt == 4);
            repeat (30) @(posedge clk_gth);

            chk_defr_words_to_reasm = defr_data_words_checked;
            chk_reasm_pkts_out      = reasm_pkt_done_cnt;
            chk_reorder_slot_valid  = reorder_slot_valid_bmp;
            chk_reorder_ooo_cnt     = reorder_ooo_buf_cnt;
            chk_expected_txfn       = expected_txfn;
            chk_idle_frames_done    = idle_discard_frame_cnt;
            chk_mgmt_events_done    = mgmt_valid_cnt;
            chk_mgmt_range_val      = mgmt_range_captured;

            checkpoint_verified_ok  = (chk_defr_words_to_reasm == 477)   && // Only DAT1_A (477W) reached Reassembly
                                      (chk_reasm_pkts_out      == 0)     && // 0 Ethernet packets completed yet
                                      (chk_reorder_slot_valid[3] == 1'b1)&& // TXFN=3 (DAT1_B) held in Reorder RAM slot 3
                                      (chk_reorder_ooo_cnt     == 1)     && // 1 out-of-order frame buffered
                                      (chk_expected_txfn       == 16'd2) && // Still waiting for TXFN=2 (DAT2_A)
                                      (chk_idle_frames_done    == 1)     && // 1 IDLE frame discarded
                                      (chk_mgmt_events_done    == 1)     && // 1 MGMT event extracted
                                      (chk_mgmt_range_val      == 64'h4153_12D0_0000_0000);

            $display("\n--- [PRE-RETRANSMISSION CHECKPOINT (AUDIT POINT 5)] ---");
            $display(" -> DATA Words Received by Reassembly : %0d / 477 Words (Strictly DAT1_A only)", chk_defr_words_to_reasm);
            $display(" -> Completed Ethernet Packets Out    : %0d (Expected: 0 while awaiting DAT2_A)", chk_reasm_pkts_out);
            $display(" -> Buffered Frame Held in Reorder RAM: Slot[3]=%0b (OooBufferedCnt=%0d, Holding TXFN=3 DAT1_B)",
                     chk_reorder_slot_valid[3], chk_reorder_ooo_cnt);
            $display(" -> Next Expected DATA Sequence Number: TXFN=%0d (Expected: 2)", chk_expected_txfn);
            $display(" -> IDLE Frames Discarded             : %0d (Expected: 1)", chk_idle_frames_done);
            $display(" -> MGMT Valid Events & Range         : %0d Event, Range=0x%016X", chk_mgmt_events_done, chk_mgmt_range_val);
            $display(" -> Checkpoint Verification Status    : %s\n", checkpoint_verified_ok ? "PASS" : "FAIL");

            // Stimulus-driven retransmission of clean TXFN=2 (DAT2_A: Last 100B of Packet A)
            $display("--- [STEP 5B] Retransmitting Clean TXFN=2 (DAT2_A) -> Expect ACK(2) & In-Order Drain TXFN=2 then TXFN=3! ---");
            send_frame_via_cdc4(2, 16'd2, 2'b01, 1'b0, 1'b0, "RETX");
        end else begin
            checkpoint_verified_ok = 1'b1;
        end

        // -----------------------------------------------------------------
        // STEP 6: Send TXFN=6 (DAT2_B: Last 100B of Packet B, fso_seq=3, Clean)
        // -----------------------------------------------------------------
        $display("--- [STEP 6] Sending TXFN=6 (DAT2_B: Last 100B of Packet B, fso_seq=3, Clean) ---");
        send_frame_via_cdc4(6, 16'd6, 2'b01, 1'b0, 1'b0, "DAT2");

        // Wait for both 502-word reassembled Ethernet packets (1,004 words) to drain
        wait(reasm_pkt_done_cnt == 2 && reasm_words_checked == 1004);
        // Closing observation window to ensure no extra or stuck frames appear
        repeat (500) @(posedge clk_gth);

        // Evaluate Mode-Specific CRC & Feedback Contracts (Audit Point 6)
        if (TEST_MODE == 0) begin
            mode_crc_counts_ok = (total_frame_attempts == 6) &&
                                 (hdr_crc_pass_cnt == 6) && (hdr_crc_fail_cnt == 0) &&
                                 (pld_crc_pass_cnt == 6) && (pld_crc_fail_cnt == 0);
            mode_fb_counts_ok  = (local_fb_total_cnt == 5) && (local_fb_seq_err_cnt == 0);
        end else if (TEST_MODE == 1) begin
            mode_crc_counts_ok = (total_frame_attempts == 7) &&
                                 (hdr_crc_pass_cnt == 7) && (hdr_crc_fail_cnt == 0) &&
                                 (pld_crc_pass_cnt == 6) && (pld_crc_fail_cnt == 1) &&
                                 (pld_fail_on_valid_hdr_cnt == 1);
            mode_fb_counts_ok  = (local_fb_total_cnt == 6) && (local_fb_seq_err_cnt == 0);
        end else begin
            mode_crc_counts_ok = (total_frame_attempts == 8) &&
                                 (hdr_crc_pass_cnt == 7) && (hdr_crc_fail_cnt == 1) &&
                                 (pld_crc_pass_cnt == 6) && (pld_fail_on_valid_hdr_cnt == 1) &&
                                 (pld_fail_on_corrupt_hdr_cnt == 1);
            mode_fb_counts_ok  = (local_fb_total_cnt == 6) && (local_fb_seq_err_cnt == 0);
        end

        reorder_seq_ok = (defr_data_frames_drained == 4) &&
                         (drained_frame_order[0] == 16'd1) &&
                         (drained_frame_order[1] == 16'd2) &&
                         (drained_frame_order[2] == 16'd3) &&
                         (drained_frame_order[3] == 16'd6);

        $display("\n================================================================================");
        $display(" CDC 4 -> DEFRAMER -> ARQ REORDER -> ETHERNET REASSEMBLY REPORT (tb_fso_ethernet_deframer2 - REV 1.2)");
        $display("================================================================================");
        $display(" 1. Mode, Clocks & Frame Attempts     : TEST_MODE=%0d (%s) | Clocks: 200.0MHz->312.5MHz | Attempts=%0d",
                 TEST_MODE, test_mode_str, total_frame_attempts);
        $display(" 2. Directed Error Injection Summary  : HeaderBitFlips=%0d | DirectedPayloadErrorBytes=%0d (9-byte burst on DAT2_A)",
                 directed_hdr_err_bits, directed_pld_err_bytes);
        $display(" 3. CDC 4 Output Scoreboard           : HdrBytes=%0d/%0d (Mismatches=%0d) | PldWords=%0d/%0d (Mismatches=%0d)",
                 exp_cdc4_hdr_rd, exp_cdc4_hdr_wr, cdc4_hdr_mismatch_cnt,
                 exp_cdc4_pld_rd, exp_cdc4_pld_wr, cdc4_pld_mismatch_cnt);
        $display(" 4. Event-Driven CRC Check Summary    : HdrCRC Pass=%0d, Fail=%0d | PldCRC Accepted=%0d, PldRejectedOnValidHdr=%0d, CleanPldRejectedOnCorruptHdr=%0d",
                 hdr_crc_pass_cnt, hdr_crc_fail_cnt, pld_crc_pass_cnt, pld_fail_on_valid_hdr_cnt, pld_fail_on_corrupt_hdr_cnt);
        if (TEST_MODE == 0) begin
            $display(" 5. Local ARQ Feedback Sequence (5)   : [%0d:%s -> %0d:%s -> %0d:%s -> %0d:%s -> %0d:%s] (SeqErrors=%0d)",
                     fb_log_rxfn[0], fb_log_ack[0] ? "ACK" : "NAK",
                     fb_log_rxfn[1], fb_log_ack[1] ? "ACK" : "NAK",
                     fb_log_rxfn[2], fb_log_ack[2] ? "ACK" : "NAK",
                     fb_log_rxfn[3], fb_log_ack[3] ? "ACK" : "NAK",
                     fb_log_rxfn[4], fb_log_ack[4] ? "ACK" : "NAK",
                     local_fb_seq_err_cnt);
        end else begin
            $display(" 5. Local ARQ Feedback Sequence (6)   : [%0d:%s -> %0d:%s -> %0d:%s -> %0d:%s -> %0d:%s -> %0d:%s] (SeqErrors=%0d)",
                     fb_log_rxfn[0], fb_log_ack[0] ? "ACK" : "NAK",
                     fb_log_rxfn[1], fb_log_ack[1] ? "ACK" : "NAK",
                     fb_log_rxfn[2], fb_log_ack[2] ? "ACK" : "NAK",
                     fb_log_rxfn[3], fb_log_ack[3] ? "ACK" : "NAK",
                     fb_log_rxfn[4], fb_log_ack[4] ? "ACK" : "NAK",
                     fb_log_rxfn[5], fb_log_ack[5] ? "ACK" : "NAK",
                     local_fb_seq_err_cnt);
            $display(" 6. Pre-Retransmission Checkpoint     : ReasmIn=%0dW (Exp:477) | PktsOut=%0d (Exp:0) | HeldSlot3=%0b | ExpTXFN=%0d | IDLE=%0d | MGMT=%0d [%s]",
                     chk_defr_words_to_reasm, chk_reasm_pkts_out, chk_reorder_slot_valid[3],
                     chk_expected_txfn, chk_idle_frames_done, chk_mgmt_events_done,
                     checkpoint_verified_ok ? "PASS" : "FAIL");
        end
        $display(" 7. Reorder DATA Release Sequence     : %0d / 4 Segments [MappedTXFN %0d -> %0d -> %0d -> %0d] | Words=%0d/1908 (Mismatches=%0d, TLAST_Err=%0d, OooBufCnt=%0d, InOrderCnt=%0d)",
                 defr_data_frames_drained,
                 drained_frame_order[0], drained_frame_order[1], drained_frame_order[2], drained_frame_order[3],
                 defr_data_words_checked, defr_data_word_mismatches, defr_tlast_err_cnt,
                 reorder_ooo_buf_cnt, reorder_in_order_cnt);
        $display(" 8. IDLE Discard & MGMT Telemetry     : IDLE Discarded=%0d Frame | MGMT ValidEvents=%0d, Range=0x%016X (Mismatches=%0d)",
                 idle_discard_frame_cnt, mgmt_valid_cnt, mgmt_range_captured, mgmt_range_mismatch_cnt);
        $display(" 9. Ethernet Reassembly Per-Packet    : Packet A = %0d/502 Words (TLAST_OK=%0d, ASCII=\"%s\", StimulusFCS=0x%08X) | Packet B = %0d/502 Words (TLAST_OK=%0d, ASCII=\"%s\", StimulusFCS=0x%08X)",
                 reasm_pkt_words_ok[0], reasm_pkt_tlast_ok[0], reasm_pkt0_ascii, reasm_pkt0_fcs,
                 reasm_pkt_words_ok[1], reasm_pkt_tlast_ok[1], reasm_pkt1_ascii, reasm_pkt1_fcs);
        $display("10. Reassembly Total & End-State Check: TotalWords=%0d/1004 (4,000B MAC, Mismatches=%0d, StrictTLAST_Err=%0d) | EndSlotValid=0x%04X | EndExpectedTXFN=%0d",
                 reasm_words_checked, reasm_word_mismatches, reasm_tlast_err_cnt,
                 reorder_slot_valid_bmp, expected_txfn);

        if ((exp_cdc4_hdr_rd           == exp_cdc4_hdr_wr) &&
            (exp_cdc4_pld_rd           == exp_cdc4_pld_wr) &&
            (cdc4_hdr_mismatch_cnt     == 0)    &&
            (cdc4_pld_mismatch_cnt     == 0)    &&
            ((TEST_MODE != 0) || (reorder_ooo_buf_cnt == 0)) &&
            mode_crc_counts_ok                  &&
            mode_fb_counts_ok                   &&
            checkpoint_verified_ok              &&
            reorder_seq_ok                      &&
            (defr_data_words_checked   == 1908) &&
            (defr_data_word_mismatches == 0)    &&
            (defr_tlast_err_cnt        == 0)    &&
            (idle_discard_frame_cnt    == 16'd1)&&
            (mgmt_valid_cnt            == 1)    &&
            (mgmt_range_mismatch_cnt   == 0)    &&
            (mgmt_range_captured       == 64'h4153_12D0_0000_0000) &&
            (reasm_pkt_done_cnt        == 2)    &&
            (reasm_words_checked       == 1004) &&
            (reasm_pkt_words_ok[0]     == 502)  &&
            (reasm_pkt_words_ok[1]     == 502)  &&
            (reasm_pkt_tlast_ok[0]     == 1)    &&
            (reasm_pkt_tlast_ok[1]     == 1)    &&
            (reasm_word_mismatches     == 0)    &&
            (reasm_tlast_err_cnt       == 0)    &&
            (reasm_pkt0_ascii          == "Kookmin FSO ") &&
            (reasm_pkt1_ascii          == "Kookmin FSO ") &&
            (reasm_pkt0_fcs            == 32'hDEAD_BEEF)  &&
            (reasm_pkt1_fcs            == 32'hDEAD_BEEF)  &&
            (reorder_slot_valid_bmp    == 16'd0)&&
            (reasm_buf_used_words      == 13'd0)&&
            (expected_txfn             == 16'd7)) begin
            $display("--------------------------------------------------------------------------------");
            $display(" FINAL VERDICT: [PASS] CDC 4 -> DEFRAMER -> ARQ REORDER -> ETHERNET REASSEMBLY VERIFIED (TEST_MODE=%0d, 2x502W PACKETS, 0 MISMATCHES)!", TEST_MODE);
        end else begin
            $fatal(1, "FINAL VERDICT: [FAIL] Verification failed in tb_fso_ethernet_deframer2 (TEST_MODE=%0d)!", TEST_MODE);
        end
        $display("================================================================================\n");
        $finish;
    end

endmodule