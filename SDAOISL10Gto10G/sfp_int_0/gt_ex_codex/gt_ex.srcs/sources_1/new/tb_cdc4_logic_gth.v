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
  - Rev 2.1 (2026-11-02 21:45 KST) : [Waveform Counter Synchronization for ETRI Handover]
    1. Initialized input loop trackers ('f' and 'c') to 0 at t=0 to eliminate 
       pre-stimulus 'X' states, synchronized 'c' to count strictly 1..239 aligned 
       with 'en_load' (returning to 0 during inter-frame gaps instead of holding 240), 
       and added explicit 200 MHz input counters ('in_hdr_byte_cnt' 1..16, 
       'in_pld_word_cnt' 1..239, and 'in_pld_byte_cnt' 8..1912).
    2. Eliminated the 1-cycle register lag on 'hdr_cnt' and 'pld_cnt' so both 
       counters align on the exact rising clock edge with 'out_hdr_byte_cnt' (1..16) 
       and 'out_pld_word_cnt' (1..478).
    3. Synchronized 'out_pld_total_bytes' to count active 32-bit output payload bytes 
       (4..1912 Bytes per frame) and 'cdc4_frame_id' (1..4) strictly within the 
       active 'header_dv'/'payload_dv' window, returning to 0 immediately after the 
       478th word (1,912th byte).
    4. Sampled output field trackers ('cdc4_TXFN', 'cdc4_ETH_FCS', 'cdc4_MGMT_RANGE', 
       and 'cdc4_ASCII_TAG') directly from the C_PRELOAD_LATENCY=2 aligned output 
       ports ('header_out' and 'payload_out').
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

    // =======================================================
    // 1. INPUT & OUTPUT WAVEFORM COUNTERS (200 MHz & 312.5 MHz)
    // =======================================================
    // [Rev 2.1] Initialized to 0 at t=0 and aligned strictly with active en_load (1..239, then 0)
    integer f = 0;
    integer c = 0;
    integer f_loop = 0;
    integer c_loop = 0;

    wire [4:0]  in_hdr_byte_cnt = en_head ? c[4:0] : 5'd0;              // 1..16 Bytes @ 200 MHz
    wire [8:0]  in_pld_word_cnt = en_load ? c[8:0] : 9'd0;              // 1..239 Words @ 200 MHz
    wire [11:0] in_pld_byte_cnt = en_load ? (c[11:0] * 12'd8) : 12'd0;  // 8..1912 Bytes @ 200 MHz

    // Hierarchical Probes & Port-Aligned Counters from rx_logic_gth.v (312.5 MHz)
    wire [4:0]  out_hdr_byte_cnt = u_cdc4.out_hdr_byte_cnt;             // 1..16 Bytes @ 312.5 MHz
    wire [8:0]  out_pld_word_cnt = u_cdc4.out_pld_word_cnt;             // 1..478 Words @ 312.5 MHz

    // [Rev 2.1] Exact active byte counter (4..1912 Bytes per frame, resets to 0 when payload_dv == 0)
    wire [15:0] out_pld_total_bytes = payload_dv ? ({5'd0, out_pld_word_cnt, 2'b00}) : 16'd0;

    // [Rev 2.1] Frame ID tracker strictly bounded by active output window (1..4 during frame, 0 in gap)
    reg  [31:0] out_frame_seq = 32'd0;
    reg         payload_dv_d1 = 1'b0;
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            out_frame_seq <= 32'd0;
            payload_dv_d1 <= 1'b0;
        end else begin
            payload_dv_d1 <= payload_dv;
            if (payload_dv && !payload_dv_d1)
                out_frame_seq <= out_frame_seq + 32'd1;
        end
    end
    wire [31:0] cdc4_frame_id = (header_dv || payload_dv) ?
                                ((payload_dv && !payload_dv_d1) ? (out_frame_seq + 32'd1) : out_frame_seq) :
                                32'd0;

    // [Rev 2.1] Port-Aligned SDA OISL Field Extractors (Sampled from header_out & payload_out)
    reg  [7:0]  hdr_rx_buf [0:15];
    reg  [15:0] cdc4_TXFN        = 16'd0;
    reg  [1:0]  cdc4_FRAME_TYPE  = 2'd0;
    reg  [15:0] cdc4_HDR_CRC16   = 16'd0;
    reg  [31:0] cdc4_FSO_PLD_HDR = 32'd0;
    reg  [31:0] cdc4_FSO_PKT_HDR = 32'd0;
    reg  [95:0] cdc4_ASCII_TAG   = 96'd0;
    reg  [31:0] cdc4_ETH_FCS     = 32'd0;
    reg  [63:0] cdc4_MGMT_RANGE  = 64'd0;
    reg  [31:0] cdc4_PLD_CRC32   = 32'd0;
    reg  [3:0]  mgmt_lo4_lat     = 4'd0;
    reg  [31:0] mgmt_mid32_lat   = 32'd0;

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            cdc4_TXFN        <= 16'd0;
            cdc4_FRAME_TYPE  <= 2'd0;
            cdc4_HDR_CRC16   <= 16'd0;
            cdc4_FSO_PLD_HDR <= 32'd0;
            cdc4_FSO_PKT_HDR <= 32'd0;
            cdc4_ASCII_TAG   <= 96'd0;
            cdc4_ETH_FCS     <= 32'd0;
            cdc4_MGMT_RANGE  <= 64'd0;
            cdc4_PLD_CRC32   <= 32'd0;
            mgmt_lo4_lat     <= 4'd0;
            mgmt_mid32_lat   <= 32'd0;
        end else begin
            if (header_dv) begin
                hdr_rx_buf[out_hdr_byte_cnt - 5'd1] <= header_out;
                case (out_hdr_byte_cnt)
                    5'd2:  cdc4_TXFN       <= {header_out, hdr_rx_buf[0]};
                    5'd5:  cdc4_FRAME_TYPE <= header_out[1:0];
                    5'd16: cdc4_HDR_CRC16  <= {hdr_rx_buf[14], header_out};
                endcase
            end

            if (payload_dv) begin
                if (out_pld_word_cnt == 9'd1) cdc4_FSO_PLD_HDR <= payload_out;
                if (out_pld_word_cnt == 9'd2) cdc4_FSO_PKT_HDR <= payload_out;

                if (out_pld_word_cnt == 9'd13 && cdc4_TXFN == 16'd1)
                    cdc4_ASCII_TAG[95:64] <= payload_out;
                if (out_pld_word_cnt == 9'd14 && cdc4_TXFN == 16'd1)
                    cdc4_ASCII_TAG[63:32] <= payload_out;
                if (out_pld_word_cnt == 9'd15 && cdc4_TXFN == 16'd1)
                    cdc4_ASCII_TAG[31:0]  <= payload_out;

                if ((out_pld_word_cnt == 9'd26 || out_pld_word_cnt == 9'd27) &&
                    (cdc4_TXFN == 16'd2) && (payload_out == 32'hDEAD_BEEF))
                    cdc4_ETH_FCS <= payload_out;

                if (out_pld_word_cnt == 9'd3)
                    mgmt_lo4_lat <= payload_out[31:28];
                if (out_pld_word_cnt == 9'd4)
                    mgmt_mid32_lat <= payload_out;
                if (out_pld_word_cnt == 9'd5 && cdc4_FRAME_TYPE == 2'b10)
                    cdc4_MGMT_RANGE <= {payload_out[27:0], mgmt_mid32_lat, mgmt_lo4_lat};

                if (out_pld_word_cnt == 9'd478)
                    cdc4_PLD_CRC32 <= payload_out;
            end
        end
    end

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

    // [Rev 2.1] Zero-lag cumulative counters (aligned on the same clock edge as out_hdr_byte_cnt & out_pld_word_cnt)
    integer r_hdr_cnt = 0;
    integer r_pld_cnt = 0;
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            r_hdr_cnt <= 0;
            r_pld_cnt <= 0;
        end else begin
            if (header_dv)  r_hdr_cnt <= r_hdr_cnt + 1;
            if (payload_dv) r_pld_cnt <= r_pld_cnt + 1;
        end
    end
    wire [31:0] hdr_cnt = r_hdr_cnt + (header_dv  ? 32'd1 : 32'd0);
    wire [31:0] pld_cnt = r_pld_cnt + (payload_dv ? 32'd1 : 32'd0);

    // Table 2-14 LSB-Packed Telemetry Vector (Matches mgmt_telemetry_generator.v)
    wire [255:0] mgmt_vec = {
        27'd0, 1'b1, 40'd0, 32'd1476000000,
        64'h4153_12D0_0000_0000, 40'd0, 6'd15,
        40'd16678204759, 6'd15
    };

    initial begin
        rst_n      = 1'b0;
        en_head    = 1'b0;
        en_load    = 1'b0;
        header_in  = 8'd0;
        payload_in = 64'd0;
        f          = 0;
        c          = 0;
        #100;
        rst_n      = 1'b1;

        wait(!u_cdc4.head_rd_rst_busy && !u_cdc4.load_rd_rst_busy);
        repeat (10) @(posedge clk_logic);

        for (f_loop = 1; f_loop <= 4; f_loop = f_loop + 1) begin
            for (c_loop = 1; c_loop <= 239; c_loop = c_loop + 1) begin
                @(posedge clk_logic);
                f <= f_loop;
                c <= c_loop;

                if (c_loop <= 16) begin
                    en_head   <= 1'b1;
                    case (c_loop)
                        1:  header_in <= f_loop[7:0];  // d0: TXFN[7:0]
                        2:  header_in <= 8'h00;        // d1: TXFN[15:8]
                        3:  header_in <= 8'h00;        // d2: RXFN[7:0]
                        4:  header_in <= 8'h00;        // d3: RXFN[15:8]
                        5:  header_in <= (f_loop == 3) ? 8'hF0 : (f_loop == 4) ? 8'hF2 : 8'hFD;
                        15: header_in <= 8'h0F;        // d14: CRC-16 MSB
                        16: header_in <= 8'h28;        // d15: CRC-16 LSB
                        default: header_in <= 8'h55;
                    endcase
                end else begin
                    en_head   <= 1'b0;
                    header_in <= 8'd0;
                end

                en_load <= 1'b1;
                if (f_loop == 1) begin
                    if      (c_loop == 1)   payload_in <= 64'hAB00_0000_CDEF_07D0;
                    else if (c_loop == 7)   payload_in <= 64'h4B6F_6F6B_6D69_6E20; // "Kookmin "
                    else if (c_loop == 8)   payload_in <= 64'h4653_4F20_AAAA_000E; // "FSO "
                    else if (c_loop == 239) payload_in <= 64'hAAAA_01DC_C320_0001;
                    else                    payload_in <= {32'hAAAA_0000 + c_loop[31:0], 32'hBBBB_0000 + c_loop[31:0]};
                end else if (f_loop == 2) begin
                    if      (c_loop == 1)   payload_in <= 64'hAB00_4064_AAAA_0001; // Table 2-18 Continuation (Len=100B)
                    else if (c_loop == 13)  payload_in <= 64'hAAAA_0018_DEAD_BEEF; // 100th Byte Eth FCS at Word 26
                    else if (c_loop == 239) payload_in <= 64'h0000_0000_C320_0002;
                    else if (c_loop > 13)   payload_in <= 64'd0;                   // 1804B Zero Padding
                    else                    payload_in <= 64'hAAAA_0000_AAAA_0000;
                end else if (f_loop == 3) begin
                    if      (c_loop == 239) payload_in <= 64'h1D1E_1D1E_C320_0003;
                    else                    payload_in <= 64'h1D1E_1D1E_1D1E_1D1E;
                end else begin
                    if      (c_loop == 1)   payload_in <= {mgmt_vec[31:0],   mgmt_vec[63:32]};
                    else if (c_loop == 2)   payload_in <= {mgmt_vec[95:64],  mgmt_vec[127:96]};
                    else if (c_loop == 3)   payload_in <= {mgmt_vec[159:128],mgmt_vec[191:160]};
                    else if (c_loop == 4)   payload_in <= {mgmt_vec[223:192],mgmt_vec[255:224]};
                    else if (c_loop == 239) payload_in <= 64'h0000_0000_C320_0004;
                    else                    payload_in <= 64'd0;
                end
            end

            @(posedge clk_logic);
            en_head    <= 1'b0;
            en_load    <= 1'b0;
            header_in  <= 8'd0;
            payload_in <= 64'd0;
            f          <= 0;
            c          <= 0;

            repeat (260) @(posedge clk_logic);
        end

        wait(r_hdr_cnt == 64 && r_pld_cnt == 1912);
        wait(cdc4_frame_id == 32'd0);
        #200;

        $display("\n======================================================================");
        $display(" CDC 4 (rx_logic_gth) VERIFICATION REPORT (312.5 MHz OUTPUT)");
        $display(" -> Total Header Bytes Emitted (4 x 16B)    : %0d / 64", r_hdr_cnt);
        $display(" -> Total Payload Words Emitted (4 x 478W)  : %0d / 1912 (%0d Bytes)", r_pld_cnt, r_pld_cnt * 4);
        $display(" -> Extracted ASCII Tag (Frame 1)           : \"%s\"", cdc4_ASCII_TAG);
        $display(" -> Extracted Ethernet FCS (Frame 2)        : 0x%08X (Expected: 0xDEADBEEF)", cdc4_ETH_FCS);
        $display(" -> Extracted IEEE-754 Range (Frame 4 MGMT) : 0x%016X (Expected: 0x415312D000000000)", cdc4_MGMT_RANGE);
        if (r_hdr_cnt == 64 && r_pld_cnt == 1912 && cdc4_ETH_FCS == 32'hDEAD_BEEF &&
            cdc4_MGMT_RANGE == 64'h4153_12D0_0000_0000)
            $display(" -> RESULT: [PASS] 100%% COMPLIANT WITH TARGET B4.2 & TABLE 2-14!");
        $display("======================================================================\n");
        $finish;
    end

endmodule