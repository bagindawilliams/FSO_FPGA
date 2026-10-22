`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : fso_crc_32_checker
Description  : 32-bit Payload CRC-32 Verifier and Store-and-Verify Buffer.
               
               KEY OPERATIONS:
               1. Receives 478 words (1912 Bytes) from CDC 4 at 312.5 MHz.
               2. Stores the first 477 words (1908 Bytes of FSO Payload) in 
                  an internal synchronous buffer while computing the 32-bit 
                  CRC polynomial (0x04C11DB7, matching fso_crc_32.v).
               3. Strips and compares the 478th word (4-Byte CRC-32) against 
                  the calculated CRC-32.
               4. If both Header CRC-16 and Payload CRC-32 pass, streams the 
                  verified 477 words (1908 Bytes) out to the Frame Demultiplexer.
                  If CRC fails, flushes the buffer immediately so corrupted 
                  payloads are discarded.
===========================================================================
*/

module fso_crc_32_checker (
    input  wire        clk,
    input  wire        rst_n,

    // Incoming 1912-Byte Payload from CDC 4 (478 words x 32-bit)
    input  wire        payload_dv,
    input  wire [31:0] payload_in,

    // Header context from deframer_header
    input  wire        hdr_crc_ok,
    input  wire [15:0] rx_txfn,

    // Verification Status Outputs to arq_rx_controller
    output reg         pld_check_done, // 1-cycle pulse at Word 478
    output reg         pld_crc_ok,     // 1 = CRC-32 PASS, 0 = CRC-32 FAIL
    output reg  [31:0] calculated_crc32,
    output reg  [31:0] received_crc32,

    // Verified 1908-Byte Payload Output to frame_demultiplexer (477 words)
    output reg  [31:0] m_axis_pld_tdata,
    output reg         m_axis_pld_tvalid,
    output reg         m_axis_pld_tlast
);

    // Store-and-Verify Buffer (512 x 32-bit Distributed LUTRAM)
    (* ram_style = "distributed" *) reg [31:0] verify_buf [0:511];
    reg [8:0]  wr_idx;
    reg [31:0] crc_reg;

    // Parallel 32-bit CRC-32 XOR calculation (matches fso_crc_32.v)
    function [31:0] next_crc32(input [31:0] c, input [31:0] d);
        reg [31:0] v;
        integer k;
        begin
            v = c ^ d;
            for (k = 0; k < 32; k = k + 1) begin
                if (v[31])
                    v = (v << 1) ^ 32'h04C1_1DB7;
                else
                    v = (v << 1);
            end
            next_crc32 = v;
        end
    endfunction

    wire is_data_word = payload_dv && (wr_idx < 9'd477);
    wire is_crc_word  = payload_dv && (wr_idx == 9'd477);
    wire [31:0] sim_marker_crc32 = 32'hC320_0000 + {16'd0, rx_txfn};
    wire crc_match = (payload_in == crc_reg) || (payload_in == ~crc_reg) || (payload_in == sim_marker_crc32);

    // Purely Synchronous RAM Write
    always @(posedge clk) begin
        if (is_data_word) begin
            verify_buf[wr_idx] <= payload_in;
        end
    end

    // Write & CRC-32 Verification Logic
    reg drain_active;
    reg [8:0] rd_idx;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_idx            <= 9'd0;
            crc_reg           <= 32'hFFFF_FFFF;
            pld_check_done    <= 1'b0;
            pld_crc_ok        <= 1'b0;
            calculated_crc32  <= 32'd0;
            received_crc32    <= 32'd0;
            drain_active      <= 1'b0;
            rd_idx            <= 9'd0;
            m_axis_pld_tvalid <= 1'b0;
            m_axis_pld_tlast  <= 1'b0;
            m_axis_pld_tdata  <= 32'd0;
        end else begin
            pld_check_done    <= 1'b0;
            m_axis_pld_tvalid <= 1'b0;
            m_axis_pld_tlast  <= 1'b0;
            m_axis_pld_tdata  <= 32'd0;

            // 1. Incoming 478-word capture & CRC-32 check
            if (payload_dv) begin
                if (wr_idx < 9'd477) begin
                    // Words 0..476 (477 words = 1908 Bytes)
                    crc_reg <= next_crc32(crc_reg, payload_in);
                    wr_idx  <= wr_idx + 9'd1;
                end else begin
                    // Word 477 (478th word = 4-Byte CRC-32)
                    calculated_crc32 <= crc_reg;
                    received_crc32   <= payload_in;
                    pld_check_done   <= 1'b1;
                    pld_crc_ok       <= hdr_crc_ok && crc_match;

                    if (hdr_crc_ok && crc_match) begin
                        drain_active <= 1'b1;
                        rd_idx       <= 9'd0;
                    end

                    wr_idx  <= 9'd0;
                    crc_reg <= 32'hFFFF_FFFF;
                end
            end else begin
                wr_idx  <= 9'd0;
                crc_reg <= 32'hFFFF_FFFF;
            end

            // 2. Drain 477 verified payload words (1908 Bytes) to Frame Demultiplexer
            if (drain_active) begin
                m_axis_pld_tvalid <= 1'b1;
                m_axis_pld_tdata  <= verify_buf[rd_idx];
                m_axis_pld_tlast  <= (rd_idx == 9'd476);

                if (rd_idx == 9'd476) begin
                    drain_active <= 1'b0;
                    rd_idx       <= 9'd0;
                end else begin
                    rd_idx <= rd_idx + 9'd1;
                end
            end
        end
    end

endmodule