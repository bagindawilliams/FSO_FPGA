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
  - Rev 2.0 (2026-10-27 04:34 KST) : [Target B6.2 - SDA OISL Page 43-45, Sec. 2.6.3.7.4 - 2.6.3.7.5,
    Figure 2-17 & Table 2-18; ETRI Review Item 4.2(2)]
    1. Populated the 14-bit 'Length' fields in Table 2-18:
       - On a Start Frame (in_continuation == 0):
         * FSO Payload Header (Word 0) = {8'hAB, seq_num, 14'd0} (Length = 0).
         * FSO Packet Header  (Word 1) = {16'hCDEF, 2'b00, DEFAULT_ETH_PKT_BYTES}
           (e.g., 32'hCDEF_07D0 for a 2000-Byte Ethernet Jumbo frame).
       - On a Continuation Frame (in_continuation == 1, when preceding frame did 
         not end with zero-padding):
         * FSO Payload Header (Word 0) = {8'hAB, seq_num, cont_rem_bytes}
           (e.g., Length = 14'd100 Bytes remaining from the split 2000-Byte packet).
    2. Added parameter CONT_NO_PKT_HDR_EN (default = 1) to enforce strict Table 2-18 
       continuation formatting: when CONT_NO_PKT_HDR_EN == 1 and in_continuation == 1,
       skips S_HDR2 (no duplicate 0xCDEF Packet Header is inserted) and appends 1 
       extra zero-pad word in S_CONT_PAD so the Continuation Frame structure is:
       [4B FSO Payload Header + 100B Remaining Data + 1804B Zero Padding = 1908B]
       (+ 4B CRC-32 = 1912B).
===========================================================================
*/

module fso_payload #(
    parameter [13:0] DEFAULT_ETH_PKT_BYTES = 14'd2000, // 2000 Bytes (14'h07D0) Jumbo Frame
    parameter        CONT_NO_PKT_HDR_EN    = 1         // 1 = Strict Table 2-18 Continuation (No duplicate 0xCDEF)
)(
    input  wire        clk,
    input  wire        rst_n,

    // -------------------------------------------------------
    // Interface from XGMII Front-End (packaging_and_segmentation.v)
    // Expected: 1900 Bytes
    // -------------------------------------------------------
    input  wire [31:0] s_axis_eth_tdata,
    input  wire        s_axis_eth_tvalid,
    input  wire        s_axis_eth_tlast,
    output reg         s_axis_eth_tready, // correction: change to reg

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
    // 1. INJECTOR FSM: Append FSO Headers (1900B -> 1908B)
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
    reg [10:0] seg_non_zero_bytes;

    // Internal wires connecting Injector -> CRC
    reg  [31:0] inj_tdata;
    reg         inj_tvalid;
    reg         inj_tlast;
    wire        inj_tready;

    wire [13:0] pld_hdr_len_field = in_continuation ? cont_rem_bytes : 14'd0;
    wire [13:0] pkt_hdr_len_field = DEFAULT_ETH_PKT_BYTES;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state              <= S_IDLE;
            seq_num            <= 10'd0;
            in_continuation    <= 1'b0;
            cont_rem_bytes     <= 14'd0;
            seg_non_zero_bytes <= 11'd0;
        end else begin
            state <= next_state;

            if (state == S_HDR1 && inj_tready) begin
                seg_non_zero_bytes <= 11'd0;
            end else if (state == S_DATA && s_axis_eth_tvalid && s_axis_eth_tready) begin
                if (s_axis_eth_tdata != 32'd0) begin
                    seg_non_zero_bytes <= seg_non_zero_bytes + 11'd4;
                end

                if (s_axis_eth_tlast) begin
                    // If the 475th word (1900th Byte) is non-zero data and we were not
                    // already finishing a continuation segment, the packet spans into the next frame!
                    if (!in_continuation && (s_axis_eth_tdata != 32'd0) && (DEFAULT_ETH_PKT_BYTES > 14'd1900)) begin
                        in_continuation <= 1'b1;
                        cont_rem_bytes  <= DEFAULT_ETH_PKT_BYTES - 14'd1900; // 14'd100 for 2000B Jumbo
                    end else begin
                        in_continuation <= 1'b0;
                        cont_rem_bytes  <= 14'd0;
                    end

                    if (!(CONT_NO_PKT_HDR_EN && in_continuation)) begin
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
                // [Rev 2.0] Table 2-18 FSO Payload Header: {0xAB, seq_num[9:0], Length[13:0]}
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
                // [Rev 2.0] Table 2-18 FSO Packet Header: {0xCDEF, 2'b00, Length[13:0]}
                inj_tdata  = {16'hCDEF, 2'b00, pkt_hdr_len_field};
                if (inj_tready) next_state = S_DATA;
            end
            S_DATA: begin
                inj_tvalid        = s_axis_eth_tvalid;
                inj_tdata         = s_axis_eth_tdata;
                s_axis_eth_tready = inj_tready;

                if (CONT_NO_PKT_HDR_EN && in_continuation) begin
                    // Suppress tlast on the 475th word so S_CONT_PAD appends the 476th word (1804th pad byte)
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
                // Appends the 451st zero-pad word (1804th zero-pad byte) so total frame = 477 words (1908 Bytes)
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
    // Sniffs the output of CRC-32 silently.
    // =======================================================
    arq_ddr4_wrapper u_arq_ddr4_wrapper (
        .clk             (clk),
        .rst_n           (rst_n),
        .ddr4_write_req  (ddr4_write_req),
        .ddr4_read_req   (ddr4_read_req),
        .ddr4_delete_req (ddr4_delete_req),
        .ddr4_addr       (ddr4_addr),
        
        // Sniffing CRC Data
        .s_axis_tdata    (crc_tdata),
        .s_axis_tvalid   (crc_tvalid),
        .s_axis_tlast    (crc_tlast),
        .s_axis_tready   (crc_tready),
        
        // Retransmit Output to MUX
        .m_axis_tdata    (m_axis_retx_tdata),
        .m_axis_tvalid   (m_axis_retx_tvalid),
        .m_axis_tlast    (m_axis_retx_tlast),
        .m_axis_tready   (m_axis_retx_tready)
    );

endmodule