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
// Revision 0.03 (2026-11-02 KST) - Frame-Relative Per-Byte Modulo-3117 Addressing (FEC28-INJECT-01):
//   - Upgraded zone evaluation from word-aligned FSM states to per-byte modulo-3117 
//     lane addressing across all 4 MSB-first byte lanes (including 32-bit words 
//     that straddle the 3117-Byte frame boundary).
//   - Preserves the original 'error.mem' file and 3-zone structure per 3117-Byte frame:
//     * Zone 1 (Bytes 1..60)     : Protected Preamble + Header LPC + first 3B.
//     * Zone 2 (Bytes 61..252)   : XORs all 48 mask words (192 bytes) from 'error.mem'.
//     * Zone 3 (Bytes 253..3117) : Clean pass-through payload tail.
//   - Holds 'frame_byte_acc' across valid-low ('en_d0 == 0') cycles so inter-word 
//     pauses never reset or shift the frame byte coordinate.
// Revision 0.04 (2026-11-05 KST) - Simulation Monitor Hold & Lane Telemetry Documentation:
//   - Updated the simulation monitor ('frame_byte_cnt', 'out_clk_cnt', 'frame_out_id',
//     and 'corrupted_word_cnt') to hold its state when 'en_d0' / 'en_d1' is low,
//     staying 100% synchronized with 'frame_byte_acc' across valid-low gaps.
//   - Documented 'applied_position', 'applied_address', and 'applied_zone' for exact
//     per-lane injection observability, and clarified that 'corrupted_word_cnt' counts
//     32-bit bus words with a non-zero XOR mask (not RS codeword symbol errors).
// Revision 0.05 (2026-11-05 KST) - Multi-Lane Frame-Start Reset for corrupted_word_cnt:
//   - Because 3117 mod 4 = 1, frame byte 1 rotates across the 4 MSB-first byte lanes
//     on consecutive frames (Frame 1: lane 0 [47:36], Frame 2: lane 1 [35:24],
//     Frame 3: lane 2 [23:12], Frame 4: lane 3 [11:0]).
//   - Updated 'corrupted_word_cnt' reset condition ('frame_start_on_any_lane') to
//     detect byte position 12'd1 on any of the four lanes so 'corrupted_word_cnt'
//     resets cleanly at the start of every frame without accumulating across frames.
// Revision 0.06 (2026-11-06 KST) - Per-Frame Mask Enable & Completed-Frame Corruption Snapshot:
//   - Added explicit 'frame_err_en' input port gating Zone 2 mask application
//     ('if ((SIM_MODE == 1) && frame_err_en)') while keeping all modulo-3117 frame
//     counters ('frame_byte_acc', 'state', 'lane_position', 'frame_out_id') running
//     continuously across all frames.
//   - Added 'frame_start_en_d0' (1-cycle pulse per 3117B frame when byte 1 enters on
//     any lane with en_d0 == 1) and latched 'last_frame_corrupted_words' alongside
//     'last_frame_done_pulse' when byte 3117 completes ('frame_end_on_any_lane')
//     so testbenches can read the exact per-frame corrupted word count before reset.
//////////////////////////////////////////////////////////////////////////////////

module error_inject #(
    parameter   SIM_MODE    = 1,
    parameter   safe_words  = 15,
    parameter   max_error   = 47,
    parameter   max_pad     = 1035 - max_error
)(
    input               clk,          // 312.5 MHz Continuous Clock
    input               rst_n,
    input               en,           // Continuous valid flag from CDC 2
    input   [31:0]      data_in,      // Continuous 32-bit stream from CDC 2
    input               frame_err_en, // Per-frame mask enable (1 = apply SIM_MODE mask, 0 = clean frame)
    output              flag,         // Continuous valid flag to gth64b66b_tx
    output  [31:0]      data_out      // 32-bit stream to gth64b66b_tx
);

reg [31:0] error [0:max_error];
initial $readmemh("error.mem", error);

parameter IDLE  = 4'b0001;
parameter ERROR = 4'b0010;
parameter PAD   = 4'b0100;
parameter END   = 4'b1000;

reg  [31:0] data_d0;
reg  [31:0] error_out;
reg         en_d0;
reg         en_d1;
reg  [11:0] frame_byte_acc;
wire [15:0] frame_word_idx = frame_byte_acc / 4;
wire        frame_wrap_now = en_d0 && (frame_byte_acc >= 12'd3113);

reg  [31:0] active_err_mask;
reg  [31:0] applied_mask;
reg  [3:0]  state;
wire [3:0]  next_state = state; // Retained for waveform compatibility
reg  [15:0] con_error;
reg  [15:0] con_pad;

// Per-lane diagnostic registers (4 MSB-first byte lanes packed per 32-bit word):
// - applied_position[47:0] : Four 12-bit frame byte positions (1..3117) for lanes 0..3.
// - applied_address[63:0]  : Four 16-bit error.mem word addresses (0..47, or FFFF when unmasked).
// - applied_zone[7:0]      : Four 2-bit zone IDs (1 = Protected 1..60, 2 = XOR Mask 61..252, 3 = Pass 253..3117).
reg  [47:0] lane_position;
reg  [63:0] lane_mask_address;
reg  [7:0]  lane_zone;
reg  [47:0] applied_position;
reg  [63:0] applied_address;
reg  [7:0]  applied_zone;

integer lane_i, byte_pos, mask_offset;

always @* begin
    active_err_mask   = 32'd0;
    lane_position     = 48'd0;
    lane_mask_address = 64'hffff_ffff_ffff_ffff;
    lane_zone         = 8'd0;
    byte_pos          = 0;
    mask_offset       = 0;
    con_error         = 16'd0;
    con_pad           = 16'd0;
    state             = IDLE;

    if (frame_byte_acc >= safe_words * 4 && frame_byte_acc < safe_words * 4 + (max_error + 1) * 4) begin
        state     = ERROR;
        con_error = (frame_byte_acc - safe_words * 4) / 4;
    end else if (frame_byte_acc >= safe_words * 4 + (max_error + 1) * 4) begin
        state     = PAD;
        con_pad   = (frame_byte_acc - safe_words * 4 - (max_error + 1) * 4) / 4;
    end

    for (lane_i = 0; lane_i < 4; lane_i = lane_i + 1) begin
        byte_pos = frame_byte_acc + lane_i;
        if (byte_pos >= 3117)
            byte_pos = byte_pos - 3117;

        lane_position[47 - 12 * lane_i -: 12] = byte_pos + 1;

        if (byte_pos < safe_words * 4) begin
            lane_zone[7 - 2 * lane_i -: 2] = 2'd1;
        end else if (byte_pos < safe_words * 4 + (max_error + 1) * 4) begin
            lane_zone[7 - 2 * lane_i -: 2]            = 2'd2;
            mask_offset                               = byte_pos - safe_words * 4;
            lane_mask_address[63 - 16 * lane_i -: 16] = mask_offset / 4;
            if ((SIM_MODE == 1) && frame_err_en)
                active_err_mask[31 - 8 * lane_i -: 8] = error[mask_offset / 4][31 - 8 * (mask_offset % 4) -: 8];
        end else begin
            lane_zone[7 - 2 * lane_i -: 2] = 2'd3;
        end
    end
end

// Exact 1-cycle frame-start indicator qualified by en_d0 (asserts once per 3117-byte frame)
wire frame_start_en_d0 = en_d0 && (
    (lane_position[47:36] == 12'd1) ||
    (lane_position[35:24] == 12'd1) ||
    (lane_position[23:12] == 12'd1) ||
    (lane_position[11:0]  == 12'd1)
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        frame_byte_acc <= 12'd0;
    else if (en_d0) begin
        if (frame_wrap_now)
            frame_byte_acc <= frame_byte_acc + 12'd4 - 12'd3117;
        else
            frame_byte_acc <= frame_byte_acc + 12'd4;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        applied_position <= 48'd0;
        applied_address  <= 64'hffff_ffff_ffff_ffff;
        applied_zone     <= 8'd0;
    end else if (en_d0) begin
        applied_position <= lane_position;
        applied_address  <= lane_mask_address;
        applied_zone     <= lane_zone;
    end else begin
        applied_position <= 48'd0;
        applied_address  <= 64'hffff_ffff_ffff_ffff;
        applied_zone     <= 8'd0;
    end
end

always @(posedge clk or negedge rst_n) begin
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

always @(posedge clk or negedge rst_n) begin
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
// Auxiliary simulation monitor:
// - The #0.8 sub-cycle stepping below is a visual unpacking of the 4 bytes inside each
//   32-bit word period (not a separate hardware byte interface).
// - 'corrupted_word_cnt' counts 32-bit bus words in the current frame that had a non-zero
//   XOR mask applied (not the number of Reed-Solomon codeword symbol errors).
// - 'last_frame_corrupted_words' latches the completed frame's final 'corrupted_word_cnt'
//   on 'frame_end_on_any_lane' alongside a 1-cycle 'last_frame_done_pulse' before reset.
reg  [7:0]  byte_out;
reg  [11:0] frame_byte_cnt;
reg  [15:0] out_clk_cnt;
reg  [31:0] frame_out_id;
reg  [31:0] cur_word;
reg  [15:0] corrupted_word_cnt;
reg  [15:0] last_frame_corrupted_words;
reg         last_frame_done_pulse;

wire frame_start_on_any_lane = (applied_position[47:36] == 12'd1) ||
                               (applied_position[35:24] == 12'd1) ||
                               (applied_position[23:12] == 12'd1) ||
                               (applied_position[11:0]  == 12'd1);

wire frame_end_on_any_lane   = (applied_position[47:36] == 12'd3117) ||
                               (applied_position[35:24] == 12'd3117) ||
                               (applied_position[23:12] == 12'd3117) ||
                               (applied_position[11:0]  == 12'd3117);

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        corrupted_word_cnt         <= 16'd0;
        last_frame_corrupted_words <= 16'd0;
        last_frame_done_pulse      <= 1'b0;
    end else begin
        last_frame_done_pulse <= 1'b0;
        if (en_d1) begin
            if (frame_end_on_any_lane) begin
                last_frame_corrupted_words <= corrupted_word_cnt;
                last_frame_done_pulse      <= 1'b1;
            end
            if (frame_start_on_any_lane)
                corrupted_word_cnt <= (applied_mask != 32'd0) ? 16'd1 : 16'd0;
            else if (applied_mask != 32'd0)
                corrupted_word_cnt <= corrupted_word_cnt + 16'd1;
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
    if (rst_n) begin
        if (en_d0) begin
            cur_word = active_err_mask ^ data_d0;
            step_single_byte(cur_word[31:24], 1'b1);
            #0.8 step_single_byte(cur_word[23:16], 1'b0);
            #0.8 step_single_byte(cur_word[15:8],  1'b0);
            #0.8 step_single_byte(cur_word[7:0],   1'b0);
        end else begin
            // Hold frame_byte_cnt, out_clk_cnt, and frame_out_id across valid-low gaps
            byte_out <= 8'd0;
        end
    end
end
// synthesis translate_on

endmodule