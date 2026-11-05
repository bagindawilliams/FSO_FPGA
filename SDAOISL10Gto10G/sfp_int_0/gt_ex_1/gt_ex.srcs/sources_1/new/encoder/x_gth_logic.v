`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Clock Domain Crossing 1 (CDC 1) Subsystem.
               Bridges the high-speed 312.5 MHz GTH TX domain from the 
               SDA Framer to the 200 MHz Baseband Logic domain.

               Key Features & Revisions:
               1. Asymmetric Bus Width: Converts 32-bit payload (312.5 MHz) 
                  to 64-bit payload (200 MHz) using Xilinx Independent Clock 
                  FIFO primitives to maintain high-throughput math pipeline.
               2. Smart Trigger: Replaced fragile pulse synchronization with 
                  reliable FIFO 'empty' flag monitoring. This ensures 
                  Zero-Gap continuous streams are processed seamlessly.
               3. Backpressure Mechanism: Outputs a 'cdc_ready' signal 
                  derived from FIFO 'full' flags. This throttles the upstream 
                  Framer, preventing throughput collisions and memory overflows.
               4. Multi-Frame Continuous Read & 10G Pacing Alignment:
                  Aligned 'max_head' (25) and 'max_load' (404) with FIFO read 
                  latency so 'rd_head' pops strictly 16 bytes and 'rd_load' pops 
                  strictly 239 words per frame.
               5. [Rev 2.0 - 2026-10-27 04:19 KST - Target B2 Audit Fix]:
                  Aligned 'header_dv' and 'payload_dv' with C_PRELOAD_LATENCY = 2.
               6. [Rev 2.1 - 2026-10-28 13:56 KST - Internal Audit Fix #6]:
                  Added a modulo-25 fractional cycle accumulator (frame_mod25_cnt)
                  that alternates between 499 cycles (2495.0 ns, 18 times out of 25)
                  and 498 cycles (2490.0 ns, 7 times out of 25), achieving an exact
                  long-term average frame period of:
                    (18 * 2495.0 ns + 7 * 2490.0 ns) / 25 = 2493.600 ns
                  matching the 3117-Byte @ 10 Gbps optical frame rate with zero drift.
               7. [Rev 2.2 - 2026-11-01 15:49 KST - Audit Fix OISL-CDC-002 & OISL-RESET-001]:
                  - Added 1-cycle output alignment registers ('header_out_d1' and 
                    'payload_out_d1') in the clk_logic domain so the FIFO read 
                    response remains aligned with the 'count + 2' valid window 
                    ('header_dv' and 'payload_dv') while raw 'dout' advances.
                  - Added Gray-coded completed-frame counters ('hdr_gray' -> 'hdr_gray_s2' 
                    for 16-byte headers and 'pld_gray' -> 'pld_gray_s2' for 478-word 
                    payloads) to ensure a full frame is committed in both FIFOs 
                    ('complete_frame_available') before starting a fixed FEC read burst, 
                    and decoupled header acceptance ('accept_head') from payload backpressure.
===========================================================================
*/

module x_gth_logic(
    // -------------------------------------------------------
    // System Clocks and Reset
    // -------------------------------------------------------
    input               clk_gth,      // Fast clock from GTH (e.g., 312.5 MHz)
    input               clk_logic,    // Slow clock for Baseband (e.g., 200 MHz)
    input               rst_n,        // Active-low asynchronous reset
    
    // -------------------------------------------------------
    // Inputs from SDA Framer (Write Domain - 312.5 MHz)
    // -------------------------------------------------------
    input               en_head,      // Header write enable
    input               en_load,      // Payload write enable
    input   [7:0]       header_in,    // 8-bit Header data
    input   [31:0]      payload_in,   // 32-bit Payload data
    
    // -------------------------------------------------------
    // Output to SDA Framer (Write Domain - 312.5 MHz)
    // -------------------------------------------------------
    output              cdc_ready,    // Backpressure to throttle Framer

    // -------------------------------------------------------
    // Outputs to FEC Encoder (Read Domain - 200 MHz)
    // -------------------------------------------------------
    output              header_dv,    // Header data valid flag
    output  [7:0]       header,       // 8-bit Header data
    output              payload_dv,   // Payload data valid flag
    output  [63:0]      payload       // Widened 64-bit Payload data
);

    // =======================================================
    // TIMING CONSTANTS (Aligned with FEC RS Latency & C_PRELOAD_LATENCY = 2)
    // =======================================================
    parameter   st_head     = 8;
    parameter   max_head    = 25;     // count 9..24 (rd_head = 16 pops), count 11..26 (header_dv = 16 cycles)
    parameter   st_load     = 164;    // 164 cycles synchronization delay for RS Header
    parameter   max_load    = 404;    // count 165..403 (rd_load = 239 pops), count 167..405 (payload_dv = 239 cycles)
    parameter   max_frame   = 496;    // Base terminal count (499 cycles = 2495.0 ns; modulated to 495 = 2490.0 ns 7/25 frames)

    reg     [15:0]  count           = 16'd0;
    reg     [4:0]   frame_mod25_cnt = 5'd0; // [Rev 2.1] 0..24 fractional pacing counter (498.72 cycles avg = 2493.600 ns)
    wire    [15:0]  active_max_frame = (frame_mod25_cnt < 5'd18) ? max_frame : (max_frame - 16'd1);

    parameter   IDLE        = 3'b001;
    parameter   ACTIVE      = 3'b010;
    parameter   END         = 3'b100;

    reg     [2:0]   state;
    reg     [2:0]   next_state;

    wire    rd_head;
    wire    [7:0]   header_out;
    wire    rd_load;
    wire    [63:0]  payload_out;

    // Internal FIFO Flags
    wire    head_empty;
    wire    load_empty;
    wire    head_full;
    wire    load_full;
    wire    head_wr_rst_busy;
    wire    head_rd_rst_busy;
    wire    load_wr_rst_busy;
    wire    load_rd_rst_busy;

    // [Rev 2.2 - OISL-CDC-002] Preserve the vendor FIFO response for 1 cycle 
    // while valid advances to the count+2 slot (raw dout already advances to the next word).
    reg [7:0]  header_out_d1;
    reg [63:0] payload_out_d1;
    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            header_out_d1  <= 8'd0;
            payload_out_d1 <= 64'd0;
        end else begin
            header_out_d1  <= header_out;
            payload_out_d1 <= payload_out;
        end
    end

    // =======================================================
    // 1. BACKPRESSURE & COMPLETED-FRAME GRAY TRACKING (Write Domain)
    // =======================================================
    assign cdc_ready = ~(head_full | load_full | head_wr_rst_busy | load_wr_rst_busy);

    // [Rev 2.2 - OISL-RESET-001] Fixed FEC read bursts require a complete input frame
    // committed in both Header (16 bytes) and Payload (478 words) FIFOs before starting.
    localparam integer HDR_INPUT_WORDS = max_head - st_head - 1;       // 16 Header bytes
    localparam integer PLD_INPUT_WORDS = 2 * (max_load - st_load - 1); // 478 Payload words (32-bit)

    reg [15:0] hdr_words      = 16'd0;
    reg [15:0] pld_words      = 16'd0;
    reg [15:0] hdr_committed  = 16'd0;
    reg [15:0] pld_committed  = 16'd0;
    reg [15:0] hdr_gray       = 16'd0;
    reg [15:0] pld_gray       = 16'd0;

    (* ASYNC_REG = "TRUE" *) reg [15:0] hdr_gray_s1 = 16'd0, hdr_gray_s2 = 16'd0;
    (* ASYNC_REG = "TRUE" *) reg [15:0] pld_gray_s1 = 16'd0, pld_gray_s2 = 16'd0;
    reg [15:0] frames_started = 16'd0;

    function [15:0] gray_to_bin(input [15:0] g);
        integer i;
        begin
            gray_to_bin[15] = g[15];
            for (i = 14; i >= 0; i = i - 1)
                gray_to_bin[i] = gray_to_bin[i + 1] ^ g[i];
        end
    endfunction

    wire complete_frame_available = (gray_to_bin(hdr_gray_s2) != frames_started) &&
                                    (gray_to_bin(pld_gray_s2) != frames_started);

    // Header is a valid-only burst; accept header bytes whenever header FIFO is ready.
    wire accept_head = en_head && !head_full && !head_wr_rst_busy;
    wire accept_load = en_load && cdc_ready;

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            hdr_words     <= 16'd0;
            pld_words     <= 16'd0;
            hdr_committed <= 16'd0;
            pld_committed <= 16'd0;
            hdr_gray      <= 16'd0;
            pld_gray      <= 16'd0;
        end else begin
            if (accept_head) begin
                if (hdr_words == HDR_INPUT_WORDS - 1) begin
                    hdr_words     <= 16'd0;
                    hdr_committed <= hdr_committed + 16'd1;
                    hdr_gray      <= ((hdr_committed + 16'd1) >> 1) ^ (hdr_committed + 16'd1);
                end else begin
                    hdr_words     <= hdr_words + 16'd1;
                end
            end
            if (accept_load) begin
                if (pld_words == PLD_INPUT_WORDS - 1) begin
                    pld_words     <= 16'd0;
                    pld_committed <= pld_committed + 16'd1;
                    pld_gray      <= ((pld_committed + 16'd1) >> 1) ^ (pld_committed + 16'd1);
                end else begin
                    pld_words     <= pld_words + 16'd1;
                end
            end
        end
    end

    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            hdr_gray_s1    <= 16'd0;
            hdr_gray_s2    <= 16'd0;
            pld_gray_s1    <= 16'd0;
            pld_gray_s2    <= 16'd0;
            frames_started <= 16'd0;
        end else begin
            hdr_gray_s1 <= hdr_gray;
            hdr_gray_s2 <= hdr_gray_s1;
            pld_gray_s1 <= pld_gray;
            pld_gray_s2 <= pld_gray_s1;
            if (state == IDLE && next_state == ACTIVE)
                frames_started <= frames_started + 16'd1;
        end
    end

    // =======================================================
    // 2. FINITE STATE MACHINE (Read Domain - clk_logic)
    // =======================================================
    always @(posedge clk_logic or negedge rst_n) begin
        if (~rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Cycle Counter & Modulo-25 Fractional Pacer (Exact 2493.600 ns Average)
    always @(posedge clk_logic or negedge rst_n) begin
        if (~rst_n) begin
            count           <= 16'd0;
            frame_mod25_cnt <= 5'd0;
        end else if (state == ACTIVE) begin
            count <= count + 1'b1;
        end else begin
            count <= 16'd0;
            if (state == END) begin
                if (frame_mod25_cnt == 5'd24)
                    frame_mod25_cnt <= 5'd0;
                else
                    frame_mod25_cnt <= frame_mod25_cnt + 5'd1;
            end
        end
    end

    // State Transitions
    always @(*) begin
        case(state)
            IDLE: begin
                if (complete_frame_available && ~head_empty && ~load_empty && ~head_rd_rst_busy && ~load_rd_rst_busy)
                    next_state <= ACTIVE;
                else
                    next_state <= IDLE;
            end
            
            ACTIVE: begin
                if (count < active_max_frame)
                    next_state <= ACTIVE;
                else
                    next_state <= END;
            end
            
            END: begin
                next_state <= IDLE;
            end
            
            default: next_state <= IDLE;
        endcase
    end

    // =======================================================
    // 3. FIFO READ GATING & OUTPUT ASSIGNMENTS
    // =======================================================
    assign  rd_head     = (state == ACTIVE) && (count > st_head && count < max_head);
    assign  header_dv   = (state == ACTIVE) && (count > st_head + 2 && count < max_head + 2);
    assign  header      = (header_dv) ? header_out_d1 : 8'b0;

    assign  rd_load     = (state == ACTIVE) && (count > st_load && count < max_load);
    assign  payload_dv  = (state == ACTIVE) && (count > st_load + 2 && count < max_load + 2);
    assign  payload     = (payload_dv) ? payload_out_d1 : 64'b0;

    // =======================================================
    // 4. IP CORE INSTANTIATIONS (Xilinx FIFO Generator)
    // =======================================================
    cross_gth_logic_head cross_head_inst (
        .srst           (~rst_n),
        .wr_clk         (clk_gth),
        .wr_en          (accept_head),
        .din            (header_in),
        .rd_clk         (clk_logic),
        .rd_en          (rd_head),
        .dout           (header_out),
        .full           (head_full),
        .empty          (head_empty),
        .wr_rst_busy    (head_wr_rst_busy),
        .rd_rst_busy    (head_rd_rst_busy)
    );

    cross_gth_logic_load cross_load_inst (
        .srst           (~rst_n),
        .wr_clk         (clk_gth),
        .wr_en          (accept_load),
        .din            (payload_in),
        .rd_clk         (clk_logic),
        .rd_en          (rd_load),
        .dout           (payload_out),
        .full           (load_full),
        .empty          (load_empty),
        .wr_rst_busy    (load_wr_rst_busy),
        .rd_rst_busy    (load_rd_rst_busy)
    );

endmodule