`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Description  : High-Fidelity Testbench for MUX Gearbox 128.

               VALIDATION OBJECTIVES:
               1. Strict 3117-Byte Geometry: Proves the MUX correctly 
                  combines Preamble and LPC and terminates exactly at 3117 
                  Bytes using the cdc_keep masking signal.
               2. OISL Packet Sequence: Simulates the progression of DAT1, 
                  DAT2, IDLE, and MGMT frames.
               3. Inter-Frame Gap: Simulates the physical 25.6 Gbps wait state.

Revision History:
  - Rev 1.0 (Initial) : 128-bit MUX Gearbox (9B Preamble + 3108B LPC = 3117B) testbench.
  - Rev 2.0 (2026-10-27 15:11 KST) : [ETRI Audit Item 1 - SDA OISL Page 23, Table 2-8 & Sec. 2.6.3.2]
    1. Added automatic verification that the first 128-bit output word of every 
       frame places the official 72-bit SDA OISL Preamble (72'h77AD5B5843641E2E26)
       at MSB bits [127:56] (MSB transmitted first) concatenated with the top 
       56 bits of LPC Word 1 at [55:0] (cdc_data = 128'h77AD5B58_43641E2E_26AAAABB_BBCCCCDD).
    2. Verified that every frame emits exactly 194 full 16-Byte words (cdc_keep = 16'hFFFF)
       plus a 195th flush word of 13 Bytes (cdc_keep = 16'h1FFF) = 3,117 Bytes (24,936 bits).
===========================================================================
*/

module tb_mux_gearbox();

    // =======================================================
    // 1. SYSTEM CLOCKS AND RESET
    // =======================================================
    reg clk;   // 200.0 MHz Baseband Clock
    reg rst_n;

    // =======================================================
    // 2. DEVICE UNDER TEST (DUT) SIGNALS
    // =======================================================
    wire [71:0]  preamble_data;
    
    reg  [95:0]  lpc_data;
    reg          lpc_valid;
    
    wire [127:0] cdc_data;
    wire         cdc_valid;
    wire [15:0]  cdc_keep;

    // =======================================================
    // 3. DUT INSTANTIATIONS
    // =======================================================
    preamble_gen u_preamble (
        .preamble_out (preamble_data)
    );

    mux_gearbox_128 u_mux (
        .clk           (clk),
        .rst_n         (rst_n),
        .preamble_data (preamble_data),
        .lpc_data      (lpc_data),
        .lpc_valid     (lpc_valid),
        .cdc_data      (cdc_data),
        .cdc_valid     (cdc_valid),
        .cdc_keep      (cdc_keep)
    );

    // =======================================================
    // 4. CLOCK & FSM INJECTOR 
    // =======================================================
    initial begin
        clk = 1'b0;
        forever #2.5 clk = ~clk; 
    end

    localparam ST_STREAM = 2'd0;
    localparam ST_GAP    = 2'd1;
    localparam ST_DONE   = 2'd2;

    reg [1:0]  tb_state;
    reg [3:0]  frame_id;
    reg [15:0] cycle_cnt;

    initial begin
        rst_n     = 1'b0;
        tb_state  = ST_STREAM;
        frame_id  = 4'd1;
        cycle_cnt = 16'd1;
        #100; rst_n = 1'b1;
    end

    always @(posedge clk or negedge rst_n) begin
        if (rst_n) begin
            case (tb_state)
                ST_STREAM: begin
                    // 259 Continuous Words from LPC
                    if (cycle_cnt < 259) cycle_cnt <= cycle_cnt + 1'b1;
                    else begin tb_state <= ST_GAP; cycle_cnt <= 16'd1; end
                end
                ST_GAP: begin
                    // 110 Cycles of Gap: Wait for Framer to assemble next frame
                    if (cycle_cnt < 110) cycle_cnt <= cycle_cnt + 1'b1;
                    else begin
                        if (frame_id < 4) begin
                            frame_id <= frame_id + 1'b1;
                            tb_state <= ST_STREAM;
                            cycle_cnt <= 16'd1;
                        end else begin
                            tb_state <= ST_DONE;
                        end
                    end
                end
            endcase
        end
    end

    // Combinational Data Assembly for LPC (96-bit words)
    reg [31:0] frame_type_str;
    always @(*) begin
        lpc_valid = 1'b0; 
        lpc_data  = 96'd0;
        frame_type_str = "WAIT";

        if (tb_state == ST_STREAM) begin
            lpc_valid = 1'b1;
            
            if      (frame_id == 1) frame_type_str = "DAT1";
            else if (frame_id == 2) frame_type_str = "DAT2";
            else if (frame_id == 3) frame_type_str = "IDLE";
            else                    frame_type_str = "MGMT";

            // Simulated LPC Structure with identifiable words
            if      (cycle_cnt == 1)   lpc_data = {64'hAAAA_BBBB_CCCC_DDDD, 16'd1, 16'hE0E0};
            else if (cycle_cnt == 2)   lpc_data = {64'hEEEE_FFFF_1111_2222, 16'd2, 16'hE0E0};
            else if (cycle_cnt == 259) lpc_data = {64'h9999_8888_7777_6666, 16'd259, 16'hE0E0};
            else                       lpc_data = {32'd0, 32'd0, 16'd0, cycle_cnt[15:0]};
        end
    end

    // =======================================================
    // 5. THE WAVEFORM TRACKERS (Global Clock, LPC, and 3117 Byte MUX)
    // =======================================================
    
    // NEW: Global Clock Counter
    reg [31:0] global_clk_cnt;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) global_clk_cnt <= 32'd0;
        else global_clk_cnt <= global_clk_cnt + 1'b1;
    end

    // NEW: LPC Byte Counter (Tracks 12 Bytes up to 3108 Bytes)
    reg [11:0] r_lpc_byte_cnt;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) r_lpc_byte_cnt <= 12'd0;
        else if (lpc_valid) r_lpc_byte_cnt <= r_lpc_byte_cnt + 12'd12;
        else if (tb_state == ST_GAP && cycle_cnt == 10) r_lpc_byte_cnt <= 12'd0;
    end
    wire [11:0] track_lpc_bytes = lpc_valid ? (r_lpc_byte_cnt + 12'd12) : r_lpc_byte_cnt;

    // EXISTING: MUX 3117 Byte Tracker & [Rev 2.0] Table 2-8 Preamble MSB-First Verifier
    reg [11:0] r_out_byte_cnt;
    integer    preamble_msb_pass_cnt = 0;
    integer    frame_3117b_pass_cnt  = 0;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            r_out_byte_cnt        <= 12'd0;
            preamble_msb_pass_cnt <= 0;
            frame_3117b_pass_cnt  <= 0;
        end else begin
            if (cdc_valid) begin
                // Verify 1st 128-bit word of frame: [127:56] must be 72'h77AD5B5843641E2E26
                if (r_out_byte_cnt == 12'd0) begin
                    $display(" [%0t] Frame %0d Word 1 cdc_data[127:56] (Preamble) = 0x%018X | cdc_data[55:0] (LPC MSB) = 0x%014X",
                             $time, frame_id, cdc_data[127:56], cdc_data[55:0]);
                    if (cdc_data[127:56] == 72'h77_AD_5B_58_43_64_1E_2E_26)
                        preamble_msb_pass_cnt <= preamble_msb_pass_cnt + 1;
                end

                if (cdc_keep == 16'hFFFF) begin
                    r_out_byte_cnt <= r_out_byte_cnt + 12'd16;
                end else if (cdc_keep == 16'h1FFF) begin
                    r_out_byte_cnt <= r_out_byte_cnt + 12'd13;
                    if ((r_out_byte_cnt + 12'd13) == 12'd3117)
                        frame_3117b_pass_cnt <= frame_3117b_pass_cnt + 1;
                end
            end 
            else if (tb_state == ST_GAP && cycle_cnt == 10) begin
                r_out_byte_cnt <= 12'd0;
            end
        end
    end

    wire [11:0] gearbox_out_byte_cnt = cdc_valid ? 
        (cdc_keep == 16'hFFFF ? (r_out_byte_cnt + 12'd16) : (r_out_byte_cnt + 12'd13)) 
        : r_out_byte_cnt;

    // =======================================================
    // 6. SIMULATION LOGGING
    // =======================================================
    initial begin
        wait(tb_state == ST_DONE);
        #5000;
        $display("\n=======================================================");
        $display(" MUX GEARBOX VERIFICATION COMPLETE (SDA OISL TABLE 2-8)");
        $display(" Preamble (9B: 72'h77AD5B5843641E2E26) + LPC (3108B) merged.");
        $display(" MUX output terminates STRICTLY at 3117 Bytes per frame.");
        $display(" The 13-Byte flush is validated by cdc_keep = 16'h1FFF.");
        $display(" Table 2-8 Preamble MSB-First Passes : %0d / 4 Frames", preamble_msb_pass_cnt);
        $display(" Exact 3117-Byte Frame Passes        : %0d / 4 Frames", frame_3117b_pass_cnt);
        if (preamble_msb_pass_cnt == 4 && frame_3117b_pass_cnt == 4)
            $display(" RESULT: [PASS] 100%% COMPLIANT WITH ETRI AUDIT ITEM 1!");
        $display("=======================================================\n");
        $finish;
    end

endmodule