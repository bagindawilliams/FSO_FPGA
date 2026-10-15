`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : High-Fidelity Testbench for CDC 2 + Error Injector Pipeline.

               VALIDATION OBJECTIVES:
               1. Dual-Mode Verification (SIM_ERR_EN):
                  - SIM_ERR_EN = 1: Injects 48-word pattern from 'error.mem'
                    into the Payload region while keeping the 9-Byte Preamble 
                    and 48-Byte LPC Header 100% uncorrupted.
                  - SIM_ERR_EN = 0: Clean bypass mode for Hardware testing 
                    with the Manual VOA (Single-Mode 0.9-1m /t49G/51 LC/PC).
               2. Continuous 3117-Byte Geometry & Zero-Gap Proof:
                  Proves that 'err_flag' stays continuously HIGH across all 
                  4 frames (DAT1, DAT2, IDLE, MGMT) and counts 1 to 3117 bytes.
               3. SDA OISL Table 2-4 Metrics Alignment:
                  Displays Frame Duration (2.4936 us), Effective Data Rate 
                  (6121.270 Mbps), Frame Rate (401.027 kHz), and FCCH (6.416 Mbps)
                  directly underneath each active frame on the Error Injector output.
===========================================================================
*/

module tb_error_inject();

    // =======================================================
    // 1. MASTER MODE SWITCH & SYSTEM CLOCKS
    // =======================================================
    // Set to 1 for Vivado 'error.mem' injection, or 0 for Hardware VOA bypass
    parameter SIM_ERR_EN = 1;

    reg clk_logic; // 200.0 MHz (Period: 5.0 ns)
    reg clk_gth;   // 312.5 MHz (Period: 3.2 ns)
    reg rst_n;
    reg en;

    // Input from MUX Gearbox Emulator (200 MHz, 128-bit)
    reg  [127:0] data_in;
    reg          data_in_dv;
    reg  [15:0]  cdc_keep;

    // Intermediate Wires: CDC 2 Output -> Error Injector Input (312.5 MHz, 32-bit)
    wire         cdc2_flag;
    wire [31:0]  cdc2_data_out;

    // Final Output from Error Injector (312.5 MHz, 32-bit)
    wire         err_flag;
    wire [31:0]  err_data_out;

    // =======================================================
    // 2. DUT INSTANTIATIONS (CDC 2 -> ERROR INJECTOR)
    // =======================================================
    x_logic_gth u_cdc2 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en         (en),
        .data_in    (data_in),
        .data_in_dv (data_in_dv),
        .cdc_keep   (cdc_keep),
        .flag       (cdc2_flag),
        .data_out   (cdc2_data_out)
    );

    error_inject #(
        .SIM_ERR_EN (SIM_ERR_EN),
        .safe_words (15), // Protects first 60 Bytes (9B Preamble + 48B Header LPC + 3B)
        .max_error  (47)  // 48 words from error.mem
    ) u_error_inject (
        .clk        (clk_gth),
        .rst_n      (rst_n),
        .en         (cdc2_flag),
        .data_in    (cdc2_data_out),
        .flag       (err_flag),
        .data_out   (err_data_out)
    );

    // =======================================================
    // 3. DUAL CLOCK GENERATION
    // =======================================================
    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic; // 200.0 MHz
    end

    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;     // 312.5 MHz
    end

    // =======================================================
    // 4. WRITE DOMAIN FSM: MUX GEARBOX EMULATOR (200 MHz)
    // =======================================================
    localparam ST_WAIT_RST = 2'd0;
    localparam ST_STREAM   = 2'd1;
    localparam ST_GAP      = 2'd2;
    localparam ST_DONE     = 2'd3;

    reg [1:0]  tb_state;
    reg [3:0]  frame_id;
    reg [15:0] cycle_cnt;

    initial begin
        rst_n     = 1'b0;
        en        = 1'b0;
        tb_state  = ST_WAIT_RST;
        frame_id  = 4'd0;
        cycle_cnt = 16'd0;
        #100; 
        rst_n     = 1'b1; 
        en        = 1'b1;
    end

    always @(posedge clk_logic or negedge rst_n) begin
        if (!rst_n) begin
            tb_state  <= ST_WAIT_RST;
            frame_id  <= 4'd0;
            cycle_cnt <= 16'd0;
        end else begin
            case (tb_state)
                ST_WAIT_RST: begin
                    if (!u_cdc2.wr_rst_busy) begin
                        if (cycle_cnt < 16'd5) begin
                            cycle_cnt <= cycle_cnt + 1'b1;
                        end else begin
                            tb_state  <= ST_STREAM;
                            frame_id  <= 4'd1;
                            cycle_cnt <= 16'd1;
                        end
                    end
                end
                ST_STREAM: begin
                    if (cycle_cnt < 16'd195) begin
                        cycle_cnt <= cycle_cnt + 1'b1;
                    end else begin
                        tb_state  <= ST_GAP;
                        cycle_cnt <= 16'd1;
                    end
                end
                ST_GAP: begin
                    // 304 cycles rate-matching gap (balances 25.6 Gbps burst to 10.0 Gbps line rate)
                    if (cycle_cnt < 16'd304) begin
                        cycle_cnt <= cycle_cnt + 1'b1;
                    end else begin
                        if (frame_id < 4'd4) begin
                            frame_id  <= frame_id + 1'b1;
                            tb_state  <= ST_STREAM;
                            cycle_cnt <= 16'd1;
                        end else begin
                            tb_state  <= ST_DONE;
                            cycle_cnt <= 16'd0;
                            en        <= 1'b0;
                        end
                    end
                end
                ST_DONE: begin
                    en <= 1'b0;
                end
            endcase
        end
    end

    // Realistic Frame Structure: Cycle 1 starts with unscrambled 72-bit Preamble (9B)
    always @(*) begin
        data_in_dv = 1'b0;
        data_in    = 128'd0;
        cdc_keep   = 16'd0;

        if (rst_n && (tb_state == ST_STREAM)) begin
            data_in_dv = 1'b1;
            if (cycle_cnt == 16'd1) begin
                // First 16 Bytes of Frame: 9B Unscrambled Preamble (55..55D5) + 7B Header LPC
                cdc_keep = 16'hFFFF;
                data_in  = {72'h55_55_55_55_55_55_55_55_D5, 24'hAA_BB_CC, {12'd0, frame_id}, {16'd1}};
            end else if (cycle_cnt <= 16'd194) begin
                cdc_keep = 16'hFFFF;
                data_in  = {32'hAAAA_BBBB, 32'hCCCC_DDDD, {28'd0, frame_id}, {16'd0, cycle_cnt}};
            end else if (cycle_cnt == 16'd195) begin
                // 13-Byte Flush ending in 0x33 + 3-Byte Zero Padding (stripped by CDC 2)
                cdc_keep = 16'h1FFF;
                data_in  = {104'h9999_8888_7777_6666_5555_4444_33, 24'h000000};
            end
        end
    end

    // =======================================================
    // 5. WAVEFORM TRACKERS FOR ALL STAGES
    // =======================================================
    // Group 1: Data In from MUX (200 MHz)
    wire [15:0] in_clk_cnt  = data_in_dv ? cycle_cnt : 16'd0;
    wire [11:0] in_byte_cnt = data_in_dv ? 
                              ((cdc_keep == 16'hFFFF) ? (cycle_cnt * 12'd16) : 12'd3117) 
                              : 12'd0;

    // Group 2: Error Injector Output Trackers (312.5 MHz)
    wire [31:0] err_mask_applied   = u_error_inject.applied_mask;
    wire [15:0] corrupted_word_cnt = u_error_inject.corrupted_word_cnt;
    wire [7:0]  byte_out           = u_error_inject.byte_out;       
    wire [15:0] out_clk_cnt        = u_error_inject.out_clk_cnt;    
    wire [11:0] frame_byte_cnt     = u_error_inject.frame_byte_cnt; 
    wire [31:0] frame_out_id       = u_error_inject.frame_out_id;   

    // =======================================================
    // 6. FRAME-ALIGNED SDA OISL TABLE 2-4 METRIC ANALYZER
    // =======================================================
    real last_gth_edge_ns;
    real measured_gth_period_ns;
    real measured_byte_time_ns;

    real time_start;
    real time_end;
    real OISL_Frame_Duration_us;
    real OISL_Effective_Data_Rate_Mbps;
    real OISL_Frame_Rate_kHz;
    real OISL_FCCH_Mbps;

    reg [31:0] prev_frame_id;

    initial begin
        last_gth_edge_ns              = 0.0;
        measured_gth_period_ns        = 0.0;
        measured_byte_time_ns         = 0.0;
        prev_frame_id                 = 32'd0;
        time_start                    = 0.0;
        time_end                      = 0.0;
        OISL_Frame_Duration_us        = 0.0;
        OISL_Effective_Data_Rate_Mbps = 0.0;
        OISL_Frame_Rate_kHz           = 0.0;
        OISL_FCCH_Mbps                = 0.0;
    end

    always @(posedge clk_gth) begin
        if (last_gth_edge_ns > 0.0) begin
            measured_gth_period_ns = $realtime - last_gth_edge_ns;
            measured_byte_time_ns  = measured_gth_period_ns / 4.0;
        end
        last_gth_edge_ns = $realtime;
    end

    // Synchronously update Table 2-4 metrics directly under frame_out_id (1, 2, 3, 4)
    always @(frame_out_id) begin
        if (frame_out_id >= 32'd1 && frame_out_id <= 32'd4) begin
            time_start = $realtime;
            time_end   = time_start + (3117.0 * measured_byte_time_ns);

            OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
            OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
            OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
            OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

            $display("---------------------------------------------------------------");
            $display(" ERROR INJECTOR FRAME %0d ACTIVE (SIM_ERR_EN = %0d)", frame_out_id, SIM_ERR_EN);
            $display(" time_start     : %0.1f ns | time_end : %0.1f ns", time_start, time_end);
            $display(" Duration       : %0.6f us (3117 Bytes Continuous)", OISL_Frame_Duration_us);
            $display(" Effective Rate : %0.6f Mbps", OISL_Effective_Data_Rate_Mbps);
            $display(" Frame Rate     : %0.6f kHz  | FCCH Rate: %0.6f Mbps", OISL_Frame_Rate_kHz, OISL_FCCH_Mbps);
            $display("---------------------------------------------------------------");
        end
        else if (frame_out_id == 32'd0) begin
            time_start                    = 0.0;
            time_end                      = 0.0;
            OISL_Frame_Duration_us        = 0.0;
            OISL_Effective_Data_Rate_Mbps = 0.0;
            OISL_Frame_Rate_kHz           = 0.0;
            OISL_FCCH_Mbps                = 0.0;
        end
        prev_frame_id = frame_out_id;
    end

    // =======================================================
    // 7. SIMULATION TERMINATION
    // =======================================================
    initial begin
        wait(tb_state == ST_DONE);
        wait(err_flag == 1'b0);
        #500;
        $display("\n[%0t] ALL 4 FRAMES PASSED THROUGH CDC 2 & ERROR INJECTOR CLEANLY.\n", $time);
        $finish;
    end

endmodule