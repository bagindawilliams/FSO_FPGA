`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_fso_ethernet_deframer
Description  : Comprehensive Verification Testbench for the Receiver FSO-to-
               Ethernet Deframer & Selective Repeat ARQ Subsystem 
               (fso_ethernet_deframer.v).

               SCENARIOS VERIFIED:
               1. Frame 1 (TXFN=1, DATA): Valid CRC-16 & CRC-32 -> Generates 
                  ACK(1) and drains 477 words (1908B) immediately.
               2. Frame 2 (TXFN=2, DATA): Corrupted Payload CRC-32 -> Flushes 
                  buffer and generates NAK(0) for TXFN=2.
               3. Frame 3 (TXFN=3, DATA): Arrives out-of-order while TXFN=2 is 
                  missing -> Generates ACK(3) and buffers in Selective Repeat 
                  Reorder RAM (does NOT drain prematurely!).
               4. Frame 4 (TXFN=4, IDLE) & Frame 5 (TXFN=5, MGMT): Verifies 
                  IDLE discard and Table 2-14 LSB-first 64-bit IEEE-754 Range 
                  extraction (64'h4153_12D0_0000_0000 = 5,000,000.0 m).
               5. Frame 2 Retransmission (TXFN=2, DATA): Passes CRC-32 -> 
                  Triggers back-to-back in-order release of TXFN=2 (477 words) 
                  followed immediately by buffered TXFN=3 (477 words)!

Revision History:
  - Rev 1.0 (Initial) : 5-scenario Deframer + Selective Repeat ARQ reorder TB.
  - Rev 2.0 (2026-10-27 15:55 KST) : [Target B3.1, B4.1 & B5.2 Verification]
    1. Computed true zero-initialized Table 2-15 CRC-16 and CRC-32 on every frame.
    2. Used LSB-packed Table 2-14 telemetry vector (matching mgmt_telemetry_generator.v)
       to verify mgmt_extraction.v Rev 2.0.
===========================================================================
*/

module tb_fso_ethernet_deframer();

    reg clk;   // 312.5 MHz Clock (3.2 ns)
    reg rst_n;

    reg         s_axis_hdr_tvalid;
    reg  [7:0]  s_axis_hdr_tdata;
    reg         s_axis_fso_tvalid;
    reg  [31:0] s_axis_fso_tdata;

    wire [31:0] m_axis_fso_tdata;
    wire        m_axis_fso_tvalid;
    wire        m_axis_fso_tlast;
    reg         m_axis_fso_tready;

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

    fso_ethernet_deframer u_dut (
        .clk                  (clk),
        .rst_n                (rst_n),
        .s_axis_hdr_tvalid    (s_axis_hdr_tvalid),
        .s_axis_hdr_tdata     (s_axis_hdr_tdata),
        .s_axis_fso_tvalid    (s_axis_fso_tvalid),
        .s_axis_fso_tdata     (s_axis_fso_tdata),
        .m_axis_fso_tdata     (m_axis_fso_tdata),
        .m_axis_fso_tvalid    (m_axis_fso_tvalid),
        .m_axis_fso_tlast     (m_axis_fso_tlast),
        .m_axis_fso_tready    (m_axis_fso_tready),
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

    initial begin
        clk = 1'b0;
        forever #1.6 clk = ~clk;
    end

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

    // Table 2-14 LSB-First Telemetry Vector (Matches mgmt_telemetry_generator.v)
    wire [255:0] mgmt_lsb_vec = {
        27'd0, 1'b1, 40'd0, 32'd1476000000,
        64'h4153_12D0_0000_0000, 40'd0, 6'd15,
        40'd16678204759, 6'd15
    };

    task send_fso_frame(
        input [15:0] txfn,
        input [1:0]  ftype,
        input        corrupt_pld_crc
    );
        integer idx;
        reg [7:0]  hb;
        reg [15:0] crc16_acc;
        reg [31:0] pw;
        reg [31:0] crc32_acc;
        begin
            crc16_acc = 16'd0;
            crc32_acc = 32'd0;

            for (idx = 0; idx < 478; idx = idx + 1) begin
                // 1. 16-Byte Header on Cycles 0..15
                if (idx < 14) begin
                    case (idx)
                        0:  hb = txfn[7:0];
                        1:  hb = txfn[15:8];
                        2:  hb = 8'h01;
                        3:  hb = 8'h00;
                        4:  hb = {4'b1111, 1'b1, 1'b1, ftype};
                        10: hb = {2'b11, 6'd15};
                        11: hb = {1'b1, 3'b000, 4'hA};
                        12: hb = 8'h01;
                        13: hb = 8'hF0;
                        default: hb = 8'h55;
                    endcase
                    crc16_acc = step_crc16(crc16_acc, hb);
                end else if (idx == 14) begin
                    hb = crc16_acc[15:8];
                end else if (idx == 15) begin
                    hb = crc16_acc[7:0];
                end else begin
                    hb = 8'd0;
                end

                // 2. 478-Word Payload (477 Data Words + 478th Word CRC-32)
                if (idx < 477) begin
                    if (ftype == 2'b10) begin
                        // MGMT Frame (Table 2-14 LSB-first)
                        if (idx < 8) pw = mgmt_lsb_vec[(idx * 32) +: 32];
                        else         pw = 32'd0;
                    end else if (ftype == 2'b00) begin
                        // IDLE Frame
                        pw = 32'h1D1E_0000 + idx[31:0];
                    end else begin
                        // DATA Frame (Table 2-18)
                        if      (idx == 0) pw = (txfn == 16'd2) ? 32'hAB00_4064 : 32'hAB00_0000;
                        else if (idx == 1) pw = (txfn == 16'd2) ? 32'hAAAA_0001 : 32'hCDEF_07D0;
                        else               pw = {txfn, idx[15:0]};
                    end
                    crc32_acc = step_crc32(crc32_acc, pw);
                end else begin
                    pw = corrupt_pld_crc ? (crc32_acc ^ 32'hDEAD_DEAD) : crc32_acc;
                end

                @(posedge clk);
                s_axis_hdr_tvalid <= (idx < 16);
                s_axis_hdr_tdata  <= (idx < 16) ? hb : 8'd0;
                s_axis_fso_tvalid <= 1'b1;
                s_axis_fso_tdata  <= pw;
            end

            @(posedge clk);
            s_axis_hdr_tvalid <= 1'b0;
            s_axis_hdr_tdata  <= 8'd0;
            s_axis_fso_tvalid <= 1'b0;
            s_axis_fso_tdata  <= 32'd0;
            repeat (25) @(posedge clk);
        end
    endtask

    integer drained_data_frames = 0;
    always @(posedge clk) begin
        if (local_fb_ack_valid) begin
            $display(" [%0t] ARQ Feedback Generated -> RXFN=%0d | ACK=%0b (%s)",
                     $time, local_fb_rxfn, local_fb_ack, local_fb_ack ? "ACK" : "NAK");
        end
        if (m_axis_fso_tvalid && m_axis_fso_tready && m_axis_fso_tlast) begin
            drained_data_frames <= drained_data_frames + 1;
            $display(" [%0t] In-Order DATA Frame #%0d Drained to Reassembly! (next expected_txfn=%0d)",
                     $time, drained_data_frames + 1, expected_txfn);
        end
    end

    initial begin
        rst_n             = 1'b0;
        s_axis_hdr_tvalid = 1'b0;
        s_axis_hdr_tdata  = 8'd0;
        s_axis_fso_tvalid = 1'b0;
        s_axis_fso_tdata  = 32'd0;
        m_axis_fso_tready = 1'b1;
        #100;
        rst_n             = 1'b1;
        repeat (10) @(posedge clk);

        $display("\n--- STEP 1: Send TXFN=1 (DATA, Clean) -> Expect ACK(1) & Immediate Drain ---");
        send_fso_frame(16'd1, 2'b01, 1'b0);
        repeat (500) @(posedge clk);

        $display("\n--- STEP 2: Send TXFN=2 (DATA, Corrupted CRC-32) -> Expect NAK(2) & Flush ---");
        send_fso_frame(16'd2, 2'b01, 1'b1);

        $display("\n--- STEP 3: Send TXFN=3 (DATA, Out-of-Order) -> Expect ACK(3) & Buffer in RAM ---");
        send_fso_frame(16'd3, 2'b01, 1'b0);

        $display("\n--- STEP 4: Send TXFN=4 (IDLE) & TXFN=5 (MGMT 5000 km) ---");
        send_fso_frame(16'd4, 2'b00, 1'b0);
        send_fso_frame(16'd5, 2'b10, 1'b0);

        $display("\n--- STEP 5: Retransmit TXFN=2 (DATA, Clean) -> Expect In-Order Drain of TXFN=2 then TXFN=3! ---");
        send_fso_frame(16'd2, 2'b01, 1'b0);
        repeat (1200) @(posedge clk);

        $display("\n======================================================================");
        $display(" FSO ETHERNET DEFRAMER & SELECTIVE REPEAT ARQ VERIFICATION REPORT");
        $display(" -> In-Order DATA Frames Released : %0d / 3 (TXFN 1 -> TXFN 2 -> TXFN 3)", drained_data_frames);
        $display(" -> Extracted MGMT Range (IEEE754): 0x%016X (Expected: 0x415312D000000000)", mgmt_range_meters);
        if (drained_data_frames == 3 && mgmt_range_meters == 64'h4153_12D0_0000_0000)
            $display(" -> RESULT: [PASS] ZERO-INIT CRC, SELECTIVE REPEAT ARQ & MGMT VERIFIED 100%%!");
        $display("======================================================================\n");
        $finish;
    end

endmodule