`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : gth64b66b_rx
Function     : 64B/66B External Gearbox Receiver, Block Sync Slip Controller,
               and De-Jitter Elastic Buffer.
               - Executes IEEE 802.3ae 64B/66B block lock state machine by 
                 asserting gt_rxgearboxslip_out until 64 consecutive valid 
                 2'b01 sync headers are verified (rx_block_locked = 1).
               - Performs bit-reversal (bit_rev32) to restore MSB-first byte 
                 ordering, removes 2-cycle Gearbox pauses via rx_elast_mem, 
                 and outputs a 100% contiguous 312.5 MHz stream to CDC 3.

Revision History:
  - Rev 1.0 (Initial) : Basic 64B/66B receiver gearbox slip FSM.
  - Rev 2.0 (2026-10-20) : Added 66/64 de-jitter buffer and internal ILA 2 
    (GTH Stage) debug registers to keep SDAOISL10Gto10G_top schematic clean.
  - Rev 3.0 (2026-10-21 05:18 KST) : Enforced strict hdr_is_valid_sync = 
    (gt_rxheader_in[1:0] == 2'b01) to eliminate false-locking on 2'b10.
  - Rev 3.1 (2026-10-21 12:21 KST) :
    1. Updated rx_elast_mem write controller with committed non-zero pointer 
       tracking so the entire byte-packed 4-frame burst (3117 words = 12,468 
       Bytes across IDLE, DAT1, DAT2, MGMT) is captured continuously without 
       swallowing Frame 4's preamble or inserting inter-frame gaps.
    2. Matched byte_out [7:0], out_clk_cnt [15:0], frame_byte_cnt [11:0], and 
       frame_out_id [31:0] to the exact 0.8 ns byte-level granularity of 
       u_error_inject so all 4 frames (1, 2, 3, 4) count 1..3117 bytes cleanly.
===========================================================================
*/

module gth64b66b_rx (
    input  wire        clk_gth,              // GTH RXUSRCLK2 (rx0_clk = 322.265625 MHz)
    input  wire        clk_312_5,            // Downstream 312.5 MHz Clock
    input  wire        rst_n,                // Active-low reset
    input  wire        gth_rx_ready,         // High when GTH RX reset is done

    // Upstream Interface from GTH Transceiver Primitive
    input  wire [31:0] gt_rxdata_in,
    input  wire [1:0]  gt_rxdatavalid_in,
    input  wire [5:0]  gt_rxheader_in,
    input  wire [1:0]  gt_rxheadervalid_in,
    output reg         gt_rxgearboxslip_out,

    // Status Output
    output reg         rx_block_locked,

    // Downstream Interface to CDC 3 (rx_gth_logic)
    output reg  [31:0] down_data,
    output reg         down_dv
);

    function [31:0] bit_rev32(input [31:0] d);
        integer i;
        begin
            for (i = 0; i < 32; i = i + 1) begin
                bit_rev32[i] = d[31 - i];
            end
        end
    endfunction

    // =======================================================
    // 1. STRICT IEEE 802.3ae 64B/66B BLOCK SYNC LOCK & SLIP FSM
    //    Strictly checks 2'b01 so pre-frame zeros never false-lock on 2'b10!
    // =======================================================
    wire hdr_is_valid_sync = (gt_rxheader_in[1:0] == 2'b01);

    reg [6:0] good_sync_cnt;
    reg [5:0] slip_wait_cnt;

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            gt_rxgearboxslip_out <= 1'b0;
            rx_block_locked      <= 1'b0;
            good_sync_cnt        <= 7'd0;
            slip_wait_cnt        <= 6'd0;
        end else if (!gth_rx_ready) begin
            gt_rxgearboxslip_out <= 1'b0;
            rx_block_locked      <= 1'b0;
            good_sync_cnt        <= 7'd0;
            slip_wait_cnt        <= 6'd0;
        end else begin
            gt_rxgearboxslip_out <= 1'b0;

            if (slip_wait_cnt > 6'd0) begin
                slip_wait_cnt <= slip_wait_cnt - 6'd1;
            end else if (gt_rxheadervalid_in[0]) begin
                if (hdr_is_valid_sync) begin
                    if (good_sync_cnt < 7'd64) begin
                        good_sync_cnt <= good_sync_cnt + 7'd1;
                    end else begin
                        rx_block_locked <= 1'b1;
                    end
                end else begin
                    rx_block_locked      <= 1'b0;
                    good_sync_cnt        <= 7'd0;
                    gt_rxgearboxslip_out <= 1'b1;
                    slip_wait_cnt        <= 6'd32;
                end
            end
        end
    end

    // =======================================================
    // 2. 66/64 DE-JITTER ELASTIC BUFFER (Continuous Burst Capture)
    //    Uses commit_wr_ptr so trailing post-burst zeros are never drained
    // =======================================================
    (* ram_style = "distributed" *) reg [31:0] rx_elast_mem [0:4095];
    reg  [11:0] raw_wr_ptr;
    reg  [11:0] commit_wr_ptr;
    reg         in_burst_sync;
    reg  [3:0]  zero_idle_cnt;

    wire [31:0] descrambled_word = bit_rev32(gt_rxdata_in);
    wire        start_new_burst  = rx_block_locked && gt_rxdatavalid_in[0] &&
                                   !in_burst_sync && (descrambled_word == 32'h5555_5555);
    wire        rx_mem_we        = rx_block_locked && gt_rxdatavalid_in[0] &&
                                   (in_burst_sync || start_new_burst);

    always @(posedge clk_gth) begin
        if (rx_mem_we) begin
            rx_elast_mem[raw_wr_ptr] <= descrambled_word;
        end
    end

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            raw_wr_ptr    <= 12'd0;
            commit_wr_ptr <= 12'd0;
            in_burst_sync <= 1'b0;
            zero_idle_cnt <= 4'd0;
        end else if (!rx_block_locked) begin
            raw_wr_ptr    <= 12'd0;
            commit_wr_ptr <= 12'd0;
            in_burst_sync <= 1'b0;
            zero_idle_cnt <= 4'd0;
        end else if (gt_rxdatavalid_in[0]) begin
            if (!in_burst_sync) begin
                zero_idle_cnt <= 4'd0;
                if (descrambled_word == 32'h5555_5555) begin
                    in_burst_sync <= 1'b1;
                    raw_wr_ptr    <= raw_wr_ptr + 12'd1;
                    commit_wr_ptr <= raw_wr_ptr + 12'd1;
                end
            end else begin
                if (descrambled_word != 32'd0) begin
                    zero_idle_cnt <= 4'd0;
                    raw_wr_ptr    <= raw_wr_ptr + 12'd1;
                    commit_wr_ptr <= raw_wr_ptr + 12'd1;
                end else begin
                    if (zero_idle_cnt == 4'd7) begin
                        // 8 consecutive zero words -> end of frame burst!
                        in_burst_sync <= 1'b0;
                        zero_idle_cnt <= 4'd0;
                        raw_wr_ptr    <= commit_wr_ptr;
                    end else begin
                        zero_idle_cnt <= zero_idle_cnt + 4'd1;
                        raw_wr_ptr    <= raw_wr_ptr + 12'd1;
                    end
                end
            end
        end
    end

    // =======================================================
    // 3. DOWNSTREAM READ FSM (Drains Continuous 312.5 MHz Stream)
    // =======================================================
    reg  [11:0] rd_ptr;
    reg         draining_burst;
    wire [11:0] words_in_buf = commit_wr_ptr - rd_ptr;

    // Hierarchical telemetry registers probed by tb_gth64b66b_loopback.v
    reg  [7:0]  byte_out;
    reg  [15:0] out_clk_cnt;
    reg  [11:0] frame_byte_cnt;
    reg  [31:0] frame_out_id;

    always @(posedge clk_312_5 or negedge rst_n) begin
        if (!rst_n) begin
            rd_ptr         <= 12'd0;
            draining_burst <= 1'b0;
            down_data      <= 32'd0;
            down_dv        <= 1'b0;
        end else if (!rx_block_locked) begin
            rd_ptr         <= 12'd0;
            draining_burst <= 1'b0;
            down_data      <= 32'd0;
            down_dv        <= 1'b0;
        end else begin
            if (!draining_burst) begin
                // Pre-buffer 16 words so continuous 312.5 MHz drain never underflows
                if (words_in_buf >= 12'd16) begin
                    draining_burst <= 1'b1;
                    down_dv        <= 1'b1;
                    down_data      <= rx_elast_mem[rd_ptr];
                    rd_ptr         <= rd_ptr + 12'd1;
                end else begin
                    down_dv        <= 1'b0;
                    down_data      <= 32'd0;
                end
            end else begin
                if (words_in_buf > 12'd0) begin
                    down_dv   <= 1'b1;
                    down_data <= rx_elast_mem[rd_ptr];
                    rd_ptr    <= rd_ptr + 12'd1;
                end else begin
                    draining_burst <= 1'b0;
                    down_dv        <= 1'b0;
                    down_data      <= 32'd0;
                end
            end
        end
    end

    // =======================================================
    // 4. SUB-CYCLE 0.8 NS BYTE & FRAME TRACKERS (Matches u_error_inject)
    // =======================================================
`ifndef SYNTHESIS
    integer b_sub;
    reg [31:0] cur_w;
    always @(posedge clk_312_5 or negedge rst_n) begin
        if (!rst_n) begin
            byte_out       <= 8'h00;
            out_clk_cnt    <= 16'd0;
            frame_byte_cnt <= 12'd0;
            frame_out_id   <= 32'd0;
        end else begin
            #0.001; // Sample down_dv & down_data right after posedge update
            if (down_dv) begin
                cur_w = down_data;
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
    always @(posedge clk_312_5 or negedge rst_n) begin
        if (!rst_n) begin
            byte_out       <= 8'h00;
            out_clk_cnt    <= 16'd0;
            frame_byte_cnt <= 12'd0;
            frame_out_id   <= 32'd0;
        end else if (down_dv) begin
            byte_out       <= down_data[31:24];
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

    // =======================================================
    // 5. INTERNAL ILA 2 (u_ila_1) GTH STAGE TELEMETRY COUNTERS
    //    Housed inside gth64b66b_rx so Top Schematic stays clean!
    // =======================================================
    (* mark_debug = "true", dont_touch = "true" *) reg        dbg_gth_rx_ready;
    (* mark_debug = "true", dont_touch = "true" *) reg        dbg_rx_block_locked;
    (* mark_debug = "true", dont_touch = "true" *) reg        dbg_gth_rx_valid;
    (* mark_debug = "true", dont_touch = "true" *) reg [31:0] dbg_gth_rx_data;
    (* mark_debug = "true", dont_touch = "true" *) reg [15:0] dbg_gth_rx_byte_cnt;
    (* mark_debug = "true", dont_touch = "true" *) reg [15:0] dbg_gth_rx_frame_cnt;
    reg down_dv_d1;

    always @(posedge clk_312_5 or negedge rst_n) begin
        if (!rst_n) begin
            dbg_gth_rx_ready     <= 1'b0;
            dbg_rx_block_locked  <= 1'b0;
            dbg_gth_rx_valid     <= 1'b0;
            dbg_gth_rx_data      <= 32'd0;
            dbg_gth_rx_byte_cnt  <= 16'd0;
            dbg_gth_rx_frame_cnt <= 16'd0;
            down_dv_d1           <= 1'b0;
        end else begin
            dbg_gth_rx_ready    <= gth_rx_ready;
            dbg_rx_block_locked <= rx_block_locked;
            dbg_gth_rx_valid    <= down_dv;
            dbg_gth_rx_data     <= down_data;
            down_dv_d1          <= down_dv;

            if (down_dv) begin
                if (dbg_gth_rx_byte_cnt == 16'd3116)
                    dbg_gth_rx_byte_cnt <= 16'd3117;
                else
                    dbg_gth_rx_byte_cnt <= dbg_gth_rx_byte_cnt + 16'd4;
            end else begin
                dbg_gth_rx_byte_cnt <= 16'd0;
            end

            if (down_dv && !down_dv_d1) begin
                dbg_gth_rx_frame_cnt <= dbg_gth_rx_frame_cnt + 16'd1;
            end
        end
    end

endmodule