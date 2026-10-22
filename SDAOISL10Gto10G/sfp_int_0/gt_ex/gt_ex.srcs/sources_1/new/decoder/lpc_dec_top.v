`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : lpc_dec_top
Description  : 4-Channel Parallel LPC(24,16) Decoder Top Module.
               Compresses 259 words of 96-bit LPC codewords (3108 Bytes) 
               back into 259 words of 64-bit scrambled FEC data (2072 Bytes).

               Revision History:
               - Rev 1.0 (Initial) : 4-channel parallel LPC(24,16) decoder top.
               - Rev 2.0 (2026-10-22 05:47 KST) :
                 1. Updated timescale to 1ns/1ps so fractional byte timing 
                    (2493.6 ns / 2072 bytes) is exact.
                 2. Clocked dec_sim_q writer on negedge clk and maintained 
                    continuous 4-frame unpacking (8288 bytes) so lpc_dec_frame_id 
                    counts 1 -> 2 -> 3 -> 4 without mid-stream resets or 'X'.
===========================================================================
*/

module lpc_dec_top (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        en,
    input  wire [95:0] data_in,
    output wire        flag,
    output wire [63:0] data_out
);

    lpc_dec lpc_dec_3 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[95:72]),
        .flag     (flag),
        .data_out (data_out[63:48])
    );

    lpc_dec lpc_dec_2 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[71:48]),
        .flag     (),
        .data_out (data_out[47:32])
    );

    lpc_dec lpc_dec_1 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[47:24]),
        .flag     (),
        .data_out (data_out[31:16])
    );

    lpc_dec lpc_dec_0 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[23:0]),
        .flag     (),
        .data_out (data_out[15:0])
    );

    // =======================================================
    // SIMULATION TRACKERS: 259 WORDS (64-BIT) & 1..2072 BYTES
    // =======================================================
    // synthesis translate_off
    reg [8:0]  lpc_dec_word_cnt;       // Counts 1 to 259 during active burst
    reg [11:0] lpc_dec_burst_byte_cnt; // Counts 8, 16 .. 2072 during active burst
    reg [15:0] out_clk_cnt;            // 200 MHz clock counter per frame (1..499)

    // SDA OISL Section 2.6.3.6.8 Theoretical Inspection Signals (Channel 3 MSB)
    wire [15:0] sda_lpc_E_rx_ch3      = lpc_dec_3.E_rx;
    wire [7:0]  sda_lpc_P_rx_ch3      = lpc_dec_3.P_rx;
    wire [7:0]  sda_lpc_P_calc_ch3    = lpc_dec_3.P_calc;
    wire [3:0]  sda_lpc_syndrome_H    = lpc_dec_3.SH;
    wire [3:0]  sda_lpc_syndrome_V    = lpc_dec_3.SV;
    wire [15:0] sda_lpc_U_decoded_ch3 = data_out[63:48];

    reg [7:0]  dec_sim_q [0:16383];
    integer    dec_wr_ptr;
    integer    dec_rd_ptr;
    reg        dec_unpack_active;

    reg [7:0]  lpc_dec_byte_stream;
    reg [11:0] lpc_dec_byte_cnt;       // Counts strictly 1 to 2072 per frame
    reg [31:0] lpc_dec_frame_id;       // Active Frame ID (1, 2, 3, 4)
    reg [15:0] lpc_dec_total_bytes;    // Counts 1 to 8288 (4 x 2072 Bytes)

    initial begin
        lpc_dec_word_cnt       = 9'd0;
        lpc_dec_burst_byte_cnt = 12'd0;
        out_clk_cnt            = 16'd0;
        dec_wr_ptr             = 0;
        dec_rd_ptr             = 0;
        dec_unpack_active      = 1'b0;
        lpc_dec_byte_stream    = 8'd0;
        lpc_dec_byte_cnt       = 12'd0;
        lpc_dec_frame_id       = 32'd0;
        lpc_dec_total_bytes    = 16'd0;
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            lpc_dec_word_cnt       <= 9'd0;
            lpc_dec_burst_byte_cnt <= 12'd0;
            out_clk_cnt            <= 16'd0;
        end else begin
            if (en) begin
                if (lpc_dec_word_cnt == 9'd259) begin
                    lpc_dec_word_cnt       <= 9'd1;
                    lpc_dec_burst_byte_cnt <= 12'd8;
                end else begin
                    lpc_dec_word_cnt       <= lpc_dec_word_cnt + 9'd1;
                    lpc_dec_burst_byte_cnt <= (lpc_dec_word_cnt + 12'd1) * 12'd8;
                end
            end else begin
                lpc_dec_word_cnt       <= 9'd0;
                lpc_dec_burst_byte_cnt <= 12'd0;
            end

            if (en && !flag && !dec_unpack_active) begin
                out_clk_cnt <= 16'd1;
            end else if (dec_unpack_active) begin
                if (lpc_dec_byte_cnt <= 12'd4 && out_clk_cnt > 16'd490)
                    out_clk_cnt <= 16'd1;
                else
                    out_clk_cnt <= out_clk_cnt + 16'd1;
            end else begin
                out_clk_cnt <= 16'd0;
            end
        end
    end

    // THREAD B: Negedge Queue Writer (2.5 ns before posedge clk)
    always @(negedge clk or negedge rst_n) begin
        if (~rst_n) begin
            dec_wr_ptr = 0;
        end else if (flag) begin
            dec_sim_q[dec_wr_ptr + 0] = data_out[63:56];
            dec_sim_q[dec_wr_ptr + 1] = data_out[55:48];
            dec_sim_q[dec_wr_ptr + 2] = data_out[47:40];
            dec_sim_q[dec_wr_ptr + 3] = data_out[39:32];
            dec_sim_q[dec_wr_ptr + 4] = data_out[31:24];
            dec_sim_q[dec_wr_ptr + 5] = data_out[23:16];
            dec_sim_q[dec_wr_ptr + 6] = data_out[15:8];
            dec_sim_q[dec_wr_ptr + 7] = data_out[7:0];
            dec_wr_ptr                = dec_wr_ptr + 8;
        end
    end

    // THREAD C: Continuous 4-Frame Unpacker (2072 Bytes per 2493.600 ns frame window)
    real next_dec_edge_ns;
    always @(posedge clk) begin
        if (rst_n && en && !flag && !dec_unpack_active) begin
            dec_unpack_active = 1'b1;
            @(posedge clk); // Align to rising edge of flag Word 1
            #0.001;
            next_dec_edge_ns  = $realtime;
            while (lpc_dec_total_bytes < 16'd8288) begin
                if (dec_rd_ptr == 0)
                    lpc_dec_byte_stream = data_out[63:56];
                else
                    lpc_dec_byte_stream = dec_sim_q[dec_rd_ptr];

                dec_rd_ptr          = dec_rd_ptr + 1;
                lpc_dec_total_bytes = lpc_dec_total_bytes + 16'd1;

                if (lpc_dec_frame_id == 32'd0) begin
                    lpc_dec_frame_id = 32'd1;
                    lpc_dec_byte_cnt = 12'd1;
                end else if (lpc_dec_byte_cnt == 12'd2072) begin
                    lpc_dec_frame_id = lpc_dec_frame_id + 32'd1;
                    lpc_dec_byte_cnt = 12'd1;
                end else begin
                    lpc_dec_byte_cnt = lpc_dec_byte_cnt + 12'd1;
                end

                next_dec_edge_ns = next_dec_edge_ns + (2493.6 / 2072.0);
                #((next_dec_edge_ns - $realtime) > 0.0 ? (next_dec_edge_ns - $realtime) : 0.001);
            end
            lpc_dec_byte_stream = 8'd0;
            lpc_dec_byte_cnt    = 12'd0;
            lpc_dec_frame_id    = 32'd0;
            out_clk_cnt         = 16'd0;
            dec_unpack_active   = 1'b0;
        end
    end
    // synthesis translate_on

endmodule