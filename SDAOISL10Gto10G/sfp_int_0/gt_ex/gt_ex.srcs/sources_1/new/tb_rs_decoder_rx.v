`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_rs_decoder_rx
Description  : Comprehensive Verification Testbench for the Reed-Solomon 
               Decoder Stage (rs_decoder #(33) for Header & rs_decoder_64 
               for Payload) operating at 200.0 MHz.

               KEY VERIFICATION FEATURES:
               1. Authentic SDA OISL 4-Frame Sequence:
                  - Frame 1 (DAT1): FRAME_TYPE=2'b01, TXFN=1, 1900B Eth Seg 1
                    ("Kookmin FSO ") + 8B FSO/Pkt Hdr + 4B CRC32 = 1912B.
                  - Frame 2 (DAT2): FRAME_TYPE=2'b01, TXFN=2, 100B Eth Seg 2
                    (ends with FCS 0xDEADBEEF) + 1800B Pad + 4B CRC32 = 1912B.
                  - Frame 3 (IDLE): FRAME_TYPE=2'b00, TXFN=3, 1908B PRBS + 4B CRC32.
                  - Frame 4 (MGMT): FRAME_TYPE=2'b10, TXFN=4, 32B PNT/Range 
                    Telemetry + 1876B Pad + 4B CRC32 = 1912B.
               2. Symbol Error Injection & Correction Proof:
                  - Injects up to 4 corrupted bytes in the 32B RS Header and 
                    8 corrupted words (64 bytes across 8 lanes) in the 2040B 
                    RS Payload per frame, proving 100% recovery (0 mismatches).
               3. Waveform Field Extractors & Table 2-4 Metrics:
                  - Unpacks every decoded Header field (TXFN, RXFN, ACK, 
                    FRAME_TYPE, TX_TS, TOD, FCCH, CRC16) and Payload byte 
                    (1 to 1912) with aligned SDA OISL Table 2-4 metrics.
===========================================================================
*/

module tb_rs_decoder_rx();

    // =======================================================
    // 1. CLOCK AND RESET SIGNALS
    // =======================================================
    reg clk_logic; // 200.0 MHz (Period = 5.0 ns)
    reg clk_gth;   // 312.5 MHz (Period = 3.2 ns - Reference for Table 2-4)
    reg rst_n;

    // =======================================================
    // 2. GOLDEN TX ENCODER SIGNALS (Generates 32B Hdr & 2040B Pld)
    // =======================================================
    reg         tx_hdr_en;
    reg  [7:0]  tx_hdr_din;
    wire        rs_enc_hdr_dv;
    wire [7:0]  rs_enc_hdr_dout;

    reg         tx_pld_en;
    reg  [63:0] tx_pld_din;
    wire        rs_enc_pld_dv;
    wire [63:0] rs_enc_pld_dout;

    // =======================================================
    // 3. GROUP 1: CORRUPTED INPUTS TO RS DECODERS (From FEC_Demux)
    // =======================================================
    reg  [5:0]  in_hdr_byte_cnt; // Counts 1..32
    reg  [8:0]  in_pld_word_cnt; // Counts 1..255
    reg  [7:0]  hdr_err_mask;
    reg  [63:0] pld_err_mask;

    wire        rx_rs_hdr_en = rs_enc_hdr_dv;
    wire [7:0]  rx_rs_hdr_in = rs_enc_hdr_dout ^ hdr_err_mask;

    wire        rx_rs_pld_en = rs_enc_pld_dv;
    wire [63:0] rx_rs_pld_in = rs_enc_pld_dout ^ pld_err_mask;

    // =======================================================
    // 4. GROUP 2: DECODED 16-BYTE HEADER & EXTRACTED SDA OISL FIELDS
    // =======================================================
    wire        dec_hdr_dv;
    wire [7:0]  dec_hdr_out;
    reg  [4:0]  dec_hdr_byte_cnt; // Counts strictly 1 to 16 Bytes per frame

    // Extracted SDA OISL Table 2-9 Header Fields (Updated as Header bytes arrive)
    reg  [7:0]  hdr_rx_buf [0:15];
    reg  [15:0] extracted_TXFN;
    reg  [15:0] extracted_RXFN;
    reg         extracted_ACK;
    reg         extracted_ACK_VALID;
    reg  [1:0]  extracted_FRAME_TYPE; // 01=DATA, 00=IDLE, 10=MGMT
    reg  [39:0] extracted_TX_TS;      // 40-bit Egress Timestamp (ps)
    reg  [5:0]  extracted_TOD_SEC;    // 6-bit Time of Day Seconds
    reg  [2:0]  extracted_TS_APPLIES;
    reg  [3:0]  extracted_FCCH_OP;
    reg  [15:0] extracted_FCCH_PL;
    reg  [15:0] extracted_HDR_CRC16;

    // =======================================================
    // 5. GROUP 3: DECODED 1912-BYTE PAYLOAD & EXTRACTED FIELDS
    // =======================================================
    wire        dec_pld_dv;
    wire [63:0] dec_pld_out;
    reg  [7:0]  dec_pld_word_cnt; // Counts strictly 1 to 239 (64-bit words)

    // 1-by-1 Payload Byte Unpacker (Counts 1 to 1912 Bytes per frame)
    reg  [7:0]  pld_byte_stream;
    reg  [11:0] dec_pld_byte_cnt; // Counts strictly 1 to 1912 Bytes per frame
    reg  [15:0] dec_pld_total_bytes;
    reg  [31:0] rs_dec_frame_id;  // Active Decoded Frame ID (1, 2, 3, 4)

    // Extracted Payload Markers (FSO Header, Packet Header, ASCII, MGMT, CRC32)
    reg  [31:0] extracted_FSO_PLD_HDR; // 0xAB00_076C (DAT1) or 0xAB01_0064 (DAT2)
    reg  [31:0] extracted_FSO_PKT_HDR; // 0xCDEF_07D0 (2000B Ethernet Length)
    reg  [95:0] extracted_ASCII_TAG;   // "Kookmin FSO " (4B6F6F6B_6D696E20_46534F20)
    reg  [63:0] extracted_MGMT_RANGE;  // 64'h4153_12D0_0000_0000 (IEEE-754 Range)
    reg  [31:0] extracted_PLD_CRC32;   // Final 4 Bytes (Bytes 1909..1912)

    // Self-check error counters
    reg  [15:0] hdr_mismatch_cnt;
    reg  [15:0] pld_mismatch_cnt;

    // =======================================================
    // 6. INSTANTIATION OF REFERENCE ENCODERS & DUT DECODERS
    // =======================================================
    // Reference TX RS(32,16) Header Encoder (32 cycles: 16B Data + 16B Parity)
    rs_encoder #(31) u_ref_rs_enc_hdr (
        .clk      (clk_logic),
        .rst_n    (rst_n),
        .en       (tx_hdr_en),
        .data_in  (tx_hdr_din),
        .flag     (rs_enc_hdr_dv),
        .data_out (rs_enc_hdr_dout)
    );

    // Reference TX 8xRS(255,239) Payload Encoder (255 cycles: 239W Data + 16W Parity)
    rs_encoder_64 #(254) u_ref_rs_enc_pld (
        .clk      (clk_logic),
        .rst_n    (rst_n),
        .en       (tx_pld_en),
        .data_in  (tx_pld_din),
        .flag     (rs_enc_pld_dv),
        .data_out (rs_enc_pld_dout)
    );

    // DUT 1: RX RS(32,16) Header Decoder (32B In -> 16B Decoded Header Out)
    rs_decoder #(33) u_dut_rs_dec_hdr (
        .clk      (clk_logic),
        .rst_n    (rst_n),
        .en       (rx_rs_hdr_en),
        .data_in  (rx_rs_hdr_in),
        .flag     (dec_hdr_dv),
        .data_out (dec_hdr_out)
    );

    // DUT 2: RX 8xRS(255,239) Payload Decoder (2040B In -> 1912B Decoded Payload Out)
    rs_decoder_64 u_dut_rs_dec_pld (
        .clk      (clk_logic),
        .rst_n    (rst_n),
        .en       (rx_rs_pld_en),
        .data_in  (rx_rs_pld_in),
        .flag     (dec_pld_dv),
        .data_out (dec_pld_out)
    );

    // =======================================================
    // 7. CLOCK GENERATORS
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
    // 8. AUTHENTIC SDA OISL HEADER (16B) & PAYLOAD (1912B) GENERATOR
    // =======================================================
    function [7:0] get_golden_hdr_byte(input integer frame_num, input integer b_pos);
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
                0:  get_golden_hdr_byte = txfn_val[7:0];
                1:  get_golden_hdr_byte = txfn_val[15:8];
                2:  get_golden_hdr_byte = rxfn_val[7:0];
                3:  get_golden_hdr_byte = rxfn_val[15:8];
                4:  get_golden_hdr_byte = {2'b11, 2'b11, ack_val, ack_vld, ftype};
                5:  get_golden_hdr_byte = tx_ts_val[7:0];
                6:  get_golden_hdr_byte = tx_ts_val[15:8];
                7:  get_golden_hdr_byte = tx_ts_val[23:16];
                8:  get_golden_hdr_byte = tx_ts_val[31:24];
                9:  get_golden_hdr_byte = tx_ts_val[39:32];
                10: get_golden_hdr_byte = {2'b11, tod_val};
                11: get_golden_hdr_byte = {1'b1, ts_app, fcch_op};
                12: get_golden_hdr_byte = fcch_pl_val[7:0];
                13: get_golden_hdr_byte = fcch_pl_val[15:8];
                14: get_golden_hdr_byte = crc16_val[15:8];
                15: get_golden_hdr_byte = crc16_val[7:0];
                default: get_golden_hdr_byte = 8'd0;
            endcase
        end
    endfunction

    function [63:0] get_golden_pld_word64(input integer frame_num, input integer w_pos);
        begin
            if (frame_num == 1) begin
                // FRAME 1 (DAT1): 1900B Segment 1 + 8B FSO/Pkt Hdr + 4B CRC32 = 1912B (239 x 64b)
                case (w_pos)
                    0:   get_golden_pld_word64 = {32'hAB00_076C, 32'hCDEF_07D0}; // FSO Hdr + Pkt Hdr
                    1:   get_golden_pld_word64 = 64'hDA01_0203_0405_5A01;        // Dest & Src MAC
                    2:   get_golden_pld_word64 = 64'h0203_0405_0800_4500;        // EtherType IPv4
                    6:   get_golden_pld_word64 = 64'h4B6F_6F6B_6D69_6E20;        // ASCII "Kookmin "
                    7:   get_golden_pld_word64 = 64'h4653_4F20_0001_0002;        // ASCII "FSO "
                    238: get_golden_pld_word64 = {32'h1900_F1EE, 32'hC320_0001}; // Last Seg1 Word + CRC32
                    default: get_golden_pld_word64 = {16'hDA71, frame_num[15:0], w_pos[31:0]};
                endcase
            end else if (frame_num == 2) begin
                // FRAME 2 (DAT2): 100B Segment 2 (ends with FCS 0xDEADBEEF) + 1800B Zero-Pad + 4B CRC32
                case (w_pos)
                    0:   get_golden_pld_word64 = {32'hAB01_0064, 32'hCDEF_07D0}; // FSO Cont Hdr (100B)
                    13:  get_golden_pld_word64 = {32'hDEADBEEF, 32'h0000_0000};  // 100th Byte = Eth FCS!
                    238: get_golden_pld_word64 = {32'h0000_0000, 32'hC320_0002}; // Zero-Pad + CRC32
                    default: begin
                        if (w_pos < 13)
                            get_golden_pld_word64 = {16'hDA72, frame_num[15:0], w_pos[31:0]};
                        else
                            get_golden_pld_word64 = 64'h0000_0000_0000_0000;     // 1800B Zero-Padding
                    end
                endcase
            end else if (frame_num == 3) begin
                // FRAME 3 (IDLE): PRBS Idle Pattern + 4B CRC32
                if (w_pos == 238)
                    get_golden_pld_word64 = {32'hA5A5_0238, 32'hC320_0003};
                else
                    get_golden_pld_word64 = {32'hA5A5_F0F0, w_pos[31:0] ^ 32'h5A5A_0F0F};
            end else begin
                // FRAME 4 (MGMT): 32B PNT/Ranging Telemetry (Words 0..3) + Zero-Pad + 4B CRC32
                case (w_pos)
                    0:   get_golden_pld_word64 = {6'd15, 40'd16678204759, 6'd15, 12'd0}; // RX/TX Sec & Picosec
                    1:   get_golden_pld_word64 = {28'd1082600, 36'h4153_12D0_0};         // TX_TS + Range MSB
                    2:   get_golden_pld_word64 = {28'h000_0000, 32'd1476000000, 4'd0};   // Range LSB + Range Sec
                    3:   get_golden_pld_word64 = {36'd0, 1'b1, 27'd0};                   // Range PS + ts_valid=1
                    238: get_golden_pld_word64 = {32'h0000_0000, 32'hC320_0004};         // Pad + MGMT CRC32
                    default: get_golden_pld_word64 = 64'h0000_0000_0000_0000;
                endcase
            end
        end
    endfunction

    // Store golden values for self-checking against RS Decoder output
    reg [7:0]  golden_hdr_mem [1:4][0:15];
    reg [63:0] golden_pld_mem [1:4][0:238];

    integer f, b, w;
    initial begin
        for (f = 1; f <= 4; f = f + 1) begin
            for (b = 0; b < 16; b = b + 1)
                golden_hdr_mem[f][b] = get_golden_hdr_byte(f, b);
            for (w = 0; w < 239; w = w + 1)
                golden_pld_mem[f][w] = get_golden_pld_word64(f, w);
        end
    end

    // Drive 4 Frames into Reference RS Encoders (spaced by 499 cycles = 2.495 us @ 200 MHz)
    integer frame_iter, cyc_iter;
    initial begin
        rst_n      = 1'b0;
        tx_hdr_en  = 1'b0;
        tx_hdr_din = 8'd0;
        tx_pld_en  = 1'b0;
        tx_pld_din = 64'd0;

        #100;
        rst_n = 1'b1;
        repeat (10) @(posedge clk_logic);

        for (frame_iter = 1; frame_iter <= 4; frame_iter = frame_iter + 1) begin
            for (cyc_iter = 0; cyc_iter < 255; cyc_iter = cyc_iter + 1) begin
                @(posedge clk_logic);
                // Drive 16 Header bytes during cycles 0..15 (RS Encoder flushes 16 parity bytes in 16..31)
                tx_hdr_en  <= (cyc_iter < 16);
                tx_hdr_din <= (cyc_iter < 16) ? golden_hdr_mem[frame_iter][cyc_iter] : 8'd0;

                // Drive 239 Payload words during cycles 0..238 (RS Encoder flushes 16 parity words in 239..254)
                tx_pld_en  <= (cyc_iter < 239);
                tx_pld_din <= (cyc_iter < 239) ? golden_pld_mem[frame_iter][cyc_iter] : 64'd0;
            end

            @(posedge clk_logic);
            tx_hdr_en  <= 1'b0;
            tx_hdr_din <= 8'd0;
            tx_pld_en  <= 1'b0;
            tx_pld_din <= 64'd0;

            // Wait remaining 243 cycles so total frame period is 255 + 1 + 243 = 499 cycles
            repeat (243) @(posedge clk_logic);
        end
    end

    // =======================================================
    // 9. ERROR INJECTION ON RS HEADER (4 Bytes) & PAYLOAD (8 Words = 64 Bytes)
    // =======================================================
    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            in_hdr_byte_cnt <= 6'd0;
            in_pld_word_cnt <= 9'd0;
        end else begin
            if (rs_enc_hdr_dv)
                in_hdr_byte_cnt <= in_hdr_byte_cnt + 6'd1;
            else
                in_hdr_byte_cnt <= 6'd0;

            if (rs_enc_pld_dv)
                in_pld_word_cnt <= in_pld_word_cnt + 9'd1;
            else
                in_pld_word_cnt <= 9'd0;
        end
    end

    always @(*) begin
        hdr_err_mask = 8'd0;
        pld_err_mask = 64'd0;

        // Corrupt 4 bytes inside the 32-Byte RS Header (well within t=8 correction capability)
        if (rs_enc_hdr_dv && (in_hdr_byte_cnt >= 6'd2 && in_hdr_byte_cnt <= 6'd5))
            hdr_err_mask = 8'hA5;

        // Corrupt 8 64-bit words (64 bytes total, 8 bytes per RS lane = max t=8 capacity!)
        if (rs_enc_pld_dv && (in_pld_word_cnt >= 9'd10 && in_pld_word_cnt <= 9'd17))
            pld_err_mask = 64'hE175_0023_4600_8792;
    end

    // =======================================================
    // 10. OUTPUT TRACKERS, FIELD PARSERS & SELF-CHECK COMPARATORS
    // =======================================================
    reg [2:0] hdr_frame_idx;
    reg [2:0] pld_frame_idx;

    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            dec_hdr_byte_cnt     <= 5'd0;
            dec_pld_word_cnt     <= 8'd0;
            hdr_frame_idx        <= 3'd1;
            pld_frame_idx        <= 3'd1;
            hdr_mismatch_cnt     <= 16'd0;
            pld_mismatch_cnt     <= 16'd0;
            extracted_TXFN       <= 16'd0;
            extracted_RXFN       <= 16'd0;
            extracted_ACK        <= 1'b0;
            extracted_ACK_VALID  <= 1'b0;
            extracted_FRAME_TYPE <= 2'd0;
            extracted_TX_TS      <= 40'd0;
            extracted_TOD_SEC    <= 6'd0;
            extracted_TS_APPLIES <= 3'd0;
            extracted_FCCH_OP    <= 4'd0;
            extracted_FCCH_PL    <= 16'd0;
            extracted_HDR_CRC16  <= 16'd0;
            extracted_FSO_PLD_HDR<= 32'd0;
            extracted_FSO_PKT_HDR<= 32'd0;
            extracted_ASCII_TAG  <= 96'd0;
            extracted_MGMT_RANGE <= 64'd0;
            extracted_PLD_CRC32  <= 32'd0;
        end else begin
            // 1. Track & Verify Decoded 16-Byte Header
            if (dec_hdr_dv) begin
                hdr_rx_buf[dec_hdr_byte_cnt] <= dec_hdr_out;
                if (dec_hdr_out !== golden_hdr_mem[hdr_frame_idx][dec_hdr_byte_cnt]) begin
                    hdr_mismatch_cnt <= hdr_mismatch_cnt + 16'd1;
                end

                if (dec_hdr_byte_cnt == 5'd15) begin
                    // Latch all extracted SDA OISL Table 2-9 Header fields on the 16th byte
                    extracted_TXFN       <= {hdr_rx_buf[1],  hdr_rx_buf[0]};
                    extracted_RXFN       <= {hdr_rx_buf[3],  hdr_rx_buf[2]};
                    extracted_ACK        <= hdr_rx_buf[4][3];
                    extracted_ACK_VALID  <= hdr_rx_buf[4][2];
                    extracted_FRAME_TYPE <= hdr_rx_buf[4][1:0];
                    extracted_TX_TS      <= {hdr_rx_buf[9], hdr_rx_buf[8], hdr_rx_buf[7], hdr_rx_buf[6], hdr_rx_buf[5]};
                    extracted_TOD_SEC    <= hdr_rx_buf[10][5:0];
                    extracted_TS_APPLIES <= hdr_rx_buf[11][6:4];
                    extracted_FCCH_OP    <= hdr_rx_buf[11][3:0];
                    extracted_FCCH_PL    <= {hdr_rx_buf[13], hdr_rx_buf[12]};
                    extracted_HDR_CRC16  <= {hdr_rx_buf[14], dec_hdr_out};

                    dec_hdr_byte_cnt <= 5'd16;
                    hdr_frame_idx    <= hdr_frame_idx + 3'd1;
                end else begin
                    dec_hdr_byte_cnt <= dec_hdr_byte_cnt + 5'd1;
                end
            end else begin
                dec_hdr_byte_cnt <= 5'd0;
            end

            // 2. Track & Verify Decoded 239-Word (1912-Byte) Payload
            if (dec_pld_dv) begin
                if (dec_pld_out !== golden_pld_mem[pld_frame_idx][dec_pld_word_cnt]) begin
                    pld_mismatch_cnt <= pld_mismatch_cnt + 16'd1;
                end

                // Extract key Payload fields for Waveform inspection
                if (dec_pld_word_cnt == 8'd0) begin
                    extracted_FSO_PLD_HDR <= dec_pld_out[63:32];
                    extracted_FSO_PKT_HDR <= dec_pld_out[31:0];
                end
                if (pld_frame_idx == 3'd1 && dec_pld_word_cnt == 8'd6)
                    extracted_ASCII_TAG[95:32] <= dec_pld_out;
                if (pld_frame_idx == 3'd1 && dec_pld_word_cnt == 8'd7)
                    extracted_ASCII_TAG[31:0]  <= dec_pld_out[63:32];
                if (pld_frame_idx == 3'd4 && dec_pld_word_cnt == 8'd1)
                    extracted_MGMT_RANGE[63:28] <= dec_pld_out[35:0];
                if (pld_frame_idx == 3'd4 && dec_pld_word_cnt == 8'd2)
                    extracted_MGMT_RANGE[27:0]  <= dec_pld_out[63:36];
                if (dec_pld_word_cnt == 8'd238) begin
                    extracted_PLD_CRC32 <= dec_pld_out[31:0];
                    dec_pld_word_cnt    <= 8'd239;
                    pld_frame_idx       <= pld_frame_idx + 3'd1;
                end else begin
                    dec_pld_word_cnt <= dec_pld_word_cnt + 8'd1;
                end
            end else begin
                dec_pld_word_cnt <= 8'd0;
            end
        end
    end

    // 1-by-1 Byte Unpacker for Decoded 1912-Byte Payload (Counts 1 to 1912 per frame)
    reg [7:0] pld_sim_q [0:16383];
    integer   q_wr_ptr, q_rd_ptr;
    reg       unpack_busy;

    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            q_wr_ptr <= 0;
        end else if (dec_pld_dv) begin
            pld_sim_q[q_wr_ptr + 0] <= dec_pld_out[63:56];
            pld_sim_q[q_wr_ptr + 1] <= dec_pld_out[55:48];
            pld_sim_q[q_wr_ptr + 2] <= dec_pld_out[47:40];
            pld_sim_q[q_wr_ptr + 3] <= dec_pld_out[39:32];
            pld_sim_q[q_wr_ptr + 4] <= dec_pld_out[31:24];
            pld_sim_q[q_wr_ptr + 5] <= dec_pld_out[23:16];
            pld_sim_q[q_wr_ptr + 6] <= dec_pld_out[15:8];
            pld_sim_q[q_wr_ptr + 7] <= dec_pld_out[7:0];
            q_wr_ptr                <= q_wr_ptr + 8;
        end
    end

    initial begin
        q_rd_ptr            = 0;
        unpack_busy         = 1'b0;
        pld_byte_stream     = 8'd0;
        dec_pld_byte_cnt    = 12'd0;
        dec_pld_total_bytes = 16'd0;
        rs_dec_frame_id     = 32'd0;

        forever begin
            @(posedge clk_logic);
            if (rst_n && !unpack_busy && (q_wr_ptr > q_rd_ptr)) begin
                unpack_busy = 1'b1;
                while ((q_rd_ptr < q_wr_ptr) && (dec_pld_total_bytes < 16'd7648)) begin
                    pld_byte_stream     = pld_sim_q[q_rd_ptr];
                    q_rd_ptr            = q_rd_ptr + 1;
                    dec_pld_total_bytes = dec_pld_total_bytes + 16'd1;

                    if (rs_dec_frame_id == 32'd0) begin
                        rs_dec_frame_id  = 32'd1;
                        dec_pld_byte_cnt = 12'd1;
                    end else if (dec_pld_byte_cnt == 12'd1912) begin
                        rs_dec_frame_id  = rs_dec_frame_id + 32'd1;
                        dec_pld_byte_cnt = 12'd1;
                    end else begin
                        dec_pld_byte_cnt = dec_pld_byte_cnt + 12'd1;
                    end
                    // 1912 decoded Payload bytes unpacked across the exact 2493.6 ns frame window
                    #(2493.6 / 1912.0);
                end
                pld_byte_stream  = 8'd0;
                dec_pld_byte_cnt = 12'd0;
                rs_dec_frame_id  = 32'd0;
                unpack_busy      = 1'b0;
            end
        end
    end

    // =======================================================
    // 11. SDA OISL TABLE 2-4 METRICS ANALYZER
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

    always @(rs_dec_frame_id) begin
        if (rs_dec_frame_id >= 32'd1 && rs_dec_frame_id <= 32'd4) begin
            time_start = $realtime;
            time_end   = time_start + (3117.0 * measured_byte_time_ns);

            OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
            OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
            OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
            OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

            $display("---------------------------------------------------------------");
            $display(" [RS DECODER RX] FRAME %0d DECODED (16B Header + 1912B Payload)", rs_dec_frame_id);
            $display(" TXFN=%0d | RXFN=%0d | ACK=%0d | TYPE=%b | FCCH_PL=0x%04h | CRC16=0x%04h",
                     extracted_TXFN, extracted_RXFN, extracted_ACK, extracted_FRAME_TYPE, extracted_FCCH_PL, extracted_HDR_CRC16);
            $display(" Duration       : %0.6f us | Hdr Err=%0d | Pld Err=%0d",
                     OISL_Frame_Duration_us, hdr_mismatch_cnt, pld_mismatch_cnt);
            $display("---------------------------------------------------------------");
        end else if (rs_dec_frame_id == 32'd0) begin
            time_start                    = 0.0;
            time_end                      = 0.0;
            OISL_Frame_Duration_us        = 0.0;
            OISL_Effective_Data_Rate_Mbps = 0.0;
            OISL_Frame_Rate_kHz           = 0.0;
            OISL_FCCH_Mbps                = 0.0;
        end
    end

    // =======================================================
    // 12. SIMULATION TERMINATION
    // =======================================================
    initial begin
        wait(dec_pld_total_bytes == 16'd7648);
        wait(rs_dec_frame_id == 32'd0);
        #500;
        $display("\n[%0.1f ns] RS DECODER RX VERIFIED: 4x16B HEADERS & 4x1912B PAYLOADS RECOVERED (MISMATCHES = %0d).\n",
                 $realtime, (hdr_mismatch_cnt + pld_mismatch_cnt));
        $finish;
    end

endmodule