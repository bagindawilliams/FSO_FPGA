`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : eth_packet_cdc
Description  : Store-and-Forward Packet Admission and Clock-Domain Crossing 
               (CDC) Bridge for 10G Ethernet Ingress and Egress Datapaths.
               Buffers complete Ethernet packets in an asynchronous data FIFO 
               paired with a packet descriptor FIFO ({bad_flag, word_count}).
               Only complete descriptors release packet data at the destination, 
               while rejected or oversize packets are discarded cleanly and 
               counted without emitting partial frames.

               Architectural & Parameter Foundation:
               - DATA_WIDTH               : Payload bus width (35b on Ingress, 32b on Egress).
               - DATA_DEPTH               : Asynchronous data FIFO depth (4096 words).
               - MAX_PACKET_WORDS         : Maximum legal packet length (512 words).
               - END_ON_VALID_GAP         : 0 = frame ends on (s_valid && s_last),
                                            1 = frame ends on falling edge of s_valid.
               - OUTPUT_PACKET_GAP_CYCLES : Minimum destination clock (m_clk) cycles
                                            with m_valid held low after the last word
                                            of an emitted packet (0 = disabled for Ingress,
                                            4 = enabled for Egress so xgmii_tx_formatter
                                            completes 1 cycle /T/ + 3 cycles IPG_WAIT).

               Revision Notes:
               1. [Rev 1.0 - Baseline]: Initial store-and-forward packet admission 
                  and CDC bridge implementation inside eth_tx_back_end_top.v.
               2. [Rev 1.1 - 2026-11-04 11:05 KST - Clean File Separation & Egress Gap]:
                  - Extracted eth_packet_cdc into a standalone module file to 
                    comply with the 1-file-per-module ETRI handover standard.
                  - Added parameter OUTPUT_PACKET_GAP_CYCLES (default 0) and 
                    destination-domain gap counter (output_packet_gap_count, 
                    output_packet_gap_active) triggered on (m_valid && m_ready && m_last).
                  - Kept a single unified FIFO read enable signal (take_word) for both 
                    data_queue.rd_en and remaining word count decrement, and preserved 
                    the original reset_all contract per Audit review.
===========================================================================
*/

module eth_packet_cdc #(
    parameter integer DATA_WIDTH               = 32,
    parameter integer DATA_DEPTH               = 4096,
    parameter integer MAX_PACKET_WORDS         = 512,
    parameter integer END_ON_VALID_GAP         = 1,
    parameter integer OUTPUT_PACKET_GAP_CYCLES = 0
)(
    input  wire                          s_clk,
    input  wire                          s_rst_n,
    input  wire                          m_clk,
    input  wire                          m_rst_n,

    // Source Packet Stream
    input  wire [DATA_WIDTH-1:0]         s_data,
    input  wire                          s_valid,
    input  wire                          s_last,

    // Destination Packet Stream
    output wire [DATA_WIDTH-1:0]         m_data,
    output wire                          m_valid,
    output wire                          m_last,
    input  wire                          m_ready,

    // Diagnostic Telemetry & Occupancy Counters
    output reg  [31:0]                   dropped_packets,
    output reg  [31:0]                   overflow_words,
    output reg  [31:0]                   underflow_count,
    output wire [$clog2(DATA_DEPTH):0]   source_occupancy
);

    // =========================================================================
    // 1. LOCAL PARAMETERS AND INTERNAL SIGNAL DECLARATIONS
    // =========================================================================
    localparam integer CW = $clog2(DATA_DEPTH) + 1;
    localparam integer GAP_CNT_WIDTH = (OUTPUT_PACKET_GAP_CYCLES > 1) ? $clog2(OUTPUT_PACKET_GAP_CYCLES + 1) : 1;
    localparam [GAP_CNT_WIDTH-1:0] GAP_LOAD_VAL = OUTPUT_PACKET_GAP_CYCLES[GAP_CNT_WIDTH-1:0];
    localparam [GAP_CNT_WIDTH-1:0] GAP_ONE_VAL  = {{(GAP_CNT_WIDTH-1){1'b0}}, 1'b1};
    localparam [GAP_CNT_WIDTH-1:0] GAP_ZERO_VAL = {GAP_CNT_WIDTH{1'b0}};

    wire        reset_all = !s_rst_n || !m_rst_n;
    (* ASYNC_REG = "TRUE" *) reg [1:0] reset_sync;
    wire        source_reset;

    wire        full;
    wire        empty;
    wire        wb;
    wire        rb;
    wire        lf;
    wire        le;
    wire        lwb;
    wire        lrb;
    wire [5:0]  desc_count;

    reg         in_packet;
    reg         admitted;
    reg         bad;
    reg         previous_valid;
    reg  [15:0] written;
    reg         pending;
    reg  [16:0] descriptor;

    wire        submit;
    wire        can_admit;
    wire        selected;
    wire        selected_bad;
    wire [15:0] prior_words;
    wire        write_word;
    wire        reject_word;
    wire        finish;
    wire        final_bad;
    wire [15:0] final_words;

    reg  [15:0] remaining;
    reg         discard;
    wire [16:0] descriptor_out;

    reg  [GAP_CNT_WIDTH-1:0] output_packet_gap_count;
    wire                     output_packet_gap_active;
    wire                     last_word_transferred;
    wire                     take_desc;
    wire                     take_word;

    // =========================================================================
    // 2. SOURCE CLOCK DOMAIN (s_clk): PACKET ADMISSION & DESCRIPTOR QUEUEING
    // =========================================================================
    always @(posedge s_clk or posedge reset_all) begin
        if (reset_all) begin
            reset_sync <= 2'b00;
        end else begin
            reset_sync <= {reset_sync[0], 1'b1};
        end
    end
    assign source_reset = !reset_sync[1];

    assign submit       = pending && !lf && !lwb;
    assign can_admit    = !wb && !lwb && !full && !lf &&
                          (source_occupancy <= DATA_DEPTH - MAX_PACKET_WORDS - 2) &&
                          (desc_count < 6'd30) && (!pending || submit);
    assign selected     = in_packet ? admitted : can_admit;
    assign selected_bad = in_packet && bad;
    assign prior_words  = in_packet ? written : 16'd0;
    assign write_word   = s_valid && selected && !selected_bad &&
                          (prior_words < MAX_PACKET_WORDS) && !full && !wb;
    assign reject_word  = s_valid && !write_word;
    assign finish       = END_ON_VALID_GAP ? (previous_valid && !s_valid) : (s_valid && s_last);
    assign final_bad    = selected_bad || reject_word;
    assign final_words  = prior_words + (write_word ? 16'd1 : 16'd0);

    always @(posedge s_clk or posedge source_reset) begin
        if (source_reset) begin
            in_packet       <= 1'b0;
            admitted        <= 1'b0;
            bad             <= 1'b0;
            previous_valid  <= 1'b0;
            written         <= 16'd0;
            pending         <= 1'b0;
            descriptor      <= 17'd0;
            dropped_packets <= 32'd0;
            overflow_words  <= 32'd0;
        end else begin
            previous_valid <= s_valid;
            if (submit) begin
                pending <= 1'b0;
            end
            if (s_valid) begin
                in_packet <= 1'b1;
                admitted  <= selected;
                bad       <= final_bad;
                written   <= final_words;
                if (reject_word) begin
                    overflow_words <= overflow_words + 1'b1;
                end
            end
            if (finish) begin
                in_packet <= 1'b0;
                written   <= 16'd0;
                bad       <= 1'b0;
                admitted  <= 1'b0;
                if (final_bad || !selected) begin
                    dropped_packets <= dropped_packets + 1'b1;
                end
                if (selected && (final_words != 16'd0)) begin
                    pending    <= 1'b1;
                    descriptor <= {final_bad, final_words};
                end
            end
        end
    end

    // =========================================================================
    // 3. DESTINATION CLOCK DOMAIN (m_clk): PACKET DRAIN & INTER-PACKET GAP
    // =========================================================================
    assign output_packet_gap_active = (OUTPUT_PACKET_GAP_CYCLES > 0) &&
                                      (output_packet_gap_count != GAP_ZERO_VAL);

    // Next descriptor may be latched on the final gap cycle (output_packet_gap_count <= 1)
    // so the next queued packet starts on cycle N+5 after exactly 4 cycles of m_valid == 0.
    assign take_desc = (remaining == 16'd0) &&
                       ((OUTPUT_PACKET_GAP_CYCLES == 0) || (output_packet_gap_count <= GAP_ONE_VAL)) &&
                       !le && !lrb && !rb;

    // Unified FIFO read & remaining word decrement signal (held low during inter-packet gap)
    assign take_word = (remaining != 16'd0) && !output_packet_gap_active &&
                       !empty && !rb && (discard || m_ready);

    assign m_valid   = (remaining != 16'd0) && !output_packet_gap_active &&
                       !discard && !empty && !rb;
    assign m_last    = m_valid && (remaining == 16'd1);

    assign last_word_transferred = m_valid && m_ready && m_last;

    always @(posedge m_clk or posedge reset_all) begin
        if (reset_all) begin
            remaining               <= 16'd0;
            discard                 <= 1'b0;
            underflow_count         <= 32'd0;
            output_packet_gap_count <= GAP_ZERO_VAL;
        end else begin
            // Destination inter-packet gap counter
            if (OUTPUT_PACKET_GAP_CYCLES > 0) begin
                if (last_word_transferred) begin
                    output_packet_gap_count <= GAP_LOAD_VAL;
                end else if (output_packet_gap_count != GAP_ZERO_VAL) begin
                    output_packet_gap_count <= output_packet_gap_count - GAP_ONE_VAL;
                end
            end else begin
                output_packet_gap_count <= GAP_ZERO_VAL;
            end

            // Descriptor load and word drain state update
            if (take_desc) begin
                remaining <= descriptor_out[15:0];
                discard   <= descriptor_out[16];
            end else begin
                if (take_word) begin
                    remaining <= remaining - 1'b1;
                end
                if ((remaining != 16'd0) && !output_packet_gap_active && empty && !rb) begin
                    underflow_count <= underflow_count + 1'b1;
                end
            end
        end
    end

    // =========================================================================
    // 4. ASYNCHRONOUS DATA AND DESCRIPTOR FIFOs (XPM_FIFO_ASYNC)
    // =========================================================================
    xpm_fifo_async #(
        .FIFO_WRITE_DEPTH   (DATA_DEPTH),
        .WRITE_DATA_WIDTH   (DATA_WIDTH),
        .READ_DATA_WIDTH    (DATA_WIDTH),
        .READ_MODE          ("fwft"),
        .FIFO_READ_LATENCY  (0),
        .CDC_SYNC_STAGES    (2),
        .WR_DATA_COUNT_WIDTH(CW),
        .RD_DATA_COUNT_WIDTH(CW),
        .USE_ADV_FEATURES   ("0707")
    ) data_queue (
        .rst           (source_reset),
        .wr_clk        (s_clk),
        .rd_clk        (m_clk),
        .din           (s_data),
        .wr_en         (write_word),
        .full          (full),
        .wr_rst_busy   (wb),
        .wr_data_count (source_occupancy),
        .dout          (m_data),
        .rd_en         (take_word),
        .empty         (empty),
        .rd_rst_busy   (rb),
        .sleep         (1'b0),
        .injectsbiterr (1'b0),
        .injectdbiterr (1'b0)
    );

    xpm_fifo_async #(
        .FIFO_WRITE_DEPTH   (32),
        .WRITE_DATA_WIDTH   (17),
        .READ_DATA_WIDTH    (17),
        .READ_MODE          ("fwft"),
        .FIFO_READ_LATENCY  (0),
        .CDC_SYNC_STAGES    (2),
        .WR_DATA_COUNT_WIDTH(6),
        .RD_DATA_COUNT_WIDTH(6),
        .USE_ADV_FEATURES   ("0707")
    ) length_queue (
        .rst           (source_reset),
        .wr_clk        (s_clk),
        .rd_clk        (m_clk),
        .din           (descriptor),
        .wr_en         (submit),
        .full          (lf),
        .wr_rst_busy   (lwb),
        .wr_data_count (desc_count),
        .dout          (descriptor_out),
        .rd_en         (take_desc),
        .empty         (le),
        .rd_rst_busy   (lrb),
        .sleep         (1'b0),
        .injectsbiterr (1'b0),
        .injectdbiterr (1'b0)
    );

endmodule