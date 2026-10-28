`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : rx_gth_logic
Description  : Clock Domain Crossing 3 (CDC 3) Module.
               Transfers the continuous 32-bit FSO frame stream from the 
               312.5 MHz GTH RX domain to the 128-bit 200.0 MHz Baseband 
               Decoder domain using cross_gth_logic.xci.

               Revision Notes:
               1. Added a 32-cycle read pre-buffer (ST_BUFFER) so the 200 MHz 
                  read domain starts cleanly after initial words are queued.
               2. Synchronized 'out_clk_cnt', 'out_word128_cnt', 'frame_out_id',
                  'frame_byte_cnt' (1..3117), and 'byte_out' to start on the 
                  exact same clock edge when 'flag' first asserts high.
               3. [Rev 2026-10-21 13:55 KST]: Registered 'fifo_out' into 
                  'fifo_out_d1' to match 'flag' (rd_en_d2) latency and added 
                  25/64 fractional rate pacer.
               4. [Rev 2026-10-21 14:02 KST]: Separated sim_byte_q writer thread
                  from unpacker thread and initialized rate_acc to 7'd63.
               5. [Rev 2026-10-21 14:10 KST]: Clocked THREAD B (sim_byte_q 
                  writer) on 'negedge clk_logic' (2.5 ns ahead of posedge 
                  clk_logic) so every 128-bit word from fifo_out is queued 
                  2.5 ns before THREAD C's 0.8 ns byte unpacker reaches the 
                  320.0 ns (400-byte / 25-word) LCM boundary. This completely 
                  eliminates the periodic 1-byte red 'X' glitches at bytes 
                  401, 801, 1201, etc.
===========================================================================
*/

module rx_gth_logic (
    input  wire         clk_gth,      // 312.5 MHz Write Clock (from gth64b66b_rx)
    input  wire         clk_logic,    // 200.0 MHz Read Clock (to core_rx)
    input  wire         rst_n,
    input  wire         en,           // Continuous valid from gth64b66b_rx
    input  wire [31:0]  data_in,      // Continuous 32-bit data from gth64b66b_rx
    output wire         flag,         // 128-bit valid flag to core_rx
    output wire [127:0] data_out      // 128-bit data stream to core_rx
);

    // =======================================================
    // 1. WRITE DOMAIN (312.5 MHz): AUTO TAIL-FLUSH FOR 32-TO-128 FIFO
    // =======================================================
    reg  [1:0]  wr_mod4_cnt;
    reg         tail_flushing;
    wire        fifo_wr_en;
    wire [31:0] fifo_din;

    always @(posedge clk_gth or negedge rst_n) begin
        if (~rst_n) begin
            wr_mod4_cnt   <= 2'd0;
            tail_flushing <= 1'b0;
        end else begin
            if (en) begin
                wr_mod4_cnt   <= wr_mod4_cnt + 2'd1;
                tail_flushing <= 1'b0;
            end else if (wr_mod4_cnt != 2'd0) begin
                wr_mod4_cnt   <= wr_mod4_cnt + 2'd1;
                tail_flushing <= 1'b1;
            end else begin
                tail_flushing <= 1'b0;
            end
        end
    end

    assign fifo_wr_en = en || (!en && (wr_mod4_cnt != 2'd0));
    assign fifo_din   = en ? data_in : 32'd0;

    // =======================================================
    // 2. XILINX ASYMMETRIC FIFO (32-bit @ 312.5M -> 128-bit @ 200M)
    // =======================================================
    wire         fifo_full;
    wire         fifo_empty;
    wire         wr_rst_busy;
    wire         rd_rst_busy;
    wire [127:0] fifo_out;
    wire         rd_en;

    cross_gth_logic cross_inst (
        .srst        (~rst_n),
        .wr_clk      (clk_gth),
        .wr_en       (fifo_wr_en),
        .din         (fifo_din),
        .rd_clk      (clk_logic),
        .rd_en       (rd_en),
        .dout        (fifo_out),
        .full        (fifo_full),
        .empty       (fifo_empty),
        .wr_rst_busy (wr_rst_busy),
        .rd_rst_busy (rd_rst_busy)
    );

    // =======================================================
    // 3. READ DOMAIN (200.0 MHz): 25/64 PACED READ & PIPELINE ALIGN
    // =======================================================
    localparam ST_IDLE   = 2'd0;
    localparam ST_BUFFER = 2'd1;
    localparam ST_READ   = 2'd2;

    reg [1:0]  rd_state;
    reg [5:0]  buf_wait_cnt;
    reg [4:0]  empty_idle_cnt;
    reg [6:0]  rate_acc;
    reg [10:0] rd_word_cnt;

    wire [6:0] next_rate_acc = rate_acc + 7'd25;
    wire       rate_fire     = (next_rate_acc >= 7'd64);

    always @(posedge clk_logic or negedge rst_n) begin
        if (~rst_n) begin
            rd_state       <= ST_IDLE;
            buf_wait_cnt   <= 6'd0;
            empty_idle_cnt <= 5'd0;
            rate_acc       <= 7'd63;
            rd_word_cnt    <= 11'd0;
        end else begin
            case (rd_state)
                ST_IDLE: begin
                    buf_wait_cnt   <= 6'd0;
                    empty_idle_cnt <= 5'd0;
                    rate_acc       <= 7'd63;
                    rd_word_cnt    <= 11'd0;
                    if (~fifo_empty && ~rd_rst_busy)
                        rd_state <= ST_BUFFER;
                end
                ST_BUFFER: begin
                    if (buf_wait_cnt < 6'd4)
                        buf_wait_cnt <= buf_wait_cnt + 6'd1;
                    else
                        rd_state <= ST_READ;
                end
                ST_READ: begin
                    if (fifo_empty) begin
                        if (empty_idle_cnt < 5'd15)
                            empty_idle_cnt <= empty_idle_cnt + 5'd1;
                        else
                            rd_state <= ST_IDLE;
                    end else begin
                        empty_idle_cnt <= 5'd0;
                        if (rate_fire) begin
                            rate_acc    <= next_rate_acc - 7'd64;
                            rd_word_cnt <= rd_word_cnt + 11'd1;
                        end else begin
                            rate_acc    <= next_rate_acc;
                        end
                    end
                end
                default: rd_state <= ST_IDLE;
            endcase
        end
    end

    assign rd_en = (rd_state == ST_READ) && (~fifo_empty) && (~rd_rst_busy) && rate_fire && (rd_word_cnt < 11'd780);

    reg         rd_en_d1;
    reg         rd_en_d2;
    reg [127:0] fifo_out_d1;

    always @(posedge clk_logic or negedge rst_n) begin
        if (~rst_n) begin
            rd_en_d1    <= 1'b0;
            rd_en_d2    <= 1'b0;
            fifo_out_d1 <= 128'd0;
        end else begin
            rd_en_d1    <= rd_en;
            rd_en_d2    <= rd_en_d1;
            if (rd_en_d1)
                fifo_out_d1 <= fifo_out;
        end
    end

    assign flag     = rd_en_d2;
    assign data_out = (flag) ? fifo_out_d1 : 128'b0;

    // =======================================================
    // 4. SIMULATION TRACKERS: RACE-FREE NEGEDGE WRITER & UNPACKER
    // =======================================================
    // synthesis translate_off
    reg [15:0] out_clk_cnt;      // 200 MHz clock counter per frame (1..499)
    reg [15:0] out_word128_cnt;  // 128-bit valid word counter (1..780)
    reg [7:0]  sim_byte_q [0:16383];
    integer    sim_wr_ptr;
    integer    sim_rd_ptr;
    reg        unpack_running;

    reg [7:0]  byte_out;
    reg [11:0] frame_byte_cnt;   // 1..3117 per frame
    reg [31:0] frame_out_id;     // 1, 2, 3, 4
    reg [15:0] out_total_bytes;  // 1..12468

    initial begin
        out_clk_cnt     = 16'd0;
        out_word128_cnt = 16'd0;
        sim_wr_ptr      = 0;
        sim_rd_ptr      = 0;
        unpack_running  = 1'b0;
        byte_out        = 8'd0;
        frame_byte_cnt  = 12'd0;
        frame_out_id    = 32'd0;
        out_total_bytes = 16'd0;
    end

    // THREAD A: Clock counter (200 MHz) & 128-bit Word Counter (1..780)
    always @(posedge clk_logic or negedge rst_n) begin
        if (~rst_n) begin
            out_word128_cnt <= 16'd0;
            out_clk_cnt     <= 16'd0;
        end else begin
            if (rd_en_d1) begin
                out_word128_cnt <= out_word128_cnt + 16'd1;
            end else if (!unpack_running && (rd_state == ST_IDLE)) begin
                out_word128_cnt <= 16'd0;
            end

            if (rd_en_d1 && !unpack_running && (out_word128_cnt == 16'd0)) begin
                out_clk_cnt <= 16'd1;
            end else if (unpack_running) begin
                if (frame_byte_cnt <= 12'd6 && out_clk_cnt > 16'd490)
                    out_clk_cnt <= 16'd1;
                else
                    out_clk_cnt <= out_clk_cnt + 16'd1;
            end else begin
                out_clk_cnt <= 16'd0;
            end
        end
    end

    // THREAD B: Negedge Writer Thread (Runs 2.5 ns BEFORE posedge clk_logic!)
    // Guarantees sim_byte_q is ALWAYS populated 2.5 ns before THREAD C reads
    // at the 320.0 ns (400-byte) LCM boundary, completely eliminating red 'X'!
    always @(negedge clk_logic or negedge rst_n) begin
        if (~rst_n) begin
            sim_wr_ptr = 0;
        end else if (rd_en_d1) begin
            sim_byte_q[sim_wr_ptr + 0]  = fifo_out[127:120];
            sim_byte_q[sim_wr_ptr + 1]  = fifo_out[119:112];
            sim_byte_q[sim_wr_ptr + 2]  = fifo_out[111:104];
            sim_byte_q[sim_wr_ptr + 3]  = fifo_out[103:96];
            sim_byte_q[sim_wr_ptr + 4]  = fifo_out[95:88];
            sim_byte_q[sim_wr_ptr + 5]  = fifo_out[87:80];
            sim_byte_q[sim_wr_ptr + 6]  = fifo_out[79:72];
            sim_byte_q[sim_wr_ptr + 7]  = fifo_out[71:64];
            sim_byte_q[sim_wr_ptr + 8]  = fifo_out[63:56];
            sim_byte_q[sim_wr_ptr + 9]  = fifo_out[55:48];
            sim_byte_q[sim_wr_ptr + 10] = fifo_out[47:40];
            sim_byte_q[sim_wr_ptr + 11] = fifo_out[39:32];
            sim_byte_q[sim_wr_ptr + 12] = fifo_out[31:24];
            sim_byte_q[sim_wr_ptr + 13] = fifo_out[23:16];
            sim_byte_q[sim_wr_ptr + 14] = fifo_out[15:8];
            sim_byte_q[sim_wr_ptr + 15] = fifo_out[7:0];
            sim_wr_ptr                  = sim_wr_ptr + 16;
        end
    end

    // THREAD C: Dedicated 0.8 ns Sub-Cycle Byte Unpacker Thread
    always @(posedge clk_logic) begin
        if (rst_n && rd_en_d1 && !unpack_running) begin
            unpack_running = 1'b1;
            while (out_total_bytes < 16'd12468) begin
                byte_out        = sim_byte_q[sim_rd_ptr];
                sim_rd_ptr      = sim_rd_ptr + 1;
                out_total_bytes = out_total_bytes + 16'd1;

                if (frame_out_id == 32'd0) begin
                    frame_out_id   = 32'd1;
                    frame_byte_cnt = 12'd1;
                end else if (frame_byte_cnt == 12'd3117) begin
                    frame_out_id   = frame_out_id + 32'd1;
                    frame_byte_cnt = 12'd1;
                end else begin
                    frame_byte_cnt = frame_byte_cnt + 12'd1;
                end

                #0.8;
            end
            byte_out        = 8'd0;
            frame_byte_cnt  = 12'd0;
            frame_out_id    = 32'd0;
            out_clk_cnt     = 16'd0;
            out_word128_cnt = 16'd0;
            unpack_running  = 1'b0;
        end
    end
    // synthesis translate_on

endmodule