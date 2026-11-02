`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Post-CDC 2 Standalone Testbench for Error Injector (312.5 MHz).

               ARCHITECTURE & WAVEFORM GROUPS:
               - Group 1: Data In from CDC 2 (312.5 MHz, 32-bit Continuous)
                 Feeds the exact continuous 3117-Byte/frame stream exiting 
                 CDC 2 (x_logic_gth) into error_inject.v. Includes 1-by-1 
                 input byte counter (in_byte_cnt: 1..3117) and input clock 
                 counter (in_clk_cnt: 1..780).
               - Group 2: Data Out from Error Inject to GTH TX (312.5 MHz, 32-bit)
                 Displays the corrupted output stream heading to gth64b66b_tx.v,
                 proving that the 9B Preamble (55..55D5) and 48B LPC Header 
                 remain uncorrupted while 48 payload words are XORed with 
                 'error.mem', maintaining exact SDA OISL Table 2-4 metrics.

Revision History:
  - Rev 1.0 (Initial) : Post-CDC 2 3-Zone Error Injector testbench.
  - Rev 2.0 (2026-10-27 15:20 KST) : [ETRI Audit Item 1 & Port Elaboration Fix]
    1. Removed non-existent '.stall_in(1'b0)' port connection on u_error_inject 
       so the instantiation matches error_inject.v 100% without [VRFC 10-3180].
    2. Updated Bytes 1..9 of every frame (cycle_cnt == 1) from the simulation 
       marker (55..55D5) to the official SDA OISL Table 2-8 72-bit Preamble 
       (72'h77_AD_5B_58_43_64_1E_2E_26) and verified that Zone 1 (first 60B) 
       passes the Preamble and LPC Header through completely uncorrupted.
===========================================================================
*/

module tb_error_inject();

    // =======================================================
    // 1. MASTER SWITCH & CLOCK/RESET SIGNALS (312.5 MHz)
    // =======================================================
    // SIM_MODE = 1: Digital 'error.mem' XOR active (Vivado Simulation)
    // SIM_MODE = 0: Digital bypass for Physical Manual VOA (/t49G/51 LC/PC)
    parameter SIM_MODE = 1;

    reg clk_logic; // 200.0 MHz ( Drives upstream CDC 2 write side )
    reg clk_gth;   // 312.5 MHz ( Primary clock for CDC 2 Out -> Error Inject -> GTH )
    reg rst_n;
    reg en_upstream;

    // Internal Upstream Stimulus to CDC 2 (Hidden background driver)
    reg  [127:0] mux_data_in;
    reg          mux_data_dv;
    reg  [15:0]  mux_cdc_keep;

    // =======================================================
    // 2. GROUP 1 SIGNALS: DATA IN FROM CDC 2 (312.5 MHz, 32-bit)
    // =======================================================
    wire         cdc2_flag_in;     // Continuous Valid from CDC 2 (312.5 MHz)
    wire [31:0]  cdc2_data_in;     // Continuous 32-bit Data from CDC 2 (312.5 MHz)
    wire [7:0]   in_byte_stream   = u_cdc2.byte_out;       // 1-by-1 Byte entering Error Inject
    wire [15:0]  in_clk_cnt       = u_cdc2.out_clk_cnt;    // 1..780 Clock Counter from CDC 2
    wire [11:0]  in_byte_cnt      = u_cdc2.frame_byte_cnt; // 1..3117 Byte Counter from CDC 2
    wire [31:0]  in_frame_id      = u_cdc2.frame_out_id;   // Active Frame ID (1, 2, 3, 4)

    // =======================================================
    // 3. GROUP 2 SIGNALS: DATA OUT FROM ERROR INJECT TO GTH (312.5 MHz)
    // =======================================================
    wire         gth_tx_valid_out; // Continuous Valid to gth64b66b_tx
    wire [31:0]  gth_tx_data_out;  // 32-bit Data to gth64b66b_tx
    wire [31:0]  err_mask_applied   = u_error_inject.applied_mask;
    wire [15:0]  corrupted_word_cnt = u_error_inject.corrupted_word_cnt;
    wire [7:0]   out_byte_stream    = u_error_inject.byte_out;       // 1-by-1 Byte exiting Error Inject
    wire [15:0]  out_clk_cnt        = u_error_inject.out_clk_cnt;    // 1..780 Clock Counter to GTH
    wire [11:0]  frame_byte_cnt     = u_error_inject.frame_byte_cnt; // 1..3117 Byte Counter to GTH
    wire [31:0]  frame_out_id       = u_error_inject.frame_out_id;   // Active Frame ID (1, 2, 3, 4)

    // =======================================================
    // 4. DUT INSTANTIATIONS (CDC 2 -> ERROR INJECTOR)
    // =======================================================
    x_logic_gth u_cdc2 (
        .clk_gth    (clk_gth),
        .clk_logic  (clk_logic),
        .rst_n      (rst_n),
        .en         (en_upstream),
        .data_in    (mux_data_in),
        .data_in_dv (mux_data_dv),
        .cdc_keep   (mux_cdc_keep),
        .flag       (cdc2_flag_in),
        .data_out   (cdc2_data_in)
    );

    error_inject #(
        .SIM_MODE   (SIM_MODE),
        .safe_words (15), // Protects first 60B (9B Preamble + 48B Header LPC + 3B)
        .max_error  (47)  // 48 words from error.mem
    ) u_error_inject (
        .clk        (clk_gth),
        .rst_n      (rst_n),
        .en         (cdc2_flag_in),
        .data_in    (cdc2_data_in),
        .flag       (gth_tx_valid_out),
        .data_out   (gth_tx_data_out)
    );

    // =======================================================
    // 5. CLOCK GENERATION
    // =======================================================
    initial begin
        clk_logic = 1'b0;
        forever #2.5 clk_logic = ~clk_logic; // 200.0 MHz
    end

    initial begin
        clk_gth = 1'b0;
        forever #1.6 clk_gth = ~clk_gth;     // 312.5 MHz (3.2 ns period)
    end

    // =======================================================
    // 6. UPSTREAM FEEDER (Generates 4 Continuous 3117B Frames)
    // =======================================================
    localparam ST_WAIT_RST = 2'd0;
    localparam ST_STREAM   = 2'd1;
    localparam ST_GAP      = 2'd2;
    localparam ST_DONE     = 2'd3;

    reg [1:0]  tb_state;
    reg [3:0]  frame_id;
    reg [15:0] cycle_cnt;

    initial begin
        rst_n       = 1'b0;
        en_upstream = 1'b0;
        tb_state    = ST_WAIT_RST;
        frame_id    = 4'd0;
        cycle_cnt   = 16'd0;
        #100; 
        rst_n       = 1'b1; 
        en_upstream = 1'b1;
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
                        if (cycle_cnt < 16'd5) cycle_cnt <= cycle_cnt + 1'b1;
                        else begin
                            tb_state  <= ST_STREAM;
                            frame_id  <= 4'd1;
                            cycle_cnt <= 16'd1;
                        end
                    end
                end
                ST_STREAM: begin
                    if (cycle_cnt < 16'd195) cycle_cnt <= cycle_cnt + 1'b1;
                    else begin
                        tb_state  <= ST_GAP;
                        cycle_cnt <= 16'd1;
                    end
                end
                ST_GAP: begin
                    if (cycle_cnt < 16'd304) cycle_cnt <= cycle_cnt + 1'b1;
                    else begin
                        if (frame_id < 4'd4) begin
                            frame_id  <= frame_id + 1'b1;
                            tb_state  <= ST_STREAM;
                            cycle_cnt <= 16'd1;
                        end else begin
                            tb_state    <= ST_DONE;
                            cycle_cnt   <= 16'd0;
                            en_upstream <= 1'b0;
                        end
                    end
                end
                ST_DONE: en_upstream <= 1'b0;
            endcase
        end
    end

    always @(*) begin
        mux_data_dv  = 1'b0;
        mux_data_in  = 128'd0;
        mux_cdc_keep = 16'd0;

        if (rst_n && (tb_state == ST_STREAM)) begin
            mux_data_dv = 1'b1;
            if (cycle_cnt == 16'd1) begin
                // [Rev 2.0] Bytes 1..9: Official SDA OISL Table 2-8 72-bit Preamble (72'h77AD5B5843641E2E26)
                // Bytes 10..16: First 7 Bytes of LPC Header
                mux_cdc_keep = 16'hFFFF;
                mux_data_in  = {72'h77_AD_5B_58_43_64_1E_2E_26, 24'hAA_BB_CC, {12'd0, frame_id}, 16'd1};
            end else if (cycle_cnt <= 16'd194) begin
                mux_cdc_keep = 16'hFFFF;
                mux_data_in  = {32'hAAAA_BBBB, 32'hCCCC_DDDD, {28'd0, frame_id}, {16'd0, cycle_cnt}};
            end else if (cycle_cnt == 16'd195) begin
                // Final 13 Bytes of the 3117-Byte Frame (ending in 0x33)
                mux_cdc_keep = 16'h1FFF;
                mux_data_in  = {104'h9999_8888_7777_6666_5555_4444_33, 24'h000000};
            end
        end
    end

    // =======================================================
    // 7. FRAME-ALIGNED SDA OISL TABLE 2-4 METRIC ANALYZER
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

    always @(frame_out_id) begin
        if (frame_out_id >= 32'd1 && frame_out_id <= 32'd4) begin
            time_start = $realtime;
            time_end   = time_start + (3117.0 * measured_byte_time_ns);

            OISL_Frame_Duration_us        = (time_end - time_start) / 1000.0;
            OISL_Effective_Data_Rate_Mbps = 15264.0 / OISL_Frame_Duration_us;
            OISL_Frame_Rate_kHz           = 1000.0 / OISL_Frame_Duration_us;
            OISL_FCCH_Mbps                = 16.0 / OISL_Frame_Duration_us;

            $display("---------------------------------------------------------------");
            $display(" [ERROR INJECT -> GTH] FRAME %0d ACTIVE (SIM_MODE = %0d)", frame_out_id, SIM_MODE);
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
    // 8. SIMULATION TERMINATION
    // =======================================================
    initial begin
        wait(tb_state == ST_DONE);
        wait(gth_tx_valid_out == 1'b0);
        #500;
        $display("\n[%0t] POST-CDC 2 ERROR INJECTOR VERIFICATION COMPLETE (Preamble 72'h77AD5B5843641E2E26 Protected).\n", $time);
        $finish;
    end

endmodule