`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_cdc4_logic_gth
Description  : Standalone Verification Testbench for Clock Domain Crossing 4 
               (rx_logic_gth.v).
               - Feeds 4 decoded FSO frames (16-Byte Header @ 8-bit + 
                 1912-Byte Payload @ 64-bit) at 200.0 MHz into rx_logic_gth.
               - Verifies that rx_logic_gth outputs strictly 16 Header cycles 
                 (8-bit) and 478 Payload cycles (32-bit = 1912 Bytes) per frame 
                 at 312.5 MHz with C_PRELOAD_LATENCY = 2 alignment.

Revision History:
  - Rev 1.0 (Initial) : 4-frame CDC 4 (200 MHz -> 312.5 MHz) testbench.
  - Rev 2.0 (2026-10-27 15:55 KST) : [Target B4.2 & Table 2-14 / Table 2-18 Alignment]
    1. Updated Frame 2 (DAT2) to Table 2-18 Continuation format (Word 1 = 
       64'hAB00_4064_AAAA_0001, Word 13 = 64'hAAAA_0018_DEAD_BEEF so Ethernet 
       FCS 0xDEADBEEF lands at 32-bit Word 26).
    2. Updated Frame 4 (MGMT) to match LSB-packed Table 2-14 bits [155:92] 
       from mgmt_telemetry_generator.v so cdc4_MGMT_RANGE captures 
       64'h4153_12D0_0000_0000 (5,000,000.0 meters).
===========================================================================
*/

module tb_cdc4_logic_gth();

    reg clk_logic; // 200.0 MHz Write Domain (5.0 ns)
    reg clk_gth;   // 312.5 MHz Read Domain (3.2 ns)
    reg rst_n;

    reg         en_head;
    reg         en_load;
    reg  [7:0]  header_in;
    reg  [63:0] payload_in;

    wire        header_dv;
    wire [7:0]  header_out;
    wire        payload_dv;
    wire [31:0] payload_out;

    // Hierarchical Probes from rx_logic_gth.v
    wire [4:0]  out_hdr_byte_cnt  = u_cdc4.out_hdr_byte_cnt;
    wire [8:0]  out_pld_word_cnt  = u_cdc4.out_pld_word_cnt;
    wire [15:0] cdc4_TXFN         = u_cdc4.cdc4_TXFN;
    wire [1:0]  cdc4_FRAME_TYPE   = u_cdc4.cdc4_FRAME_TYPE;
    wire [15:0] cdc4_HDR_CRC16    = u_cdc4.cdc4_HDR_CRC16;
    wire [31:0] cdc4_FSO_PLD_HDR  = u_cdc4.cdc4_FSO_PLD_HDR;
    wire [31:0] cdc4_FSO_PKT_HDR  = u_cdc4.cdc4_FSO_PKT_HDR;
    wire [95:0] cdc4_ASCII_TAG    = u_cdc4.cdc4_ASCII_TAG;
    wire [31:0] cdc4_ETH_FCS      = u_cdc4.cdc4_ETH_FCS;
    wire [63:0] cdc4_MGMT_RANGE   = u_cdc4.cdc4_MGMT_RANGE;
    wire [31:0] cdc4_PLD_CRC32    = u_cdc4.cdc4_PLD_CRC32;
    wire [31:0] cdc4_frame_id     = u_cdc4.cdc4_frame_id;
    wire [15:0] out_pld_total_bytes = u_cdc4.out_pld_total_bytes;

    rx_logic_gth u_cdc4 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en_head    (en_head),
        .en_load    (en_load),
        .header_in  (header_in),
        .payload_in (payload_in),
        .header_dv  (header_dv),
        .header     (header_out),
        .payload_dv (payload_dv),
        .payload    (payload_out)
    );

    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic;
    end

    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;
    end

    integer hdr_cnt = 0;
    integer pld_cnt = 0;
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            hdr_cnt <= 0;
            pld_cnt <= 0;
        end else begin
            if (header_dv)  hdr_cnt <= hdr_cnt + 1;
            if (payload_dv) pld_cnt <= pld_cnt + 1;
        end
    end

    // Table 2-14 LSB-Packed Telemetry Vector (Matches mgmt_telemetry_generator.v)
    wire [255:0] mgmt_vec = {
        27'd0, 1'b1, 40'd0, 32'd1476000000,
        64'h4153_12D0_0000_0000, 40'd0, 6'd15,
        40'd16678204759, 6'd15
    };

    integer f, c;
    initial begin
        rst_n      = 1'b0;
        en_head    = 1'b0;
        en_load    = 1'b0;
        header_in  = 8'd0;
        payload_in = 64'd0;
        #100;
        rst_n      = 1'b1;

        wait(!u_cdc4.head_rd_rst_busy && !u_cdc4.load_rd_rst_busy);
        repeat (10) @(posedge clk_logic);

        for (f = 1; f <= 4; f = f + 1) begin
            for (c = 1; c <= 239; c = c + 1) begin
                @(posedge clk_logic);
                if (c <= 16) begin
                    en_head   <= 1'b1;
                    case (c)
                        1:  header_in <= f[7:0];  // d0: TXFN[7:0]
                        2:  header_in <= 8'h00;   // d1: TXFN[15:8]
                        3:  header_in <= 8'h00;   // d2: RXFN[7:0]
                        4:  header_in <= 8'h00;   // d3: RXFN[15:8]
                        5:  header_in <= (f == 3) ? 8'hF0 : (f == 4) ? 8'hF2 : 8'hFD;
                        15: header_in <= 8'h0F;   // d14: CRC-16 MSB
                        16: header_in <= 8'h28;   // d15: CRC-16 LSB
                        default: header_in <= 8'h55;
                    endcase
                end else begin
                    en_head   <= 1'b0;
                    header_in <= 8'd0;
                end

                en_load <= 1'b1;
                if (f == 1) begin
                    if      (c == 1)   payload_in <= 64'hAB00_0000_CDEF_07D0;
                    else if (c == 7)   payload_in <= 64'h4B6F_6F6B_6D69_6E20; // "Kookmin "
                    else if (c == 8)   payload_in <= 64'h4653_4F20_AAAA_000E; // "FSO "
                    else if (c == 239) payload_in <= 64'hAAAA_01DC_C320_0001;
                    else               payload_in <= {32'hAAAA_0000 + c[31:0], 32'hBBBB_0000 + c[31:0]};
                end else if (f == 2) begin
                    if      (c == 1)   payload_in <= 64'hAB00_4064_AAAA_0001; // Table 2-18 Continuation (Len=100B)
                    else if (c == 13)  payload_in <= 64'hAAAA_0018_DEAD_BEEF; // 100th Byte Eth FCS at Word 26
                    else if (c == 239) payload_in <= 64'h0000_0000_C320_0002;
                    else if (c > 13)   payload_in <= 64'd0;                   // 1804B Zero Padding
                    else               payload_in <= 64'hAAAA_0000_AAAA_0000;
                end else if (f == 3) begin
                    if      (c == 239) payload_in <= 64'h1D1E_1D1E_C320_0003;
                    else               payload_in <= 64'h1D1E_1D1E_1D1E_1D1E;
                end else begin
                    if      (c == 1)   payload_in <= {mgmt_vec[31:0],   mgmt_vec[63:32]};
                    else if (c == 2)   payload_in <= {mgmt_vec[95:64],  mgmt_vec[127:96]};
                    else if (c == 3)   payload_in <= {mgmt_vec[159:128],mgmt_vec[191:160]};
                    else if (c == 4)   payload_in <= {mgmt_vec[223:192],mgmt_vec[255:224]};
                    else if (c == 239) payload_in <= 64'h0000_0000_C320_0004;
                    else               payload_in <= 64'd0;
                end
            end

            @(posedge clk_logic);
            en_head    <= 1'b0;
            en_load    <= 1'b0;
            header_in  <= 8'd0;
            payload_in <= 64'd0;

            repeat (260) @(posedge clk_logic);
        end

        wait(hdr_cnt == 64 && pld_cnt == 1912);
        wait(cdc4_frame_id == 32'd0);
        #200;

        $display("\n======================================================================");
        $display(" CDC 4 (rx_logic_gth) VERIFICATION REPORT (312.5 MHz OUTPUT)");
        $display(" -> Total Header Bytes Emitted (4 x 16B)    : %0d / 64", hdr_cnt);
        $display(" -> Total Payload Words Emitted (4 x 478W)  : %0d / 1912 (%0d Bytes)", pld_cnt, pld_cnt * 4);
        $display(" -> Extracted ASCII Tag (Frame 1)           : \"%s\"", cdc4_ASCII_TAG);
        $display(" -> Extracted Ethernet FCS (Frame 2)        : 0x%08X (Expected: 0xDEADBEEF)", cdc4_ETH_FCS);
        $display(" -> Extracted IEEE-754 Range (Frame 4 MGMT) : 0x%016X (Expected: 0x415312D000000000)", cdc4_MGMT_RANGE);
        if (hdr_cnt == 64 && pld_cnt == 1912 && cdc4_ETH_FCS == 32'hDEAD_BEEF &&
            cdc4_MGMT_RANGE == 64'h4153_12D0_0000_0000)
            $display(" -> RESULT: [PASS] 100%% COMPLIANT WITH TARGET B4.2 & TABLE 2-14!");
        $display("======================================================================\n");
        $finish;
    end

endmodule