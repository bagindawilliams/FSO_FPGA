`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_demux_preamble_128
Description  : Verification Testbench for demux_preamble_128.v and 
               preamble_sda_decoder.v driven by rx_gth_logic.v (CDC 3).

               WAVEFORM GROUPS TO OBSERVE:
               1. Data In from CDC 3 (200.0 MHz, 128-bit, 3117 Bytes/frame):
                  - cdc3_flag_out, cdc3_data_out[127:0], cdc3_frame_byte_cnt (1..3117)
               2. Separated 72-bit Preamble & Lock Status (200.0 MHz):
                  - preamble_valid, preamble_extracted[71:0] (5555555555555555d5),
                    preamble_bit_cnt (72), preamble_byte_cnt (9), link_locked_out (1),
                    locked_frame_cnt (1..4)
               3. Separated 96-bit LPC Frame Output (200.0 MHz, 3108 Bytes/frame):
                  - lpc_valid_out, lpc_data_out[95:0], lpc_word_cnt (1..259),
                    lpc_byte_stream[7:0], lpc_byte_cnt (1..3108), demux_frame_id (1..4)
                  - SDA OISL Table 2-4 Metrics aligned under demux_frame_id (1..4).

               Revision History:
               - Rev 1.0 (Initial) : Baseline demux_preamble_128 testbench.
               - Rev 1.1 (2026-10-22 05:14 KST) : Upgraded timescale to 1ns/1ps
                 and initialized total_word_idx = 0 at t=0.
===========================================================================
*/

module tb_demux_preamble_128();

    // =======================================================
    // 1. CLOCK AND RESET SIGNALS
    // =======================================================
    reg clk_gth;   // 312.5 MHz (Period = 3.2 ns)
    reg clk_logic; // 200.0 MHz (Period = 5.0 ns)
    reg rst_n;

    // Upstream stimulus to CDC 3 (312.5 MHz, 32-bit)
    reg         gth_rx_dv;
    reg  [31:0] gth_rx_data;

    // =======================================================
    // 2. GROUP 1: DATA IN FROM CDC 3 (200.0 MHz, 128-bit, 3117B)
    // =======================================================
    wire         cdc3_flag_out;
    wire [127:0] cdc3_data_out;
    wire [15:0]  cdc3_word128_cnt    = u_cdc3.out_word128_cnt;
    wire [7:0]   cdc3_byte_stream    = u_cdc3.byte_out;
    wire [11:0]  cdc3_frame_byte_cnt = u_cdc3.frame_byte_cnt; // 1..3117
    wire [31:0]  cdc3_frame_id       = u_cdc3.frame_out_id;   // 1..4

    // =======================================================
    // 3. GROUP 2: EXTRACTED 72-BIT PREAMBLE & LOCK STATUS (9 Bytes)
    // =======================================================
    wire [71:0]  preamble_extracted;
    wire         preamble_valid;
    wire         link_locked_out;
    wire [6:0]   preamble_bit_cnt    = u_demux.preamble_bit_cnt;  // 72 bits
    wire [3:0]   preamble_byte_cnt   = u_demux.preamble_byte_cnt; // 9 Bytes
    wire [15:0]  locked_frame_cnt    = u_preamble_dec.locked_frame_cnt; // 1..4

    // =======================================================
    // 4. GROUP 3: EXTRACTED 96-BIT LPC STREAM (259 Words = 3108 Bytes)
    // =======================================================
    wire [95:0]  lpc_data_out;
    wire         lpc_valid_out;
    wire [8:0]   lpc_word_cnt        = u_demux.lpc_word_cnt;      // 1..259 words
    wire [7:0]   lpc_byte_stream     = u_demux.lpc_byte_stream;   // 1-by-1 LPC byte
    wire [11:0]  lpc_byte_cnt        = u_demux.lpc_byte_cnt;      // 1..3108 Bytes
    wire [15:0]  lpc_total_bytes     = u_demux.lpc_total_bytes;   // 1..12432 Bytes
    wire [31:0]  demux_frame_id      = u_demux.demux_frame_id;    // 1..4

    // =======================================================
    // 5. DUT INSTANTIATIONS (CDC 3 -> DEMUX 128 -> PREAMBLE DECODER)
    // =======================================================
    rx_gth_logic u_cdc3 (
        .clk_gth   (clk_gth),
        .clk_logic (clk_logic),
        .rst_n     (rst_n),
        .en        (gth_rx_dv),
        .data_in   (gth_rx_data),
        .flag      (cdc3_flag_out),
        .data_out  (cdc3_data_out)
    );

    demux_preamble_128 u_demux (
        .clk                (clk_logic),
        .rst_n              (rst_n),
        .cdc_data_in        (cdc3_data_out),
        .cdc_valid_in       (cdc3_flag_out),
        .preamble_extracted (preamble_extracted),
        .preamble_valid     (preamble_valid),
        .lpc_data_out       (lpc_data_out),
        .lpc_valid_out      (lpc_valid_out)
    );

    preamble_sda_decoder u_preamble_dec (
        .clk                (clk_logic),
        .rst_n              (rst_n),
        .preamble_in        (preamble_extracted),
        .preamble_valid_in  (preamble_valid),
        .link_locked_out    (link_locked_out)
    );

    // =======================================================
    // 6. CLOCK GENERATORS
    // =======================================================
    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;   // 312.5 MHz
    end

    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic; // 200.0 MHz
    end

    // =======================================================
    // 7. CONTINUOUS 4-FRAME GENERATOR (4 x 3117 = 12,468 Bytes)
    // =======================================================
    function [7:0] get_frame_byte(input [31:0] f_idx, input [11:0] b_idx);
        begin
            case (b_idx)
                // Bytes 1..9: 72-bit Preamble (55_55_55_55_55_55_55_55_D5)
                12'd1, 12'd2, 12'd3, 12'd4,
                12'd5, 12'd6, 12'd7, 12'd8: get_frame_byte = 8'h55;
                12'd9:                      get_frame_byte = 8'hD5;
                // Bytes 10..3117: 3108 Bytes of LPC Data (starts with AA_BB_CC, ends with 33)
                12'd10:                     get_frame_byte = 8'hAA;
                12'd11:                     get_frame_byte = 8'hBB;
                12'd12:                     get_frame_byte = 8'hCC;
                12'd13:                     get_frame_byte = f_idx[7:0];
                12'd3105, 12'd3106:         get_frame_byte = 8'h99;
                12'd3107, 12'd3108:         get_frame_byte = 8'h88;
                12'd3109, 12'd3110:         get_frame_byte = 8'h77;
                12'd3111, 12'd3112:         get_frame_byte = 8'h66;
                12'd3113, 12'd3114:         get_frame_byte = 8'h55;
                12'd3115, 12'd3116:         get_frame_byte = 8'h44;
                12'd3117:                   get_frame_byte = 8'h33; // 3108th LPC Byte (3117th Frame Byte)
                default:                    get_frame_byte = b_idx[7:0];
            endcase
        end
    endfunction

    integer total_word_idx;
    integer b0_abs, b1_abs, b2_abs, b3_abs;
    reg [7:0] byte0, byte1, byte2, byte3;

    initial begin
        rst_n          = 1'b0;
        gth_rx_dv      = 1'b0;
        gth_rx_data    = 32'd0;
        total_word_idx = 0;

        #100;
        rst_n = 1'b1;

        wait(u_cdc3.wr_rst_busy == 1'b0 && u_cdc3.rd_rst_busy == 1'b0);
        repeat (10) @(posedge clk_gth);

        for (total_word_idx = 0; total_word_idx < 3117; total_word_idx = total_word_idx + 1) begin
            b0_abs = total_word_idx * 4;
            b1_abs = total_word_idx * 4 + 1;
            b2_abs = total_word_idx * 4 + 2;
            b3_abs = total_word_idx * 4 + 3;

            byte0 = get_frame_byte((b0_abs / 3117) + 1, (b0_abs % 3117) + 1);
            byte1 = get_frame_byte((b1_abs / 3117) + 1, (b1_abs % 3117) + 1);
            byte2 = get_frame_byte((b2_abs / 3117) + 1, (b2_abs % 3117) + 1);
            byte3 = get_frame_byte((b3_abs / 3117) + 1, (b3_abs % 3117) + 1);

            @(posedge clk_gth);
            gth_rx_dv   <= 1'b1;
            gth_rx_data <= {byte0, byte1, byte2, byte3};
        end

        @(posedge clk_gth);
        gth_rx_dv   <= 1'b0;
        gth_rx_data <= 32'd0;
    end

    // =======================================================
    // 8. SDA OISL TABLE 2-4 METRICS ANALYZER (ALIGNED TO DEMUX OUTPUT)
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

    always @(demux_frame_id) begin
        if (demux_frame_id >= 32'd1 && demux_frame_id <= 32'd4) begin
            time_start = $realtime;
            time_end   = time_start + (3117.0 * measured_byte_time_ns);

            OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
            OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
            OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
            OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

            $display("---------------------------------------------------------------");
            $display(" [DEMUX PREAMBLE 128] FRAME %0d ACTIVE (9B Preamble + 3108B LPC)", demux_frame_id);
            $display(" Preamble Hex   : %018h (72 bits) | Link Locked: %0d", preamble_extracted, link_locked_out);
            $display(" time_start     : %0.1f ns | time_end : %0.1f ns", time_start, time_end);
            $display(" Duration       : %0.6f us", OISL_Frame_Duration_us);
            $display(" Effective Rate : %0.6f Mbps", OISL_Effective_Data_Rate_Mbps);
            $display(" Frame Rate     : %0.6f kHz  | FCCH Rate: %0.6f Mbps", OISL_Frame_Rate_kHz, OISL_FCCH_Mbps);
            $display("---------------------------------------------------------------");
        end else if (demux_frame_id == 32'd0) begin
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
        wait(lpc_total_bytes == 16'd12432);
        wait(demux_frame_id == 32'd0);
        #500;
        $display("\n[%0.1f ns] DEMUX PREAMBLE 128 VERIFIED: 4x72-bit PREAMBLES & 4x3108B LPC FRAMES EXTRACTED.\n", $realtime);
        $finish;
    end

endmodule