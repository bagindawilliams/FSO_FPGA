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

// Revision FEC28-INJECT-01, 2026-11-02 KST.
// Frame-relative byte addressing supersedes the Rev0.02 word-state zone logic.
// The accepted stream starts at frame byte1 after reset. Valid-low cycles hold
// the coordinate; they do not terminate a frame. Each MSB-first byte lane is
// addressed separately, including words crossing the 3117-byte boundary.
// Default zones: bytes1..60 protected,61..252 XOR all48 original mask words,
// bytes253..3117 pass through. Ports, two-register latency and mask file remain.
// max_pad is retained for caller compatibility; the fixed frame length governs
// the third zone. Historical serialized-byte display below is an auxiliary
// visualization, not the accepted-transfer coordinate used for injection.
reg [31:0] error [0:max_error];
initial $readmemh("error.mem", error);
parameter IDLE=4'b0001, ERROR=4'b0010, PAD=4'b0100, END=4'b1000;
reg [31:0] data_d0, error_out;
reg en_d0, en_d1;
reg [11:0] frame_byte_acc;
wire [15:0] frame_word_idx = frame_byte_acc / 4;
wire frame_wrap_now = en_d0 && (frame_byte_acc >= 3113);
reg [31:0] active_err_mask;
reg [31:0] applied_mask;
reg [3:0] state;
wire [3:0] next_state = state; // Historical waveform compatibility; no FSM.
reg [15:0] con_error, con_pad;
// Packed lanes are MSB-first. Address FFFF means no mask read on that lane.
reg [47:0] lane_position;
reg [63:0] lane_mask_address;
reg [7:0] lane_zone;
reg [47:0] applied_position;
reg [63:0] applied_address;
reg [7:0] applied_zone;
integer lane_i, byte_pos, mask_offset;
always @* begin
    active_err_mask=0; lane_position=0; lane_mask_address=64'hffffffffffffffff;
    lane_zone=0; byte_pos=0; mask_offset=0;
    con_error=0; con_pad=0; state=IDLE;
    if(frame_byte_acc >= safe_words*4 && frame_byte_acc < safe_words*4+(max_error+1)*4) begin
        state=ERROR; con_error=(frame_byte_acc-safe_words*4)/4;
    end else if(frame_byte_acc >= safe_words*4+(max_error+1)*4) begin
        state=PAD; con_pad=(frame_byte_acc-safe_words*4-(max_error+1)*4)/4;
    end
    for(lane_i=0;lane_i<4;lane_i=lane_i+1) begin
        byte_pos=frame_byte_acc+lane_i;
        if(byte_pos>=3117) byte_pos=byte_pos-3117;
        lane_position[47-12*lane_i -:12]=byte_pos+1;
        if(byte_pos<safe_words*4) lane_zone[7-2*lane_i -:2]=1;
        else if(byte_pos<safe_words*4+(max_error+1)*4) begin
            lane_zone[7-2*lane_i -:2]=2;
            mask_offset=byte_pos-safe_words*4;
            lane_mask_address[63-16*lane_i -:16]=mask_offset/4;
            if(SIM_MODE==1)
                active_err_mask[31-8*lane_i -:8]=error[mask_offset/4][31-8*(mask_offset%4) -:8];
        end else lane_zone[7-2*lane_i -:2]=3;
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) frame_byte_acc<=0;
    else if(en_d0) begin
        if(frame_wrap_now) frame_byte_acc<=frame_byte_acc+4-3117;
        else frame_byte_acc<=frame_byte_acc+4;
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin applied_position<=0;applied_address<=64'hffffffffffffffff;applied_zone<=0;end
    else if(en_d0) begin applied_position<=lane_position;applied_address<=lane_mask_address;applied_zone<=lane_zone;end
    else begin applied_position<=0;applied_address<=64'hffffffffffffffff;applied_zone<=0;end
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