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
  - Rev 2.3 (2026-11-02 15:00 KST) : [Baseline 27 Functional Packing Change - Write-Side 256-Bit MSB Pre-Packer]
    Replaced the read-side barrel shifter with a write-side 200 MHz 256-bit 
    MSB-first pre-packer ('pack_buf', 'pack_bytes') so 13-byte frame tails 
    (cdc_keep == 16'h1FFF) are packed into contiguous 128-bit words before 
    entering cross_logic_gth, and aligned 'flag'/'data_out' with accepted FIFO 
    reads ('rd_en && !fifo_empty && !rd_rst_busy').
  - Rev 2.4 (2026-11-05 04:30 KST) : [Audit Fix - Coherent Handshake Snapshot, Accepted-Read Counter & Stall Hold]
    1. Fixed wire identifier typo ('stream_burst_done').
    2. Replaced multi-bit step Gray conversion of 'target_gth_words' with:
       (a) a single-step (+1 per FIFO write) Gray-coded write beat counter 
           ('wr_fifo_beats_gray'), and
       (b) a coherent Req/Ack handshake snapshot ('snap_req' <-> 'snap_ack') 
           that holds 'snap_gth_words_hold' stable across clock domains.
    3. Updated 'gth_words_read' to increment strictly on accepted FIFO reads 
       ('rd_accept = rd_en && !fifo_empty && !rd_rst_busy') matching 'rd_en_d1'.
    4. Added stall-holding on 'fifo_wr_req' / 'fifo_din' if '!cdc2_ready' and 
       updated the simulation byte monitor to hold its position when valid is low.
  - Rev 2.5 (2026-11-05 05:35 KST) : [Audit Fix - Strict Declaration-Before-Use Order]
    Moved the declaration of 'reg snap_ack_gth;' above its first reference in 
    the clk_logic snapshot handshake block to comply with strict Verilog 
    declaration-before-use rules.
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
    wire [31:0] fifo_out;

    // Internal FIFO write-side readiness indicator (not an external upstream port)
    wire        cdc2_ready = ~fifo_full & ~wr_rst_busy;

    // =======================================================
    // 1. MSB-FIRST 256-BIT PRE-PACKER (WRITE DOMAIN - 200 MHz)
    // =======================================================
    reg [255:0] pack_buf;
    reg [5:0]   pack_bytes; 
    reg [127:0] fifo_din;
    reg         fifo_wr_req;
    reg [9:0]   idle_gap_cnt;
    reg         writer_flushed;
    reg [15:0]  wr_stall_hold_cnt;

    wire        fifo_wr_en     = fifo_wr_req && cdc2_ready;
    wire        wr_req_stalled = fifo_wr_req && !cdc2_ready;
    wire        accept_in      = en && data_in_dv && cdc2_ready && !wr_req_stalled;

    wire [127:0] clean_in = (cdc_keep == 16'hFFFF) ? data_in : 
                            (cdc_keep == 16'h1FFF) ? {data_in[127:24], 24'd0} : 128'd0;
    wire [5:0]   in_bytes = (cdc_keep == 16'hFFFF) ? 6'd16 : 
                            (cdc_keep == 16'h1FFF) ? 6'd13 : 6'd0;

    wire [255:0] shifted_in_full = {clean_in, 128'd0} >> ((pack_bytes - 6'd16) * 8);
    wire [255:0] shifted_in_norm = {clean_in, 128'd0} >> (pack_bytes * 8);

    // Flush residual bytes (<16B) when either 'en' deasserts OR input stream has been 
    // idle for >310 clk_logic cycles (exceeding the 304-cycle FEC inter-frame gap).
    wire         flush_residual  = (pack_bytes > 6'd0) && (!accept_in) &&
                                   ((!en) || (idle_gap_cnt >= 10'd310));

    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            pack_buf          <= 256'd0;
            pack_bytes        <= 6'd0;
            fifo_wr_req       <= 1'b0;
            fifo_din          <= 128'd0;
            idle_gap_cnt      <= 10'd0;
            writer_flushed    <= 1'b0;
            wr_stall_hold_cnt <= 16'd0;
        end else begin
            if (wr_req_stalled) begin
                // Hold pending fifo_wr_req and fifo_din intact until cdc2_ready asserts
                fifo_wr_req       <= 1'b1;
                wr_stall_hold_cnt <= wr_stall_hold_cnt + 16'd1;
            end else begin
                fifo_wr_req <= 1'b0;

                if (accept_in) begin
                    idle_gap_cnt   <= 10'd0;
                    writer_flushed <= 1'b0;
                end else if (pack_bytes > 6'd0 && idle_gap_cnt < 10'd1023) begin
                    idle_gap_cnt   <= idle_gap_cnt + 10'd1;
                end else if (pack_bytes == 6'd0) begin
                    idle_gap_cnt   <= 10'd0;
                end

                if (pack_bytes >= 6'd16) begin
                    fifo_din    <= pack_buf[255:128];
                    fifo_wr_req <= 1'b1;

                    if (accept_in) begin
                        pack_buf   <= (pack_buf << 128) | shifted_in_full;
                        pack_bytes <= pack_bytes - 6'd16 + in_bytes;
                    end else begin
                        pack_buf   <= (pack_buf << 128);
                        pack_bytes <= pack_bytes - 6'd16;
                    end
                end 
                else if (accept_in) begin
                    pack_buf   <= pack_buf | shifted_in_norm;
                    pack_bytes <= pack_bytes + in_bytes;
                end
                else if (flush_residual) begin
                    fifo_din       <= pack_buf[255:128];
                    fifo_wr_req    <= 1'b1;
                    pack_buf       <= 256'd0;
                    pack_bytes     <= 6'd0;
                    writer_flushed <= 1'b1;
                end
            end
        end
    end

    // =======================================================
    // 2. COHERENT CROSS-DOMAIN COUNTER TRANSFER (200 MHz -> 312.5 MHz)
    //    (a) Single-Step (+1) Gray-Coded 128-Bit FIFO Write Beat Counter
    //    (b) Req/Ack Handshake Snapshot for Exact 32-Bit Target Word Count
    // =======================================================
    reg  [31:0] wr_fifo_beats;
    reg  [31:0] wr_fifo_beats_gray;
    wire [31:0] wr_fifo_beats_next = wr_fifo_beats + (fifo_wr_en ? 32'd1 : 32'd0);

    reg  [31:0] total_bytes_in_logic;
    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            wr_fifo_beats        <= 32'd0;
            wr_fifo_beats_gray   <= 32'd0;
            total_bytes_in_logic <= 32'd0;
        end else begin
            wr_fifo_beats      <= wr_fifo_beats_next;
            wr_fifo_beats_gray <= wr_fifo_beats_next ^ (wr_fifo_beats_next >> 1);
            if (accept_in)
                total_bytes_in_logic <= total_bytes_in_logic + {26'd0, in_bytes};
        end
    end

    wire [31:0] target_gth_words = (total_bytes_in_logic + 32'd3) >> 2;

    // Coherent Req/Ack Snapshot Handshake (all registers declared before first use)
    reg         snap_req;
    reg         snap_ack_gth;
    reg  [31:0] snap_gth_words_hold;
    reg         snap_flushed_hold;
    (* ASYNC_REG = "TRUE" *) reg        snap_ack_s1,           snap_ack_s2;
    (* ASYNC_REG = "TRUE" *) reg [31:0] wr_fifo_beats_gray_s1, wr_fifo_beats_gray_s2;
    (* ASYNC_REG = "TRUE" *) reg        snap_req_s1,           snap_req_s2;
    reg  [31:0]                         total_words_written_sync1;
    reg                                 writer_flushed_sync2;

    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            snap_req            <= 1'b0;
            snap_gth_words_hold <= 32'd0;
            snap_flushed_hold   <= 1'b0;
            snap_ack_s1         <= 1'b0;
            snap_ack_s2         <= 1'b0;
        end else begin
            snap_ack_s1 <= snap_ack_gth;
            snap_ack_s2 <= snap_ack_s1;
            if (snap_req == snap_ack_s2) begin
                if ((target_gth_words != snap_gth_words_hold) ||
                    (writer_flushed   != snap_flushed_hold)) begin
                    snap_gth_words_hold <= target_gth_words;
                    snap_flushed_hold   <= writer_flushed;
                    snap_req            <= ~snap_req;
                end
            end
        end
    end

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

    wire [31:0] wr_fifo_beats_gth = gray2bin32(wr_fifo_beats_gray_s2);

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            wr_fifo_beats_gray_s1     <= 32'd0;
            wr_fifo_beats_gray_s2     <= 32'd0;
            snap_req_s1               <= 1'b0;
            snap_req_s2               <= 1'b0;
            snap_ack_gth              <= 1'b0;
            total_words_written_sync1 <= 32'd0;
            writer_flushed_sync2      <= 1'b0;
        end else begin
            wr_fifo_beats_gray_s1 <= wr_fifo_beats_gray;
            wr_fifo_beats_gray_s2 <= wr_fifo_beats_gray_s1;
            snap_req_s1           <= snap_req;
            snap_req_s2           <= snap_req_s1;
            if (snap_req_s2 != snap_ack_gth) begin
                total_words_written_sync1 <= snap_gth_words_hold;
                writer_flushed_sync2      <= snap_flushed_hold;
                snap_ack_gth              <= snap_req_s2;
            end
        end
    end

    // =======================================================
    // 3. XILINX NATIVE FIFO INSTANTIATION (128-bit -> 32-bit)
    // =======================================================
    reg rd_en;

    cross_logic_gth cross_inst (
        .srst        (~rst_n),      
        .wr_clk      (clk_logic),   
        .wr_en       (fifo_wr_en),  
        .din         (fifo_din),     
        .rd_clk      (clk_gth),     
        .rd_en       (rd_en),       
        .dout        (fifo_out),    
        .full        (fifo_full),
        .empty       (fifo_empty),
        .wr_rst_busy (wr_rst_busy),
        .rd_rst_busy (rd_rst_busy)
    );

    // =======================================================
    // 4. ELASTIC BUFFER FSM & ACCEPTED-READ PIPELINE (READ DOMAIN - 312.5 MHz)
    // =======================================================
    localparam ST_IDLE   = 2'd0;
    localparam ST_BUFFER = 2'd1;
    localparam ST_STREAM = 2'd2;

    reg  [1:0]  state;
    reg  [8:0]  start_delay;
    reg         rd_en_d1;
    reg  [31:0] gth_words_read;

    // [Rev 2.4 - Audit Fix C] Count only actual accepted FIFO reads
    wire        rd_accept           = rd_en && !fifo_empty && !rd_rst_busy;
    wire [31:0] next_gth_words_read = gth_words_read + (rd_accept ? 32'd1 : 32'd0);
    wire        stream_burst_done   = (!en || writer_flushed_sync2) &&
                                      (total_words_written_sync1 > 32'd0) &&
                                      (next_gth_words_read >= total_words_written_sync1);

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            state          <= ST_IDLE;
            start_delay    <= 9'd0;
            rd_en          <= 1'b0;
            gth_words_read <= 32'd0;
        end else begin
            gth_words_read <= next_gth_words_read;

            case (state)
                ST_IDLE: begin
                    rd_en <= 1'b0;
                    if (en && !fifo_empty && !rd_rst_busy &&
                        ((wr_fifo_beats_gth > 32'd0) || (gth_words_read < total_words_written_sync1))) begin
                        state       <= ST_BUFFER;
                        start_delay <= 9'd0;
                    end
                end
                ST_BUFFER: begin
                    if (start_delay < 9'd50) begin
                        start_delay <= start_delay + 1'b1;
                    end else begin
                        state <= ST_STREAM;
                        rd_en <= 1'b1;
                    end
                end
                ST_STREAM: begin
                    if (stream_burst_done || fifo_empty) begin
                        rd_en <= 1'b0;
                        state <= ST_IDLE;
                    end else begin
                        rd_en <= 1'b1;
                    end
                end
                default: state <= ST_IDLE;
            endcase
        end
    end

    // [Rev 2.3 & Rev 2.4] Output valid and data follow accepted FIFO reads
    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            rd_en_d1 <= 1'b0;
            flag     <= 1'b0;
            data_out <= 32'd0;
        end else begin
            rd_en_d1 <= rd_accept;
            flag     <= rd_en_d1;
            data_out <= rd_en_d1 ? fifo_out : 32'd0;
        end
    end

    // =======================================================
    // 5. SIMULATION WAVEFORM BYTE UNPACKER VISUALIZATION (1..3117)
    //    Note: Sub-cycle #0.8 stepping is an auxiliary visualization of the 
    //          4 bytes inside each 32-bit word; frame counters hold position 
    //          when rd_en_d1 is low so valid-low gaps never lose byte coordinates.
    // =======================================================
    // synthesis translate_off
    reg [7:0]  byte_out;
    reg [11:0] frame_byte_cnt;
    reg [15:0] out_clk_cnt;
    reg [31:0] frame_out_id;
    reg [31:0] cur_word;

    task step_single_byte(input [7:0] b_val, input is_clk_rising);
    begin
        byte_out <= b_val;
        if (frame_out_id == 32'd0) begin
            frame_out_id   <= 32'd1;
            frame_byte_cnt <= 12'd1;
            out_clk_cnt    <= 16'd1;
        end else if (frame_byte_cnt == 12'd3117) begin
            frame_out_id   <= frame_out_id + 1'b1;
            frame_byte_cnt <= 12'd1;
            out_clk_cnt    <= 16'd1;
        end else begin
            frame_byte_cnt <= frame_byte_cnt + 12'd1;
            if (is_clk_rising)
                out_clk_cnt <= out_clk_cnt + 16'd1;
        end
    end
    endtask

    always @(negedge rst_n) begin
        if (!rst_n) begin
            byte_out       <= 8'd0;
            frame_byte_cnt <= 12'd0;
            out_clk_cnt    <= 16'd0;
            frame_out_id   <= 32'd0;
            cur_word       <= 32'd0;
        end
    end

    always @(posedge clk_gth) begin
        if (rst_n) begin
            if (rd_en_d1) begin
                cur_word = fifo_out;
                step_single_byte(cur_word[31:24], 1'b1);
                #0.8 step_single_byte(cur_word[23:16], 1'b0);
                #0.8 step_single_byte(cur_word[15:8],  1'b0);
                #0.8 step_single_byte(cur_word[7:0],   1'b0);
            end else begin
                // Hold frame_byte_cnt, out_clk_cnt, and frame_out_id across valid-low cycles
                byte_out <= 8'd0;
            end
        end
    end
    // synthesis translate_on

endmodule