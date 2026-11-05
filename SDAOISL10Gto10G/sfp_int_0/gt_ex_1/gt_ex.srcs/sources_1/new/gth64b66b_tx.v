`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : gth64b66b_tx
Function     : 64B/66B External Gearbox Transmitter Adapter with Internal 
               Rate-Matching Elastic Buffer.
               - Receives 32-bit FSO frames (3117 Bytes/frame) from Error 
                 Injector / CDC 2 at 312.5 MHz (clk_312_5).
               - Adapts data stream to GTH TXUSRCLK2 (322.265625 MHz) by 
                 driving gt_txsequence_out (0..32), attaching 2-bit Sync 
                 Header 2'b01, performing bit-reversal (MSB-first optical 
                 transmission), and pausing data reads for 2 cycles when 
                 gt_txsequence_out == 32.

Revision History:
  - Rev 1.0 (Initial) : Basic 64B/66B Gearbox sequence generator.
  - Rev 2.0 (2026-10-20) : Added internal dual-clock rate-matching elastic 
    buffer (elast_mem) and encapsulated ILA 1 (TX Stage) debug registers 
    inside module to keep SDAOISL10Gto10G_top RTL schematic clean.
  - Rev 3.0 (2026-10-21 05:18 KST) : Restored pure 2'b01 sync header 
    (6'b000001) and zero-idle output prior to frame start.
  - Rev 3.1 (2026-10-21 05:27 KST) : Added First-Word Fall-Through (FWFT) 
    bypass on elast_mem.
  - Rev 3.2 (2026-10-21 12:21 KST) : Separated pre-frame 00000000 from 
    active frame start by driving gt_txdata_out via immediate first-word 
    mux when up_valid_in asserts, ensuring gt_txdata_out transitions to 
    active data at the exact instant tx_byte_cnt = 1 begins and returns 
    to 00000000 cleanly when Frame 4 (MGMT) completes.
  - Rev 3.3 (2026-11-01 15:49 KST) : [Audit Fix OISL-GTH-001 & OISL-GTH-003 - Startup Reserve & Registered Output]
    1. [Fix OISL-GTH-003]: Added 'START_WORDS = 780' parameter and 'stream_started'
       guard to reserve one full 3,117-byte frame (ceil(3117/4) = 780 words) in
       'elast_mem' before enabling continuous 64B/66B gearbox extraction, preventing
       mid-frame buffer underflow across the 312.5 MHz to 322.265625 MHz rate adaptation.
    2. [Fix OISL-GTH-001]: Drove 'gt_txdata_out' exclusively from the registered
       'gt_txdata_reg' read pipeline (removing the combinational 'up_data_in' bypass
       that previously emitted the first words before 'rd_ptr' advanced and caused
       duplicate initial words).
  - Rev 3.4 (2026-11-05 07:05 KST) : [Audit Section 3 & 6 Fix - Modulo-3117 Debug Telemetry & Clock Note]
    1. Updated 'dbg_tx_fso_byte_cnt' and 'dbg_tx_fso_frame_cnt' to perform true
       modulo-3,117 byte accumulation across 32-bit word boundaries so multi-frame
       continuous streams count every 3,117-byte SDA frame accurately.
    2. Documented that in the top-level hardware architecture (SDAOISL10Gto10G_top.v),
       both 'clk_312_5' and 'clk_gth' are driven by 'tx0_clk' (synchronous buffer
       operation); if operated with asynchronous clocks in hardware, gray-coded
       pointer synchronization is required.
===========================================================================
*/

module gth64b66b_tx #(parameter integer START_WORDS = 780) (
    input  wire        clk_312_5,         // Upstream 32-bit Stream Clock (tx0_clk in SDAOISL10Gto10G_top)
    input  wire        clk_gth,           // GTH TXUSRCLK2 (tx0_clk)
    input  wire        rst_n,             // Active-low reset
    input  wire        gth_tx_ready,      // High when GTH TX initialization is done

    // Upstream Interface from Error Injector / CDC 2 (3117 Bytes /frame)
    input  wire [31:0] up_data_in,
    input  wire        up_valid_in,
    output wire        tx_stall_out,

    // Downstream Interface to GTH Transceiver Primitive
    output wire [31:0] gt_txdata_out,
    output reg  [5:0]  gt_txheader_out,
    output reg  [6:0]  gt_txsequence_out
);

    assign tx_stall_out = 1'b0;

    function [31:0] bit_rev32(input [31:0] d);
        integer i;
        begin
            for (i = 0; i < 32; i = i + 1) begin
                bit_rev32[i] = d[31 - i];
            end
        end
    endfunction

    // =======================================================
    // 1. INTERNAL RATE-MATCHING ELASTIC BUFFER
    //    Note: Synchronous when clk_312_5 and clk_gth are tied to tx0_clk
    //          as in SDAOISL10Gto10G_top.v.
    // =======================================================
    (* ram_style = "distributed" *) reg [31:0] elast_mem [0:4095];
    reg [11:0] wr_ptr;
    reg [11:0] rd_ptr;

    always @(posedge clk_312_5) begin
        if (up_valid_in && gth_tx_ready) begin
            elast_mem[wr_ptr] <= up_data_in;
        end
    end

    always @(posedge clk_312_5 or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= 12'd0;
        end else if (!gth_tx_ready) begin
            wr_ptr <= 12'd0;
        end else if (up_valid_in) begin
            wr_ptr <= wr_ptr + 12'd1;
        end
    end

    // =======================================================
    // 2. 64B/66B 32-BIT GEARBOX STREAMER (66 Cycles: 0..65 -> Seq 0..32)
    // =======================================================
    // [Rev 3.3 - OISL-GTH-003] Reserve ceil(3117/4) = 780 words once before continuous TX.
    // Never pause the gearbox to refill after starting.
    reg         stream_started;
    reg  [6:0]  tx_seq_cnt;
    reg  [31:0] gt_txdata_reg;
    reg         tx_active_reg;
    wire        pause_data_cycle = (tx_seq_cnt == 7'd64) || (tx_seq_cnt == 7'd65);
    wire [11:0] words_avail      = wr_ptr - rd_ptr;

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            stream_started    <= 1'b0;
            tx_seq_cnt        <= 7'd0;
            rd_ptr            <= 12'd0;
            gt_txdata_reg     <= 32'd0;
            tx_active_reg     <= 1'b0;
            gt_txheader_out   <= 6'b000001;
            gt_txsequence_out <= 7'd0;
        end else if (!gth_tx_ready) begin
            stream_started    <= 1'b0;
            tx_seq_cnt        <= 7'd0;
            rd_ptr            <= 12'd0;
            gt_txdata_reg     <= 32'd0;
            tx_active_reg     <= 1'b0;
            gt_txheader_out   <= 6'b000001;
            gt_txsequence_out <= 7'd0;
        end else begin
            if (!stream_started && words_avail >= START_WORDS)
                stream_started <= 1'b1;

            // 1. Advance 0..65 modulo-66 counter
            if (tx_seq_cnt == 7'd65)
                tx_seq_cnt <= 7'd0;
            else
                tx_seq_cnt <= tx_seq_cnt + 7'd1;

            gt_txsequence_out <= {1'b0, tx_seq_cnt[6:1]};
            gt_txheader_out   <= 6'b000001; // 2'b01 Valid 64B/66B Sync Header

            // 2. Read from elastic buffer on the 64 active Gearbox cycles
            if (!pause_data_cycle) begin
                if (stream_started && words_avail > 12'd0) begin
                    gt_txdata_reg <= bit_rev32(elast_mem[rd_ptr]);
                    rd_ptr        <= rd_ptr + 12'd1;
                    tx_active_reg <= 1'b1;
                end else begin
                    gt_txdata_reg <= 32'd0;
                    tx_active_reg <= 1'b0;
                end
            end
        end
    end

    // [Rev 3.3 - OISL-GTH-001] Only the registered elastic buffer read pipeline drives
    // transmitted data so the first word is never duplicated prior to rd_ptr advancement.
    assign gt_txdata_out = gt_txdata_reg;

    // =======================================================
    // 3. INTERNAL ILA 1 (u_ila_0) TX STAGE TELEMETRY COUNTERS
    //    [Rev 3.4] Modulo-3117 byte & frame tracking across word boundaries
    // =======================================================
    (* mark_debug = "true", dont_touch = "true" *) reg        dbg_tx_fso_valid;
    (* mark_debug = "true", dont_touch = "true" *) reg [31:0] dbg_tx_fso_data;
    (* mark_debug = "true", dont_touch = "true" *) reg [15:0] dbg_tx_fso_byte_cnt;
    (* mark_debug = "true", dont_touch = "true" *) reg [15:0] dbg_tx_fso_frame_cnt;
    reg up_valid_d1;

    always @(posedge clk_312_5 or negedge rst_n) begin
        if (!rst_n) begin
            dbg_tx_fso_valid     <= 1'b0;
            dbg_tx_fso_data      <= 32'd0;
            dbg_tx_fso_byte_cnt  <= 16'd0;
            dbg_tx_fso_frame_cnt <= 16'd0;
            up_valid_d1          <= 1'b0;
        end else begin
            dbg_tx_fso_valid <= up_valid_in;
            dbg_tx_fso_data  <= up_data_in;
            up_valid_d1      <= up_valid_in;

            if (up_valid_in) begin
                if (!up_valid_d1 && (dbg_tx_fso_byte_cnt == 16'd0)) begin
                    dbg_tx_fso_byte_cnt  <= 16'd4;
                    dbg_tx_fso_frame_cnt <= dbg_tx_fso_frame_cnt + 16'd1;
                end else if (dbg_tx_fso_byte_cnt + 16'd4 > 16'd3117) begin
                    dbg_tx_fso_byte_cnt  <= (dbg_tx_fso_byte_cnt + 16'd4) - 16'd3117;
                    dbg_tx_fso_frame_cnt <= dbg_tx_fso_frame_cnt + 16'd1;
                end else begin
                    dbg_tx_fso_byte_cnt  <= dbg_tx_fso_byte_cnt + 16'd4;
                end
            end
        end
    end

endmodule