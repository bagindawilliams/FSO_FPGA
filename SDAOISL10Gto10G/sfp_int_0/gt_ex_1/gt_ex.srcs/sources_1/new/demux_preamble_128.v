`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : demux_preamble_128
Description  : 128-bit Receiver Frame Synchronization & Preamble Demultiplexer.
               - Receives paced 128-bit words from CDC 3 (rx_gth_logic.v) at 
                 200.0 MHz (195 words = 3117 Bytes per frame).
               - Buffers incoming words in a synchronous queue (in_queue) up to 
                 a safe pre-fill threshold (1600 Bytes) so that all 259 LPC 
                 words (96-bit / 12 Bytes each = 3108 Bytes) are emitted in a 
                 100% contiguous, gap-free burst required by lpc_dec_top and 
                 descrambler.
               - Extracts the 72-bit (9-Byte) optical Preamble at the start of 
                 every 3117-Byte frame and outputs it on preamble_extracted 
                 with a 1-cycle preamble_valid pulse.

Revision History:
  - Rev 1.0 (Initial) : 128-bit to 72-bit Preamble + 96-bit LPC demultiplexer.
  - Rev 1.1 (2026-10-22 05:25 KST) : Updated timescale to 1ns/1ps, added 
    ST_WAIT_FRAME pre-buffering (total_avail_bytes >= 1600) to guarantee 
    259-cycle contiguous lpc_valid_out bursts, and added 4-frame continuous 
    simulation unpackers (demux_frame_id 1..4, lpc_byte_cnt 1..3108).
  - Rev 2.0 (2026-10-27 04:19 KST) : [Target B1.1 - ETRI Audit Item 1, SDA OISL Page 23, Table 2-8]
    Added official SDA OISL 72-bit Preamble constant STD_PREAMBLE_OISL = 
    72'h77_AD_5B_58_43_64_1E_2E_26 verification alongside legacy marker 
    72'h55_55_55_55_55_55_55_55_D5 so both updated full-loopback and standalone 
    testbenches lock cleanly on Byte 1..9 of every 3117-Byte frame.
===========================================================================
*/

module demux_preamble_128 (
    input  wire         clk,
    input  wire         rst_n,

    // Upstream Interface from CDC 3 (rx_gth_logic @ 200 MHz)
    input  wire [127:0] cdc_data_in,
    input  wire         cdc_valid_in,

    // Extracted 72-bit Preamble Output to preamble_sda_decoder
    output reg  [71:0]  preamble_extracted,
    output reg          preamble_valid,

    // Extracted 96-bit LPC Codeword Stream Output to lpc_dec_top (259 cycles/frame)
    output reg  [95:0]  lpc_data_out,
    output reg          lpc_valid_out
);

    // [Rev 2.0 - 2026-10-27 04:19 KST] SDA OISL v2.1.2 Table 2-8 Standard Preamble & Legacy Sim Marker
    localparam [71:0] STD_PREAMBLE_OISL   = 72'h77_AD_5B_58_43_64_1E_2E_26;
    localparam [71:0] LEGACY_SIM_PREAMBLE = 72'h55_55_55_55_55_55_55_55_D5;

    // =======================================================
    // 1. INGRESS 128-BIT SYNCHRONOUS QUEUE (512 x 128-bit)
    // =======================================================
    (* ram_style = "distributed" *) reg [127:0] in_queue [0:511];
    reg  [8:0]  q_wr_ptr;
    reg  [8:0]  q_rd_ptr;
    reg  [9:0]  q_word_cnt;

    // 384-bit MSB-aligned Byte Barrel Shifter
    reg  [383:0] shift_buf;
    reg  [5:0]   buf_bytes;

    // FSM States
    localparam ST_WAIT_FRAME = 2'd0;
    localparam ST_PREAMBLE   = 2'd1;
    localparam ST_LPC_BURST  = 2'd2;
    localparam ST_INTER_GAP  = 2'd3;

    reg  [1:0]  state;
    reg  [8:0]  lpc_word_idx; // 0..258 (259 LPC words = 3108 Bytes)
    reg  [4:0]  gap_cnt;

    wire [14:0] total_avail_bytes = ({5'd0, q_word_cnt} << 4) + {9'd0, buf_bytes};

    // Pop from queue whenever barrel shifter has room for a 16-Byte (128-bit) word
    wire [5:0]  bytes_consumed_now = (state == ST_PREAMBLE)  ? 6'd9  :
                                     (state == ST_LPC_BURST) ? 6'd12 : 6'd0;
    wire [5:0]  rem_bytes_after_op = buf_bytes - bytes_consumed_now;
    wire        q_pop              = (q_word_cnt > 10'd0) && (rem_bytes_after_op <= 6'd32);
    wire [127:0] q_head_word       = in_queue[q_rd_ptr];

    wire [383:0] shifted_after_consume = (state == ST_PREAMBLE)  ? (shift_buf << 72) :
                                         (state == ST_LPC_BURST) ? (shift_buf << 96) : shift_buf;
    wire [383:0] next_word_aligned     = {q_head_word, 256'd0} >> (rem_bytes_after_op * 8);

    // Purely Synchronous Queue RAM Write
    always @(posedge clk) begin
        if (cdc_valid_in) begin
            in_queue[q_wr_ptr] <= cdc_data_in;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q_wr_ptr           <= 9'd0;
            q_rd_ptr           <= 9'd0;
            q_word_cnt         <= 10'd0;
            shift_buf          <= 384'd0;
            buf_bytes          <= 6'd0;
            state              <= ST_WAIT_FRAME;
            lpc_word_idx       <= 9'd0;
            gap_cnt            <= 5'd0;
            preamble_extracted <= 72'd0;
            preamble_valid     <= 1'b0;
            lpc_data_out       <= 96'd0;
            lpc_valid_out      <= 1'b0;
        end else begin
            preamble_valid <= 1'b0;
            lpc_valid_out  <= 1'b0;

            // 1. Queue Write & Read Pointer Management
            if (cdc_valid_in) begin
                q_wr_ptr <= q_wr_ptr + 9'd1;
            end
            if (q_pop) begin
                q_rd_ptr <= q_rd_ptr + 9'd1;
            end
            case ({cdc_valid_in, q_pop})
                2'b10:   q_word_cnt <= q_word_cnt + 10'd1;
                2'b01:   q_word_cnt <= q_word_cnt - 10'd1;
                default: q_word_cnt <= q_word_cnt;
            endcase

            // 2. Barrel Shifter Update
            if (q_pop) begin
                shift_buf <= shifted_after_consume | next_word_aligned;
                buf_bytes <= rem_bytes_after_op + 6'd16;
            end else begin
                shift_buf <= shifted_after_consume;
                buf_bytes <= rem_bytes_after_op;
            end

            // 3. Frame Synchronization & Contiguous 259-Cycle LPC Burst FSM
            case (state)
                ST_WAIT_FRAME: begin
                    lpc_word_idx <= 9'd0;
                    gap_cnt      <= 5'd0;
                    // Wait until >= 1600 Bytes are buffered so all 259 LPC words 
                    // (3108 Bytes) drain in a 100% gap-free burst
                    if ((total_avail_bytes >= 15'd1600) && (buf_bytes >= 6'd9)) begin
                        state <= ST_PREAMBLE;
                    end
                end

                ST_PREAMBLE: begin
                    // Extract 9-Byte (72-bit) Preamble at MSB [383:312]
                    preamble_extracted <= shift_buf[383:312];
                    preamble_valid     <= 1'b1;
                    lpc_word_idx       <= 9'd0;
                    state              <= ST_LPC_BURST;
                end

                ST_LPC_BURST: begin
                    // Emit 259 consecutive 96-bit (12-Byte) LPC words (3108 Bytes)
                    lpc_data_out  <= shift_buf[383:288];
                    lpc_valid_out <= 1'b1;

                    if (lpc_word_idx == 9'd258) begin
                        lpc_word_idx <= 9'd0;
                        gap_cnt      <= 5'd0;
                        state        <= ST_INTER_GAP;
                    end else begin
                        lpc_word_idx <= lpc_word_idx + 9'd1;
                    end
                end

                ST_INTER_GAP: begin
                    if (gap_cnt < 5'd15) begin
                        gap_cnt <= gap_cnt + 5'd1;
                    end else begin
                        gap_cnt <= 5'd0;
                        state   <= ST_WAIT_FRAME;
                    end
                end

                default: state <= ST_WAIT_FRAME;
            endcase
        end
    end

    // =======================================================
    // 2. SIMULATION TRACKERS (For tb_demux_preamble_128.v)
    // =======================================================
    // synthesis translate_off
    wire preamble_is_sda_oisl = preamble_valid &&
                                ((preamble_extracted == STD_PREAMBLE_OISL) ||
                                 (preamble_extracted == LEGACY_SIM_PREAMBLE));

    reg [8:0]  out_lpc_word_cnt; // 1..259 per frame
    reg [11:0] out_lpc_byte_cnt; // 12..3108 per frame
    reg [7:0]  lpc_sim_q [0:16383];
    integer    lpc_wr_ptr;
    integer    lpc_rd_ptr;
    reg        lpc_unpack_active;

    reg [7:0]  lpc_byte_stream;
    reg [11:0] lpc_byte_idx;     // 1..3108 per frame
    reg [31:0] demux_frame_id;   // 1, 2, 3, 4
    reg [15:0] lpc_total_bytes;  // 1..12432 (4 x 3108 Bytes)

    initial begin
        out_lpc_word_cnt  = 9'd0;
        out_lpc_byte_cnt  = 12'd0;
        lpc_wr_ptr        = 0;
        lpc_rd_ptr        = 0;
        lpc_unpack_active = 1'b0;
        lpc_byte_stream   = 8'd0;
        lpc_byte_idx      = 12'd0;
        demux_frame_id    = 32'd0;
        lpc_total_bytes   = 16'd0;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out_lpc_word_cnt <= 9'd0;
            out_lpc_byte_cnt <= 12'd0;
        end else if (lpc_valid_out) begin
            if (out_lpc_word_cnt == 9'd259) begin
                out_lpc_word_cnt <= 9'd1;
                out_lpc_byte_cnt <= 12'd12;
            end else begin
                out_lpc_word_cnt <= out_lpc_word_cnt + 9'd1;
                out_lpc_byte_cnt <= out_lpc_byte_cnt + 12'd12;
            end
        end else begin
            out_lpc_word_cnt <= 9'd0;
            out_lpc_byte_cnt <= 12'd0;
        end
    end

    always @(negedge clk or negedge rst_n) begin
        if (!rst_n) begin
            lpc_wr_ptr = 0;
        end else if (lpc_valid_out) begin
            lpc_sim_q[lpc_wr_ptr + 0]  = lpc_data_out[95:88];
            lpc_sim_q[lpc_wr_ptr + 1]  = lpc_data_out[87:80];
            lpc_sim_q[lpc_wr_ptr + 2]  = lpc_data_out[79:72];
            lpc_sim_q[lpc_wr_ptr + 3]  = lpc_data_out[71:64];
            lpc_sim_q[lpc_wr_ptr + 4]  = lpc_data_out[63:56];
            lpc_sim_q[lpc_wr_ptr + 5]  = lpc_data_out[55:48];
            lpc_sim_q[lpc_wr_ptr + 6]  = lpc_data_out[47:40];
            lpc_sim_q[lpc_wr_ptr + 7]  = lpc_data_out[39:32];
            lpc_sim_q[lpc_wr_ptr + 8]  = lpc_data_out[31:24];
            lpc_sim_q[lpc_wr_ptr + 9]  = lpc_data_out[23:16];
            lpc_sim_q[lpc_wr_ptr + 10] = lpc_data_out[15:8];
            lpc_sim_q[lpc_wr_ptr + 11] = lpc_data_out[7:0];
            lpc_wr_ptr                 = lpc_wr_ptr + 12;
        end
    end

    real next_lpc_edge_ns;
    always @(posedge clk) begin
        if (rst_n && preamble_valid && !lpc_unpack_active) begin
            lpc_unpack_active = 1'b1;
            @(posedge clk);
            #0.001;
            next_lpc_edge_ns = $realtime;
            while (lpc_total_bytes < 16'd12432) begin
                if (lpc_rd_ptr == 0)
                    lpc_byte_stream = lpc_data_out[95:88];
                else
                    lpc_byte_stream = lpc_sim_q[lpc_rd_ptr];

                lpc_rd_ptr      = lpc_rd_ptr + 1;
                lpc_total_bytes = lpc_total_bytes + 16'd1;

                if (demux_frame_id == 32'd0) begin
                    demux_frame_id = 32'd1;
                    lpc_byte_idx   = 12'd1;
                end else if (lpc_byte_idx == 12'd3108) begin
                    demux_frame_id = demux_frame_id + 32'd1;
                    lpc_byte_idx   = 12'd1;
                end else begin
                    lpc_byte_idx   = lpc_byte_idx + 12'd1;
                end

                next_lpc_edge_ns = next_lpc_edge_ns + (2493.6 / 3108.0);
                #((next_lpc_edge_ns - $realtime) > 0.0 ? (next_lpc_edge_ns - $realtime) : 0.001);
            end
            lpc_byte_stream   = 8'd0;
            lpc_byte_idx      = 12'd0;
            demux_frame_id    = 32'd0;
            lpc_unpack_active = 1'b0;
        end
    end
    // synthesis translate_on

endmodule