`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : x_logic_gth
Description  : Clock Domain Crossing 2 (CDC 2) & Modulo-4 Byte-Packing Shifter.
               - Bridges the 200.0 MHz 128-bit MUX Gearbox domain to the 
                 312.5 MHz 32-bit GTH TX domain via cross_logic_gth FIFO.
               - Strips the 3 trailing zero-padding bytes on the 195th word 
                 (cdc_keep == 16'h1FFF -> 13 valid bytes) and seamlessly packs 
                 consecutive 3117-Byte frames back-to-back across 32-bit word 
                 boundaries (4 frames = 12,468 Bytes = 3117 clocks @ 312.5 MHz, 
                 exact 2.493600 us per frame).

Revision History:
  - Rev 1.0 (Initial) : 128-to-32 bit CDC 2 with modulo-4 byte barrel shifter.
  - Rev 2.2 (2026-10-28 14:55 KST) : [Gray-Code CDC & FIFO Full Protection]
    1. Converted cross-domain frame counter (wr_frame_cnt) to Gray Code 
       (wr_frame_gray) before the 2-stage synchronizer (marked with 
       ASYNC_REG = "TRUE") and decoded Gray-to-Binary in the clk_gth domain 
       to eliminate multi-bit binary CDC sampling glitches.
    2. Gated FIFO write enable (fifo_wr_en) with !fifo_full & !wr_rst_busy 
       and exposed 'cdc2_ready' for lossless upstream flow control.
===========================================================================
*/

module x_logic_gth (
    input  wire         clk_gth,     // 312.5 MHz Read Domain
    input  wire         clk_logic,   // 200.0 MHz Write Domain
    input  wire         rst_n,
    input  wire         en,
    input  wire [127:0] data_in,
    input  wire         data_in_dv,
    input  wire [15:0]  cdc_keep,
    output reg          flag,
    output reg  [31:0]  data_out
);

    wire        fifo_full;
    wire        fifo_empty;
    wire        wr_rst_busy;
    wire        rd_rst_busy;
    wire [31:0] fifo_dout;
    wire        cdc2_ready = ~fifo_full & ~wr_rst_busy;

    // =======================================================
    // 1. WRITE DOMAIN (200 MHz): FRAME TRACKER & GRAY-CODE CDC
    // =======================================================
    reg [7:0]  wr_word_idx;
    reg [31:0] wr_frame_cnt;
    wire       fifo_wr_en = en && data_in_dv && (~fifo_full) && (~wr_rst_busy);

    // Binary-to-Gray conversion in clk_logic domain
    wire [31:0] wr_frame_gray_next = wr_frame_cnt ^ (wr_frame_cnt >> 1);
    reg  [31:0] wr_frame_gray;

    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            wr_word_idx   <= 8'd0;
            wr_frame_cnt  <= 32'd0;
            wr_frame_gray <= 32'd0;
        end else begin
            wr_frame_gray <= wr_frame_gray_next;
            if (fifo_wr_en) begin
                if ((cdc_keep == 16'h1FFF) || (wr_word_idx == 8'd194)) begin
                    wr_word_idx  <= 8'd0;
                    wr_frame_cnt <= wr_frame_cnt + 32'd1;
                end else begin
                    wr_word_idx  <= wr_word_idx + 8'd1;
                end
            end else if (!data_in_dv) begin
                wr_word_idx <= 8'd0;
            end
        end
    end

    // 2-Stage Gray-Code Synchronizer into clk_gth (312.5 MHz) Domain
    (* ASYNC_REG = "TRUE" *) reg [31:0] wr_frame_gray_sync1;
    (* ASYNC_REG = "TRUE" *) reg [31:0] wr_frame_gray_sync2;

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            wr_frame_gray_sync1 <= 32'd0;
            wr_frame_gray_sync2 <= 32'd0;
        end else begin
            wr_frame_gray_sync1 <= wr_frame_gray;
            wr_frame_gray_sync2 <= wr_frame_gray_sync1;
        end
    end

    // Gray-to-Binary conversion in clk_gth domain
    function [31:0] gray2bin32(input [31:0] g);
        integer k;
        reg [31:0] b;
        begin
            b[31] = g[31];
            for (k = 30; k >= 0; k = k - 1) begin
                b[k] = b[k + 1] ^ g[k];
            end
            gray2bin32 = b;
        end
    endfunction

    wire [31:0] wr_frame_cnt_gth = gray2bin32(wr_frame_gray_sync2);

    // =======================================================
    // 2. ASYNCHRONOUS FIFO (128-bit @ 200M -> 32-bit @ 312.5M)
    // =======================================================
    reg  [11:0] pop_word_idx;
    wire         need_word;
    wire        fifo_rd_en = (~fifo_empty) && (~rd_rst_busy) && need_word;

    cross_logic_gth u_async_fifo (
        .srst        (~rst_n),
        .wr_clk      (clk_logic),
        .rd_clk      (clk_gth),
        .din         (data_in),
        .wr_en       (fifo_wr_en),
        .rd_en       (fifo_rd_en),
        .dout        (fifo_dout),
        .full        (fifo_full),
        .empty       (fifo_empty),
        .wr_rst_busy (wr_rst_busy),
        .rd_rst_busy (rd_rst_busy)
    );

    // =======================================================
    // 3. READ DOMAIN (312.5 MHz): 3117-BYTE BARREL SHIFTER
    // =======================================================
    reg  [1:0]  pipe_valid;
    reg  [2:0]  pipe_bytes_0;
    reg  [2:0]  pipe_bytes_1;
    wire [2:0]  popped_valid_bytes = (pop_word_idx == 12'd779) ? 3'd1 : 3'd4;

    reg  [95:0] shift_reg;
    reg  [4:0]  avail_bytes;
    reg         stream_active;
    reg  [31:0] rd_frame_cnt;
    reg  [11:0] rd_frame_bytes;

    wire        has_4_bytes    = (avail_bytes >= 5'd4);
    wire        is_final_flush = stream_active && (rd_frame_cnt + 32'd1 >= wr_frame_cnt_gth) &&
                                 fifo_empty && (!pipe_valid[0]) && (!pipe_valid[1]) &&
                                 (avail_bytes > 5'd0) && (avail_bytes < 5'd4);
    wire [4:0]  bytes_consumed = has_4_bytes ? 5'd4 : (is_final_flush ? avail_bytes : 5'd0);
    wire [4:0]  next_avail_pre = avail_bytes - bytes_consumed;

    assign need_word = stream_active && (avail_bytes <= 5'd8);

    wire [95:0] shifted_reg    = shift_reg << (bytes_consumed * 8);
    wire [95:0] incoming_alg   = ({fifo_dout, 64'd0} &
                                  ((pipe_bytes_1 == 3'd1) ? 96'hFF00_0000_0000_0000_0000_0000 :
                                                            96'hFFFF_FFFF_0000_0000_0000_0000))
                                 >> (next_avail_pre * 8);

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            pop_word_idx   <= 12'd0;
            pipe_valid     <= 2'b00;
            pipe_bytes_0   <= 3'd0;
            pipe_bytes_1   <= 3'd0;
            shift_reg      <= 96'd0;
            avail_bytes    <= 5'd0;
            stream_active  <= 1'b0;
            rd_frame_cnt   <= 32'd0;
            rd_frame_bytes <= 12'd0;
            flag           <= 1'b0;
            data_out       <= 32'd0;
        end else begin
            // 2-Cycle FIFO Read Pipeline (C_PRELOAD_LATENCY = 2)
            pipe_valid[0] <= fifo_rd_en;
            pipe_valid[1] <= pipe_valid[0];
            pipe_bytes_0  <= fifo_rd_en ? popped_valid_bytes : 3'd0;
            pipe_bytes_1  <= pipe_bytes_0;

            if (fifo_rd_en) begin
                if (pop_word_idx == 12'd779)
                    pop_word_idx <= 12'd0;
                else
                    pop_word_idx <= pop_word_idx + 12'd1;
            end else if (!stream_active && fifo_empty) begin
                pop_word_idx <= 12'd0;
            end

            // Start streaming once at least 1 complete frame is buffered in FIFO
            if (!stream_active) begin
                if (wr_frame_cnt_gth > rd_frame_cnt) begin
                    stream_active <= 1'b1;
                end
                flag     <= 1'b0;
                data_out <= 32'd0;
            end else begin
                if (has_4_bytes || is_final_flush) begin
                    flag     <= 1'b1;
                    data_out <= shift_reg[95:64];
                    if (rd_frame_bytes + {7'd0, bytes_consumed} >= 12'd3117) begin
                        rd_frame_bytes <= (rd_frame_bytes + {7'd0, bytes_consumed}) - 12'd3117;
                        rd_frame_cnt   <= rd_frame_cnt + 32'd1;
                    end else begin
                        rd_frame_bytes <= rd_frame_bytes + {7'd0, bytes_consumed};
                    end
                end else begin
                    flag     <= 1'b0;
                    data_out <= 32'd0;
                    if (fifo_empty && (!pipe_valid[0]) && (!pipe_valid[1]) && (avail_bytes == 5'd0)) begin
                        stream_active <= 1'b0;
                    end
                end
            end

            // Update Barrel Shifter
            if (pipe_valid[1]) begin
                shift_reg   <= shifted_reg | incoming_alg;
                avail_bytes <= next_avail_pre + {2'd0, pipe_bytes_1};
            end else begin
                shift_reg   <= shifted_reg;
                avail_bytes <= next_avail_pre;
            end
        end
    end

    // =======================================================
    // 4. SUB-CYCLE 0.8 NS BYTE & FRAME TRACKERS (For Waveform)
    // =======================================================
    reg [7:0]  byte_out;
    reg [15:0] out_clk_cnt;
    reg [11:0] frame_byte_cnt;
    reg [31:0] frame_out_id;

`ifndef SYNTHESIS
    integer b_sub;
    reg [31:0] cur_w;
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            byte_out       <= 8'h00;
            out_clk_cnt    <= 16'd0;
            frame_byte_cnt <= 12'd0;
            frame_out_id   <= 32'd0;
        end else begin
            #0.001;
            if (flag) begin
                cur_w = data_out;
                if (frame_out_id == 32'd0) begin
                    frame_out_id   = 32'd1;
                    out_clk_cnt    = 16'd1;
                    frame_byte_cnt = 12'd0;
                end else begin
                    out_clk_cnt    = out_clk_cnt + 16'd1;
                end

                for (b_sub = 0; b_sub < 4; b_sub = b_sub + 1) begin
                    if (b_sub > 0) #(0.8);
                    byte_out = cur_w[31 - (b_sub * 8) -: 8];
                    if (frame_byte_cnt == 12'd3117) begin
                        frame_byte_cnt = 12'd1;
                        frame_out_id   = frame_out_id + 32'd1;
                        out_clk_cnt    = 16'd1;
                    end else begin
                        frame_byte_cnt = frame_byte_cnt + 12'd1;
                    end
                end
            end else begin
                byte_out       <= 8'h00;
                out_clk_cnt    <= 16'd0;
                frame_byte_cnt <= 12'd0;
                frame_out_id   <= 32'd0;
            end
        end
    end
`else
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            byte_out       <= 8'h00;
            out_clk_cnt    <= 16'd0;
            frame_byte_cnt <= 12'd0;
            frame_out_id   <= 32'd0;
        end else if (flag) begin
            byte_out       <= data_out[31:24];
            out_clk_cnt    <= out_clk_cnt + 16'd1;
            frame_byte_cnt <= (frame_byte_cnt >= 12'd3114) ? 12'd3117 : (frame_byte_cnt + 12'd4);
            if (frame_out_id == 32'd0) frame_out_id <= 32'd1;
        end else begin
            byte_out       <= 8'h00;
            out_clk_cnt    <= 16'd0;
            frame_byte_cnt <= 12'd0;
            frame_out_id   <= 32'd0;
        end
    end
`endif

endmodule