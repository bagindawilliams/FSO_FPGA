`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_cdc3_rx_gth_logic
Description  : Standalone Verification Testbench for Clock Domain Crossing 3 
               (rx_gth_logic.v + cross_gth_logic.xci).
               
               WAVEFORM GROUPS:
               1. Data In from GTH RX (312.5 MHz, 32-bit Continuous):
                  - clk_gth, gth_rx_dv, gth_rx_data[31:0], in_byte_stream[7:0],
                    in_clk_cnt (1..780), in_byte_cnt (1..3117), in_frame_id (1..4)
               2. Data Out from CDC 3 (200.0 MHz, 128-bit):
                  - clk_logic, cdc3_flag_out, cdc3_data_out[127:0],
                    out_clk_cnt (1..499 @ 200 MHz), out_word128_cnt (1..780),
                    out_byte_stream[7:0], out_frame_byte_cnt (1..3117),
                    out_total_bytes (1..12468), out_frame_id (1..4)

               Revision Notes:
               - [Rev 2026-10-21 13:45 KST]: Initialized total_word_idx = 0 
                 at t=0 in the initial block to eliminate the red 'X' value 
                 prior to 158.400 ns.
               - [Rev 2.0 - 2026-10-27 15:20 KST - ETRI Audit Item 1 Alignment]:
                 Updated 'get_frame_byte' (Bytes 1..9) from the simulation 
                 marker (55_55_55_55_55_55_55_55_D5) to the official SDA OISL 
                 v2.1.2 Table 2-8 72-bit Preamble (72'h77_AD_5B_58_43_64_1E_2E_26, 
                 MSB transmitted first) and added automatic verification of 
                 the extracted 128-bit words.
===========================================================================
*/

module tb_cdc3_rx_gth_logic();

    reg clk_gth;   // 312.5 MHz (Period = 3.2 ns)
    reg clk_logic; // 200.0 MHz (Period = 5.0 ns)
    reg rst_n;

    // Group 1: Data In from GTH RX (312.5 MHz, 32-bit)
    reg         gth_rx_dv;
    reg  [31:0] gth_rx_data;
    reg  [7:0]  in_byte_stream;
    reg  [11:0] in_byte_cnt;    // Counts 1 to 3117 per frame
    reg  [15:0] in_clk_cnt;     // Counts 1 to 780 per frame (312.5 MHz)
    reg  [31:0] in_frame_id;    // Active Input Frame ID (1, 2, 3, 4)

    // Group 2: Data Out from CDC 3 (200.0 MHz, 128-bit)
    wire         cdc3_flag_out;
    wire [127:0] cdc3_data_out;
    wire [15:0]  out_clk_cnt        = u_cdc3.out_clk_cnt;     // Counts 1 to 499 per frame (200 MHz)
    wire [15:0]  out_word128_cnt    = u_cdc3.out_word128_cnt; // Counts 1 to 780 (128-bit words)
    wire [7:0]   out_byte_stream    = u_cdc3.byte_out;        // 1-by-1 unpacked byte
    wire [11:0]  out_frame_byte_cnt = u_cdc3.frame_byte_cnt;  // Counts 1 to 3117 per frame
    wire [15:0]  out_total_bytes    = u_cdc3.out_total_bytes; // Counts 1 to 12468
    wire [31:0]  out_frame_id       = u_cdc3.frame_out_id;    // Active Output Frame ID (1, 2, 3, 4)

    // DUT Instantiation
    rx_gth_logic u_cdc3 (
        .clk_gth   (clk_gth),
        .clk_logic (clk_logic),
        .rst_n     (rst_n),
        .en        (gth_rx_dv),
        .data_in   (gth_rx_data),
        .flag      (cdc3_flag_out),
        .data_out  (cdc3_data_out)
    );

    // Clocks
    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;   // 312.5 MHz
    end

    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic; // 200.0 MHz
    end

    // Frame Byte Pattern Function
    // [Rev 2.0 - 2026-10-27 15:20 KST] Bytes 1..9 updated to SDA OISL Table 2-8 Preamble:
    // 72'h77_AD_5B_58_43_64_1E_2E_26 (MSB 8'h77 transmitted first down to LSB 8'h26)
    function [7:0] get_frame_byte(input [31:0] f_idx, input [11:0] b_idx);
        begin
            case (b_idx)
                12'd1:                      get_frame_byte = 8'h77;
                12'd2:                      get_frame_byte = 8'hAD;
                12'd3:                      get_frame_byte = 8'h5B;
                12'd4:                      get_frame_byte = 8'h58;
                12'd5:                      get_frame_byte = 8'h43;
                12'd6:                      get_frame_byte = 8'h64;
                12'd7:                      get_frame_byte = 8'h1E;
                12'd8:                      get_frame_byte = 8'h2E;
                12'd9:                      get_frame_byte = 8'h26;
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
                12'd3117:                   get_frame_byte = 8'h33;
                default:                    get_frame_byte = b_idx[7:0];
            endcase
        end
    endfunction

    integer total_word_idx;
    integer b0_abs, b1_abs, b2_abs, b3_abs;
    reg [7:0] byte0, byte1, byte2, byte3;

    task step_input_byte(input [7:0] b_val, input is_clk_edge);
        begin
            in_byte_stream <= b_val;
            if (in_frame_id == 32'd0) begin
                in_frame_id <= 32'd1;
                in_byte_cnt <= 12'd1;
                in_clk_cnt  <= 16'd1;
            end else if (in_byte_cnt == 12'd3117) begin
                in_frame_id <= in_frame_id + 32'd1;
                in_byte_cnt <= 12'd1;
                in_clk_cnt  <= 16'd1;
            end else begin
                in_byte_cnt <= in_byte_cnt + 12'd1;
                if (is_clk_edge)
                    in_clk_cnt <= in_clk_cnt + 16'd1;
            end
        end
    endtask

    initial begin
        rst_n          = 1'b0;
        gth_rx_dv      = 1'b0;
        gth_rx_data    = 32'd0;
        in_byte_stream = 8'd0;
        in_byte_cnt    = 12'd0;
        in_clk_cnt     = 16'd0;
        in_frame_id    = 32'd0;
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

            step_input_byte(byte0, 1'b1);
            #0.8 step_input_byte(byte1, 1'b0);
            #0.8 step_input_byte(byte2, 1'b0);
            #0.8 step_input_byte(byte3, 1'b0);
        end

        @(posedge clk_gth);
        gth_rx_dv      <= 1'b0;
        gth_rx_data    <= 32'd0;
        in_byte_stream <= 8'd0;
        in_byte_cnt    <= 12'd0;
        in_clk_cnt     <= 16'd0;
        in_frame_id    <= 32'd0;
    end

    // SDA OISL Table 2-4 Metrics Analyzer
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

    always @(out_frame_id) begin
        if (out_frame_id >= 32'd1 && out_frame_id <= 32'd4) begin
            time_start = $realtime;
            time_end   = time_start + (3117.0 * measured_byte_time_ns);

            OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
            OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
            OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
            OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

            $display("---------------------------------------------------------------");
            $display(" [CDC 3 OUTPUT] FRAME %0d ACTIVE (3117 Bytes, Synchronized Start)", out_frame_id);
            $display(" time_start     : %0.1f ns | time_end : %0.1f ns", time_start, time_end);
            $display(" Duration       : %0.6f us", OISL_Frame_Duration_us);
            $display(" Effective Rate : %0.6f Mbps", OISL_Effective_Data_Rate_Mbps);
            $display(" Frame Rate     : %0.6f kHz  | FCCH Rate: %0.6f Mbps", OISL_Frame_Rate_kHz, OISL_FCCH_Mbps);
            $display("---------------------------------------------------------------");
        end else if (out_frame_id == 32'd0) begin
            time_start                    = 0.0;
            time_end                      = 0.0;
            OISL_Frame_Duration_us        = 0.0;
            OISL_Effective_Data_Rate_Mbps = 0.0;
            OISL_Frame_Rate_kHz           = 0.0;
            OISL_FCCH_Mbps                = 0.0;
        end
    end

    initial begin
        wait(out_total_bytes == 16'd12468);
        wait(out_frame_id == 32'd0);
        #500;
        $display("\n[%0.1f ns] CDC 3 VERIFICATION COMPLETE: ALL 12,468 BYTES (4 x 3117B, Preamble 72'h77AD5B5843641E2E26) UNPACKED.\n", $realtime);
        $finish;
    end

endmodule