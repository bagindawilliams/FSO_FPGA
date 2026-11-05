`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : eth_rx_segment_cdc
Description  : Asynchronous Clock-Domain Crossing (CDC) Segment Bridge for 
               the 10G Ethernet Receive Front-End (Hardware Mode, RUN_MODE == 0).
               Transfers 32-bit segmented FSO payload words, segment end flag 
               (s_last), and 14-bit valid byte count metadata (s_bytes) across 
               the asynchronous boundary from the 10G PCS/PMA RX user clock 
               domain (s_clk, 312.5 MHz) to the FSO Framer clock domain (m_clk).

               Architectural & Parameter Foundation:
               - Width : 47 bits total ({s_bytes[13:0], s_last, s_data[31:0]}).
               - Depth : 1024 words (FWFT mode, zero read latency, 2-stage CDC).
               - Reset : 2-stage ASYNC_REG synchronizer in the source clock 
                         domain with full wr_rst_busy / rd_rst_busy gating.

               Revision Notes:
               1. [Rev 1.0 - Baseline]: Initial hardware segment CDC bridge 
                  implementation inside eth_rx_front_end_top.v.
               2. [Rev 1.1 - 2026-11-04 11:05 KST - Clean File Separation]:
                  Extracted eth_rx_segment_cdc into a dedicated standalone 
                  source file to enforce the project-wide 1-file-per-module 
                  coding standard for ETRI handover without altering port 
                  contracts, FIFO parameters, or handshake behavior.
===========================================================================
*/

module eth_rx_segment_cdc (
    input  wire        s_clk,
    input  wire        m_clk,
    input  wire        rst_n,

    // Source Segment Stream (10G Ethernet PCS/PMA RX Clock Domain)
    input  wire [31:0] s_data,
    input  wire        s_valid,
    input  wire        s_last,
    input  wire [13:0] s_bytes,
    output wire        s_ready,

    // Destination Segment Stream (FSO Framer Clock Domain)
    output wire [31:0] m_data,
    output wire        m_valid,
    output wire        m_last,
    output wire [13:0] m_bytes,
    input  wire        m_ready
);

    // =========================================================================
    // 1. INTERNAL SIGNALS AND SYNCHRONIZED SOURCE RESET
    // =========================================================================
    wire        full;
    wire        empty;
    wire        wb;
    wire        rb;
    wire [46:0] q;

    (* ASYNC_REG = "TRUE" *) reg [1:0] reset_sync;

    always @(posedge s_clk or negedge rst_n) begin
        if (!rst_n) begin
            reset_sync <= 2'b00;
        end else begin
            reset_sync <= {reset_sync[0], 1'b1};
        end
    end

    // =========================================================================
    // 2. STREAM HANDSHAKE AND PAYLOAD UNPACKING
    // =========================================================================
    assign s_ready = !full && !wb;
    assign m_valid = !empty && !rb;
    assign {m_bytes, m_last, m_data} = q;

    // =========================================================================
    // 3. ASYNCHRONOUS FWFT SEGMENT FIFO (47-BIT WIDTH, 1024-WORD DEPTH)
    // =========================================================================
    xpm_fifo_async #(
        .FIFO_WRITE_DEPTH (1024),
        .WRITE_DATA_WIDTH (47),
        .READ_DATA_WIDTH  (47),
        .READ_MODE        ("fwft"),
        .FIFO_READ_LATENCY(0),
        .CDC_SYNC_STAGES  (2),
        .USE_ADV_FEATURES ("0000")
    ) queue (
        .rst           (!reset_sync[1]),
        .wr_clk        (s_clk),
        .rd_clk        (m_clk),
        .din           ({s_bytes, s_last, s_data}),
        .wr_en         (s_valid && s_ready),
        .full          (full),
        .wr_rst_busy   (wb),
        .dout          (q),
        .rd_en         (m_valid && m_ready),
        .empty         (empty),
        .rd_rst_busy   (rb),
        .sleep         (1'b0),
        .injectsbiterr (1'b0),
        .injectdbiterr (1'b0)
    );

endmodule