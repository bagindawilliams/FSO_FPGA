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
// Revision 0.02 - Post-CDC 2 (312.5 MHz) Continuous 3117B Stream, GTH Stall & VOA Mode:
//   1. Added parameter SIM_MODE (1 = Enable error.mem XOR injection for Vivado 
//      simulation; 0 = Clean hardware pass-through for physical testing with 
//      Manual Variable Attenuator Single-Mode 0.9-1m /t49G/51 LC/PC).
//   2. Added 'stall_in' input port to support 64B/66B Gearbox backpressure from 
//      gth64b66b_tx.v (freezes pipeline when stall_in == 1'b1).
//   3. Tracks exact 3117-Byte boundaries on the incoming 32-bit continuous stream,
//      protecting the first 15 words (60 Bytes = 9B Preamble + 48B Header LPC + 3B)
//      in IDLE before entering ERROR (48 words from error.mem) and PAD (remaining 
//      words up to Byte 3117), while maintaining a continuous Zero-Gap 'flag'.
//////////////////////////////////////////////////////////////////////////////////


module error_inject #(
    parameter   SIM_MODE    = 1,    // 1 = Sim (error.mem active), 0 = HW (Bypass for Manual VOA /t49G/51)
    parameter   safe_words  = 15,   // Protect first 15 words (60 Bytes: Preamble + Header) of each 3117B frame
    parameter   max_error   = 47,   // 48 words (0..47) of error mask from error.mem
    parameter   max_pad     = 1035 - max_error
)(
    input               clk,        // 312.5 MHz (or 322.265625 MHz tx0_clk with stall_in)
    input               rst_n,
    input               en,         // Continuous valid flag from CDC 2 (x_logic_gth)
    input               stall_in,   // Backpressure stall from gth64b66b_tx (0 when standalone)
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

// Revision 0.02: Continuous pipeline control & Modulo-3117 Byte boundary tracker
reg                 en_d0;
reg                 en_d1;
reg     [11:0]      frame_byte_acc;
reg     [15:0]      frame_word_idx;
wire                frame_wrap_now = en_d0 && (frame_byte_acc + 12'd4 >= 12'd3117);

// Active XOR mask: Applied only in ERROR state when SIM_MODE == 1
wire    [31:0]      active_err_mask = ((SIM_MODE == 1) && (state == ERROR)) ? error[con_error] : 32'd0;
reg     [31:0]      applied_mask;

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        state   <= IDLE;
    else if (~stall_in)
        state   <= next_state;
end

// Modulo-3117 Byte accumulator on the incoming 32-bit continuous stream
always @(posedge clk or negedge rst_n)
begin
    if (~rst_n) begin
        frame_byte_acc <= 12'd0;
        frame_word_idx <= 16'd0;
    end else if (~stall_in) begin
        if (en_d0) begin
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
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        con_error   <= 16'd0;
    else if (~stall_in) begin
        if (state == ERROR)
            con_error   <= con_error + 1'b1;
        else
            con_error   <= 16'd0;
    end
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        con_pad   <= 16'd0;
    else if (~stall_in) begin
        if (state == PAD && !frame_wrap_now)
            con_pad   <= con_pad + 1'b1;
        else
            con_pad   <= 16'd0;
    end
end

always @(*)
begin
    case(state)
        IDLE:           begin
                            // Hold in IDLE during reset or during the first 15 words (Preamble + Header)
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
                                // Reached 3117th byte of current frame -> protect next frame's Preamble
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
        data_d0     <= 32'b0;
        en_d0       <= 1'b0;
        en_d1       <= 1'b0;
    end else if (~stall_in) begin
        data_d0     <= data_in;
        en_d0       <= en;
        en_d1       <= en_d0;
    end
end

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n) begin
        error_out    <= 32'b0;
        applied_mask <= 32'b0;
    end else if (~stall_in) begin
        if (en_d0) begin
            error_out    <= active_err_mask ^ data_d0;
            applied_mask <= active_err_mask;
        end else begin
            error_out    <= 32'b0;
            applied_mask <= 32'b0;
        end
    end
end

// Continuous output valid & data towards gth64b66b_tx
assign  flag        = en_d1;
assign  data_out    = (flag) ? error_out : 32'b0;

// =========================================================================
// WAVEFORM TRACKERS: 1-BY-1 BYTE UNPACKER & ERROR COUNTER (312.5 MHz)
// =========================================================================
reg  [7:0]  byte_out;
reg  [11:0] frame_byte_cnt;
reg  [15:0] out_clk_cnt;
reg  [31:0] frame_out_id;
reg  [31:0] cur_word;
reg  [15:0] corrupted_word_cnt;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        corrupted_word_cnt <= 16'd0;
    else if (~stall_in) begin
        if (en_d1) begin
            if (frame_byte_cnt == 12'd1 && out_clk_cnt == 16'd1)
                corrupted_word_cnt <= (applied_mask != 32'd0) ? 16'd1 : 16'd0;
            else if (applied_mask != 32'd0)
                corrupted_word_cnt <= corrupted_word_cnt + 16'd1;
        end else begin
            corrupted_word_cnt <= 16'd0;
        end
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
    if (rst_n && !stall_in) begin
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

endmodule