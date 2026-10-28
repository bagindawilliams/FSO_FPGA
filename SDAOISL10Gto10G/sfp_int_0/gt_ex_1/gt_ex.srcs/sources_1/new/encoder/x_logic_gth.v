`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Clock Domain Crossing 2 (CDC 2) - Elastic Transmit Buffer.

               CRITICAL REVISIONS:
               1. MSB-First Pre-Packer (200 MHz):
                  Packs 128-bit words from MSB to LSB to match Xilinx Native 
                  Asymmetric FIFO (128-to-32) extraction order.
               2. Registered Output Alignment (312.5 MHz):
                  Outputs a 100% continuous 32-bit stream at 312.5 MHz 
                  (10.0 Gbps net rate -> exact 2.4936 us per 3117-Byte frame).
               3. True Byte-by-Byte Unpacker & Counter (1 to 3117 by 1):
                  Wrapped in synthesis translate_off/on for clean RTL Schematic.
===========================================================================
*/

module x_logic_gth(
    input               clk_gth,      // 312.5 MHz (Read Domain - 10.0 Gbps Continuous)
    input               clk_logic,    // 200.0 MHz (Write Domain - Baseband)
    input               rst_n,
    input               en,
    input   [127:0]     data_in,      
    input               data_in_dv,   
    input   [15:0]      cdc_keep,     
    output  reg         flag,         
    output  reg [31:0]  data_out      
);

    // =======================================================
    // 1. MSB-FIRST 128-BIT PRE-PACKER (WRITE DOMAIN - 200 MHz)
    // =======================================================
    reg [255:0] pack_buf;
    reg [5:0]   pack_bytes; 
    reg [127:0] fifo_din;
    reg         fifo_wr_en;

    wire [127:0] clean_in = (cdc_keep == 16'hFFFF) ? data_in : 
                            (cdc_keep == 16'h1FFF) ? {data_in[127:24], 24'd0} : 128'd0;
    wire [5:0]   in_bytes = (cdc_keep == 16'hFFFF) ? 6'd16 : 
                            (cdc_keep == 16'h1FFF) ? 6'd13 : 6'd0;

    wire [255:0] shifted_in_full = {clean_in, 128'd0} >> ((pack_bytes - 6'd16) * 8);
    wire [255:0] shifted_in_norm = {clean_in, 128'd0} >> (pack_bytes * 8);

    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            pack_buf   <= 256'd0;
            pack_bytes <= 6'd0;
            fifo_wr_en <= 1'b0;
            fifo_din   <= 128'd0;
        end else begin
            fifo_wr_en <= 1'b0;

            if (pack_bytes >= 6'd16) begin
                fifo_din   <= pack_buf[255:128];
                fifo_wr_en <= 1'b1;

                if (en && data_in_dv) begin
                    pack_buf   <= (pack_buf << 128) | shifted_in_full;
                    pack_bytes <= pack_bytes - 6'd16 + in_bytes;
                end else begin
                    pack_buf   <= (pack_buf << 128);
                    pack_bytes <= pack_bytes - 6'd16;
                end
            end 
            else if (en && data_in_dv) begin
                pack_buf   <= pack_buf | shifted_in_norm;
                pack_bytes <= pack_bytes + in_bytes;
            end
            else if (!en && pack_bytes > 6'd0) begin
                fifo_din   <= pack_buf[255:128];
                fifo_wr_en <= 1'b1;
                pack_buf   <= 256'd0;
                pack_bytes <= 6'd0;
            end
        end
    end

    // =======================================================
    // 2. XILINX NATIVE FIFO INSTANTIATION
    // =======================================================
    wire        fifo_empty;
    wire        fifo_full;
    wire        wr_rst_busy;
    wire        rd_rst_busy;
    wire [31:0] fifo_out;
    reg         rd_en;

    cross_logic_gth cross_inst (
        .srst        (~rst_n),      
        .wr_clk      (clk_logic),   
        .wr_en       (fifo_wr_en),  
        .din         (fifo_din),     
        .rd_clk      (clk_gth),     
        .rd_en       (rd_en),       
        .dout        (fifo_out),    
        .full        (fifo_full),
        .empty       (fifo_empty),
        .wr_rst_busy (wr_rst_busy),
        .rd_rst_busy (rd_rst_busy)
    );

    // =======================================================
    // 3. ELASTIC BUFFER FSM (READ DOMAIN - 312.5 MHz)
    // =======================================================
    localparam ST_IDLE   = 2'd0;
    localparam ST_BUFFER = 2'd1;
    localparam ST_STREAM = 2'd2;

    reg [1:0]  state;
    reg [8:0]  start_delay;
    reg        rd_en_d1;

    reg [31:0] total_words_written_sync0, total_words_written_sync1;
    reg [31:0] total_bytes_in_logic;
    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) total_bytes_in_logic <= 32'd0;
        else if (en && data_in_dv) total_bytes_in_logic <= total_bytes_in_logic + in_bytes;
    end

    wire [31:0] target_gth_words = total_bytes_in_logic[31:2];
    reg  [31:0] gth_words_read;

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            total_words_written_sync0 <= 32'd0;
            total_words_written_sync1 <= 32'd0;
        end else begin
            total_words_written_sync0 <= target_gth_words;
            total_words_written_sync1 <= total_words_written_sync0;
        end
    end

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            state          <= ST_IDLE;
            start_delay    <= 9'd0;
            rd_en          <= 1'b0;
            gth_words_read <= 32'd0;
        end else begin
            case (state)
                ST_IDLE: begin
                    rd_en <= 1'b0;
                    if (en && !fifo_empty) begin
                        state       <= ST_BUFFER;
                        start_delay <= 9'd0;
                    end
                end
                ST_BUFFER: begin
                    if (start_delay < 9'd50) begin
                        start_delay <= start_delay + 1'b1;
                    end else begin
                        state          <= ST_STREAM;
                        rd_en          <= 1'b1;
                        gth_words_read <= 32'd1;
                    end
                end
                ST_STREAM: begin
                    if ((!en && (gth_words_read >= total_words_written_sync1)) || fifo_empty) begin
                        rd_en <= 1'b0;
                        state <= ST_IDLE;
                    end else begin
                        rd_en          <= 1'b1;
                        gth_words_read <= gth_words_read + 1'b1;
                    end
                end
                default: state <= ST_IDLE;
            endcase
        end
    end

    always @(posedge clk_gth or negedge rst_n) begin
        if (!rst_n) begin
            rd_en_d1 <= 1'b0;
            flag     <= 1'b0;
            data_out <= 32'd0;
        end else begin
            rd_en_d1 <= rd_en;
            flag     <= rd_en_d1;
            data_out <= rd_en_d1 ? fifo_out : 32'd0;
        end
    end

    // =======================================================
    // 4. TRUE 1-BYTE-BY-1-BYTE UNPACKER & TRACKER (1..3117)
    // =======================================================
    // synthesis translate_off
    reg [7:0]  byte_out;
    reg [11:0] frame_byte_cnt;
    reg [15:0] out_clk_cnt;
    reg [31:0] frame_out_id;
    reg [31:0] cur_word;

    task step_single_byte(input [7:0] b_val, input is_clk_rising);
    begin
        byte_out <= b_val;
        if (frame_out_id == 32'd0) begin
            frame_out_id   <= 32'd1;
            frame_byte_cnt <= 12'd1;
            out_clk_cnt    <= 16'd1;
        end else if (frame_byte_cnt == 12'd3117) begin
            frame_out_id   <= frame_out_id + 1'b1;
            frame_byte_cnt <= 12'd1;
            out_clk_cnt    <= 16'd1;
        end else begin
            frame_byte_cnt <= frame_byte_cnt + 12'd1;
            if (is_clk_rising)
                out_clk_cnt <= out_clk_cnt + 16'd1;
        end
    end
    endtask

    always @(negedge rst_n) begin
        if (!rst_n) begin
            byte_out       <= 8'd0;
            frame_byte_cnt <= 12'd0;
            out_clk_cnt    <= 16'd0;
            frame_out_id   <= 32'd0;
            cur_word       <= 32'd0;
        end
    end

    always @(posedge clk_gth) begin
        if (rst_n) begin
            if (rd_en_d1) begin
                cur_word = fifo_out;
                step_single_byte(cur_word[31:24], 1'b1);
                #0.8 step_single_byte(cur_word[23:16], 1'b0);
                #0.8 step_single_byte(cur_word[15:8],  1'b0);
                #0.8 step_single_byte(cur_word[7:0],   1'b0);
            end else begin
                byte_out       <= 8'd0;
                frame_byte_cnt <= 12'd0;
                out_clk_cnt    <= 16'd0;
                frame_out_id   <= 32'd0;
            end
        end
    end
    // synthesis translate_on

endmodule