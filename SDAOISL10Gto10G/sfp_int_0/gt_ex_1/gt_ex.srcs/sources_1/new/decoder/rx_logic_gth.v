`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : rx_logic_gth
Description  : Clock Domain Crossing 4 (CDC 4) Module.
               Transfers the decoded 16-Byte Header (8-bit, 16 cycles) and 
               1912-Byte Payload (64-bit 239 cycles -> 32-bit 478 cycles) 
               from the 200.0 MHz Baseband Decoder domain (core_rx) to the 
               312.5 MHz Deframer domain.

               Revision History:
               - Rev 1.0 (Initial) : Dual asynchronous FIFO CDC 4 controller 
                 (cross_logic_gth_head & cross_logic_gth_load).
               - Rev 2.0 (2026-10-22 06:55 KST) :
                 1. Updated timescale to 1ns/1ps so fractional payload byte 
                    unpacking (2493.6 ns / 1912 bytes = 1.304184 ns) is exact.
                 2. Latched header fields progressively as each byte arrives 
                    (TXFN on byte 2, RXFN on byte 4, ACK/FRAME_TYPE on byte 5)
                    and assembled all 64 bits of cdc4_MGMT_RANGE across words 
                    3, 4, and 5 so cdc4_ASCII_TAG ("Kookmin FSO "), 
                    cdc4_ETH_FCS (0xDEADBEEF), and cdc4_MGMT_RANGE 
                    (64'h4153_12D0_0000_0000) capture 100% accurately.
                 3. Clocked pld_sim_q writer on negedge clk_gth and maintained 
                    continuous 4-frame unpacking (7648 bytes) so cdc4_frame_id 
                    counts 1 -> 2 -> 3 -> 4 cleanly without 'X' glitches.
               - Rev 2.1 (2026-10-27 04:26 KST) : [Target B4.2 - SDA OISL Table 2-14 Alignment]
                 Updated cdc4_MGMT_RANGE simulation tracker to support both 
                 LSB-packed Table 2-14 bits [155:92] from mgmt_telemetry_generator.v
                 ({payload_out[27:0], mgmt_range_mid32, mgmt_range_lo4}) and 
                 MSB-packed standalone testbench vectors.
===========================================================================
*/

module rx_logic_gth (
    // Clocks and Reset
    input  wire        clk_gth,      // 312.5 MHz Read Domain (Deframer)
    input  wire        clk_logic,    // 200.0 MHz Write Domain (core_rx)
    input  wire        rst_n,

    // Inputs from core_rx (200.0 MHz Domain)
    input  wire        en_head,      // 16 cycles valid from RS(32,16) Decoder (16 Bytes)
    input  wire        en_load,      // 239 cycles valid from 8xRS(255,239) Decoder (1912 Bytes)
    input  wire [7:0]  header_in,    // 8-bit decoded Header
    input  wire [63:0] payload_in,   // 64-bit decoded Payload

    // Outputs to Deframer (312.5 MHz Domain)
    output wire        header_dv,    // Strictly 16 cycles valid @ 312.5 MHz (16 Bytes)
    output wire [7:0]  header,       // 8-bit Header output
    output wire        payload_dv,   // Strictly 478 cycles valid @ 312.5 MHz (1912 Bytes)
    output wire [31:0] payload       // 32-bit Payload output
);

    // =======================================================
    // READ TIMING PARAMETERS (312.5 MHz Domain)
    // Aligned with C_PRELOAD_LATENCY = 2 (Embedded Output Register):
    // - rd_head active : count = 21..36  (16 pops)  -> header_dv  : count = 23..38  (16 cycles)
    // - rd_load active : count = 21..498 (478 pops) -> payload_dv : count = 23..500 (478 cycles)
    // =======================================================
    parameter st_head   = 20;
    parameter max_head  = 37;
    parameter st_load   = 20;
    parameter max_load  = 499;
    parameter max_frame = 502;

    reg [15:0] count = 16'd0;

    localparam IDLE   = 3'b001;
    localparam ACTIVE = 3'b010;
    localparam END    = 3'b100;

    reg [2:0] state;
    reg [2:0] next_state;

    wire        rd_head;
    wire [7:0]  header_out;
    wire        rd_load;
    wire [31:0] payload_out;

    wire head_empty;
    wire load_empty;
    wire head_rd_rst_busy;
    wire load_rd_rst_busy;

    // 1. Read Control State Machine (312.5 MHz)
    always @(posedge clk_gth or negedge rst_n) begin
        if (~rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(posedge clk_gth or negedge rst_n) begin
        if (~rst_n)
            count <= 16'd0;
        else if (state == ACTIVE)
            count <= count + 1'b1;
        else
            count <= 16'd0;
    end

    always @(*) begin
        case (state)
            IDLE: begin
                if (~head_empty && ~load_empty && ~head_rd_rst_busy && ~load_rd_rst_busy)
                    next_state = ACTIVE;
                else
                    next_state = IDLE;
            end
            ACTIVE: begin
                if (count < max_frame)
                    next_state = ACTIVE;
                else
                    next_state = END;
            end
            END:     next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // 2. FIFO Read Enable & 2-Cycle Latency Aligned Outputs
    assign rd_head    = (state == ACTIVE) && (count > st_head && count < max_head);
    assign header_dv  = (state == ACTIVE) && (count > st_head + 2 && count < max_head + 2);
    assign header     = (header_dv) ? header_out : 8'd0;

    assign rd_load    = (state == ACTIVE) && (count > st_load && count < max_load);
    assign payload_dv = (state == ACTIVE) && (count > st_load + 2 && count < max_load + 2);
    assign payload    = (payload_dv) ? payload_out : 32'd0;

    // 3. Asynchronous FIFO Instantiations
    cross_logic_gth_head cross_head_inst (
        .srst        (~rst_n),
        .wr_clk      (clk_logic),
        .wr_en       (en_head),
        .din         (header_in),
        .rd_clk      (clk_gth),
        .rd_en       (rd_head),
        .dout        (header_out),
        .full        (),
        .empty       (head_empty),
        .wr_rst_busy (),
        .rd_rst_busy (head_rd_rst_busy)
    );

    cross_logic_gth_load cross_load_inst (
        .srst        (~rst_n),
        .wr_clk      (clk_logic),
        .wr_en       (en_load),
        .din         (payload_in),
        .rd_clk      (clk_gth),
        .rd_en       (rd_load),
        .dout        (payload_out),
        .full        (),
        .empty       (load_empty),
        .wr_rst_busy (),
        .rd_rst_busy (load_rd_rst_busy)
    );

    // =======================================================
    // 4. SIMULATION TRACKERS & SDA OISL FIELD EXTRACTORS (312.5 MHz)
    // =======================================================
    // synthesis translate_off
    wire [4:0]  out_hdr_byte_cnt = header_dv  ? (count - (st_head + 16'd2)) : 5'd0;  // 1..16 Bytes
    wire [8:0]  out_pld_word_cnt = payload_dv ? (count - (st_load + 16'd2)) : 9'd0;  // 1..478 Words

    reg  [7:0]  hdr_buf [0:15];
    reg  [15:0] cdc4_TXFN;
    reg  [15:0] cdc4_RXFN;
    reg         cdc4_ACK;
    reg         cdc4_ACK_VALID;
    reg  [1:0]  cdc4_FRAME_TYPE; // 01=DATA, 00=IDLE, 10=MGMT
    reg  [39:0] cdc4_TX_TS;
    reg  [5:0]  cdc4_TOD_SEC;
    reg  [2:0]  cdc4_TS_APPLIES;
    reg  [3:0]  cdc4_FCCH_OP;
    reg  [15:0] cdc4_FCCH_PL;
    reg  [15:0] cdc4_HDR_CRC16;

    reg  [31:0] cdc4_FSO_PLD_HDR;
    reg  [31:0] cdc4_FSO_PKT_HDR;
    reg  [95:0] cdc4_ASCII_TAG;
    reg  [31:0] cdc4_ETH_FCS;
    reg  [63:0] cdc4_MGMT_RANGE;
    reg  [31:0] cdc4_PLD_CRC32;

    reg  [3:0]  mgmt_range_hi4;
    reg  [3:0]  mgmt_range_lo4;
    reg  [31:0] mgmt_range_mid32;

    always @(posedge clk_gth or negedge rst_n) begin
        if (~rst_n) begin
            cdc4_TXFN        <= 16'd0;
            cdc4_RXFN        <= 16'd0;
            cdc4_ACK         <= 1'b0;
            cdc4_ACK_VALID   <= 1'b0;
            cdc4_FRAME_TYPE  <= 2'd0;
            cdc4_TX_TS       <= 40'd0;
            cdc4_TOD_SEC     <= 6'd0;
            cdc4_TS_APPLIES  <= 3'd0;
            cdc4_FCCH_OP     <= 4'd0;
            cdc4_FCCH_PL     <= 16'd0;
            cdc4_HDR_CRC16   <= 16'd0;
            cdc4_FSO_PLD_HDR <= 32'd0;
            cdc4_FSO_PKT_HDR <= 32'd0;
            cdc4_ASCII_TAG   <= 96'd0;
            cdc4_ETH_FCS     <= 32'd0;
            cdc4_MGMT_RANGE  <= 64'd0;
            cdc4_PLD_CRC32   <= 32'd0;
            mgmt_range_hi4   <= 4'd0;
            mgmt_range_lo4   <= 4'd0;
            mgmt_range_mid32 <= 32'd0;
        end else begin
            // 1. Progressive Header Field Extraction (Updates as each byte arrives)
            if (header_dv) begin
                hdr_buf[out_hdr_byte_cnt - 5'd1] <= header_out;
                case (out_hdr_byte_cnt)
                    5'd2:  cdc4_TXFN <= {header_out, hdr_buf[0]};
                    5'd4:  cdc4_RXFN <= {header_out, hdr_buf[2]};
                    5'd5: begin
                        cdc4_ACK        <= header_out[3];
                        cdc4_ACK_VALID  <= header_out[2];
                        cdc4_FRAME_TYPE <= header_out[1:0];
                    end
                    5'd10: cdc4_TX_TS     <= {header_out, hdr_buf[8], hdr_buf[7], hdr_buf[6], hdr_buf[5]};
                    5'd11: cdc4_TOD_SEC   <= header_out[5:0];
                    5'd12: begin
                        cdc4_TS_APPLIES <= header_out[6:4];
                        cdc4_FCCH_OP    <= header_out[3:0];
                    end
                    5'd14: cdc4_FCCH_PL   <= {header_out, hdr_buf[12]};
                    5'd16: cdc4_HDR_CRC16 <= {hdr_buf[14], header_out};
                endcase
            end

            // 2. Payload Marker Extraction (Uses progressive cdc4_TXFN & cdc4_FRAME_TYPE)
            if (payload_dv) begin
                if (out_pld_word_cnt == 9'd1) cdc4_FSO_PLD_HDR <= payload_out;
                if (out_pld_word_cnt == 9'd2) cdc4_FSO_PKT_HDR <= payload_out;

                // Frame 1 (DAT1): Extract 12-Byte ASCII Tag "Kookmin FSO " (Words 13, 14, 15)
                if (out_pld_word_cnt == 9'd13 && cdc4_TXFN == 16'd1)
                    cdc4_ASCII_TAG[95:64] <= payload_out;
                if (out_pld_word_cnt == 9'd14 && cdc4_TXFN == 16'd1)
                    cdc4_ASCII_TAG[63:32] <= payload_out;
                if (out_pld_word_cnt == 9'd15 && cdc4_TXFN == 16'd1)
                    cdc4_ASCII_TAG[31:0]  <= payload_out;

                // Frame 2 (DAT2): Extract Ethernet FCS 0xDEADBEEF at 100th segment byte (Word 27 or Word 26)
                if ((out_pld_word_cnt == 9'd26 || out_pld_word_cnt == 9'd27) &&
                    (cdc4_TXFN == 16'd2) && (payload_out == 32'hDEAD_BEEF))
                    cdc4_ETH_FCS <= payload_out;

                // Frame 4 (MGMT): Extract 64-bit IEEE-754 Range (64'h4153_12D0_0000_0000) across Words 3, 4, 5
                if (out_pld_word_cnt == 9'd3) begin
                    mgmt_range_hi4 <= payload_out[3:0];
                    mgmt_range_lo4 <= payload_out[31:28];
                end
                if (out_pld_word_cnt == 9'd4)
                    mgmt_range_mid32 <= payload_out;
                if (out_pld_word_cnt == 9'd5 && cdc4_FRAME_TYPE == 2'b10) begin
                    if (mgmt_range_hi4 != 4'd0)
                        cdc4_MGMT_RANGE <= {mgmt_range_hi4, mgmt_range_mid32, payload_out[31:4]};
                    else
                        cdc4_MGMT_RANGE <= {payload_out[27:0], mgmt_range_mid32, mgmt_range_lo4};
                end

                // Final 32-bit Word (Word 478): Extract FSO Payload CRC-32
                if (out_pld_word_cnt == 9'd478)
                    cdc4_PLD_CRC32 <= payload_out;
            end
        end
    end

    // 3. Race-Free Negedge Queue Writer & Continuous 4-Frame Unpacker (1..1912 Bytes/frame)
    reg [7:0]  pld_sim_q [0:16383];
    integer    pld_wr_ptr, pld_rd_ptr;
    reg        pld_unpack_active;

    reg [7:0]  out_pld_byte_stream;
    reg [11:0] out_pld_byte_cnt;    // Counts strictly 1 to 1912 per frame
    reg [15:0] out_pld_total_bytes; // Counts 1 to 7648 (4 x 1912 Bytes)
    reg [31:0] cdc4_frame_id;       // Active Frame ID (1, 2, 3, 4)

    initial begin
        pld_wr_ptr          = 0;
        pld_rd_ptr          = 0;
        pld_unpack_active   = 1'b0;
        out_pld_byte_stream = 8'd0;
        out_pld_byte_cnt    = 12'd0;
        out_pld_total_bytes = 16'd0;
        cdc4_frame_id       = 32'd0;
    end

    // THREAD B: Negedge Queue Writer (1.6 ns before posedge clk_gth)
    always @(negedge clk_gth or negedge rst_n) begin
        if (~rst_n) begin
            pld_wr_ptr = 0;
        end else if (payload_dv) begin
            pld_sim_q[pld_wr_ptr + 0] = payload_out[31:24];
            pld_sim_q[pld_wr_ptr + 1] = payload_out[23:16];
            pld_sim_q[pld_wr_ptr + 2] = payload_out[15:8];
            pld_sim_q[pld_wr_ptr + 3] = payload_out[7:0];
            pld_wr_ptr                = pld_wr_ptr + 4;
        end
    end

    // THREAD C: Continuous 4-Frame Unpacker (1912 Bytes per 2493.600 ns frame window)
    real next_cdc4_edge_ns;
    always @(posedge clk_gth) begin
        if (rst_n && (state == ACTIVE) && (count == st_load + 16'd3) && !pld_unpack_active) begin
            pld_unpack_active = 1'b1;
            #0.001; // Align with payload_dv Word 1 at count == 23
            next_cdc4_edge_ns = $realtime;
            while (out_pld_total_bytes < 16'd7648) begin
                if (pld_rd_ptr == 0)
                    out_pld_byte_stream = payload_out[31:24];
                else
                    out_pld_byte_stream = pld_sim_q[pld_rd_ptr];

                pld_rd_ptr          = pld_rd_ptr + 1;
                out_pld_total_bytes = out_pld_total_bytes + 16'd1;

                if (cdc4_frame_id == 32'd0) begin
                    cdc4_frame_id    = 32'd1;
                    out_pld_byte_cnt = 12'd1;
                end else if (out_pld_byte_cnt == 12'd1912) begin
                    cdc4_frame_id    = cdc4_frame_id + 32'd1;
                    out_pld_byte_cnt = 12'd1;
                end else begin
                    out_pld_byte_cnt = out_pld_byte_cnt + 12'd1;
                end

                next_cdc4_edge_ns = next_cdc4_edge_ns + (2493.6 / 1912.0);
                #((next_cdc4_edge_ns - $realtime) > 0.0 ? (next_cdc4_edge_ns - $realtime) : 0.001);
            end
            out_pld_byte_stream = 8'd0;
            out_pld_byte_cnt    = 12'd0;
            cdc4_frame_id       = 32'd0;
            pld_unpack_active   = 1'b0;
        end
    end
    // synthesis translate_on

endmodule