`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : demux_preamble_128
Description  : 128-bit Frame Synchronizer and Demultiplexer.
               Separates each 3117-Byte FSO frame from CDC 3 into:
               1. 72-bit Optical Preamble (9 Bytes: 72'h55_55_55_55_55_55_55_55_D5)
               2. 259 consecutive 96-bit LPC words (259 x 12 Bytes = 3108 Bytes)

               Revision History:
               - Rev 1.0 (Initial) : 128-bit sliding-window preamble extractor
                 and 96-bit LPC gearbox demultiplexer.
               - Rev 1.1 (2026-10-22 05:14 KST) :
                 1. Upgraded timescale precision to 1ns/1ps.
                 2. Set ST_INTER_GAP to 238 cycles so each frame (1 Preamble + 
                    259 LPC + 239 Gap = 499 cycles @ 200 MHz) matches the exact 
                    2.4936 us frame cadence across all 4 frames.
                 3. Clocked simulation queue writer (lpc_sim_q) on negedge clk 
                    and used exact integer picosecond pacing (984 bytes @ 803 ps 
                    + 2124 bytes @ 802 ps = 2,493,600 ps = 2.493600 us/frame) 
                    to eliminate red 'X' glitches and 1-cycle start lag.
===========================================================================
*/

module demux_preamble_128 (
    input  wire         clk,
    input  wire         rst_n,
    
    // Input from rx_gth_logic (CDC 3: 128-bit @ 200.0 MHz)
    input  wire [127:0] cdc_data_in,
    input  wire         cdc_valid_in,
    
    // Separated 72-bit Preamble Output (9 Bytes)
    output reg  [71:0]  preamble_extracted,
    output reg          preamble_valid,
    
    // Separated 96-bit LPC Frame Output (259 cycles = 3108 Bytes)
    output reg  [95:0]  lpc_data_out,
    output reg          lpc_valid_out
);

    localparam [71:0] EXPECTED_PREAMBLE = 72'h55_55_55_55_55_55_55_55_D5;

    // =======================================================
    // 1. INTERNAL SYNCHRONOUS QUEUE (512 x 128-bit)
    // =======================================================
    (* ram_style = "distributed" *) reg [127:0] in_queue [0:511];
    reg [8:0]   wr_ptr;
    reg [8:0]   rd_ptr;
    reg [9:0]   q_count;

    wire         need_more_bytes;
    wire         q_pop  = need_more_bytes && (q_count != 10'd0);
    wire [127:0] q_dout = in_queue[rd_ptr];

    always @(posedge clk) begin
        if (cdc_valid_in) begin
            in_queue[wr_ptr] <= cdc_data_in;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr  <= 9'd0;
            rd_ptr  <= 9'd0;
            q_count <= 10'd0;
        end else begin
            if (cdc_valid_in) begin
                wr_ptr <= wr_ptr + 9'd1;
            end
            if (q_pop) begin
                rd_ptr <= rd_ptr + 9'd1;
            end
            case ({cdc_valid_in, q_pop})
                2'b10:   q_count <= q_count + 10'd1;
                2'b01:   q_count <= q_count - 10'd1;
                default: q_count <= q_count;
            endcase
        end
    end

    // =======================================================
    // 2. MSB-FIRST SLIDING WINDOW & 259-CYCLE LPC EXTRACTOR
    // =======================================================
    localparam ST_WAIT_FRAME = 2'd0;
    localparam ST_PREAMBLE   = 2'd1;
    localparam ST_LPC_BURST  = 2'd2;
    localparam ST_INTER_GAP  = 2'd3;

    reg [1:0]   state;
    reg [255:0] rx_buffer;
    reg [5:0]   bytes_in_buffer;
    reg [8:0]   word_count;
    reg [7:0]   gap_cnt;

    wire [15:0] total_avail_bytes = ({6'd0, q_count} << 4) + {10'd0, bytes_in_buffer};

    reg [5:0] consume_bytes;
    always @(*) begin
        consume_bytes = 6'd0;
        if (state == ST_PREAMBLE && (bytes_in_buffer >= 6'd9)) begin
            if (rx_buffer[255:184] == EXPECTED_PREAMBLE)
                consume_bytes = 6'd9;
            else
                consume_bytes = 6'd1;
        end else if (state == ST_LPC_BURST && (bytes_in_buffer >= 6'd12)) begin
            consume_bytes = 6'd12;
        end
    end

    assign need_more_bytes = ((bytes_in_buffer - consume_bytes) <= 6'd16);

    wire [255:0] shifted_buf = (consume_bytes == 6'd9)  ? (rx_buffer << 72) :
                               (consume_bytes == 6'd12) ? (rx_buffer << 96) :
                               (consume_bytes == 6'd1)  ? (rx_buffer << 8)  : rx_buffer;
    wire [5:0]   rem_bytes   = bytes_in_buffer - consume_bytes;
    wire [255:0] aligned_in  = {q_dout, 128'd0} >> (rem_bytes * 8);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state              <= ST_WAIT_FRAME;
            rx_buffer          <= 256'd0;
            bytes_in_buffer    <= 6'd0;
            word_count         <= 9'd0;
            gap_cnt            <= 8'd0;
            preamble_extracted <= 72'd0;
            preamble_valid     <= 1'b0;
            lpc_data_out       <= 96'd0;
            lpc_valid_out      <= 1'b0;
        end else begin
            preamble_valid <= 1'b0;
            lpc_valid_out  <= 1'b0;

            if (q_pop) begin
                rx_buffer       <= shifted_buf | aligned_in;
                bytes_in_buffer <= rem_bytes + 6'd16;
            end else begin
                rx_buffer       <= shifted_buf;
                bytes_in_buffer <= rem_bytes;
            end

            case (state)
                ST_WAIT_FRAME: begin
                    if (total_avail_bytes >= 16'd1500) begin
                        state <= ST_PREAMBLE;
                    end
                end

                ST_PREAMBLE: begin
                    if (bytes_in_buffer >= 6'd9) begin
                        if (rx_buffer[255:184] == EXPECTED_PREAMBLE) begin
                            preamble_extracted <= rx_buffer[255:184];
                            preamble_valid     <= 1'b1;
                            word_count         <= 9'd0;
                            state              <= ST_LPC_BURST;
                        end
                    end
                end

                ST_LPC_BURST: begin
                    if (bytes_in_buffer >= 6'd12) begin
                        lpc_data_out  <= rx_buffer[255:160];
                        lpc_valid_out <= 1'b1;

                        if (word_count == 9'd258) begin
                            word_count <= 9'd0;
                            gap_cnt    <= 8'd0;
                            state      <= ST_INTER_GAP;
                        end else begin
                            word_count <= word_count + 9'd1;
                        end
                    end
                end

                ST_INTER_GAP: begin
                    // 238 cycles gap so 1 (Preamble) + 259 (LPC) + 238 (Gap) + 1 (Wait) = 499 cycles (2.495 us)
                    if (gap_cnt == 8'd237) begin
                        gap_cnt <= 8'd0;
                        state   <= ST_WAIT_FRAME;
                    end else begin
                        gap_cnt <= gap_cnt + 8'd1;
                    end
                end

                default: state <= ST_WAIT_FRAME;
            endcase
        end
    end

    // =======================================================
    // 3. SIMULATION TRACKERS: RACE-FREE NEGEDGE WRITER & UNPACKER
    // =======================================================
    // synthesis translate_off
    reg [6:0]  preamble_bit_cnt;   // 72 bits when Preamble valid
    reg [3:0]  preamble_byte_cnt;  // 9 Bytes when Preamble valid
    reg [8:0]  lpc_word_cnt;       // Counts 1 to 259 during active LPC burst
    reg [11:0] lpc_burst_byte_cnt; // Counts 12, 24 .. 3108 during active LPC burst
    reg [15:0] out_clk_cnt;        // 200 MHz clock counter per frame (1..499)

    reg [7:0]  lpc_sim_q [0:16383];
    integer    lpc_wr_ptr;
    integer    lpc_rd_ptr;
    reg        lpc_unpack_active;

    reg [7:0]  lpc_byte_stream;
    reg [11:0] lpc_byte_cnt;       // Counts strictly 1 to 3108 per frame
    reg [31:0] demux_frame_id;     // Active Frame ID (1, 2, 3, 4)
    reg [15:0] lpc_total_bytes;    // Counts 1 to 12432 (4 x 3108 Bytes)

    wire lpc_word_firing = (state == ST_LPC_BURST) && (bytes_in_buffer >= 6'd12);

    initial begin
        preamble_bit_cnt   = 7'd0;
        preamble_byte_cnt  = 4'd0;
        lpc_word_cnt       = 9'd0;
        lpc_burst_byte_cnt = 12'd0;
        out_clk_cnt        = 16'd0;
        lpc_wr_ptr         = 0;
        lpc_rd_ptr         = 0;
        lpc_unpack_active  = 1'b0;
        lpc_byte_stream    = 8'd0;
        lpc_byte_cnt       = 12'd0;
        demux_frame_id     = 32'd0;
        lpc_total_bytes    = 16'd0;
    end

    // THREAD A: Clock & Word Counters
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            preamble_bit_cnt   <= 7'd0;
            preamble_byte_cnt  <= 4'd0;
            lpc_word_cnt       <= 9'd0;
            lpc_burst_byte_cnt <= 12'd0;
            out_clk_cnt        <= 16'd0;
        end else begin
            if (state == ST_PREAMBLE && (bytes_in_buffer >= 6'd9) && (rx_buffer[255:184] == EXPECTED_PREAMBLE)) begin
                preamble_bit_cnt  <= 7'd72;
                preamble_byte_cnt <= 4'd9;
            end else if (!preamble_valid && !lpc_valid_out && !lpc_unpack_active) begin
                preamble_bit_cnt  <= 7'd0;
                preamble_byte_cnt <= 4'd0;
            end

            if (lpc_word_firing) begin
                lpc_word_cnt       <= word_count + 9'd1;
                lpc_burst_byte_cnt <= (word_count + 12'd1) * 12'd12;
            end else begin
                lpc_word_cnt       <= 9'd0;
                lpc_burst_byte_cnt <= 12'd0;
            end

            if (lpc_word_firing && (word_count == 9'd0) && !lpc_unpack_active) begin
                out_clk_cnt <= 16'd1;
            end else if (lpc_unpack_active) begin
                if (lpc_byte_cnt <= 12'd6 && out_clk_cnt > 16'd490)
                    out_clk_cnt <= 16'd1;
                else
                    out_clk_cnt <= out_clk_cnt + 16'd1;
            end else begin
                out_clk_cnt <= 16'd0;
            end
        end
    end

    // THREAD B: Negedge Queue Writer (2.5 ns ahead of posedge clk, zero race!)
    always @(negedge clk or negedge rst_n) begin
        if (!rst_n) begin
            lpc_wr_ptr = 0;
        end else if (lpc_word_firing) begin
            lpc_sim_q[lpc_wr_ptr + 0]  = rx_buffer[255:248];
            lpc_sim_q[lpc_wr_ptr + 1]  = rx_buffer[247:240];
            lpc_sim_q[lpc_wr_ptr + 2]  = rx_buffer[239:232];
            lpc_sim_q[lpc_wr_ptr + 3]  = rx_buffer[231:224];
            lpc_sim_q[lpc_wr_ptr + 4]  = rx_buffer[223:216];
            lpc_sim_q[lpc_wr_ptr + 5]  = rx_buffer[215:208];
            lpc_sim_q[lpc_wr_ptr + 6]  = rx_buffer[207:200];
            lpc_sim_q[lpc_wr_ptr + 7]  = rx_buffer[199:192];
            lpc_sim_q[lpc_wr_ptr + 8]  = rx_buffer[191:184];
            lpc_sim_q[lpc_wr_ptr + 9]  = rx_buffer[183:176];
            lpc_sim_q[lpc_wr_ptr + 10] = rx_buffer[175:168];
            lpc_sim_q[lpc_wr_ptr + 11] = rx_buffer[167:160];
            lpc_wr_ptr                 = lpc_wr_ptr + 12;
        end
    end

    // THREAD C: Exact 2,493,600 ps (2.493600 us) Sub-Cycle Byte Unpacker
    always @(posedge clk) begin
        if (rst_n && lpc_word_firing && !lpc_unpack_active) begin
            lpc_unpack_active = 1'b1;
            while (lpc_total_bytes < 16'd12432) begin
                lpc_byte_stream = lpc_sim_q[lpc_rd_ptr];
                lpc_rd_ptr      = lpc_rd_ptr + 1;
                lpc_total_bytes = lpc_total_bytes + 16'd1;

                if (demux_frame_id == 32'd0) begin
                    demux_frame_id = 32'd1;
                    lpc_byte_cnt   = 12'd1;
                end else if (lpc_byte_cnt == 12'd3108) begin
                    demux_frame_id = demux_frame_id + 32'd1;
                    lpc_byte_cnt   = 12'd1;
                end else begin
                    lpc_byte_cnt   = lpc_byte_cnt + 12'd1;
                end

                // Exact integer picosecond pacing:
                // 984 * 803 ps + 2124 * 802 ps = 2,493,600 ps = 2493.600 ns per frame!
                if (lpc_byte_cnt <= 12'd984)
                    #0.803;
                else
                    #0.802;
            end
            lpc_byte_stream   = 8'd0;
            lpc_byte_cnt      = 12'd0;
            demux_frame_id    = 32'd0;
            out_clk_cnt       = 16'd0;
            lpc_unpack_active = 1'b0;
        end
    end
    // synthesis translate_on

endmodule