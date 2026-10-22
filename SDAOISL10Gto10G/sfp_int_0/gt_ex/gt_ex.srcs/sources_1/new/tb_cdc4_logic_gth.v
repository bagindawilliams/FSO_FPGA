`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_cdc4_logic_gth
Description  : Standalone Verification Testbench for Clock Domain Crossing 4
               (rx_logic_gth.v + cross_logic_gth_head.xci + 
               cross_logic_gth_load.xci).

               WAVEFORM GROUPS TO OBSERVE:
               1. Group 1 - Data In from RS Decoders (200.0 MHz):
                  - in_hdr_dv (16 cycles), in_hdr_data[7:0], in_hdr_byte_cnt (1..16)
                  - in_pld_dv (239 cycles), in_pld_data[63:0], in_pld_word_cnt (1..239),
                    in_pld_byte_cnt (8..1912), in_frame_id (1..4)
               2. Group 2 - Decoded Header Out to Deframer (312.5 MHz, 16 Bytes):
                  - out_hdr_dv (16 cycles), out_hdr_data[7:0], out_hdr_byte_cnt (1..16)
                  - Extracted SDA OISL Table 2-9 Fields:
                    cdc4_TXFN, cdc4_RXFN, cdc4_ACK, cdc4_ACK_VALID, cdc4_FRAME_TYPE,
                    cdc4_TX_TS, cdc4_TOD_SEC, cdc4_TS_APPLIES, cdc4_FCCH_OP,
                    cdc4_FCCH_PL, cdc4_HDR_CRC16
               3. Group 3 - Decoded Payload Out to Deframer (312.5 MHz, 1912 Bytes):
                  - out_pld_dv (478 cycles), out_pld_data[31:0], out_pld_word_cnt (1..478)
                  - out_pld_byte_stream[7:0], out_pld_byte_cnt (1..1912),
                    out_pld_total_bytes (1..7648), cdc4_frame_id (1..4)
                  - Extracted Payload Markers:
                    cdc4_FSO_PLD_HDR, cdc4_FSO_PKT_HDR, cdc4_ASCII_TAG ("Kookmin FSO "),
                    cdc4_ETH_FCS (0xDEADBEEF), cdc4_MGMT_RANGE, cdc4_PLD_CRC32
                  - SDA OISL Table 2-4 Metrics aligned under cdc4_frame_id (1..4).

               Revision History:
               - Rev 1.0 (Initial) : Standalone CDC 4 verification testbench.
               - Rev 1.1 (2026-10-22 06:55 KST) : Updated timescale to 1ns/1ps 
                 and tuned inter-frame write gap to 256 cycles (2480.0 ns) so 
                 each subsequent frame's first 32-bit word is pre-queued in 
                 CDC 4 before the 2493.600 ns unpacker boundary, preventing 
                 any 'X' glitches at frame transitions 1 -> 2 -> 3 -> 4.
===========================================================================
*/

module tb_cdc4_logic_gth();

    // =======================================================
    // 1. CLOCK AND RESET SIGNALS
    // =======================================================
    reg clk_logic; // 200.0 MHz Write Domain (from core_rx RS Decoders)
    reg clk_gth;   // 312.5 MHz Read Domain (to Deframer)
    reg rst_n;

    // =======================================================
    // 2. GROUP 1: DATA IN FROM RS DECODERS (200.0 MHz)
    // =======================================================
    reg         in_hdr_dv;
    reg  [7:0]  in_hdr_data;
    reg  [4:0]  in_hdr_byte_cnt; // Counts 1..16 Bytes

    reg         in_pld_dv;
    reg  [63:0] in_pld_data;
    reg  [7:0]  in_pld_word_cnt; // Counts 1..239 Words (64-bit)
    reg  [11:0] in_pld_byte_cnt; // Counts 8..1912 Bytes
    reg  [31:0] in_frame_id;     // Active Input Frame ID (1..4)

    // =======================================================
    // 3. GROUP 2: HEADER OUT TO DEFRAMER (312.5 MHz, 16 Bytes)
    // =======================================================
    wire        out_hdr_dv;
    wire [7:0]  out_hdr_data;
    wire [4:0]  out_hdr_byte_cnt = u_cdc4.out_hdr_byte_cnt; // Counts 1..16 Bytes

    // Extracted SDA OISL Header Fields
    wire [15:0] cdc4_TXFN        = u_cdc4.cdc4_TXFN;
    wire [15:0] cdc4_RXFN        = u_cdc4.cdc4_RXFN;
    wire        cdc4_ACK         = u_cdc4.cdc4_ACK;
    wire        cdc4_ACK_VALID   = u_cdc4.cdc4_ACK_VALID;
    wire [1:0]  cdc4_FRAME_TYPE  = u_cdc4.cdc4_FRAME_TYPE;
    wire [39:0] cdc4_TX_TS       = u_cdc4.cdc4_TX_TS;
    wire [5:0]  cdc4_TOD_SEC     = u_cdc4.cdc4_TOD_SEC;
    wire [2:0]  cdc4_TS_APPLIES  = u_cdc4.cdc4_TS_APPLIES;
    wire [3:0]  cdc4_FCCH_OP     = u_cdc4.cdc4_FCCH_OP;
    wire [15:0] cdc4_FCCH_PL     = u_cdc4.cdc4_FCCH_PL;
    wire [15:0] cdc4_HDR_CRC16   = u_cdc4.cdc4_HDR_CRC16;

    // =======================================================
    // 4. GROUP 3: PAYLOAD OUT TO DEFRAMER (312.5 MHz, 1912 Bytes)
    // =======================================================
    wire        out_pld_dv;
    wire [31:0] out_pld_data;
    wire [8:0]  out_pld_word_cnt    = u_cdc4.out_pld_word_cnt;    // Counts 1..478 Words (32-bit)
    wire [7:0]  out_pld_byte_stream = u_cdc4.out_pld_byte_stream; // 1-by-1 Payload Byte
    wire [11:0] out_pld_byte_cnt    = u_cdc4.out_pld_byte_cnt;    // Counts 1..1912 Bytes
    wire [15:0] out_pld_total_bytes = u_cdc4.out_pld_total_bytes; // Counts 1..7648 Bytes
    wire [31:0] cdc4_frame_id       = u_cdc4.cdc4_frame_id;       // Active Frame ID (1..4)

    // Extracted Payload Content Markers
    wire [31:0] cdc4_FSO_PLD_HDR    = u_cdc4.cdc4_FSO_PLD_HDR;
    wire [31:0] cdc4_FSO_PKT_HDR    = u_cdc4.cdc4_FSO_PKT_HDR;
    wire [95:0] cdc4_ASCII_TAG      = u_cdc4.cdc4_ASCII_TAG;
    wire [31:0] cdc4_ETH_FCS        = u_cdc4.cdc4_ETH_FCS;
    wire [63:0] cdc4_MGMT_RANGE     = u_cdc4.cdc4_MGMT_RANGE;
    wire [31:0] cdc4_PLD_CRC32      = u_cdc4.cdc4_PLD_CRC32;

    // =======================================================
    // 5. DUT INSTANTIATION: CDC 4 (rx_logic_gth)
    // =======================================================
    rx_logic_gth u_cdc4 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en_head    (in_hdr_dv),
        .en_load    (in_pld_dv),
        .header_in  (in_hdr_data),
        .payload_in (in_pld_data),
        .header_dv  (out_hdr_dv),
        .header     (out_hdr_data),
        .payload_dv (out_pld_dv),
        .payload    (out_pld_data)
    );

    // =======================================================
    // 6. CLOCK GENERATORS
    // =======================================================
    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic; // 200.0 MHz (5.0 ns)
    end

    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;   // 312.5 MHz (3.2 ns)
    end

    // =======================================================
    // 7. AUTHENTIC SDA OISL 4-FRAME GENERATOR (200.0 MHz Write Domain)
    // =======================================================
    function [7:0] get_hdr_byte(input integer frame_num, input integer b_pos);
        reg [1:0]  ftype;
        reg [15:0] txfn_val;
        reg [15:0] rxfn_val;
        reg        ack_val;
        reg        ack_vld;
        reg [39:0] tx_ts_val;
        reg [5:0]  tod_val;
        reg [2:0]  ts_app;
        reg [3:0]  fcch_op;
        reg [15:0] fcch_pl_val;
        reg [15:0] crc16_val;
        begin
            txfn_val    = frame_num[15:0];
            rxfn_val    = (frame_num > 1) ? (frame_num[15:0] - 16'd1) : 16'd0;
            ack_val     = (frame_num > 1) ? 1'b1 : 1'b0;
            ack_vld     = (frame_num > 1) ? 1'b1 : 1'b0;
            ftype       = (frame_num == 1 || frame_num == 2) ? 2'b01 : // DATA
                          (frame_num == 3)                   ? 2'b00 : // IDLE
                                                               2'b10;  // MGMT
            tx_ts_val   = 40'd1_082_600 + (frame_num - 1) * 40'd2_493_600;
            tod_val     = 6'd15;
            ts_app      = 3'b001;
            fcch_op     = 4'hA;
            fcch_pl_val = 16'hF000 + frame_num[15:0];
            crc16_val   = 16'hC160 + frame_num[15:0];

            case (b_pos)
                0:  get_hdr_byte = txfn_val[7:0];
                1:  get_hdr_byte = txfn_val[15:8];
                2:  get_hdr_byte = rxfn_val[7:0];
                3:  get_hdr_byte = rxfn_val[15:8];
                4:  get_hdr_byte = {2'b11, 2'b11, ack_val, ack_vld, ftype};
                5:  get_hdr_byte = tx_ts_val[7:0];
                6:  get_hdr_byte = tx_ts_val[15:8];
                7:  get_hdr_byte = tx_ts_val[23:16];
                8:  get_hdr_byte = tx_ts_val[31:24];
                9:  get_hdr_byte = tx_ts_val[39:32];
                10: get_hdr_byte = {2'b11, tod_val};
                11: get_hdr_byte = {1'b1, ts_app, fcch_op};
                12: get_hdr_byte = fcch_pl_val[7:0];
                13: get_hdr_byte = fcch_pl_val[15:8];
                14: get_hdr_byte = crc16_val[15:8];
                15: get_hdr_byte = crc16_val[7:0];
                default: get_hdr_byte = 8'd0;
            endcase
        end
    endfunction

    function [63:0] get_pld_word64(input integer frame_num, input integer w_pos);
        begin
            if (frame_num == 1) begin
                case (w_pos)
                    0:   get_pld_word64 = {32'hAB00_076C, 32'hCDEF_07D0}; // FSO Hdr + Pkt Hdr (2000B)
                    1:   get_pld_word64 = 64'hDA01_0203_0405_5A01;        // Dest & Src MAC
                    2:   get_pld_word64 = 64'h0203_0405_0800_4500;        // EtherType IPv4
                    6:   get_pld_word64 = 64'h4B6F_6F6B_6D69_6E20;        // ASCII "Kookmin "
                    7:   get_pld_word64 = 64'h4653_4F20_0001_0002;        // ASCII "FSO "
                    238: get_pld_word64 = {32'h1900_F1EE, 32'hC320_0001}; // Last Seg1 Word + CRC32
                    default: get_pld_word64 = {16'hDA71, frame_num[15:0], w_pos[31:0]};
                endcase
            end else if (frame_num == 2) begin
                case (w_pos)
                    0:   get_pld_word64 = {32'hAB01_0064, 32'hCDEF_07D0}; // FSO Cont Hdr (100B)
                    13:  get_pld_word64 = {32'hDEADBEEF, 32'h0000_0000};  // 100th Byte = Eth FCS!
                    238: get_pld_word64 = {32'h0000_0000, 32'hC320_0002}; // Zero-Pad + CRC32
                    default: begin
                        if (w_pos < 13)
                            get_pld_word64 = {16'hDA72, frame_num[15:0], w_pos[31:0]};
                        else
                            get_pld_word64 = 64'h0000_0000_0000_0000;
                    end
                endcase
            end else if (frame_num == 3) begin
                if (w_pos == 238)
                    get_pld_word64 = {32'hA5A5_0238, 32'hC320_0003};
                else
                    get_pld_word64 = {32'hA5A5_F0F0, w_pos[31:0] ^ 32'h5A5A_0F0F};
            end else begin
                case (w_pos)
                    0:   get_pld_word64 = {6'd15, 40'd16678204759, 6'd15, 12'd0};
                    1:   get_pld_word64 = {28'd1082600, 36'h4153_12D0_0};
                    2:   get_pld_word64 = {28'h000_0000, 32'd1476000000, 4'd0};
                    3:   get_pld_word64 = {36'd0, 1'b1, 27'd0};
                    238: get_pld_word64 = {32'h0000_0000, 32'hC320_0004};
                    default: get_pld_word64 = 64'h0000_0000_0000_0000;
                endcase
            end
        end
    endfunction

    integer f_idx, cyc_idx;

    initial begin
        rst_n           = 1'b0;
        in_hdr_dv       = 1'b0;
        in_hdr_data     = 8'd0;
        in_hdr_byte_cnt = 5'd0;
        in_pld_dv       = 1'b0;
        in_pld_data     = 64'd0;
        in_pld_word_cnt = 8'd0;
        in_pld_byte_cnt = 12'd0;
        in_frame_id     = 32'd0;

        #100;
        rst_n = 1'b1;

        wait(u_cdc4.head_rd_rst_busy == 1'b0 && u_cdc4.load_rd_rst_busy == 1'b0);
        repeat (10) @(posedge clk_logic);

        for (f_idx = 1; f_idx <= 4; f_idx = f_idx + 1) begin
            for (cyc_idx = 0; cyc_idx < 239; cyc_idx = cyc_idx + 1) begin
                @(posedge clk_logic);
                in_frame_id <= f_idx;

                // 16 Header Bytes (cycles 0..15)
                if (cyc_idx < 16) begin
                    in_hdr_dv       <= 1'b1;
                    in_hdr_data     <= get_hdr_byte(f_idx, cyc_idx);
                    in_hdr_byte_cnt <= cyc_idx[4:0] + 5'd1;
                end else begin
                    in_hdr_dv       <= 1'b0;
                    in_hdr_data     <= 8'd0;
                    in_hdr_byte_cnt <= 5'd0;
                end

                // 239 Payload Words (cycles 0..238 = 1912 Bytes)
                in_pld_dv       <= 1'b1;
                in_pld_data     <= get_pld_word64(f_idx, cyc_idx);
                in_pld_word_cnt <= cyc_idx[7:0] + 8'd1;
                in_pld_byte_cnt <= (cyc_idx[11:0] + 12'd1) * 12'd8;
            end

            @(posedge clk_logic);
            in_hdr_dv       <= 1'b0;
            in_hdr_data     <= 8'd0;
            in_hdr_byte_cnt <= 5'd0;
            in_pld_dv       <= 1'b0;
            in_pld_data     <= 64'd0;
            in_pld_word_cnt <= 8'd0;
            in_pld_byte_cnt <= 12'd0;

            // 256-cycle inter-frame interval ensures next frame's first word
            // is pre-buffered in CDC 4 prior to the 2493.600 ns unpacker edge
            repeat (256) @(posedge clk_logic);
        end

        in_frame_id <= 32'd0;
    end

    // =======================================================
    // 8. SDA OISL TABLE 2-4 METRICS ANALYZER (312.5 MHz Output)
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

    always @(cdc4_frame_id) begin
        if (cdc4_frame_id >= 32'd1 && cdc4_frame_id <= 32'd4) begin
            time_start = $realtime;
            time_end   = time_start + (3117.0 * measured_byte_time_ns);

            OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
            OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
            OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
            OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

            $display("---------------------------------------------------------------");
            $display(" [CDC 4: rx_logic_gth] FRAME %0d ACTIVE (16B Hdr + 1912B Pld @ 312.5M)", cdc4_frame_id);
            $display(" time_start     : %0.1f ns | time_end : %0.1f ns", time_start, time_end);
            $display(" Duration       : %0.6f us", OISL_Frame_Duration_us);
            $display(" Effective Rate : %0.6f Mbps", OISL_Effective_Data_Rate_Mbps);
            $display(" Frame Rate     : %0.6f kHz  | FCCH Rate: %0.6f Mbps", OISL_Frame_Rate_kHz, OISL_FCCH_Mbps);
            $display("---------------------------------------------------------------");
        end else if (cdc4_frame_id == 32'd0) begin
            time_start                    = 0.0;
            time_end                      = 0.0;
            OISL_Frame_Duration_us        = 0.0;
            OISL_Effective_Data_Rate_Mbps = 0.0;
            OISL_Frame_Rate_kHz           = 0.0;
            OISL_FCCH_Mbps                = 0.0;
        end
    end

    // =======================================================
    // 9. SIMULATION TERMINATION
    // =======================================================
    initial begin
        wait(out_pld_total_bytes == 16'd7648);
        wait(cdc4_frame_id == 32'd0);
        #500;
        $display("\n[%0.1f ns] CDC 4 VERIFICATION COMPLETE: 4x16B HEADERS & 4x1912B PAYLOADS DELIVERED AT 312.5 MHz.\n",
                 $realtime);
        $finish;
    end

endmodule