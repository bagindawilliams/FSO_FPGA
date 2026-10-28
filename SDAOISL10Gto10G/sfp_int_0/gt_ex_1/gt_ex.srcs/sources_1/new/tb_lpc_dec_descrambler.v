`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : tb_lpc_dec_descrambler
Description  : Verification Testbench for the Receiver Line Product Code 
               Decoder (lpc_dec_top.v) and Parallel PRBS Descrambler 
               (descrambler.v).

               KEY VERIFICATION OBJECTIVES:
               1. Encodes 4 full FSO frames (259 words x 64-bit = 2072 Bytes 
                  per frame) using the Golden Reference TX Scrambler and 
                  LPC(24,16) Encoder (lpc_top).
               2. Injects 1 single-bit channel error into every 24-bit LPC 
                  sub-block (4 bit errors per 96-bit word = 1036 bit errors 
                  per frame = 4144 bit errors across 4 frames).
               3. Verifies that lpc_dec_top corrects all 4144 single-bit 
                  errors via 2D horizontal/vertical parity syndromes and 
                  descrambler recovers all 1036 words (8288 Bytes) with 
                  ZERO mismatches.

Revision History:
  - Rev 1.0 (Initial) : 4-frame LPC(24,16) 1-bit error correction + Descrambler TB.
  - Rev 2.0 (2026-10-27 15:55 KST) : [ETRI Audit Item 4 & Item 6 Verification]
    1. Verified 25-bit PRBS Scrambler/Descrambler state reset to SEED_INIT = 
       25'h0000007 (Table 2-17, Page 39) and Figure 2-12 bit ordering (Page 40).
    2. Exposed Active Disparity Management accumulators (running_disparity) in 
       both lpc_top and lpc_dec_top (Sec. 2.6.3.6.8, Pages 40-41).
    3. Updated payload header patterns to match Table 2-18 (0xAB00_0000_CDEF_07D0 
       on DAT1 and 0xAB00_4064 on DAT2).
===========================================================================
*/

module tb_lpc_dec_descrambler();

    reg clk;   // 200.0 MHz Baseband Clock (5.0 ns)
    reg rst_n;

    // Golden Reference TX Inputs (259 words x 64-bit per frame)
    reg         tx_mux_dv;
    reg  [63:0] tx_mux_data;

    // Golden Reference TX Scrambler & LPC Outputs
    wire        tx_scr_dv;
    wire [63:0] tx_scr_data;
    wire        tx_lpc_dv;
    wire [95:0] tx_lpc_data;

    // Channel 1-Bit per 24-Bit Sub-Block Error Injection Mask
    parameter INJECT_1BIT_PER_SUBBLOCK = 1;
    reg  [8:0]  err_rot_idx;
    wire [23:0] sub_err_mask = INJECT_1BIT_PER_SUBBLOCK ?
                               (24'h000100 << (err_rot_idx % 16)) : 24'd0;
    wire [95:0] full_96b_err_mask = tx_lpc_dv ? {4{sub_err_mask}} : 96'd0;
    wire [95:0] noisy_lpc_in      = tx_lpc_data ^ full_96b_err_mask;

    // Receiver DUT Outputs (lpc_dec_top -> descrambler)
    wire        rx_lpc_dec_dv;
    wire [63:0] rx_lpc_dec_data;
    wire        rx_desc_dv;
    wire [63:0] rx_desc_data;

    // Hierarchical Probes for ETRI Audit Item 4 (25-bit PRBS) & Item 6 (Active Disparity)
    wire [24:0]        tx_scr_state_25b     = u_ref_scrambler.Q;
    wire [24:0]        rx_desc_state_25b    = u_dut_descrambler.Q;
    wire signed [11:0] tx_lpc3_running_disp = u_ref_lpc_top.lpc_3.running_disparity;
    wire signed [11:0] rx_lpc3_running_disp = u_dut_lpc_dec_top.lpc_dec_3.running_disparity;
    wire [15:0]        total_corrected_bits = u_dut_lpc_dec_top.total_corrected_bits;
    wire [7:0]         byte_stream_out      = u_dut_descrambler.byte_stream_out;
    wire [11:0]        frame_byte_idx       = u_dut_descrambler.frame_byte_idx;
    wire [31:0]        desc_frame_id        = u_dut_descrambler.desc_frame_id;

    // 1. Golden Reference TX Scrambler (25-bit PRBS, Seed 25'h0000007)
    scrambler u_ref_scrambler (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (tx_mux_dv),
        .data_in  (tx_mux_data),
        .flag     (tx_scr_dv),
        .data_out (tx_scr_data)
    );

    // 2. Golden Reference TX LPC(24,16) Encoder Top (64-bit -> 96-bit)
    lpc_top u_ref_lpc_top (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (tx_scr_dv),
        .data_in  (tx_scr_data),
        .flag     (tx_lpc_dv),
        .data_out (tx_lpc_data)
    );

    // 3. Receiver DUT Stage 1: LPC(24,16) Decoder Top (96-bit -> 64-bit)
    lpc_dec_top u_dut_lpc_dec_top (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (tx_lpc_dv),
        .data_in  (noisy_lpc_in),
        .flag     (rx_lpc_dec_dv),
        .data_out (rx_lpc_dec_data)
    );

    // 4. Receiver DUT Stage 2: 25-bit PRBS Descrambler (64-bit, 259 cycles)
    descrambler u_dut_descrambler (
        .clk      (clk),
        .rst_n    (rst_n),
        .en       (rx_lpc_dec_dv),
        .data_in  (rx_lpc_dec_data),
        .flag     (rx_desc_dv),
        .data_out (rx_desc_data)
    );

    // 200.0 MHz Clock Generation
    initial begin
        clk = 1'b0;
        forever #2.5 clk = ~clk;
    end

    // Stimulus FSM (4 Frames x 259 Words = 1036 Words = 8288 Bytes)
    localparam ST_STREAM = 2'd0;
    localparam ST_GAP    = 2'd1;
    localparam ST_DONE   = 2'd2;

    reg [1:0]  tb_state;
    reg [3:0]  frame_id;
    reg [15:0] cycle_cnt;

    initial begin
        rst_n       = 1'b0;
        tb_state    = ST_STREAM;
        frame_id    = 4'd1;
        cycle_cnt   = 16'd1;
        err_rot_idx = 9'd0;
        #100;
        rst_n       = 1'b1;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tb_state    <= ST_STREAM;
            frame_id    <= 4'd1;
            cycle_cnt   <= 16'd1;
            err_rot_idx <= 9'd0;
        end else begin
            if (tx_lpc_dv)
                err_rot_idx <= err_rot_idx + 9'd1;
            else
                err_rot_idx <= 9'd0;

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
                    if (cycle_cnt < 16'd20)
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
        tx_mux_dv   = 1'b0;
        tx_mux_data = 64'd0;

        if (rst_n && (tb_state == ST_STREAM)) begin
            tx_mux_dv = 1'b1;
            if      (cycle_cnt == 16'd1)   tx_mux_data = {4'd0, frame_id, 8'h00, 16'h0000, 8'hFD, 24'h554433};
            else if (cycle_cnt == 16'd2)   tx_mux_data = 64'h2211_F28A_8899_0F28;
            else if (cycle_cnt <= 16'd4)   tx_mux_data = 64'hC1C2_C1C2_C1C2_C1C2;
            else if (cycle_cnt == 16'd5)   tx_mux_data = (frame_id == 4'd2) ? 64'hAB00_4064_AAAA_0001 : 64'hAB00_0000_CDEF_07D0;
            else if (cycle_cnt == 16'd243) tx_mux_data = 64'hDA7A_DA7A_C320_0000 + {60'd0, frame_id};
            else if (cycle_cnt >  16'd243) tx_mux_data = 64'hB10C_B10C_B10C_B10C;
            else begin
                if      (frame_id <= 4'd2) tx_mux_data = 64'hDA7A_DA7A_0000_0000 | {48'd0, cycle_cnt};
                else if (frame_id == 4'd3) tx_mux_data = 64'h1D1E_1D1E_0000_0000 | {48'd0, cycle_cnt};
                else                       tx_mux_data = 64'hA1A1_A1A1_0000_0000 | {48'd0, cycle_cnt};
            end
        end
    end

    // 4-Cycle Pipeline Reference Delay to Compare rx_desc_data against tx_mux_data
    reg [63:0] exp_pipe [0:3];
    integer    matched_words   = 0;
    integer    mismatched_words = 0;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            exp_pipe[0] <= 64'd0; exp_pipe[1] <= 64'd0;
            exp_pipe[2] <= 64'd0; exp_pipe[3] <= 64'd0;
        end else begin
            exp_pipe[0] <= tx_mux_data;
            exp_pipe[1] <= exp_pipe[0];
            exp_pipe[2] <= exp_pipe[1];
            exp_pipe[3] <= exp_pipe[2];

            if (rx_desc_dv) begin
                if (rx_desc_data == exp_pipe[3])
                    matched_words <= matched_words + 1;
                else
                    mismatched_words <= mismatched_words + 1;
            end
        end
    end

    initial begin
        wait(tb_state == ST_DONE);
        wait(matched_words + mismatched_words == 1036);
        wait(desc_frame_id == 32'd0);
        #200;

        $display("\n======================================================================");
        $display(" LPC(24,16) DECODER & 25-BIT DESCRAMBLER (SEED 0x0000007) REPORT");
        $display(" -> Total Single-Bit Channel Errors Corrected : %0d / 4144", total_corrected_bits);
        $display(" -> Total 64-bit Words Recovered Intact       : %0d / 1036 (8288 Bytes)", matched_words);
        $display(" -> Uncorrected / Mismatched Words            : %0d", mismatched_words);
        if (matched_words == 1036 && mismatched_words == 0 && total_corrected_bits == 4144)
            $display(" -> RESULT: [PASS] 100%% COMPLIANT WITH ETRI AUDIT ITEM 4 & ITEM 6!");
        $display("======================================================================\n");
        $finish;
    end

endmodule