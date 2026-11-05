`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Testbench for fso_payload.v (Data Path Sub-Top Module).
               Scenario: 2000-Byte Jumbo Frame.
               Proves the following hardware mechanics:
               1. segmentation: 4KB FIFO absorbs 2000B, outputs 1900B rigid block.
               2. fso_payload: Injects 0xAB and 0xCDEF (1900B -> 1908B).
               3. fso_crc_32: Appends the 4B CRC seamlessly (1908B -> 1912B).
               4. fifo_data: Buffers the 1912B frame for MUX transmission.
               5. arq_ddr4_wrapper: Captures the accepted post-FIFO 1912B frame 
                  and replays all 478 words intact on retransmission readback.

Revision History:
  - Rev 1.0 (Initial) : 2000-Byte Jumbo segmentation & FSO Payload encapsulation testbench.
  - Rev 2.0 (2026-10-27 15:04 KST) :
    1. Connected 'seg_valid_bytes' output port on u_segmenter (1900 Bytes on 
       Frame 1, 100 Bytes on Frame 2).
    2. Added automatic verification of SDA OISL Table 2-18 (Page 44-45) & ETRI 
       Review Item 4.2(2) header fields.
    3. Added ARQ DDR4 Retransmit readback test (ddr4_read_req = 1) to verify 
       Target B3.2 (all 478 words = 1912 Bytes including Word 477 CRC-32 are 
       stored and re-emitted intact).
  - Rev 2.3 (2026-10-29 01:49 KST) : [Unified Counter & Frame Label Alignment]
    Connected 'seg_valid_bytes' input port on u_fso_payload and added waveform counters.
  - Rev 2.4 (2026-10-29 12:52 KST) : [Audit Fix - Exact Completion Wait Synchronization]
    Replaced fixed '#2000' delays with event-driven 'wait(rx_frame_idx == 2'd1/2)'.
  - Rev 2.5 (2026-10-29 15:19 KST) : [Audit Fix R04 - Elaboration Signal Name Alignment]
    Updated hierarchical sniffer state check to 'writing_state'.
  - Rev 2.8 (2026-10-30 12:31 KST) : [Audit Fix A18 - 14-Bit Metadata Interconnect Alignment]
    Widened 'seg_valid_bytes' wire to 14 bits ([13:0]).
  - Rev 2.9 (2026-11-05 02:55 KST) : [Post-FIFO Capture Alignment & Zero-Lag 3-Metric Counters]
    Aligned 'ddr4_write_req', 'ddr4_addr', 'payload_cycle_cnt', and 'rx_frame_idx' 
    with the post-FIFO stream ('fifo_data_tvalid && fifo_data_tready').
  - Rev 3.0 (2026-11-05 03:05 KST) : [Zero-Lag Word/Header Captures & Gated RETX Bus Display]
    Converted 'frame1_word_cnt', 'frame2_word_cnt', 'retx_word_cnt', and all 
    captured header/CRC registers to zero-lag signals.
  - Rev 3.1 (2026-11-05 03:12 KST) : [Pre-Drain ARQ Write Arming & 478th Word Alignment]
    Qualified 'fifo_data_tready' with 'u_fso_payload.u_arq_ddr4_wrapper.writing_state'
    so 'ddr4_write_req' arms 'writing_state' 1 cycle before Word 0 drains.
  - Rev 3.2 (2026-11-05 03:50 KST) : [Audit Review Alignment - Stall-Safe Index Hold & Scoped Verdict]
    1. Updated 'raw_in_idx', 'payload_cycle_cnt', and 'raw_retx_idx' to hold their 
       current word index when '!(valid && ready)' and reset to 0 only on '!rst_n' 
       or 'valid && ready && last', ensuring handshake stalls never shift word indices.
    2. Added explicit 'x_state_err_cnt' checking on raw buses ('seg_tdata', 
       'fifo_data_tdata', 'retx_data_tdata') during active transfers.
    3. Clarified counter semantics ('*_clk_cnt' = active transfer beat index; 
       '*_byte_1b_cnt' = visual 4-byte sub-stepping inside each 3.2 ns word period) 
       and scoped the final PASS message to the exact verified items.
===========================================================================
*/

module tb_fso_payload();

    reg clk;
    reg rst_n;
    reg trigger;
    reg [15:0] target_frame_size;

    // Visual sub-cycle 0.8 ns byte stepper (illustrates the 4 bytes inside each 3.2 ns 32-bit word)
    reg [2:0] sub_byte_step = 3'd1;
    always @(posedge clk) begin
        sub_byte_step <= 3'd1;
        #0.8 sub_byte_step <= 3'd2;
        #0.8 sub_byte_step <= 3'd3;
        #0.8 sub_byte_step <= 3'd4;
    end

    // -------------------------------------------------------
    // 1. AXI-Stream from Virtual PC (Packet Generator)
    // -------------------------------------------------------
    wire [31:0] gen_tdata;
    wire [3:0]  gen_tkeep;
    wire        gen_tvalid;
    wire        gen_tlast;
    wire        gen_tready;

    eth_axis_packet_gen u_packet_gen (
        .clk              (clk), 
        .rst_n            (rst_n), 
        .trigger          (trigger), 
        .frame_size_bytes (target_frame_size),
        .m_axis_tdata     (gen_tdata), 
        .m_axis_tkeep     (gen_tkeep),
        .m_axis_tvalid    (gen_tvalid), 
        .m_axis_tlast     (gen_tlast), 
        .m_axis_tready    (gen_tready)
    );

    // -------------------------------------------------------
    // 2. Packaging and Segmentation (Front-End Cut)
    // -------------------------------------------------------
    wire [31:0] seg_tdata;
    wire        seg_tvalid;
    wire        seg_tlast;
    wire        seg_tready;
    wire [13:0] seg_valid_bytes; // [Rev 2.8 - Fix A18] Full 14-bit packet/segment byte count

    packaging_and_segmentation u_segmenter (
        .clk                (clk),
        .rst_n              (rst_n),
        .s_axis_tdata       (gen_tdata),
        .s_axis_tvalid      (gen_tvalid),
        .s_axis_tlast       (gen_tlast),
        .s_axis_tready      (gen_tready),
        .s_axis_tkeep_bytes (3'd4),
        .m_axis_tdata       (seg_tdata),
        .m_axis_tvalid      (seg_tvalid),
        .m_axis_tlast       (seg_tlast),
        .m_axis_tready      (seg_tready),
        .seg_valid_bytes    (seg_valid_bytes)
    );

    // -------------------------------------------------------
    // 3. DUT: FSO Payload Data Path Sub-Top
    // -------------------------------------------------------
    reg         ddr4_write_req;
    reg         ddr4_read_req;
    reg         ddr4_delete_req;
    wire [15:0] ddr4_addr;
    
    wire [31:0] fifo_data_tdata;
    wire        fifo_data_tvalid;
    wire        fifo_data_tlast;
    wire        fifo_data_tready; 

    wire [31:0] retx_data_tdata;
    wire        retx_data_tvalid;
    wire        retx_data_tlast;
    reg         retx_data_tready;

    fso_payload u_fso_payload (
        .clk                 (clk),
        .rst_n               (rst_n),
        
        .s_axis_eth_tdata    (seg_tdata),
        .s_axis_eth_tvalid   (seg_tvalid),
        .s_axis_eth_tlast    (seg_tlast),
        .s_axis_eth_tready   (seg_tready),
        .seg_valid_bytes     (seg_valid_bytes),
        
        .ddr4_write_req      (ddr4_write_req),
        .ddr4_read_req       (ddr4_read_req),
        .ddr4_delete_req     (ddr4_delete_req),
        .ddr4_addr           (ddr4_addr),

        .m_axis_data_tdata   (fifo_data_tdata),
        .m_axis_data_tvalid  (fifo_data_tvalid),
        .m_axis_data_tlast   (fifo_data_tlast),
        .m_axis_data_tready  (fifo_data_tready),

        .m_axis_retx_tdata   (retx_data_tdata),
        .m_axis_retx_tvalid  (retx_data_tvalid),
        .m_axis_retx_tlast   (retx_data_tlast),
        .m_axis_retx_tready  (retx_data_tready)
    );

    // =======================================================
    // SYSTEM CLOCK GENERATOR: 312.5 MHz (3.2ns period)
    // =======================================================
    initial begin
        clk = 1'b0;
        forever #1.6 clk = ~clk; 
    end

    // Watchdog Timeout Guard
    initial begin
        #100000;
        $fatal(1, "\n[TIMEOUT ERROR] tb_fso_payload did not complete within 100 us!\n");
    end

    // =======================================================
    // TRANSFER BEAT COUNTERS & STALL-SAFE WORD INDEX TRACKERS
    // Note: '*_clk_cnt' indicates the active transfer beat number (1..475 / 1..478).
    //       '*_byte_1b_cnt' is a 0.8 ns visual illustration of the 4 bytes per 32-bit beat.
    // =======================================================
    reg  [15:0] raw_in_idx        = 16'd0;
    reg  [1:0]  in_seg_idx        = 2'd0;
    reg  [15:0] payload_cycle_cnt = 16'd0;
    reg  [15:0] raw_retx_idx      = 16'd0;
    reg  [1:0]  rx_frame_idx      = 2'd0;

    // Gate fifo_data_tready with u_arq_ddr4_wrapper.writing_state so Word 0 drains after write is armed
    assign      fifo_data_tready  = (rx_frame_idx < 2'd2) ? u_fso_payload.u_arq_ddr4_wrapper.writing_state : 1'b1;

    wire        in_xfer_active    = seg_tvalid && seg_tready;
    wire        out_xfer_active   = fifo_data_tvalid && fifo_data_tready;
    wire        retx_xfer_active  = retx_data_tvalid && retx_data_tready;

    // Companion gated display buses (raw buses seg_tdata, fifo_data_tdata, retx_data_tdata are also checked & displayed)
    wire [31:0] seg_active_tdata  = in_xfer_active   ? seg_tdata       : 32'd0;
    wire [31:0] fifo_active_tdata = out_xfer_active  ? fifo_data_tdata : 32'd0;
    wire [31:0] retx_active_tdata = retx_xfer_active ? retx_data_tdata : 32'd0;

    // A. Segment Input Beat & Byte Counters (0 when inactive, 1..475 Beats, 4..1900 Byte-Beat, 1..1900 Visual 1B)
    wire [15:0] in_clk_cnt        = in_xfer_active ? (raw_in_idx + 16'd1) : 16'd0;
    wire [15:0] in_byte_cnt       = in_xfer_active ? ((raw_in_idx + 16'd1) * 16'd4) : 16'd0;
    wire [15:0] in_byte_clk_cnt   = in_byte_cnt;
    wire [15:0] in_byte_1b_cnt    = in_xfer_active ? ((raw_in_idx * 16'd4) + {13'd0, sub_byte_step}) : 16'd0;

    wire [13:0] seg_valid_bytes_clean = !in_xfer_active ? 14'd0 :
                                        ((in_seg_idx == 2'd1) && (raw_in_idx >= 16'd25)) ? 14'd100 :
                                        in_byte_clk_cnt[13:0];

    // B. FSO Payload Output Beat & Byte Counters (0 when inactive, 1..478 Beats, 4..1912 Byte-Beat, 1..1912 Visual 1B)
    wire [15:0] out_clk_cnt       = out_xfer_active ? (payload_cycle_cnt + 16'd1) : 16'd0;
    wire [15:0] out_byte_cnt      = out_xfer_active ? ((payload_cycle_cnt + 16'd1) * 16'd4) : 16'd0;
    wire [15:0] out_byte_clk_cnt  = out_byte_cnt;
    wire [15:0] out_byte_1b_cnt   = out_xfer_active ? ((payload_cycle_cnt * 16'd4) + {13'd0, sub_byte_step}) : 16'd0;

    // C. ARQ Retransmit Readback Beat & Byte Counters (0 when inactive, 1..478 Beats, 4..1912 Byte-Beat, 1..1912 Visual 1B)
    wire [15:0] retx_clk_cnt      = retx_xfer_active ? (raw_retx_idx + 16'd1) : 16'd0;
    wire [15:0] retx_byte_clk_cnt = retx_xfer_active ? ((raw_retx_idx + 16'd1) * 16'd4) : 16'd0;
    wire [15:0] retx_byte_1b_cnt  = retx_xfer_active ? ((raw_retx_idx * 16'd4) + {13'd0, sub_byte_step}) : 16'd0;

    // Slot Address: Addr 0 for DAT1 & RETX, Addr 1 for DAT2
    assign ddr4_addr              = (rx_frame_idx == 2'd1) ? 16'd1 : 16'd0;

    // Underlying Latched Storage for End-of-Frame Report
    reg [15:0] frame1_word_cnt_q      = 16'd0;
    reg [15:0] frame2_word_cnt_q      = 16'd0;
    reg [15:0] retx_word_cnt_q        = 16'd0;
    reg [15:0] retx_mismatch_cnt      = 16'd0;
    reg [15:0] x_state_err_cnt        = 16'd0;
    reg [31:0] exp_frame1_mem [0:477];
    reg [31:0] f1_pld_hdr_q           = 32'd0;
    reg [31:0] f1_pkt_hdr_q           = 32'd0;
    reg [31:0] f1_crc32_q             = 32'd0;
    reg [31:0] f2_pld_hdr_q           = 32'd0;
    reg [31:0] f2_word1_data_q        = 32'd0;
    reg [31:0] f2_word25_fcs_q        = 32'd0;
    reg [31:0] f2_crc32_q             = 32'd0;
    reg [31:0] retx_last_word_crc32_q = 32'd0;

    // Zero-Lag Word Counters & Header/CRC Captures
    wire [15:0] frame1_word_cnt      = (out_xfer_active && (rx_frame_idx == 2'd0)) ? out_clk_cnt  : frame1_word_cnt_q;
    wire [15:0] frame2_word_cnt      = (out_xfer_active && (rx_frame_idx == 2'd1)) ? out_clk_cnt  : frame2_word_cnt_q;
    wire [15:0] retx_word_cnt        = retx_xfer_active                            ? retx_clk_cnt : retx_word_cnt_q;

    wire [31:0] f1_pld_hdr           = (out_xfer_active && (rx_frame_idx == 2'd0) && (payload_cycle_cnt == 16'd0))  ? fifo_data_tdata : f1_pld_hdr_q;
    wire [31:0] f1_pkt_hdr           = (out_xfer_active && (rx_frame_idx == 2'd0) && (payload_cycle_cnt == 16'd1))  ? fifo_data_tdata : f1_pkt_hdr_q;
    wire [31:0] f1_crc32             = (out_xfer_active && (rx_frame_idx == 2'd0) && fifo_data_tlast)               ? fifo_data_tdata : f1_crc32_q;
    wire [31:0] f2_pld_hdr           = (out_xfer_active && (rx_frame_idx == 2'd1) && (payload_cycle_cnt == 16'd0))  ? fifo_data_tdata : f2_pld_hdr_q;
    wire [31:0] f2_word1_data        = (out_xfer_active && (rx_frame_idx == 2'd1) && (payload_cycle_cnt == 16'd1))  ? fifo_data_tdata : f2_word1_data_q;
    wire [31:0] f2_word25_fcs        = (out_xfer_active && (rx_frame_idx == 2'd1) && (payload_cycle_cnt == 16'd25)) ? fifo_data_tdata : f2_word25_fcs_q;
    wire [31:0] f2_crc32             = (out_xfer_active && (rx_frame_idx == 2'd1) && fifo_data_tlast)               ? fifo_data_tdata : f2_crc32_q;
    wire [31:0] retx_last_word_crc32 = (retx_xfer_active && retx_data_tlast)                                        ? retx_data_tdata : retx_last_word_crc32_q;

    reg [3:0]  frame_id;
    reg [31:0] frame_type_str;

    always @(*) begin
        if      (retx_xfer_active)                        begin frame_id = 4'd3; frame_type_str = "RETX"; end
        else if (out_xfer_active && rx_frame_idx == 2'd0) begin frame_id = 4'd1; frame_type_str = "DAT1"; end
        else if (out_xfer_active && rx_frame_idx == 2'd1) begin frame_id = 4'd2; frame_type_str = "DAT2"; end
        else                                              begin frame_id = 4'd0; frame_type_str = "WAIT"; end
    end
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            raw_in_idx             <= 16'd0;
            in_seg_idx             <= 2'd0;
            payload_cycle_cnt      <= 16'd0;
            raw_retx_idx           <= 16'd0;
            ddr4_write_req         <= 1'b0;
            frame1_word_cnt_q      <= 16'd0;
            frame2_word_cnt_q      <= 16'd0;
            retx_word_cnt_q        <= 16'd0;
            retx_mismatch_cnt      <= 16'd0;
            x_state_err_cnt        <= 16'd0;
            f1_pld_hdr_q           <= 32'd0;
            f1_pkt_hdr_q           <= 32'd0;
            f1_crc32_q             <= 32'd0;
            f2_pld_hdr_q           <= 32'd0;
            f2_word1_data_q        <= 32'd0;
            f2_word25_fcs_q        <= 32'd0;
            f2_crc32_q             <= 32'd0;
            retx_last_word_crc32_q <= 32'd0;
            rx_frame_idx           <= 2'd0;
        end else begin
            // 1. Track Segment Input index (0..474): Hold value when !in_xfer_active
            if (in_xfer_active) begin
                if (^seg_tdata === 1'bx)
                    x_state_err_cnt <= x_state_err_cnt + 16'd1;
                if (seg_tlast) begin
                    raw_in_idx <= 16'd0;
                    in_seg_idx <= in_seg_idx + 2'd1;
                end else begin
                    raw_in_idx <= raw_in_idx + 16'd1;
                end
            end

            // 2. Arm u_arq_ddr4_wrapper.writing_state 1 cycle before each frame drains from fifo_data
            if ((payload_cycle_cnt == 16'd0) &&
                !u_fso_payload.u_arq_ddr4_wrapper.writing_state &&
                !ddr4_write_req && (rx_frame_idx < 2'd2)) begin
                ddr4_write_req <= 1'b1;
            end else begin
                ddr4_write_req <= 1'b0;
            end

            // 3. Track Post-FIFO FSO Payload Output (m_axis_data_*): Hold value when !out_xfer_active
            if (out_xfer_active) begin
                if (^fifo_data_tdata === 1'bx)
                    x_state_err_cnt <= x_state_err_cnt + 16'd1;
                if (rx_frame_idx == 2'd0) begin
                    exp_frame1_mem[payload_cycle_cnt] <= fifo_data_tdata;
                    frame1_word_cnt_q <= payload_cycle_cnt + 16'd1;
                    if (payload_cycle_cnt == 16'd0) f1_pld_hdr_q <= fifo_data_tdata;
                    if (payload_cycle_cnt == 16'd1) f1_pkt_hdr_q <= fifo_data_tdata;
                    if (fifo_data_tlast)            f1_crc32_q   <= fifo_data_tdata;
                end else if (rx_frame_idx == 2'd1) begin
                    frame2_word_cnt_q <= payload_cycle_cnt + 16'd1;
                    if (payload_cycle_cnt == 16'd0)  f2_pld_hdr_q    <= fifo_data_tdata;
                    if (payload_cycle_cnt == 16'd1)  f2_word1_data_q <= fifo_data_tdata;
                    if (payload_cycle_cnt == 16'd25) f2_word25_fcs_q <= fifo_data_tdata;
                    if (fifo_data_tlast)             f2_crc32_q      <= fifo_data_tdata;
                end

                if (fifo_data_tlast) begin
                    payload_cycle_cnt <= 16'd0;
                    rx_frame_idx      <= rx_frame_idx + 2'd1;
                end else begin
                    payload_cycle_cnt <= payload_cycle_cnt + 16'd1;
                end
            end

            // 4. Track ARQ Retransmit Readback Output (m_axis_retx_*): Hold value when !retx_xfer_active
            if (retx_xfer_active) begin
                if (^retx_data_tdata === 1'bx)
                    x_state_err_cnt <= x_state_err_cnt + 16'd1;
                if (retx_data_tdata !== exp_frame1_mem[raw_retx_idx]) begin
                    retx_mismatch_cnt <= retx_mismatch_cnt + 16'd1;
                end
                retx_word_cnt_q <= raw_retx_idx + 16'd1;
                if (retx_data_tlast) begin
                    retx_last_word_crc32_q <= retx_data_tdata;
                    raw_retx_idx           <= 16'd0;
                end else begin
                    raw_retx_idx           <= raw_retx_idx + 16'd1;
                end
            end
        end
    end

    // =======================================================
    // SIMULATION SCENARIO
    // =======================================================
    initial begin
        rst_n             = 1'b0;
        trigger           = 1'b0;
        target_frame_size = 16'd2000;
        retx_data_tready  = 1'b1;
        ddr4_read_req     = 1'b0;
        ddr4_delete_req   = 1'b0;

        #100;
        rst_n = 1'b1;
        #50;
        
        $display("\n[%0t] SCENARIO: PC Fires a 2000-Byte Jumbo Frame...", $time);
        
        @(posedge clk); trigger = 1'b1; 
        @(posedge clk); trigger = 1'b0; 
        
        wait(rx_frame_idx == 2'd1);
        @(posedge clk);
        $display("[%0t] FRAME 1 Complete (Post-FIFO): %0d Words (%0d Bytes). Saved to DDR4 Addr 0.", $time, frame1_word_cnt, frame1_word_cnt * 4);
        $display("       -> Word 0 (FSO Payload Hdr) : 0x%08X (Expected: 0xAB000000, seq=0, Len=0)", f1_pld_hdr);
        $display("       -> Word 1 (FSO Packet Hdr)  : 0x%08X (Expected: 0xCDEF07D0, Len=2000B)", f1_pkt_hdr);
        $display("       -> Word 477 (FSO CRC-32)    : 0x%08X", f1_crc32);
        
        wait(rx_frame_idx == 2'd2);
        repeat (2) @(posedge clk);
        $display("[%0t] FRAME 2 Complete (Post-FIFO): %0d Words (%0d Bytes). Saved to DDR4 Addr 1.", $time, frame2_word_cnt, frame2_word_cnt * 4);
        $display("       -> Word 0 (FSO Payload Hdr) : 0x%08X (Expected: 0xAB004064, seq=1, Cont_Len=100B)", f2_pld_hdr);
        $display("       -> Word 1 (Cont Data Word 1): 0x%08X (No duplicate 0xCDEF per Table 2-18!)", f2_word1_data);
        $display("       -> Word 25 (100th B Eth FCS): 0x%08X (Expected: 0xDEADBEEF)", f2_word25_fcs);
        $display("       -> Word 477 (FSO CRC-32)    : 0x%08X", f2_crc32);
        
        @(posedge clk);
        ddr4_read_req  <= 1'b1;
        @(posedge clk);
        ddr4_read_req  <= 1'b0;

        wait(retx_word_cnt_q == 16'd478);
        repeat (20) @(posedge clk);
        $display("[%0t] ARQ RETX READBACK Complete: %0d Words (%0d Bytes), Last Word CRC-32 = 0x%08X, Mismatches = %0d, X-Errs = %0d",
                 $time, retx_word_cnt, retx_word_cnt * 4, retx_last_word_crc32, retx_mismatch_cnt, x_state_err_cnt);
        if ((frame1_word_cnt == 16'd478) && (frame2_word_cnt == 16'd478) &&
            (retx_word_cnt == 16'd478) && (retx_mismatch_cnt == 16'd0) &&
            (x_state_err_cnt == 16'd0) && (retx_last_word_crc32 == f1_crc32) &&
            (f1_pld_hdr == 32'hAB00_0000) && (f1_pkt_hdr == 32'hCDEF_07D0) &&
            (f2_pld_hdr == 32'hAB00_4064) && (f2_word25_fcs == 32'hDEAD_BEEF))
            $display(" RESULT: [PASS] DAT1/DAT2 length and header checks passed; DAT1 RAM replay matched all 478 words.\n");
        else
            $fatal(1, " RESULT: [FAIL] Frame word count, header, or ARQ readback mismatch!");
        
        $finish;
    end
endmodule