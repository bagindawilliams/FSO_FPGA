`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : FEC_Demux
Description  : Forward Error Correction (FEC) Frame Demultiplexer.
               Receives the 259-cycle descrambled 64-bit stream (2072 Bytes)
               and separates it into:
               1. RS Header Stream : 32 cycles @ 8-bit  (32 Bytes: 16B Data + 16B Parity)
               2. RS Payload Stream: 255 cycles @ 64-bit (2040 Bytes: 1912B Data + 128B Parity)

               Revision History:
               - Rev 1.0 (Initial) : 2072B to 32B Header + 2040B Payload demultiplexer.
               - Rev 2.0 (2026-10-22 06:20 KST) : Updated timescale to 1ns/1ps,
                 clocked pld_sim_q writer on negedge clk, and maintained 
                 continuous 4-frame unpacking (8160 bytes across exact 
                 2493.600 ns frame windows) so demux_frame_id counts 1 -> 2 -> 3 -> 4.
===========================================================================
*/

module FEC_Demux (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        en,          // 259 continuous cycles from descrambler
    input  wire [63:0] data_in,     // 64-bit descrambled word

    // Output to RS(32,16) Header Decoder (8-bit, 32 cycles = 32 Bytes)
    output reg         header_dv,
    output reg  [7:0]  header,

    // Output to 8xRS(255,239) Payload Decoder (64-bit, 255 cycles = 2040 Bytes)
    output reg         payload_dv,
    output reg  [63:0] payload
);

    reg [8:0]   in_word_cnt;
    reg [255:0] hdr_shift_buf;
    reg [5:0]   hdr_byte_idx;
    reg         hdr_serializing;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            in_word_cnt     <= 9'd0;
            hdr_shift_buf   <= 256'd0;
            hdr_byte_idx    <= 6'd0;
            hdr_serializing <= 1'b0;
            header_dv       <= 1'b0;
            header          <= 8'd0;
            payload_dv      <= 1'b0;
            payload         <= 64'd0;
        end else begin
            header_dv  <= 1'b0;
            header     <= 8'd0;
            payload_dv <= 1'b0;
            payload    <= 64'd0;

            // 1. Route first 4 words (32 Bytes) to Header buffer, remaining 255 words (2040 Bytes) to Payload
            if (en) begin
                if (in_word_cnt < 9'd4) begin
                    case (in_word_cnt[1:0])
                        2'd0: hdr_shift_buf[255:192] <= data_in;
                        2'd1: hdr_shift_buf[191:128] <= data_in;
                        2'd2: hdr_shift_buf[127:64]  <= data_in;
                        2'd3: begin
                            hdr_shift_buf[63:0] <= data_in;
                            hdr_serializing     <= 1'b1;
                            hdr_byte_idx        <= 6'd0;
                        end
                    endcase
                    in_word_cnt <= in_word_cnt + 9'd1;
                end else begin
                    payload_dv <= 1'b1;
                    payload    <= data_in;
                    if (in_word_cnt == 9'd258)
                        in_word_cnt <= 9'd0;
                    else
                        in_word_cnt <= in_word_cnt + 9'd1;
                end
            end else begin
                in_word_cnt <= 9'd0;
            end

            // 2. Serialize 32-Byte RS Header at 1 Byte per clock cycle (MSB-first)
            if (hdr_serializing) begin
                header_dv     <= 1'b1;
                header        <= hdr_shift_buf[255:248];
                hdr_shift_buf <= {hdr_shift_buf[247:0], 8'd0};

                if (hdr_byte_idx == 6'd31) begin
                    hdr_serializing <= 1'b0;
                    hdr_byte_idx    <= 6'd0;
                end else begin
                    hdr_byte_idx <= hdr_byte_idx + 6'd1;
                end
            end
        end
    end

    // =======================================================
    // 3. SIMULATION TRACKERS: HEADER (1..32B) & PAYLOAD (1..2040B)
    // =======================================================
    // synthesis translate_off
    reg [5:0]  hdr_out_byte_cnt; // Counts 1..32 during header_dv
    reg [8:0]  pld_out_word_cnt; // Counts 1..255 during payload_dv

    reg [7:0]  pld_sim_q [0:16383];
    integer    pld_wr_ptr;
    integer    pld_rd_ptr;
    reg        pld_unpack_active;

    reg [7:0]  pld_byte_stream;
    reg [11:0] pld_byte_cnt;     // Counts strictly 1 to 2040 per frame
    reg [31:0] demux_frame_id;   // Active Frame ID (1, 2, 3, 4)
    reg [15:0] pld_total_bytes;  // Counts 1 to 8160 (4 x 2040 Bytes)

    initial begin
        hdr_out_byte_cnt  = 6'd0;
        pld_out_word_cnt  = 9'd0;
        pld_wr_ptr        = 0;
        pld_rd_ptr        = 0;
        pld_unpack_active = 1'b0;
        pld_byte_stream   = 8'd0;
        pld_byte_cnt      = 12'd0;
        demux_frame_id    = 32'd0;
        pld_total_bytes   = 16'd0;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            hdr_out_byte_cnt <= 6'd0;
            pld_out_word_cnt <= 9'd0;
        end else begin
            if (hdr_serializing)
                hdr_out_byte_cnt <= hdr_byte_idx + 6'd1;
            else
                hdr_out_byte_cnt <= 6'd0;

            if (en && (in_word_cnt >= 9'd4))
                pld_out_word_cnt <= (in_word_cnt - 9'd3);
            else
                pld_out_word_cnt <= 9'd0;
        end
    end

    // THREAD B: Negedge Queue Writer (2.5 ns before posedge clk)
    always @(negedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pld_wr_ptr = 0;
        end else if (payload_dv) begin
            pld_sim_q[pld_wr_ptr + 0] = payload[63:56];
            pld_sim_q[pld_wr_ptr + 1] = payload[55:48];
            pld_sim_q[pld_wr_ptr + 2] = payload[47:40];
            pld_sim_q[pld_wr_ptr + 3] = payload[39:32];
            pld_sim_q[pld_wr_ptr + 4] = payload[31:24];
            pld_sim_q[pld_wr_ptr + 5] = payload[23:16];
            pld_sim_q[pld_wr_ptr + 6] = payload[15:8];
            pld_sim_q[pld_wr_ptr + 7] = payload[7:0];
            pld_wr_ptr                = pld_wr_ptr + 8;
        end
    end

    // THREAD C: Continuous 4-Frame Unpacker (2040 Bytes per 2493.600 ns frame window)
    real next_pld_edge_ns;
    always @(posedge clk) begin
        if (rst_n && en && (in_word_cnt == 9'd4) && !pld_unpack_active) begin
            pld_unpack_active = 1'b1;
            #0.001; // Wait 1 ps so payload_dv and payload Word 1 are updated
            next_pld_edge_ns  = $realtime;
            while (pld_total_bytes < 16'd8160) begin
                if (pld_rd_ptr == 0)
                    pld_byte_stream = payload[63:56];
                else
                    pld_byte_stream = pld_sim_q[pld_rd_ptr];

                pld_rd_ptr      = pld_rd_ptr + 1;
                pld_total_bytes = pld_total_bytes + 16'd1;

                if (demux_frame_id == 32'd0) begin
                    demux_frame_id = 32'd1;
                    pld_byte_cnt   = 12'd1;
                end else if (pld_byte_cnt == 12'd2040) begin
                    demux_frame_id = demux_frame_id + 32'd1;
                    pld_byte_cnt   = 12'd1;
                end else begin
                    pld_byte_cnt   = pld_byte_cnt + 12'd1;
                end

                next_pld_edge_ns = next_pld_edge_ns + (2493.6 / 2040.0);
                #((next_pld_edge_ns - $realtime) > 0.0 ? (next_pld_edge_ns - $realtime) : 0.001);
            end
            pld_byte_stream   = 8'd0;
            pld_byte_cnt      = 12'd0;
            demux_frame_id    = 32'd0;
            pld_unpack_active = 1'b0;
        end
    end
    // synthesis translate_on

endmodule