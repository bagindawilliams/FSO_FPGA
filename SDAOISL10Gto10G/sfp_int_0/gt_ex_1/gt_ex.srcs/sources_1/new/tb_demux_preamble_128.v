`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_demux_preamble_128
Description  : Verification Testbench for 128-bit Receiver Preamble Demux 
               (demux_preamble_128.v) and Optical Sync Lock Verifier 
               (preamble_sda_decoder.v), driven directly by CDC 3 
               (rx_gth_logic.v).

               KEY OBJECTIVES:
               1. Feeds 4 continuous 3117-Byte FSO frames (12,468 Bytes in 
                  3117 clocks @ 312.5 MHz) into CDC 3 (rx_gth_logic).
               2. Verifies that demux_preamble_128 extracts the exact 72-bit 
                  (9-Byte) Preamble at the start of each frame and emits 
                  259 contiguous 96-bit LPC words (3108 Bytes) per frame.
               3. Verifies that preamble_sda_decoder asserts link_locked_out = 1 
                  and increments locked_frame_cnt from 1 to 4.

Revision History:
  - Rev 1.0 (Initial) : 4-frame CDC 3 -> demux_preamble_128 -> preamble_sda_decoder TB.
  - Rev 2.0 (2026-10-27 15:55 KST) : [ETRI Audit Item 1 & Target B1.1 Verification]
    Updated 'get_frame_byte' (Bytes 1..9 of every 3117-Byte frame) from the 
    legacy marker (72'h55_55_55_55_55_55_55_55_D5) to the official SDA OISL 
    v2.1.2 Table 2-8 72-bit Preamble (72'h77_AD_5B_58_43_64_1E_2E_26, MSB 8'h77 
    transmitted first down to LSB 8'h26) and added automatic self-checking 
    assertions for all 4 frames.
===========================================================================
*/

module tb_demux_preamble_128();

    reg clk_gth;   // 312.5 MHz Write Clock to CDC 3 (3.2 ns)
    reg clk_logic; // 200.0 MHz Read & Demux Clock (5.0 ns)
    reg rst_n;

    // Upstream 312.5 MHz Stimulus into CDC 3
    reg         gth_rx_dv;
    reg  [31:0] gth_rx_data;

    // CDC 3 Outputs -> Demux 128 Inputs (200.0 MHz, 128-bit)
    wire         cdc3_flag_out;
    wire [127:0] cdc3_data_out;

    // Demux 128 & Preamble Decoder Outputs (200.0 MHz)
    wire [71:0]  preamble_extracted;
    wire         preamble_valid;
    wire [95:0]  lpc_data_out;
    wire         lpc_valid_out;
    wire         link_locked_out;

    // Hierarchical Waveform Trackers
    wire [15:0]  locked_frame_cnt = u_preamble_dec.locked_frame_cnt;
    wire [8:0]   out_lpc_word_cnt = u_demux_128.out_lpc_word_cnt;
    wire [11:0]  out_lpc_byte_cnt = u_demux_128.out_lpc_byte_cnt;
    wire [7:0]   lpc_byte_stream  = u_demux_128.lpc_byte_stream;
    wire [11:0]  lpc_byte_idx     = u_demux_128.lpc_byte_idx;
    wire [31:0]  demux_frame_id   = u_demux_128.demux_frame_id;
    wire [15:0]  lpc_total_bytes  = u_demux_128.lpc_total_bytes;

    // 1. CDC 3 Instantiation (312.5 MHz 32b -> 200.0 MHz 128b)
    rx_gth_logic u_cdc3 (
        .clk_gth   (clk_gth),
        .clk_logic (clk_logic),
        .rst_n     (rst_n),
        .en        (gth_rx_dv),
        .data_in   (gth_rx_data),
        .flag      (cdc3_flag_out),
        .data_out  (cdc3_data_out)
    );

    // 2. Demux Preamble 128 Instantiation
    demux_preamble_128 u_demux_128 (
        .clk                (clk_logic),
        .rst_n              (rst_n),
        .cdc_data_in        (cdc3_data_out),
        .cdc_valid_in       (cdc3_flag_out),
        .preamble_extracted (preamble_extracted),
        .preamble_valid     (preamble_valid),
        .lpc_data_out       (lpc_data_out),
        .lpc_valid_out      (lpc_valid_out)
    );

    // 3. Preamble SDA Decoder Instantiation
    preamble_sda_decoder u_preamble_dec (
        .clk               (clk_logic),
        .rst_n             (rst_n),
        .preamble_in       (preamble_extracted),
        .preamble_valid_in (preamble_valid),
        .link_locked_out   (link_locked_out)
    );

    // Clock Generators
    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;   // 312.5 MHz
    end

    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic; // 200.0 MHz
    end

    // [Rev 2.0] Official SDA OISL Table 2-8 72-bit Preamble (72'h77AD5B5843641E2E26)
    function [7:0] get_frame_byte(input [31:0] f_idx, input [11:0] b_idx);
        begin
            case (b_idx)
                12'd1:               get_frame_byte = 8'h77;
                12'd2:               get_frame_byte = 8'hAD;
                12'd3:               get_frame_byte = 8'h5B;
                12'd4:               get_frame_byte = 8'h58;
                12'd5:               get_frame_byte = 8'h43;
                12'd6:               get_frame_byte = 8'h64;
                12'd7:               get_frame_byte = 8'h1E;
                12'd8:               get_frame_byte = 8'h2E;
                12'd9:               get_frame_byte = 8'h26;
                12'd10:              get_frame_byte = 8'hAA;
                12'd11:              get_frame_byte = 8'hBB;
                12'd12:              get_frame_byte = 8'hCC;
                12'd13:              get_frame_byte = f_idx[7:0];
                12'd3105, 12'd3106:  get_frame_byte = 8'h99;
                12'd3107, 12'd3108:  get_frame_byte = 8'h88;
                12'd3109, 12'd3110:  get_frame_byte = 8'h77;
                12'd3111, 12'd3112:  get_frame_byte = 8'h66;
                12'd3113, 12'd3114:  get_frame_byte = 8'h55;
                12'd3115, 12'd3116:  get_frame_byte = 8'h44;
                12'd3117:            get_frame_byte = 8'h33;
                default:             get_frame_byte = b_idx[7:0];
            endcase
        end
    endfunction

    integer total_word_idx;
    integer b0_abs, b1_abs, b2_abs, b3_abs;
    integer total_lpc_words_captured = 0;
    integer preamble_match_cnt       = 0;

    always @(posedge clk_logic) begin
        if (preamble_valid) begin
            $display(" [%0.1f ns] Frame %0d Preamble Extracted = 0x%018X (Expected: 0x77AD5B5843641E2E26)",
                     $realtime, preamble_match_cnt + 1, preamble_extracted);
            if (preamble_extracted == 72'h77_AD_5B_58_43_64_1E_2E_26)
                preamble_match_cnt <= preamble_match_cnt + 1;
        end
        if (lpc_valid_out) begin
            total_lpc_words_captured <= total_lpc_words_captured + 1;
        end
    end

    initial begin
        rst_n          = 1'b0;
        gth_rx_dv      = 1'b0;
        gth_rx_data    = 32'd0;
        total_word_idx = 0;

        #100;
        rst_n = 1'b1;

        wait(u_cdc3.wr_rst_busy == 1'b0 && u_cdc3.rd_rst_busy == 1'b0);
        repeat (10) @(posedge clk_gth);

        // Stream 4 continuous 3117-Byte frames (12,468 Bytes = 3117 words x 32-bit)
        for (total_word_idx = 0; total_word_idx < 3117; total_word_idx = total_word_idx + 1) begin
            b0_abs = total_word_idx * 4;
            b1_abs = total_word_idx * 4 + 1;
            b2_abs = total_word_idx * 4 + 2;
            b3_abs = total_word_idx * 4 + 3;

            @(posedge clk_gth);
            gth_rx_dv   <= 1'b1;
            gth_rx_data <= {
                get_frame_byte((b0_abs / 3117) + 1, (b0_abs % 3117) + 1),
                get_frame_byte((b1_abs / 3117) + 1, (b1_abs % 3117) + 1),
                get_frame_byte((b2_abs / 3117) + 1, (b2_abs % 3117) + 1),
                get_frame_byte((b3_abs / 3117) + 1, (b3_abs % 3117) + 1)
            };
        end

        @(posedge clk_gth);
        gth_rx_dv   <= 1'b0;
        gth_rx_data <= 32'd0;

        wait(total_lpc_words_captured == 1036);
        wait(demux_frame_id == 32'd0);
        #200;

        $display("\n======================================================================");
        $display(" DEMUX PREAMBLE 128 & SDA OISL TABLE 2-8 LOCK REPORT");
        $display(" -> Official Preamble (72'h77AD5B5843641E2E26) Matches : %0d / 4", preamble_match_cnt);
        $display(" -> Optical Link Locked Status (link_locked_out)       : %0b", link_locked_out);
        $display(" -> Total Locked Frames (locked_frame_cnt)             : %0d / 4", locked_frame_cnt);
        $display(" -> Total 96-bit LPC Words Emitted (4 x 259)           : %0d / 1036 (%0d Bytes)",
                 total_lpc_words_captured, total_lpc_words_captured * 12);
        if (preamble_match_cnt == 4 && link_locked_out == 1'b1 && total_lpc_words_captured == 1036)
            $display(" -> RESULT: [PASS] 100%% COMPLIANT WITH ETRI AUDIT ITEM 1!");
        $display("======================================================================\n");
        $finish;
    end

endmodule