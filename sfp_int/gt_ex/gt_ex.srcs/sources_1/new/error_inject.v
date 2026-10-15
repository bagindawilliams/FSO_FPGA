`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WiComAI Lab, Kookmin University
// Engineer: Williamsyah Baginda Miraj & Giovanni Dwi
// 
// Create Date: 11/19/2025 06:26:34 PM
// Design Name: SDA OISL 10G Optical Transceiver
// Module Name: error_inject
// Project Name: SDAOISL_10Gto10G
// Target Devices: Kintex UltraScale (xcku060-ffva1156-2-i)
// Tool Versions: Vivado 2025.2
// Description: 
//   Digital RTL Error Injector operating on the 312.5 MHz (32-bit) GTH stream.
// 
// Dependencies: error.mem
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Revision 0.02 - Continuous 3117-Byte Frame Alignment & Dual-Mode VOA Support:
//   1. Added parameter SIM_ERR_EN (1 = Digital XOR injection using error.mem for 
//      Vivado simulation; 0 = Clean hardware pass-through when using the physical 
//      Manual Variable Optical Attenuator Single-Mode 0.9-1m /t49G/51 LC/PC).
//   2. Preserved continuous Zero-Gap 'flag' assertion across back-to-back 
//      3117-Byte frames exiting CDC 2 (x_logic_gth) so no 32-bit words are dropped.
//   3. Protects the first 15 words (60 Bytes: 9B unscrambled Preamble + 48B 
//      LPC Header + 3B boundary margin) of every 3117-Byte frame before injecting 
//      the 48-word error.mem pattern into the Payload LPC region.
//   4. Includes 1-by-1 byte unpacker and Modulo-3117 tracker for waveform proof.
//////////////////////////////////////////////////////////////////////////////////


module error_inject #(
    parameter   SIM_ERR_EN  = 1,    // 1 = Enable error.mem XOR (Sim), 0 = Bypass for HW VOA Attenuator
    parameter   safe_words  = 15,   // Protect first 15 words (60B: 9B Preamble + 48B Header LPC) per frame
    parameter   max_error   = 47,   // 48 words (0..47) of error pattern from error.mem
    parameter   max_pad     = 1035 - max_error
)(
    input               clk,
    input               rst_n,
    input               en,
    input   [31:0]      data_in,
    output              flag,
    output  [31:0]      data_out
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

// Revision 0.02: Continuous pipeline valid tracking & per-frame word tracking
reg                 en_d0;
reg                 en_d1;
reg     [11:0]      frame_byte_acc;
reg     [15:0]      frame_word_idx;
wire                frame_wrap_now = en_d0 && (frame_byte_acc + 12'd4 >= 12'd3117);

// Active XOR mask (32'd0 during Preamble/Header, PAD, or when SIM_ERR_EN == 0 for HW VOA)
wire    [31:0]      active_err_mask = (SIM_ERR_EN && (state == ERROR)) ? error[con_error] : 32'd0;
reg     [31:0]      applied_mask;

always @(posedge clk or negedge rst_n)
begin
    if (~rst_n)
        state   <= IDLE;
    else
        state   <= next_state;
end

// Track exact 3117-Byte frame boundary on the incoming continuous stream from CDC 2
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
                            // Wait in IDLE during reset or during the first 'safe_words' (Preamble + Header)
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
                                // Frame hit 3117 Bytes! Return to IDLE to protect next frame's Preamble + Header
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

// Continuous Zero-Gap output flag & data assignment
assign  flag        = en_d1;
assign  data_out    = (flag) ? error_out : 32'b0;

// =========================================================================
// WAVEFORM TRACKERS: 1-BY-1 BYTE UNPACKER & BIT-ERROR COUNTER (312.5 MHz)
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
            // Unpack 4 bytes per 3.2 ns cycle (0.8 ns per byte = 10.0 Gbps)
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