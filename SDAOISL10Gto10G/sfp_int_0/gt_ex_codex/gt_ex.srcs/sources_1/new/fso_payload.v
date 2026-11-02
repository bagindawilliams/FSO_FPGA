`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : SDA OISL FSO Payload Encapsulation Engine.
               Appends FSO Payload Header (0xAB) and FSO Packet Header (0xCDEF)
               to the incoming 1900-Byte segmented Ethernet payload.
               Output geometrically guaranteed to be exactly 1908 Bytes 
               (477 clock cycles) as dictated by SDA OISL Figure 2-17.
               
               Acts as the primary encapsulation container for Ethernet data.
               Internal Operations:
               1. Injects FSO Payload & Packet Headers (1900B -> 1908B).
               2. Computes and appends CRC-32 (1908B -> 1912B) via fso_crc_32.
               3. Sniffs and stores the 1912B frame into ARQ_DDR4_WRAPPER.
               4. Buffers the 1912B frame into fifo_data.
               Outputs both the normal data stream and the ARQ retx stream.

Revision History:
  - Rev 1.0 (Initial) : FSO Payload (0xAB) & Packet (0xCDEF) Header injector + CRC-32 + FIFO.
  - Rev 2.0 (2026-10-27 04:34 KST) : [Target B6.2 - SDA OISL Page 43-45, Table 2-18]
    Populated the 14-bit 'Length' fields in Table 2-18 and added strict Table 2-18 
    continuation formatting (no duplicate 0xCDEF header).
  - Rev 2.1 (2026-10-28 13:56 KST) : [Internal Audit Fix #5 - Dynamic Ingress Length & Zero-Data Safety]
    1. Added 'seg_valid_bytes' metadata input from packaging_and_segmentation.v.
    2. Completely removed 's_axis_eth_tdata != 32'd0' from the continuation decision.
  - Rev 2.6 (2026-10-30 00:55 KST) : [Audit Fix N07 - 14-Bit Super-Jumbo Length & Multi-Segment Continuation]
    Reconstructed 14-bit packet length and added multi-segment continuation tracking.
  - Rev 2.8 (2026-10-30 11:30 KST) : [Audit Fix A01, A02 & A18]:
    1. [Fix A18 & A01]: Widened 'seg_valid_bytes' input port to 14 bits ([13:0]).
    2. [Fix A02]: Populated the Continuation Frame Payload Header (0xAB) Length[13:0]
       field with the full remaining packet byte count ('cont_rem_bytes') per SDA OISL 
       Section 2.6.3.7.5.
  - Rev 2.9 (2026-10-30 18:05 KST) : [Audit Fix B03 - Full 1904-Byte Continuation Frame Alignment]
    1. When 'in_continuation && (cont_rem_bytes > 14'd1900)', accepts all 476 data 
       words (1,904 Bytes) from packaging_and_segmentation.v directly in S_DATA 
       (asserting 'inj_tlast = s_axis_eth_tlast' on the 476th data word without 
       entering S_CONT_PAD) and decrements 'cont_rem_bytes' by 1,904 Bytes. This 
       eliminates mid-packet 4-byte zero padding in >=3,804B multi-segment packets 
       (achieving 0 normative byte mismatches in tx_payload_trace.sv).
    2. When 'in_continuation && (cont_rem_bytes <= 14'd1900)' (such as the 100B 
       second segment of a 2,000B packet), appends the 476th zero-pad word via 
       S_CONT_PAD after the 475th segmenter word, preserving 100% compatibility with
       all 2,000B testbenches.
===========================================================================
*/

module fso_payload #(
    parameter [13:0] DEFAULT_ETH_PKT_BYTES = 14'd2000, // Fallback only if seg_valid_bytes is unconnected (0)
    parameter        CONT_NO_PKT_HDR_EN    = 1         // 1 = Strict Table 2-18 Continuation (No duplicate 0xCDEF)
)(
    input  wire        clk,
    input  wire        rst_n,

    // -------------------------------------------------------
    // Interface from XGMII Front-End (packaging_and_segmentation.v)
    // Expected: 1900B (Initial) / 1904B (Full Continuation) + 14-Bit Length Metadata
    // -------------------------------------------------------
    input  wire [31:0] s_axis_eth_tdata,
    input  wire        s_axis_eth_tvalid,
    input  wire        s_axis_eth_tlast,
    output reg         s_axis_eth_tready,
    input  wire [13:0] seg_valid_bytes,   // [Rev 2.8 - Fix A18] Full 14-bit packet/segment byte count

    // -------------------------------------------------------
    // ARQ Control Interfaces (from arq_tx_controller.v)
    // -------------------------------------------------------
    input  wire        ddr4_write_req,
    input  wire        ddr4_read_req,
    input  wire        ddr4_delete_req,
    input  wire [15:0] ddr4_addr,

    // -------------------------------------------------------
    // AXI-Stream Outputs to fso_payload_mux.v
    // Output: 1912 Bytes (Both Data and Retransmit paths)
    // -------------------------------------------------------
    output wire [31:0] m_axis_data_tdata,
    output wire        m_axis_data_tvalid,
    output wire        m_axis_data_tlast,
    input  wire        m_axis_data_tready,

    output wire [31:0] m_axis_retx_tdata,
    output wire        m_axis_retx_tvalid,
    output wire        m_axis_retx_tlast,
    input  wire        m_axis_retx_tready
);

    // =======================================================
    // 1. INJECTOR FSM: Append FSO Headers (1900B/1904B -> 1908B)
    // =======================================================
    localparam S_IDLE     = 3'd0,
               S_HDR1     = 3'd1,
               S_HDR2     = 3'd2,
               S_DATA     = 3'd3,
               S_CONT_PAD = 3'd4;
    
    reg [2:0]  state, next_state;
    reg [9:0]  seq_num;
    reg        in_continuation;
    reg [13:0] cont_rem_bytes;
    reg [13:0] latched_pkt_bytes;

    // Resolve active ingress packet length (handles both 14-bit direct and unconnected fallback)
    wire        meta_low_valid  = (^seg_valid_bytes[10:0] !== 1'bx);
    wire        meta_high_valid = (^seg_valid_bytes[13:11] !== 1'bx);
    wire [13:0] live_pkt_bytes  = meta_low_valid ?
                                  {meta_high_valid ? seg_valid_bytes[13:11] : 3'd0, seg_valid_bytes[10:0]} :
                                  DEFAULT_ETH_PKT_BYTES;

    // Internal wires connecting Injector -> CRC
    reg  [31:0] inj_tdata;
    reg         inj_tvalid;
    reg         inj_tlast;
    wire        inj_tready;

    // [Rev 2.8 - Fix A02] Per SDA OISL Section 2.6.3.7.5, Continuation Payload Header (0xAB)
    // carries the total remaining byte length of the continued packet ('cont_rem_bytes').
    wire [13:0] pld_hdr_len_field = in_continuation ? cont_rem_bytes : 14'd0;
    wire [13:0] pkt_hdr_len_field = latched_pkt_bytes;

    // [Rev 2.9 - Fix B03] When cont_rem_bytes > 1900, the segmenter provides 476 full data words
    // (1904 Bytes), so S_CONT_PAD is NOT needed (1 Header word + 476 Data words = 477 words).
    // S_CONT_PAD is only used when cont_rem_bytes <= 1900 (where the segmenter provides 475 words).
    wire cont_needs_pad_word = CONT_NO_PKT_HDR_EN && in_continuation && (cont_rem_bytes <= 14'd1900);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state             <= S_IDLE;
            seq_num           <= 10'd0;
            in_continuation   <= 1'b0;
            cont_rem_bytes    <= 14'd0;
            latched_pkt_bytes <= DEFAULT_ETH_PKT_BYTES;
        end else begin
            state <= next_state;

            if ((state == S_IDLE || state == S_HDR1) && s_axis_eth_tvalid && !in_continuation) begin
                latched_pkt_bytes <= (live_pkt_bytes != 14'd0) ? live_pkt_bytes : DEFAULT_ETH_PKT_BYTES;
            end

            if (state == S_DATA && s_axis_eth_tvalid && s_axis_eth_tready) begin
                if (s_axis_eth_tlast) begin
                    // [Rev 2.9 - Fix B03] Exact 1900B initial & 1904B continuation subtraction
                    if (!in_continuation) begin
                        if (latched_pkt_bytes > 14'd1900) begin
                            in_continuation <= 1'b1;
                            cont_rem_bytes  <= latched_pkt_bytes - 14'd1900;
                        end else begin
                            in_continuation <= 1'b0;
                            cont_rem_bytes  <= 14'd0;
                        end
                    end else begin
                        if (cont_rem_bytes > 14'd1904) begin
                            in_continuation <= 1'b1;
                            cont_rem_bytes  <= cont_rem_bytes - 14'd1904;
                        end else begin
                            in_continuation <= 1'b0;
                            cont_rem_bytes  <= 14'd0;
                        end
                    end

                    if (!cont_needs_pad_word) begin
                        seq_num <= seq_num + 10'd1;
                    end
                end
            end else if (state == S_CONT_PAD && inj_tready) begin
                seq_num <= seq_num + 10'd1;
            end
        end
    end

    always @(*) begin
        next_state        = state;
        s_axis_eth_tready = 1'b0;
        inj_tvalid        = 1'b0;
        inj_tlast         = 1'b0;
        inj_tdata         = 32'd0;

        case (state)
            S_IDLE: begin
                if (s_axis_eth_tvalid) next_state = S_HDR1;
            end
            S_HDR1: begin
                inj_tvalid = 1'b1;
                // Table 2-18 FSO Payload Header: {0xAB, seq_num[9:0], Length[13:0]}
                inj_tdata  = {8'hAB, seq_num, pld_hdr_len_field};
                if (inj_tready) begin
                    if (CONT_NO_PKT_HDR_EN && in_continuation)
                        next_state = S_DATA; // Table 2-18 Continuation: skip duplicate 0xCDEF header
                    else
                        next_state = S_HDR2;
                end
            end
            S_HDR2: begin
                inj_tvalid = 1'b1;
                // Table 2-18 FSO Packet Header: {0xCDEF, 2'b00, Length[13:0]}
                inj_tdata  = {16'hCDEF, 2'b00, pkt_hdr_len_field};
                if (inj_tready) next_state = S_DATA;
            end
            S_DATA: begin
                inj_tvalid        = s_axis_eth_tvalid;
                inj_tdata         = s_axis_eth_tdata;
                s_axis_eth_tready = inj_tready;

                if (cont_needs_pad_word) begin
                    // Suppress tlast on the 475th word so S_CONT_PAD appends the 476th trailing pad word
                    inj_tlast = 1'b0;
                    if (s_axis_eth_tvalid && inj_tready && s_axis_eth_tlast) begin
                        next_state = S_CONT_PAD;
                    end
                end else begin
                    inj_tlast = s_axis_eth_tlast;
                    if (s_axis_eth_tvalid && inj_tready && s_axis_eth_tlast) begin
                        next_state = S_IDLE;
                    end
                end
            end
            S_CONT_PAD: begin
                // Appends the 476th word (trailing zero-pad word for <=1900B continuation tail)
                inj_tvalid = 1'b1;
                inj_tdata  = 32'd0;
                inj_tlast  = 1'b1;
                if (inj_tready) begin
                    next_state = S_IDLE;
                end
            end
            default: next_state = S_IDLE;
        endcase
    end

    // =======================================================
    // 2. FSO CRC-32 ENGINE (1908B -> 1912B)
    // =======================================================
    wire [31:0] crc_tdata;
    wire        crc_tvalid;
    wire        crc_tlast;
    wire        crc_tready;

    fso_crc_32 u_fso_crc_32 (
        .clk             (clk),
        .rst_n           (rst_n),
        .s_axis_tdata    (inj_tdata),
        .s_axis_tvalid   (inj_tvalid),
        .s_axis_tlast    (inj_tlast),
        .s_axis_tready   (inj_tready),
        .m_axis_tdata    (crc_tdata),
        .m_axis_tvalid   (crc_tvalid),
        .m_axis_tlast    (crc_tlast),
        .m_axis_tready   (crc_tready)
    );

    // =======================================================
    // 3. FIFO DATA BUFFER (Primary Output Path)
    // =======================================================
    fso_axis_fifo #(.FIFO_DEPTH(1024), .ADDR_WIDTH(10)) fifo_data (
        .clk             (clk),
        .rst_n           (rst_n),
        .s_axis_tdata    (crc_tdata),
        .s_axis_tvalid   (crc_tvalid),
        .s_axis_tlast    (crc_tlast),
        .s_axis_tready   (crc_tready),
        .m_axis_tdata    (m_axis_data_tdata),
        .m_axis_tvalid   (m_axis_data_tvalid),
        .m_axis_tlast    (m_axis_data_tlast),
        .m_axis_tready   (m_axis_data_tready)
    );

    // =======================================================
    // 4. ARQ DDR4 WRAPPER (Retransmit Path)
    // Captures accepted DATA output after FIFO, aligned with scheduler allocation.
    // =======================================================
    arq_ddr4_wrapper u_arq_ddr4_wrapper (
        .clk             (clk),
        .rst_n           (rst_n),
        .ddr4_write_req  (ddr4_write_req),
        .ddr4_read_req   (ddr4_read_req),
        .ddr4_delete_req (ddr4_delete_req),
        .ddr4_addr       (ddr4_addr),
        
        // Capture accepted DATA transmission, after FIFO; matches allocated slot.
        .s_axis_tdata    (m_axis_data_tdata),
        .s_axis_tvalid   (m_axis_data_tvalid),
        .s_axis_tlast    (m_axis_data_tlast),
        .s_axis_tready   (m_axis_data_tready),
        
        // Retransmit Output to MUX
        .m_axis_tdata    (m_axis_retx_tdata),
        .m_axis_tvalid   (m_axis_retx_tvalid),
        .m_axis_tlast    (m_axis_retx_tlast),
        .m_axis_tready   (m_axis_retx_tready)
    );

endmodule