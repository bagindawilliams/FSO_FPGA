`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 06:26:34 PM
// Design Name: 
// Module Name: error_inject
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Revision 0.02 - Continuous 312.5 MHz 3117-Byte Stream & Dual-Mode VOA Support:
//   - Operates on the continuous 312.5 MHz (3.2 ns period, 0.8 ns/byte) stream 
//     exiting CDC 2 so every 3117-Byte frame has an exact duration of 2.4936 us.
//   - SIM_MODE = 1: XORs 48 payload words per frame using 'error.mem' while 
//     protecting the first 15 words (60B = 9B Preamble + 48B Header LPC + 3B).
//   - SIM_MODE = 0: Clean bypass for physical testing with Manual VOA /t49G/51.
//////////////////////////////////////////////////////////////////////////////////

module error_inject #(
    parameter   SIM_MODE    = 1,
    parameter   safe_words  = 15,
    parameter   max_error   = 47,
    parameter   max_pad     = 1035 - max_error
)(
    input               clk,        // 312.5 MHz Continuous Clock
    input               rst_n,
    input               en,         // Continuous valid flag from CDC 2
    input   [31:0]      data_in,    // Continuous 32-bit stream from CDC 2
    output              flag,       // Continuous valid flag to gth64b66b_tx
    output  [31:0]      data_out    // 32-bit stream to gth64b66b_tx
);

reg     [31:0]      error   [0:max_error];
reg     [15:0]      con_error   = 16'd0;
reg     [15:0]      con_pad     = 16'd0;

initial
    $readmemh("error.mem", error);

parameter   IDLE        = 4'b0001;
parameter   ERROR       = 4'b0010;
parameter   PAD         = 4'b0100;
parameter   END         = 4'b1000;

reg     [3:0]   state;
reg     [3:0]   next_state;

reg     [31:0]      data_d0;
reg     [31:0]      error_out;

reg                 en_d0;
reg                 en_d1;
reg     [11:0]      frame_byte_acc;
reg     [15:0]      frame_word_idx;
wire                frame_wrap_now = en_d0 && (frame_byte_acc + 12'd4 >= 12'd3117);

wire    [31:0]      active_err_mask = ((SIM_MODE == 1) && (state == ERROR)) ? error[con_error] : 32'd0;
reg     [31:0]      applied_mask;

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        state   <= IDLE;
    else
        state   <= next_state;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n) begin
        frame_byte_acc <= 12'd0;
        frame_word_idx <= 16'd0;
    end else if (en_d0) begin
        if (frame_byte_acc + 12'd4 >= 12'd3117) begin
            frame_byte_acc <= (frame_byte_acc + 12'd4) - 12'd3117;
            frame_word_idx <= 16'd0;
        end else begin
            frame_byte_acc <= frame_byte_acc + 12'd4;
            frame_word_idx <= frame_word_idx + 16'd1;
        end
    end else begin
        frame_byte_acc <= 12'd0;
        frame_word_idx <= 16'd0;
    end
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        con_error   <= 16'd0;
    else if (state == ERROR)
        con_error   <= con_error + 1'b1;
    else
        con_error   <= 16'd0;
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        con_pad   <= 16'd0;
    else if (state == PAD && !frame_wrap_now)
        con_pad   <= con_pad + 1'b1;
    else
        con_pad   <= 16'd0;
end

always @(*)
begin
    case(state)
        IDLE:           begin
                            if (en_d0 && (frame_word_idx == safe_words - 1))
                                next_state  <= ERROR;
                            else
                                next_state  <= IDLE;
                        end
        ERROR:          begin
                            if (!en_d0)
                                next_state  <= IDLE;
                            else if (con_error < max_error)
                                next_state  <= ERROR;
                            else
                                next_state  <= PAD;
                        end
        PAD:            begin
                            if (!en_d0)
                                next_state  <= END;
                            else if (frame_wrap_now)
                                next_state  <= IDLE;
                            else
                                next_state  <= PAD;
                        end
        END:            next_state  <= IDLE;
        default:        next_state  <= IDLE;
    endcase
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n) begin
        data_d0 <= 32'b0;
        en_d0   <= 1'b0;
        en_d1   <= 1'b0;
    end else begin
        data_d0 <= data_in;
        en_d0   <= en;
        en_d1   <= en_d0;
    end
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n) begin
        error_out    <= 32'b0;
        applied_mask <= 32'b0;
    end else if (en_d0) begin
        error_out    <= active_err_mask ^ data_d0;
        applied_mask <= active_err_mask;
    end else begin
        error_out    <= 32'b0;
        applied_mask <= 32'b0;
    end
end

assign  flag        = en_d1;
assign  data_out    = (flag) ? error_out : 32'b0;

// synthesis translate_off
reg  [7:0]  byte_out;
reg  [11:0] frame_byte_cnt;
reg  [15:0] out_clk_cnt;
reg  [31:0] frame_out_id;
reg  [31:0] cur_word;
reg  [15:0] corrupted_word_cnt;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        corrupted_word_cnt <= 16'd0;
    else if (en_d1) begin
        if (frame_byte_cnt == 12'd1 && out_clk_cnt == 16'd1)
            corrupted_word_cnt <= (applied_mask != 32'd0) ? 16'd1 : 16'd0;
        else if (applied_mask != 32'd0)
            corrupted_word_cnt <= corrupted_word_cnt + 16'd1;
    end else begin
        corrupted_word_cnt <= 16'd0;
    end
end

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
    if (~rst_n) begin
        byte_out       <= 8'd0;
        frame_byte_cnt <= 12'd0;
        out_clk_cnt    <= 16'd0;
        frame_out_id   <= 32'd0;
        cur_word       <= 32'd0;
    end
end

always @(posedge clk) begin
    if (rst_n) begin
        if (en_d0) begin
            cur_word = active_err_mask ^ data_d0;
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