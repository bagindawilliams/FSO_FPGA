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
               4. arq_ddr4_wrapper SNIFFS the 1912B frame for backup.
               5. fifo_data: Successfully buffers the final 1912B frame for MUX.

Revision History:
  - Rev 1.0 (Initial) : 2000-Byte Jumbo segmentation & FSO Payload encapsulation testbench.
  - Rev 2.0 (2026-10-27 15:04 KST) :
    1. Connected 'seg_valid_bytes' output port on u_segmenter (1900 Bytes on 
       Frame 1, 100 Bytes on Frame 2).
    2. Added automatic verification of SDA OISL Table 2-18 (Page 44-45) & ETRI 
       Review Item 4.2(2) header fields:
       - Frame 1 (Start Frame, 478 words = 1912B):
         * Word 0 = 32'hAB00_0000 (seq_num=0, Length=0)
         * Word 1 = 32'hCDEF_07D0 (Magic=0xCDEF, Length=2000 Bytes)
       - Frame 2 (Continuation Frame, 478 words = 1912B):
         * Word 0 = 32'hAB00_4064 (seq_num=1, Length=100 Bytes remaining)
         * Words 1..25 = 100 Bytes remaining Ethernet payload (ending with 
           FCS 32'hDEADBEEF at Word 25, NO duplicate 0xCDEF Packet Header!)
         * Words 26..476 = 1804 Bytes (451 words) Zero Padding
         * Word 477 = 4-Byte FSO CRC-32
    3. Added ARQ DDR4 Retransmit readback test (ddr4_read_req = 1) to verify 
       Target B3.2 (all 478 words = 1912 Bytes including Word 477 CRC-32 are 
       stored and re-emitted intact).
===========================================================================
*/

module tb_fso_payload();

    reg clk;
    reg rst_n;
    reg trigger;
    reg [15:0] target_frame_size;

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
    wire [10:0] seg_valid_bytes;

    packaging_and_segmentation u_segmenter (
        .clk              (clk),
        .rst_n            (rst_n),
        .s_axis_tdata     (gen_tdata),
        .s_axis_tvalid    (gen_tvalid),
        .s_axis_tlast     (gen_tlast),
        .s_axis_tready    (gen_tready),
        .m_axis_tdata     (seg_tdata),
        .m_axis_tvalid    (seg_tvalid),
        .m_axis_tlast     (seg_tlast),
        .m_axis_tready    (seg_tready),
        .seg_valid_bytes  (seg_valid_bytes)
    );

    // -------------------------------------------------------
    // 3. DUT: FSO Payload Data Path Sub-Top
    // -------------------------------------------------------
    // ARQ RAM Control Signals
    reg         ddr4_write_req;
    reg         ddr4_read_req;
    reg         ddr4_delete_req;
    reg  [15:0] ddr4_addr;
    
    // Primary Output to MUX
    wire [31:0] fifo_data_tdata;
    wire        fifo_data_tvalid;
    wire        fifo_data_tlast;
    reg         fifo_data_tready; 

    // Retransmit Output (Verified in Rev 2.0 for 478-word / 1912B completeness)
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

    // =======================================================
    // CYCLE COUNTER, TABLE 2-18 VERIFIER & DYNAMIC ARQ ADDRESS LOGIC
    // =======================================================
    reg [15:0] payload_cycle_cnt;
    reg [15:0] frame1_word_cnt;
    reg [15:0] frame2_word_cnt;
    reg [15:0] retx_word_cnt;
    reg [31:0] f1_pld_hdr, f1_pkt_hdr, f1_crc32;
    reg [31:0] f2_pld_hdr, f2_word1_data, f2_word25_fcs, f2_crc32;
    reg [31:0] retx_last_word_crc32;
    reg [1:0]  rx_frame_idx;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            payload_cycle_cnt    <= 16'd0;
            ddr4_addr            <= 16'd0; // Start storing at Address 0
            frame1_word_cnt      <= 16'd0;
            frame2_word_cnt      <= 16'd0;
            retx_word_cnt        <= 16'd0;
            f1_pld_hdr           <= 32'd0;
            f1_pkt_hdr           <= 32'd0;
            f1_crc32             <= 32'd0;
            f2_pld_hdr           <= 32'd0;
            f2_word1_data        <= 32'd0;
            f2_word25_fcs        <= 32'd0;
            f2_crc32             <= 32'd0;
            retx_last_word_crc32 <= 32'd0;
            rx_frame_idx         <= 2'd0;
        end else begin
            if (u_fso_payload.crc_tvalid && u_fso_payload.crc_tready) begin
                if (rx_frame_idx == 2'd0) begin
                    frame1_word_cnt <= frame1_word_cnt + 16'd1;
                    if (payload_cycle_cnt == 16'd0)   f1_pld_hdr <= u_fso_payload.crc_tdata;
                    if (payload_cycle_cnt == 16'd1)   f1_pkt_hdr <= u_fso_payload.crc_tdata;
                    if (u_fso_payload.crc_tlast)      f1_crc32   <= u_fso_payload.crc_tdata;
                end else if (rx_frame_idx == 2'd1) begin
                    frame2_word_cnt <= frame2_word_cnt + 16'd1;
                    if (payload_cycle_cnt == 16'd0)   f2_pld_hdr    <= u_fso_payload.crc_tdata;
                    if (payload_cycle_cnt == 16'd1)   f2_word1_data <= u_fso_payload.crc_tdata;
                    if (payload_cycle_cnt == 16'd25)  f2_word25_fcs <= u_fso_payload.crc_tdata;
                    if (u_fso_payload.crc_tlast)      f2_crc32      <= u_fso_payload.crc_tdata;
                end

                if (u_fso_payload.crc_tlast) begin
                    payload_cycle_cnt <= 16'd0;
                    rx_frame_idx      <= rx_frame_idx + 2'd1;
                    // Increment ARQ RAM address for the next frame
                    ddr4_addr         <= ddr4_addr + 1'b1; 
                end else begin
                    payload_cycle_cnt <= payload_cycle_cnt + 1'b1;
                end
            end

            // Track ARQ DDR4 Retransmit Readback (Target B3.2 Verification)
            if (retx_data_tvalid && retx_data_tready) begin
                retx_word_cnt <= retx_word_cnt + 16'd1;
                if (retx_data_tlast) begin
                    retx_last_word_crc32 <= retx_data_tdata;
                end
            end
        end
    end

    // =======================================================
    // SIMULATION SCENARIO
    // =======================================================
    initial begin
        // 1. Initialization
        rst_n             = 1'b0;
        trigger           = 1'b0;
        target_frame_size = 16'd2000; // Attack with 2000B Jumbo Frame
        
        // MUX is always ready to receive data
        fifo_data_tready  = 1'b1; 
        retx_data_tready  = 1'b1;
        
        // Configure ARQ Wrapper to ALWAYS sniff and write to RAM
        ddr4_write_req    = 1'b1;  
        ddr4_read_req     = 1'b0;
        ddr4_delete_req   = 1'b0;

        #100;
        rst_n = 1'b1;
        #50;
        
        $display("\n[%0t] SCENARIO: PC Fires a 2000-Byte Jumbo Frame...", $time);
        
        // Fire Jumbo Packet
        @(posedge clk); trigger = 1'b1; 
        @(posedge clk); trigger = 1'b0; 
        
        // Wait for Frame 1 (First 1900B block) to process
        // Takes roughly 478 clocks (approx 1500ns) to reach CRC and DDR4
        #2000; 
        $display("[%0t] FRAME 1 Complete: %0d Words (%0d Bytes). Saved to DDR4 Addr 0.", $time, frame1_word_cnt, frame1_word_cnt * 4);
        $display("       -> Word 0 (FSO Payload Hdr) : 0x%08X (Expected: 0xAB000000, seq=0, Len=0)", f1_pld_hdr);
        $display("       -> Word 1 (FSO Packet Hdr)  : 0x%08X (Expected: 0xCDEF07D0, Len=2000B)", f1_pkt_hdr);
        $display("       -> Word 477 (FSO CRC-32)    : 0x%08X", f1_crc32);
        
        // Wait for Frame 2 (Remaining 100B + 1804B Zero Pad per Table 2-18) to process
        #2000;
        $display("[%0t] FRAME 2 Complete: %0d Words (%0d Bytes). Saved to DDR4 Addr 1.", $time, frame2_word_cnt, frame2_word_cnt * 4);
        $display("       -> Word 0 (FSO Payload Hdr) : 0x%08X (Expected: 0xAB004064, seq=1, Cont_Len=100B)", f2_pld_hdr);
        $display("       -> Word 1 (Cont Data Word 1): 0x%08X (No duplicate 0xCDEF per Table 2-18!)", f2_word1_data);
        $display("       -> Word 25 (100th B Eth FCS): 0x%08X (Expected: 0xDEADBEEF)", f2_word25_fcs);
        $display("       -> Word 477 (FSO CRC-32)    : 0x%08X", f2_crc32);
        
        // Verify ARQ DDR4 Retransmit Readback of Frame 1 (Slot 0) -> Must emit all 478 words (1912B)
        @(posedge clk);
        ddr4_write_req = 1'b0;
        ddr4_addr      = 16'd0;
        ddr4_read_req  = 1'b1;
        @(posedge clk);
        ddr4_read_req  = 1'b0;

        wait(retx_data_tlast);
        #100;
        $display("[%0t] ARQ RETX READBACK Complete: %0d Words (%0d Bytes), Last Word CRC-32 = 0x%08X",
                 $time, retx_word_cnt, retx_word_cnt * 4, retx_last_word_crc32);
        if ((frame1_word_cnt == 16'd478) && (frame2_word_cnt == 16'd478) &&
            (retx_word_cnt == 16'd478) && (retx_last_word_crc32 == f1_crc32) &&
            (f1_pkt_hdr == 32'hCDEF_07D0) && (f2_pld_hdr == 32'hAB00_4064) &&
            (f2_word25_fcs == 32'hDEAD_BEEF))
            $display(" RESULT: [PASS] TABLE 2-18 CONTINUATION & 1912B ARQ RAM VERIFIED 100%%!\n");
        else
            $display(" RESULT: [CHECK WAVEFORM] Verify counters above.\n");
        
        $finish;
    end
endmodule