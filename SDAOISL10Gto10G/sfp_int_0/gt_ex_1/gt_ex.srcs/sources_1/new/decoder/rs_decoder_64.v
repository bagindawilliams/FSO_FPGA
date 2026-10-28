`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University / ETRI Daejeon
Engineers    : Irzal Zaini & Williamsyah Baginda Miraj
Module Name  : rs_decoder_64
Description  : 64-bit Parallel Reed-Solomon Payload Decoder.
               Instantiates 8 parallel RS(255,239) decoder engines to 
               process 255 incoming 64-bit words (2040 Bytes) and output 
               239 corrected 64-bit payload words (1912 Bytes).

               Revision History:
               - Rev 1.0 (Initial) : 8-lane parallel RS(255,239) payload decoder.
               - Rev 1.1 (2026-10-22 06:20 KST) : Updated timescale to 1ns/1ps,
                 clocked rs_sim_q writer on negedge clk, and maintained 
                 continuous 4-frame unpacking (7648 bytes across exact 
                 2493.600 ns frame windows) so rs_frame_id counts 1 -> 2 -> 3 -> 4.
===========================================================================
*/

module rs_decoder_64 (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        en,
    input  wire [63:0] data_in,
    output wire        flag,
    output wire [63:0] data_out
);

    rs_decoder #(256) rs_decoder_7 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[63:56]),
        .flag     (flag),
        .data_out (data_out[63:56])
    );

    rs_decoder #(256) rs_decoder_6 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[55:48]),
        .flag     (),
        .data_out (data_out[55:48])
    );

    rs_decoder #(256) rs_decoder_5 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[47:40]),
        .flag     (),
        .data_out (data_out[47:40])
    );

    rs_decoder #(256) rs_decoder_4 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[39:32]),
        .flag     (),
        .data_out (data_out[39:32])
    );

    rs_decoder #(256) rs_decoder_3 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[31:24]),
        .flag     (),
        .data_out (data_out[31:24])
    );

    rs_decoder #(256) rs_decoder_2 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[23:16]),
        .flag     (),
        .data_out (data_out[23:16])
    );

    rs_decoder #(256) rs_decoder_1 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[15:8]),
        .flag     (),
        .data_out (data_out[15:8])
    );

    rs_decoder #(256) rs_decoder_0 (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (en),
        .data_in  (data_in[7:0]),
        .flag     (),
        .data_out (data_out[7:0])
    );

    // =====================================================================
    // SIMULATION TRACKERS: 1..1912 BYTE UNPACKER & FSO HEADER/CRC32 EXTRACTOR
    // =====================================================================
    // synthesis translate_off
    wire [8:0]  pld_out_word_cnt = rs_decoder_7.out_byte_cnt; // 1..239 Words (64-bit)
    wire [11:0] total_repaired_pld_bytes = 
                rs_decoder_7.repaired_symbol_cnt + rs_decoder_6.repaired_symbol_cnt +
                rs_decoder_5.repaired_symbol_cnt + rs_decoder_4.repaired_symbol_cnt +
                rs_decoder_3.repaired_symbol_cnt + rs_decoder_2.repaired_symbol_cnt +
                rs_decoder_1.repaired_symbol_cnt + rs_decoder_0.repaired_symbol_cnt;

    reg [31:0] fso_payload_header; // Captures 0xAB00_076C from Word 1 [63:32]
    reg [31:0] fso_packet_header;  // Captures 0xCDEF_07D0 from Word 1 [31:0]
    reg [31:0] fso_crc32_out;      // Captures 32-bit FSO CRC-32 from Word 239 [31:0]

    reg [7:0]  rs_sim_q [0:16383];
    integer    rs_wr_ptr;
    integer    rs_rd_ptr;
    reg        rs_unpack_active;

    reg [7:0]  pld_byte_stream;
    reg [11:0] pld_byte_cnt;       // Counts strictly 1 to 1912 per frame
    reg [31:0] rs_frame_id;        // Active Frame ID (1, 2, 3, 4)
    reg [15:0] pld_total_bytes;    // Counts 1 to 7648 (4 x 1912 Bytes)

    initial begin
        fso_payload_header = 32'd0;
        fso_packet_header  = 32'd0;
        fso_crc32_out      = 32'd0;
        rs_wr_ptr          = 0;
        rs_rd_ptr          = 0;
        rs_unpack_active   = 1'b0;
        pld_byte_stream    = 8'd0;
        pld_byte_cnt       = 12'd0;
        rs_frame_id        = 32'd0;
        pld_total_bytes    = 16'd0;
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            fso_payload_header <= 32'd0;
            fso_packet_header  <= 32'd0;
            fso_crc32_out      <= 32'd0;
        end else if (flag) begin
            if (pld_out_word_cnt == 9'd1) begin
                fso_payload_header <= data_out[63:32];
                fso_packet_header  <= data_out[31:0];
            end
            if (pld_out_word_cnt == 9'd239) begin
                fso_crc32_out <= data_out[31:0];
            end
        end
    end

    // THREAD B: Negedge Queue Writer (2.5 ns before posedge clk)
    always @(negedge clk or negedge rst_n) begin
        if (~rst_n) begin
            rs_wr_ptr = 0;
        end else if (flag) begin
            rs_sim_q[rs_wr_ptr + 0] = data_out[63:56];
            rs_sim_q[rs_wr_ptr + 1] = data_out[55:48];
            rs_sim_q[rs_wr_ptr + 2] = data_out[47:40];
            rs_sim_q[rs_wr_ptr + 3] = data_out[39:32];
            rs_sim_q[rs_wr_ptr + 4] = data_out[31:24];
            rs_sim_q[rs_wr_ptr + 5] = data_out[23:16];
            rs_sim_q[rs_wr_ptr + 6] = data_out[15:8];
            rs_sim_q[rs_wr_ptr + 7] = data_out[7:0];
            rs_wr_ptr               = rs_wr_ptr + 8;
        end
    end

    // THREAD C: Continuous 4-Frame Unpacker (1912 Bytes per 2493.600 ns frame window)
    real next_rs_edge_ns;
    always @(posedge clk) begin
        if (rst_n && (rs_decoder_7.rd_state == 3'b010) && (rs_decoder_7.con_rd == 16'd1) && !rs_unpack_active) begin
            rs_unpack_active = 1'b1;
            @(posedge clk); // Align to rising edge of flag Word 1 (con_rd == 2)
            #0.001;
            next_rs_edge_ns  = $realtime;
            while (pld_total_bytes < 16'd7648) begin
                if (rs_rd_ptr == 0)
                    pld_byte_stream = data_out[63:56];
                else
                    pld_byte_stream = rs_sim_q[rs_rd_ptr];

                rs_rd_ptr       = rs_rd_ptr + 1;
                pld_total_bytes = pld_total_bytes + 16'd1;

                if (rs_frame_id == 32'd0) begin
                    rs_frame_id  = 32'd1;
                    pld_byte_cnt = 12'd1;
                end else if (pld_byte_cnt == 12'd1912) begin
                    rs_frame_id  = rs_frame_id + 32'd1;
                    pld_byte_cnt = 12'd1;
                end else begin
                    pld_byte_cnt = pld_byte_cnt + 12'd1;
                end

                next_rs_edge_ns = next_rs_edge_ns + (2493.6 / 1912.0);
                #((next_rs_edge_ns - $realtime) > 0.0 ? (next_rs_edge_ns - $realtime) : 0.001);
            end
            pld_byte_stream  = 8'd0;
            pld_byte_cnt     = 12'd0;
            rs_frame_id      = 32'd0;
            rs_unpack_active = 1'b0;
        end
    end
    // synthesis translate_on

endmodule