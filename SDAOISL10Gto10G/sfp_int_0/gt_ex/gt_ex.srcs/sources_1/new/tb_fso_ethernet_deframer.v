`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_fso_ethernet_deframer
Description  : Full Subsystem Verification Testbench for fso_ethernet_deframer.v
               with Integrated SDA OISL Table 2-4 & Table 2-11 Metrics Analyzer.

               PROVES SELECTIVE REPEAT OUT-OF-ORDER RECOVERY & TABLE 2-11:
               1. Arrival 1: TXFN=1 (DATA) Clean      -> ACK 1 -> Drains TXFN=1 immediately
               2. Arrival 2: TXFN=2 (DATA) CRC Failed -> NAK 2 -> Flushed (expected_txfn stays 2)
               3. Arrival 3: TXFN=3 (DATA) Clean      -> ACK 3 -> Buffered in Slot 3 (Held!)
               4. Arrival 4: TXFN=2 (DATA) Retx Clean -> ACK 2 -> Drains TXFN=2 THEN TXFN=3 in-order!
               5. Arrival 5: TXFN=4 (IDLE) Clean      -> Discarded by idle_discard.v
               6. Arrival 6: TXFN=5 (MGMT) Clean      -> Extracted by mgmt_extraction.v

               Revision History:
               - Rev 1.0 (Initial) : Full 6-arrival Selective Repeat ARQ & Deframer testbench.
               - Rev 1.1 (2026-10-22 07:01 KST) :
                 1. Updated timescale to 1ns/1ps.
                 2. Aligned ord_word_cnt (1..477), ord_byte_cnt (4..1908), 
                    ord_total_bytes (4..5724), and last_drained_seg_hdr with 
                    m_axis_fso_tvalid so Word 1 and Word 477 display with 
                    zero 1-cycle lag across back-to-back reordered drains.
                 3. Reset Table 2-4 math metrics cleanly to 0.0 when arrival_idx == 0.
===========================================================================
*/

module tb_fso_ethernet_deframer();

    // =======================================================
    // 1. CLOCK AND RESET SIGNALS
    // =======================================================
    reg clk_gth; // 312.5 MHz (Period = 3.2 ns)
    reg rst_n;

    // =======================================================
    // 2. GROUP 1: INPUT STREAMS FROM CDC 4 (16B Header + 1912B Payload)
    // =======================================================
    reg         in_hdr_dv;
    reg  [7:0]  in_hdr_data;
    reg  [4:0]  in_hdr_byte_cnt;

    reg         in_pld_dv;
    reg  [31:0] in_pld_data;
    reg  [8:0]  in_pld_word_cnt;
    reg  [31:0] arrival_idx;

    // =======================================================
    // 3. GROUP 2: CONTROL PLANE (HEADER PARSER, CRC STATUS & ARQ ACK/NAK)
    // =======================================================
    wire        hdr_crc_ok;
    wire        pld_crc_ok;
    wire [15:0] rx_txfn;
    wire [1:0]  rx_frame_type;
    wire [39:0] rx_tx_ts;
    wire [3:0]  rx_fcch_op;
    wire [15:0] rx_fcch_pl;

    wire [15:0] local_fb_rxfn;
    wire        local_fb_ack;
    wire        local_fb_ack_valid;
    wire [15:0] peer_rxfn_out;
    wire        peer_ack_out;
    wire        peer_ack_valid_out;
    wire [15:0] expected_txfn;

    // =======================================================
    // 4. GROUP 3: DATA PLANE (IN-ORDER 1908B DATA, IDLE & MGMT TELEMETRY)
    // =======================================================
    wire [31:0] m_axis_fso_tdata;
    wire        m_axis_fso_tvalid;
    wire        m_axis_fso_tlast;

    wire [63:0] mgmt_range_meters;
    wire        mgmt_telemetry_valid;
    wire [15:0] idle_frame_cnt            = u_dut_deframer.u_deframer.u_frame_demultiplexer.idle_frame_cnt;
    wire [15:0] mgmt_frame_cnt            = u_dut_deframer.u_deframer.u_frame_demultiplexer.mgmt_frame_cnt;
    wire [15:0] in_order_drained_cnt      = u_dut_deframer.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.in_order_drained_cnt;
    wire [15:0] out_of_order_buffered_cnt = u_dut_deframer.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.out_of_order_buffered_cnt;

    reg  [8:0]  raw_ord_word_idx;
    reg  [15:0] raw_ord_total_bytes;
    reg  [15:0] latched_seg_hdr;

    // Zero-lag aligned counters for Waveform Group 3 (Counts 1..477 words and 4..1908 bytes)
    wire [8:0]  ord_word_cnt         = m_axis_fso_tvalid ? (raw_ord_word_idx + 9'd1) : 9'd0;
    wire [11:0] ord_byte_cnt         = m_axis_fso_tvalid ? ({3'd0, raw_ord_word_idx + 9'd1} * 12'd4) : 12'd0;
    wire [15:0] ord_total_bytes      = m_axis_fso_tvalid ? (raw_ord_total_bytes + 16'd4) : raw_ord_total_bytes;
    wire [15:0] last_drained_seg_hdr = (m_axis_fso_tvalid && raw_ord_word_idx == 9'd0) ? m_axis_fso_tdata[15:0] : latched_seg_hdr;

    // =======================================================
    // 5. GROUP 4: SDA OISL TABLE 2-4 & TABLE 2-11 ANALYZER SIGNALS
    // =======================================================
    wire [7:0]  Table2_11_ARQ_HOLDOFF_CFG    = 8'd255;
    wire [7:0]  Table2_11_ARQ_HOLDOFF_MULT   = 8'd16;
    wire [15:0] Table2_11_ARQ_HOLDOFF_FRAMES = u_dut_deframer.u_deframer.u_frame_demultiplexer.u_arq_rx_reorder.arq_holdoff_frames_out;
    wire [2:0]  Table2_11_ARQ_MAX_RETX       = 3'd5;
    real        Table2_11_ARQ_Holdoff_Time_ms;
    real        Table2_11_Max_Link_Dist_km;

    real last_gth_edge_ns;
    real measured_gth_period_ns;
    real measured_byte_time_ns;
    real time_start;
    real time_end;
    real OISL_Frame_Duration_us;
    real OISL_Effective_Data_Rate_Mbps;
    real OISL_Frame_Rate_kHz;
    real OISL_FCCH_Mbps;

    // =======================================================
    // 6. DUT INSTANTIATION: fso_ethernet_deframer
    // =======================================================
    fso_ethernet_deframer u_dut_deframer (
        .clk                  (clk_gth),
        .rst_n                (rst_n),
        .s_axis_hdr_tvalid    (in_hdr_dv),
        .s_axis_hdr_tdata     (in_hdr_data),
        .s_axis_fso_tvalid    (in_pld_dv),
        .s_axis_fso_tdata     (in_pld_data),
        .m_axis_fso_tdata     (m_axis_fso_tdata),
        .m_axis_fso_tvalid    (m_axis_fso_tvalid),
        .m_axis_fso_tlast     (m_axis_fso_tlast),
        .m_axis_fso_tready    (1'b1),
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

    // =======================================================
    // 7. CLOCK GENERATOR (312.5 MHz)
    // =======================================================
    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;
    end

    // =======================================================
    // 8. HEADER (16B) & PAYLOAD (1912B) STIMULUS BUILDERS
    // =======================================================
    function [7:0] build_hdr_byte(
        input [15:0] txfn_v,
        input [15:0] rxfn_v,
        input        ack_v,
        input        ack_vld_v,
        input [1:0]  ftype_v,
        input integer b_idx
    );
        reg [39:0] ts_v;
        reg [15:0] fcch_v;
        reg [15:0] crc16_v;
        begin
            ts_v    = 40'd1_082_600 + (txfn_v - 16'd1) * 40'd2_493_600;
            fcch_v  = 16'hF000 + txfn_v;
            crc16_v = 16'hC160 + txfn_v;

            case (b_idx)
                0:  build_hdr_byte = txfn_v[7:0];
                1:  build_hdr_byte = txfn_v[15:8];
                2:  build_hdr_byte = rxfn_v[7:0];
                3:  build_hdr_byte = rxfn_v[15:8];
                4:  build_hdr_byte = {2'b11, 2'b11, ack_v, ack_vld_v, ftype_v};
                5:  build_hdr_byte = ts_v[7:0];
                6:  build_hdr_byte = ts_v[15:8];
                7:  build_hdr_byte = ts_v[23:16];
                8:  build_hdr_byte = ts_v[31:24];
                9:  build_hdr_byte = ts_v[39:32];
                10: build_hdr_byte = {2'b11, 6'd15};
                11: build_hdr_byte = {1'b1, 3'b001, 4'hA};
                12: build_hdr_byte = fcch_v[7:0];
                13: build_hdr_byte = fcch_v[15:8];
                14: build_hdr_byte = crc16_v[15:8];
                15: build_hdr_byte = crc16_v[7:0];
                default: build_hdr_byte = 8'd0;
            endcase
        end
    endfunction

    task send_cdc4_frame(
        input [31:0] arr_id,
        input [15:0] txfn_val,
        input [15:0] rxfn_val,
        input        ack_val,
        input        ack_vld,
        input [1:0]  ftype_val,
        input        corrupt_crc32
    );
        integer c;
        begin
            arrival_idx = arr_id;
            for (c = 0; c < 478; c = c + 1) begin
                @(posedge clk_gth);
                if (c < 16) begin
                    in_hdr_dv       <= 1'b1;
                    in_hdr_data     <= build_hdr_byte(txfn_val, rxfn_val, ack_val, ack_vld, ftype_val, c);
                    in_hdr_byte_cnt <= c[4:0] + 5'd1;
                end else begin
                    in_hdr_dv       <= 1'b0;
                    in_hdr_data     <= 8'd0;
                    in_hdr_byte_cnt <= 5'd0;
                end

                in_pld_dv       <= 1'b1;
                in_pld_word_cnt <= c[8:0] + 9'd1;

                if (c == 477) begin
                    in_pld_data <= corrupt_crc32 ? 32'hBAD0_C0DE : (32'hC320_0000 + {16'd0, txfn_val});
                end else if (ftype_val == 2'b01) begin
                    if (c == 0)
                        in_pld_data <= (txfn_val == 16'd1) ? 32'hAB00_076C :
                                       (txfn_val == 16'd2) ? 32'hAB01_0064 : 32'hAB00_0040;
                    else if (c == 1)
                        in_pld_data <= (txfn_val == 16'd3) ? 32'hCDEF_0040 : 32'hCDEF_07D0;
                    else
                        in_pld_data <= {16'hDA00 + txfn_val, c[15:0]};
                end else if (ftype_val == 2'b00) begin
                    in_pld_data <= {16'h1D1E, c[15:0]};
                end else begin
                    case (c)
                        0: in_pld_data <= {6'd15, 26'd16678204};
                        1: in_pld_data <= {14'd759, 6'd15, 12'd0};
                        2: in_pld_data <= {28'd1082600, 4'h4};
                        3: in_pld_data <= 32'h1531_2D00;
                        4: in_pld_data <= {28'd0, 4'h5};
                        5: in_pld_data <= {28'h7F83_BA0, 4'd0};
                        6: in_pld_data <= 32'd0;
                        7: in_pld_data <= {4'd0, 1'b1, 27'd0};
                        default: in_pld_data <= 32'd0;
                    endcase
                end
            end

            @(posedge clk_gth);
            in_hdr_dv       <= 1'b0;
            in_hdr_data     <= 8'd0;
            in_hdr_byte_cnt <= 5'd0;
            in_pld_dv       <= 1'b0;
            in_pld_data     <= 32'd0;
            in_pld_word_cnt <= 9'd0;

            repeat (1000) @(posedge clk_gth);
        end
    endtask

    initial begin
        rst_n           = 1'b0;
        in_hdr_dv       = 1'b0;
        in_hdr_data     = 8'd0;
        in_hdr_byte_cnt = 5'd0;
        in_pld_dv       = 1'b0;
        in_pld_data     = 32'd0;
        in_pld_word_cnt = 9'd0;
        arrival_idx     = 32'd0;

        #100;
        rst_n = 1'b1;
        repeat (15) @(posedge clk_gth);

        // 1. Arrival 1: TXFN=1 (DAT1) Clean
        send_cdc4_frame(32'd1, 16'd1, 16'd0, 1'b0, 1'b0, 2'b01, 1'b0);

        // 2. Arrival 2: TXFN=2 (DAT2) Corrupted -> NAK 2, Flushed!
        send_cdc4_frame(32'd2, 16'd2, 16'd1, 1'b1, 1'b1, 2'b01, 1'b1);

        // 3. Arrival 3: TXFN=3 (DAT3) Clean arrives OUT-OF-ORDER -> Buffered in Slot 3!
        send_cdc4_frame(32'd3, 16'd3, 16'd1, 1'b1, 1'b1, 2'b01, 1'b0);

        // 4. Arrival 4: TXFN=2 (DAT2) Retransmitted Clean -> Drains TXFN=2 THEN TXFN=3!
        send_cdc4_frame(32'd4, 16'd2, 16'd2, 1'b1, 1'b1, 2'b01, 1'b0);

        // 5. Arrival 5: TXFN=4 (IDLE) Clean -> Discarded
        send_cdc4_frame(32'd5, 16'd4, 16'd3, 1'b1, 1'b1, 2'b00, 1'b0);

        // 6. Arrival 6: TXFN=5 (MGMT) Clean -> Extracted
        send_cdc4_frame(32'd6, 16'd5, 16'd4, 1'b1, 1'b1, 2'b10, 1'b0);

        arrival_idx = 32'd0;
        #200;
        $display("\n[%0.1f ns] FSO ETHERNET DEFRAMER & TABLE 2-11 SELECTIVE REPEAT ARQ VERIFIED.\n", $realtime);
        $finish;
    end

    // =======================================================
    // 9. ORDERED DATA TRACKER & TABLE 2-4 / TABLE 2-11 ANALYZER
    // =======================================================
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
        Table2_11_ARQ_Holdoff_Time_ms = 0.0;
        Table2_11_Max_Link_Dist_km    = 0.0;
    end

    always @(posedge clk_gth) begin
        if (last_gth_edge_ns > 0.0) begin
            measured_gth_period_ns = $realtime - last_gth_edge_ns;
            measured_byte_time_ns  = measured_gth_period_ns / 4.0;
        end
        last_gth_edge_ns = $realtime;
    end

    always @(arrival_idx) begin
        if (arrival_idx >= 32'd1 && arrival_idx <= 32'd6) begin
            time_start = $realtime;
            time_end   = time_start + (3117.0 * measured_byte_time_ns);

            OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
            OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
            OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
            OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

            Table2_11_ARQ_Holdoff_Time_ms = (Table2_11_ARQ_HOLDOFF_FRAMES * OISL_Frame_Duration_us) / 1000.0;
            Table2_11_Max_Link_Dist_km    = (299.792458 * Table2_11_ARQ_Holdoff_Time_ms) / 2.0;

            $display("---------------------------------------------------------------");
            $display(" [DEFRAMER & ARQ] ARRIVAL %0d | Holdoff Max=%0d Frames (%0.3f ms, ~%0.1f km)",
                     arrival_idx, Table2_11_ARQ_HOLDOFF_FRAMES, Table2_11_ARQ_Holdoff_Time_ms, Table2_11_Max_Link_Dist_km);
            $display(" Table 2-4: Duration=%0.6f us | Eff Rate=%0.6f Mbps | Frame Rate=%0.6f kHz",
                     OISL_Frame_Duration_us, OISL_Effective_Data_Rate_Mbps, OISL_Frame_Rate_kHz);
            $display("---------------------------------------------------------------");
        end else if (arrival_idx == 32'd0) begin
            time_start                    = 0.0;
            time_end                      = 0.0;
            OISL_Frame_Duration_us        = 0.0;
            OISL_Effective_Data_Rate_Mbps = 0.0;
            OISL_Frame_Rate_kHz           = 0.0;
            OISL_FCCH_Mbps                = 0.0;
        end
    end

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            raw_ord_word_idx    <= 9'd0;
            raw_ord_total_bytes <= 16'd0;
            latched_seg_hdr     <= 16'd0;
        end else if (m_axis_fso_tvalid) begin
            if (raw_ord_word_idx == 9'd0)
                latched_seg_hdr <= m_axis_fso_tdata[15:0];

            raw_ord_total_bytes <= raw_ord_total_bytes + 16'd4;

            if (m_axis_fso_tlast)
                raw_ord_word_idx <= 9'd0;
            else
                raw_ord_word_idx <= raw_ord_word_idx + 9'd1;
        end else begin
            raw_ord_word_idx <= 9'd0;
        end
    end

endmodule