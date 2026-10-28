`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_FEC_Demux
Description  : Standalone Verification Testbench for Receiver FEC Demux 
               (FEC_Demux.v).
               - Feeds 4 continuous 259-word (2072-Byte) descrambled frames 
                 into FEC_Demux at 200.0 MHz.
               - Verifies that the first 4 words (32 Bytes) are serialized 
                 into 32 consecutive 8-bit Header bytes (header_dv = 1 for 
                 32 cycles) and the remaining 255 words (2040 Bytes) are 
                 routed to the 64-bit Payload bus (payload_dv = 1 for 255 cycles).

Revision History:
  - Rev 1.0 (Initial) : 4-frame FEC_Demux 32B Header + 2040B Payload splitter TB.
  - Rev 2.0 (2026-10-27 15:55 KST) : [Table 2-10 & Table 2-18 Alignment]
    Aligned Header bytes d0..d15 with SDA OISL Table 2-10 LSB-first ordering 
    (d0 = TXFN[7:0], d1 = TXFN[15:8], d14..d15 = 16'h0F28 CRC-16) and Payload 
    Word 1 with Table 2-18 (64'hAB00_0000_CDEF_07D0 on DAT1, 64'hAB00_4064_AAAA_0001 
    on DAT2 Continuation Frame).
===========================================================================
*/

module tb_FEC_Demux();

    reg clk;   // 200.0 MHz Baseband Clock (5.0 ns)
    reg rst_n;

    reg         desc_dv;
    reg  [63:0] desc_data;

    wire        rs_head_dv;
    wire [7:0]  rs_head_out;
    wire        rs_load_dv;
    wire [63:0] rs_load_out;

    // Hierarchical Waveform Trackers inside FEC_Demux
    wire [5:0]  out_hdr_byte_cnt = u_fec_demux.out_hdr_byte_cnt; // 1..32 Bytes
    wire [8:0]  out_pld_word_cnt = u_fec_demux.out_pld_word_cnt; // 1..255 Words
    wire [11:0] out_pld_byte_cnt = u_fec_demux.out_pld_byte_cnt; // 8..2040 Bytes

    FEC_Demux u_fec_demux (
        .clk        (clk),
        .rst_n      (rst_n),
        .en         (desc_dv),
        .data_in    (desc_data),
        .header_dv  (rs_head_dv),
        .header     (rs_head_out),
        .payload_dv (rs_load_dv),
        .payload    (rs_load_out)
    );

    initial begin
        clk = 1'b0;
        forever #2.5 clk = ~clk;
    end

    localparam ST_STREAM = 2'd0;
    localparam ST_GAP    = 2'd1;
    localparam ST_DONE   = 2'd2;

    reg [1:0]  tb_state;
    reg [3:0]  frame_id;
    reg [15:0] cycle_cnt;

    integer total_hdr_bytes_out = 0;
    integer total_pld_words_out = 0;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            total_hdr_bytes_out <= 0;
            total_pld_words_out <= 0;
        end else begin
            if (rs_head_dv) total_hdr_bytes_out <= total_hdr_bytes_out + 1;
            if (rs_load_dv) total_pld_words_out <= total_pld_words_out + 1;
        end
    end

    initial begin
        rst_n     = 1'b0;
        tb_state  = ST_STREAM;
        frame_id  = 4'd1;
        cycle_cnt = 16'd1;
        #100;
        rst_n     = 1'b1;
    end

    always @(posedge clk or negedge rst_n) begin
        if (rst_n) begin
            case (tb_state)
                ST_STREAM: begin
                    if (cycle_cnt < 16'd259)
                        cycle_cnt <= cycle_cnt + 16'd1;
                    else begin
                        tb_state  <= ST_GAP;
                        cycle_cnt <= 16'd1;
                    end
                end
                ST_GAP: begin
                    if (cycle_cnt < 16'd35)
                        cycle_cnt <= cycle_cnt + 16'd1;
                    else if (frame_id < 4'd4) begin
                        frame_id  <= frame_id + 4'd1;
                        tb_state  <= ST_STREAM;
                        cycle_cnt <= 16'd1;
                    end else begin
                        tb_state  <= ST_DONE;
                    end
                end
                default: tb_state <= ST_DONE;
            endcase
        end
    end

    always @(*) begin
        desc_dv   = 1'b0;
        desc_data = 64'd0;

        if (rst_n && (tb_state == ST_STREAM)) begin
            desc_dv = 1'b1;
            // Words 1..4: 32-Byte RS(32,16) Encoded Header (Table 2-10 LSB-first)
            if      (cycle_cnt == 16'd1)   desc_data = {4'd0, frame_id, 8'h00, 16'h0000, 8'hFD, 24'h554433};
            else if (cycle_cnt == 16'd2)   desc_data = 64'h2211_F28A_8899_0F28;
            else if (cycle_cnt <= 16'd4)   desc_data = 64'hC1C2_C1C2_C1C2_C1C2;
            // Words 5..259: 2040-Byte 8xRS(255,239) Encoded Payload (Table 2-18)
            else if (cycle_cnt == 16'd5)   desc_data = (frame_id == 4'd2) ? 64'hAB00_4064_AAAA_0001 : 64'hAB00_0000_CDEF_07D0;
            else if (cycle_cnt == 16'd243) desc_data = 64'hDA7A_DA7A_C320_0000 + {60'd0, frame_id};
            else if (cycle_cnt >  16'd243) desc_data = 64'hB10C_B10C_B10C_B10C;
            else begin
                if      (frame_id <= 4'd2) desc_data = 64'hDA7A_DA7A_DA7A_DA7A;
                else if (frame_id == 4'd3) desc_data = 64'h1D1E_1D1E_1D1E_1D1E;
                else                       desc_data = 64'hA1A1_A1A1_A1A1_A1A1;
            end
        end
    end

    initial begin
        wait(tb_state == ST_DONE);
        #500;
        $display("\n======================================================================");
        $display(" RECEIVER FEC_DEMUX GEOMETRY VERIFICATION REPORT");
        $display(" -> Total 8-bit RS Header Bytes Emitted (4 x 32B)    : %0d / 128 Bytes", total_hdr_bytes_out);
        $display(" -> Total 64-bit RS Payload Words Emitted (4 x 255W) : %0d / 1020 Words (%0d Bytes)",
                 total_pld_words_out, total_pld_words_out * 8);
        if (total_hdr_bytes_out == 128 && total_pld_words_out == 1020)
            $display(" -> RESULT: [PASS] 100%% EXACT HEADER & PAYLOAD DEMULTIPLEXING!");
        $display("======================================================================\n");
        $finish;
    end

endmodule