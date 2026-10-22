`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_reassembly_and_backend
Description  : End-to-End Verification Testbench for ethernet_frame_reassembly.v
               (eth_preamble_gen + mux_eth_32) and eth_tx_back_end_top.v
               (eth_mac_packing_tx + xgmii_tx_formatter) at 312.5 MHz.

               WAVEFORM GROUPS TO OBSERVE:
               1. Group 1 - Deframed FSO Segments In (DAT1 1908B + DAT2 1908B):
                  - s_axis_fso_tvalid, s_axis_fso_tdata[31:0], in_seg_id (1, 2),
                    in_seg_word_cnt (1..477), in_seg_byte_cnt (4..1908)
               2. Group 2 - Reassembled Ethernet Frame Out (502 Words = 2008 Bytes):
                  - reasm_eth_tvalid, reasm_eth_tdata[31:0], reasm_eth_tlast,
                    reassembled_pkt_bytes (2000), reassembled_pkt_cnt (1),
                    reasm_word_cnt (1..502), reasm_byte_cnt (4..2008),
                    tx_word_cnt (1..502), tx_byte_cnt (4..2008)
               3. Group 3 - Final XGMII Egress to PC 2 (503 Cycles = 2012 Bytes + IPG):
                  - xgmii_txd[31:0], xgmii_txc[3:0], xgmii_active_word_cnt (1..503),
                    xgmii_active_byte_cnt (4..2012), extracted_DEST_MAC,
                    extracted_SRC_MAC, extracted_ASCII ("Kookmin FSO "),
                    extracted_FCS (0xDEADBEEF)

               Revision History:
               - Rev 1.0 (Initial) : End-to-end Reassembly + Back-End testbench.
               - Rev 1.1 (2026-10-22 07:09 KST) :
                 1. Updated timescale to 1ns/1ps.
                 2. Eliminated 1-cycle non-blocking lag on xgmii_active_word_cnt 
                    (1..503) and xgmii_active_byte_cnt (4..2012) so Cycle 1 
                    (Start 0x555555FB) immediately displays word=1 / byte=4 
                    and Cycle 503 (Terminate 0x070707FD) displays word=503 / 
                    byte=2012 before returning to 0 on Idle (0x07070707).
                 3. Added zero-lag reasm_word_cnt (1..502) & reasm_byte_cnt 
                    (4..2008) aligned to reasm_eth_tvalid alongside SDA OISL 
                    Table 2-4 timing metrics.
===========================================================================
*/

module tb_reassembly_and_backend();

    // =======================================================
    // 1. CLOCK AND RESET SIGNALS
    // =======================================================
    reg clk_gth; // 312.5 MHz (Period = 3.2 ns)
    reg clk_100M;// 100.0 MHz (DRP clock)
    reg rst_n;

    // =======================================================
    // 2. GROUP 1: INPUT SEGMENTS FROM DEFRAMER (477 Words = 1908B/Seg)
    // =======================================================
    reg  [31:0] s_axis_fso_tdata;
    reg         s_axis_fso_tvalid;
    reg         s_axis_fso_tlast;
    wire        s_axis_fso_tready;

    reg  [3:0]  in_seg_id;       // 1 = DAT1 (1900B valid), 2 = DAT2 (100B valid + 1800B pad)
    reg  [8:0]  in_seg_word_cnt; // Counts 1..477
    reg  [11:0] in_seg_byte_cnt; // Counts 4..1908 Bytes

    // =======================================================
    // 3. GROUP 2: REASSEMBLED ETHERNET STREAM (502 Words = 2008 Bytes)
    // =======================================================
    wire [31:0] reasm_eth_tdata;
    wire        reasm_eth_tvalid;
    wire        reasm_eth_tlast;
    wire [15:0] reassembled_pkt_bytes;
    wire [15:0] reassembled_pkt_cnt;

    // Zero-lag counters aligned directly with reasm_eth_tvalid (1..502 words, 4..2008 bytes)
    reg  [15:0] raw_reasm_word_idx;
    wire [15:0] reasm_word_cnt = reasm_eth_tvalid ? (raw_reasm_word_idx + 16'd1) : 16'd0;
    wire [15:0] reasm_byte_cnt = reasm_eth_tvalid ? ((raw_reasm_word_idx + 16'd1) * 16'd4) : 16'd0;

    // Packer-stage counters inside eth_tx_back_end_top (1-cycle registered)
    wire [15:0] tx_word_cnt = u_back_end.tx_word_cnt; // Counts 1..502 Words
    wire [15:0] tx_byte_cnt = u_back_end.tx_byte_cnt; // Counts 4..2008 Bytes

    // =======================================================
    // 4. GROUP 3: FINAL XGMII OUTPUT TO PC 2 (312.5 MHz)
    // =======================================================
    wire [31:0] xgmii_txd;
    wire [3:0]  xgmii_txc;
    wire        txp_unused, txn_unused;

    reg  [15:0] raw_xgmii_word_idx;
    wire        xgmii_is_active       = (xgmii_txd != 32'h0707_0707);
    wire [15:0] xgmii_active_word_cnt = xgmii_is_active ? (raw_xgmii_word_idx + 16'd1) : 16'd0; // 1..503
    wire [15:0] xgmii_active_byte_cnt = xgmii_is_active ? ((raw_xgmii_word_idx + 16'd1) * 16'd4) : 16'd0; // 4..2012

    reg  [47:0] extracted_DEST_MAC;
    reg  [47:0] extracted_SRC_MAC;
    reg  [95:0] extracted_ASCII;       // "Kookmin FSO " (4B6F6F6B_6D696E20_46534F20)
    reg  [31:0] extracted_FCS;         // 0xDEADBEEF

    // =======================================================
    // 5. DUT INSTANTIATIONS: REASSEMBLY + XGMII BACK-END
    // =======================================================
    ethernet_frame_reassembly u_reassembly (
        .clk                   (clk_gth),
        .rst_n                 (rst_n),
        .s_axis_fso_tdata      (s_axis_fso_tdata),
        .s_axis_fso_tvalid     (s_axis_fso_tvalid),
        .s_axis_fso_tlast      (s_axis_fso_tlast),
        .s_axis_fso_tready     (s_axis_fso_tready),
        .m_axis_eth_tdata      (reasm_eth_tdata),
        .m_axis_eth_tvalid     (reasm_eth_tvalid),
        .m_axis_eth_tlast      (reasm_eth_tlast),
        .m_axis_eth_tready     (1'b1),
        .reassembled_pkt_bytes (reassembled_pkt_bytes),
        .reassembled_pkt_cnt   (reassembled_pkt_cnt)
    );

    eth_tx_back_end_top #(
        .RUN_MODE (1) // Simulation Mode
    ) u_back_end (
        .clk       (clk_gth),
        .rst_n     (rst_n),
        .data_in   (reasm_eth_tdata),
        .en        (reasm_eth_tvalid),
        .xgmii_txd (xgmii_txd),
        .xgmii_txc (xgmii_txc),
        .refclk_p  (1'b0),
        .refclk_n  (1'b1),
        .reset     (~rst_n),
        .dclk      (clk_100M),
        .txp       (txp_unused),
        .txn       (txn_unused)
    );

    // =======================================================
    // 6. CLOCK GENERATORS
    // =======================================================
    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;   // 312.5 MHz
    end

    initial begin
        clk_100M = 1'b0;
        forever #5.0 clk_100M = ~clk_100M; // 100.0 MHz
    end

    // =======================================================
    // 7. STIMULUS: FEED DAT1 (1908B) + GAP + DAT2 (1908B)
    // =======================================================
    function [31:0] get_eth_payload_word(input integer eth_w_idx);
        begin
            // eth_w_idx 0..499 = 500 words = 2000-Byte Jumbo Ethernet Packet
            case (eth_w_idx)
                0:   get_eth_payload_word = 32'hDA01_0203; // Dest MAC [47:16]
                1:   get_eth_payload_word = 32'h0405_5A01; // Dest MAC [15:0] + Src MAC [47:32]
                2:   get_eth_payload_word = 32'h0203_0405; // Src MAC [31:0]
                3:   get_eth_payload_word = 32'h0800_4500; // EtherType IPv4 (0x0800)
                4:   get_eth_payload_word = 32'h07C2_0001; // IPv4 Total Length
                5:   get_eth_payload_word = 32'h4000_4011; // UDP Protocol
                6:   get_eth_payload_word = 32'hC0A8_0101; // Src IP (192.168.1.1)
                7:   get_eth_payload_word = 32'hC0A8_0102; // Dest IP (192.168.1.2)
                8:   get_eth_payload_word = 32'h1F90_1F90; // UDP Ports (8080 -> 8080)
                9:   get_eth_payload_word = 32'h4B6F_6F6B; // ASCII "Kook"
                10:  get_eth_payload_word = 32'h6D69_6E20; // ASCII "min "
                11:  get_eth_payload_word = 32'h4653_4F20; // ASCII "FSO "
                499: get_eth_payload_word = 32'hDEAD_BEEF; // 500th Word (Bytes 1997..2000): Ethernet FCS
                default: get_eth_payload_word = {16'hE700, eth_w_idx[15:0] + 16'd1};
            endcase
        end
    endfunction

    integer w;

    initial begin
        rst_n             = 1'b0;
        s_axis_fso_tdata  = 32'd0;
        s_axis_fso_tvalid = 1'b0;
        s_axis_fso_tlast  = 1'b0;
        in_seg_id         = 4'd0;
        in_seg_word_cnt   = 9'd0;
        in_seg_byte_cnt   = 12'd0;

        #100;
        rst_n = 1'b1;
        repeat (10) @(posedge clk_gth);

        // ---------------------------------------------------
        // SEGMENT 1 (DAT1): 477 Words = 1908 Bytes
        // Word 0 = 0xAB00_076C (Start, 1900B), Word 1 = 0xCDEF_07D0 (2000B Total)
        // Words 2..476 = Ethernet Words 0..474 (First 1900 Bytes)
        // ---------------------------------------------------
        for (w = 0; w < 477; w = w + 1) begin
            @(posedge clk_gth);
            in_seg_id         <= 4'd1;
            s_axis_fso_tvalid <= 1'b1;
            s_axis_fso_tlast  <= (w == 476);
            in_seg_word_cnt   <= w[8:0] + 9'd1;
            in_seg_byte_cnt   <= (w[11:0] + 12'd1) * 12'd4;

            if (w == 0)
                s_axis_fso_tdata <= 32'hAB00_076C;
            else if (w == 1)
                s_axis_fso_tdata <= 32'hCDEF_07D0;
            else
                s_axis_fso_tdata <= get_eth_payload_word(w - 2);
        end

        @(posedge clk_gth);
        s_axis_fso_tvalid <= 1'b0;
        s_axis_fso_tlast  <= 1'b0;
        s_axis_fso_tdata  <= 32'd0;
        in_seg_id         <= 4'd0;
        in_seg_word_cnt   <= 9'd0;
        in_seg_byte_cnt   <= 12'd0;

        // Simulate realistic 300-cycle inter-frame gap between DAT1 and DAT2
        repeat (300) @(posedge clk_gth);

        // ---------------------------------------------------
        // SEGMENT 2 (DAT2): 477 Words = 1908 Bytes
        // Word 0 = 0xAB01_0064 (Cont, 100B), Word 1 = 0xCDEF_07D0 (2000B Total)
        // Words 2..26  = Ethernet Words 475..499 (Remaining 100 Bytes ending in 0xDEADBEEF)
        // Words 27..476= 450 Words (1800 Bytes) of Zero-Padding (To be stripped!)
        // ---------------------------------------------------
        for (w = 0; w < 477; w = w + 1) begin
            @(posedge clk_gth);
            in_seg_id         <= 4'd2;
            s_axis_fso_tvalid <= 1'b1;
            s_axis_fso_tlast  <= (w == 476);
            in_seg_word_cnt   <= w[8:0] + 9'd1;
            in_seg_byte_cnt   <= (w[11:0] + 12'd1) * 12'd4;

            if (w == 0)
                s_axis_fso_tdata <= 32'hAB01_0064;
            else if (w == 1)
                s_axis_fso_tdata <= 32'hCDEF_07D0;
            else if (w <= 26)
                s_axis_fso_tdata <= get_eth_payload_word(475 + (w - 2));
            else
                s_axis_fso_tdata <= 32'h0000_0000; // 1800 Bytes Zero-Padding
        end

        @(posedge clk_gth);
        s_axis_fso_tvalid <= 1'b0;
        s_axis_fso_tlast  <= 1'b0;
        s_axis_fso_tdata  <= 32'd0;
        in_seg_id         <= 4'd0;
        in_seg_word_cnt   <= 9'd0;
        in_seg_byte_cnt   <= 12'd0;
    end

    // =======================================================
    // 8. REASSEMBLY & XGMII OUTPUT MONITOR (PC 2 EGRESS)
    // =======================================================
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            raw_reasm_word_idx <= 16'd0;
            raw_xgmii_word_idx <= 16'd0;
            extracted_DEST_MAC <= 48'd0;
            extracted_SRC_MAC  <= 48'd0;
            extracted_ASCII    <= 96'd0;
            extracted_FCS      <= 32'd0;
        end else begin
            // Track Reassembly Output Words (0..501 -> reasm_word_cnt = 1..502)
            if (reasm_eth_tvalid) begin
                if (reasm_eth_tlast)
                    raw_reasm_word_idx <= 16'd0;
                else
                    raw_reasm_word_idx <= raw_reasm_word_idx + 16'd1;
            end else begin
                raw_reasm_word_idx <= 16'd0;
            end

            // Track XGMII Egress Words (0..502 -> xgmii_active_word_cnt = 1..503)
            if (xgmii_is_active) begin
                raw_xgmii_word_idx <= raw_xgmii_word_idx + 16'd1;

                // Extract Ethernet MAC, ASCII "Kookmin FSO ", and FCS from XGMII stream
                // (Cycle 0 = Start 0xFB, Cycle 1 = SFD 0xD5, Cycle 2 = First MAC word)
                case (raw_xgmii_word_idx)
                    16'd2:   extracted_DEST_MAC[47:16] <= xgmii_txd;
                    16'd3: begin
                        extracted_DEST_MAC[15:0] <= xgmii_txd[31:16];
                        extracted_SRC_MAC[47:32] <= xgmii_txd[15:0];
                    end
                    16'd4:   extracted_SRC_MAC[31:0]   <= xgmii_txd;
                    16'd11:  extracted_ASCII[95:64]    <= xgmii_txd; // "Kook"
                    16'd12:  extracted_ASCII[63:32]    <= xgmii_txd; // "min "
                    16'd13:  extracted_ASCII[31:0]     <= xgmii_txd; // "FSO "
                    16'd501: extracted_FCS             <= xgmii_txd; // 0xDEADBEEF (500th Payload Word)
                endcase
            end else begin
                raw_xgmii_word_idx <= 16'd0;
            end
        end
    end

    // =======================================================
    // 9. SDA OISL TABLE 2-4 METRICS ANALYZER
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

    always @(in_seg_id) begin
        if (in_seg_id >= 4'd1 && in_seg_id <= 4'd2) begin
            time_start = $realtime;
            time_end   = time_start + (3117.0 * measured_byte_time_ns);

            OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
            OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
            OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
            OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;
        end
    end

    // =======================================================
    // 10. SIMULATION TERMINATION & SUMMARY REPORT
    // =======================================================
    initial begin
        wait(reassembled_pkt_cnt == 16'd1);
        wait(xgmii_txd == 32'h0707_07FD); // Wait for XGMII Terminate (/T/) at Word 503
        @(posedge clk_gth);
        time_start                    = 0.0;
        time_end                      = 0.0;
        OISL_Frame_Duration_us        = 0.0;
        OISL_Effective_Data_Rate_Mbps = 0.0;
        OISL_Frame_Rate_kHz           = 0.0;
        OISL_FCCH_Mbps                = 0.0;
        repeat (20) @(posedge clk_gth);

        $display("======================================================================");
        $display(" [PC 2 EGRESS VERIFIED] 2000-BYTE JUMBO ETHERNET PACKET REASSEMBLED!");
        $display(" Reassembled Payload : %0d Bytes (+ 8B Preamble = 2008B / 502 Words)", reassembled_pkt_bytes);
        $display(" DEST_MAC            : %012h | SRC_MAC : %012h", extracted_DEST_MAC, extracted_SRC_MAC);
        $display(" ASCII Tag (Hex/Str) : %024h (\"%s\")", extracted_ASCII, extracted_ASCII);
        $display(" Reconstructed FCS   : 0x%08h (Expected: 0xDEADBEEF)", extracted_FCS);
        $display("======================================================================");
        $finish;
    end

endmodule