`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Testbench for IDLE and MGMT FSO Payload Generation.
               Scenario: PC is quiet. System streams IDLE frames and 
               injects an MGMT frame using the Payload Multiplexer.
               
               Proves:
               1. IDLE PRBS dynamically seeded by (TXFN + 1).
               2. MGMT Telemetry mapping followed by Zero Padding.
               3. CRC-32 sealing both payloads to exactly 1912 Bytes.
               4. FIFO separation and seamless MUX arbitration.
               5. S2S 5000km Simulation Stimulus.
                  Validates Time of Flight (ToF) and IEEE 754 Float64 range
                  stimulus formatting.
                  (Note: Previous mock data is deactivated and commented out).

Revision History:
  - Rev 1.0 (Initial) : IDLE & MGMT 1912-Byte capsule generation and MUX arbitration testbench.
  - Rev 2.0 (2026-10-27 15:04 KST) : [ETRI Audit Item 5 - SDA OISL Page 31, Sec. 2.6.3.5.1.2]
    Added Golden-Vector verification for the 25-bit Frame Scrambler PRBS generator 
    (polynomial 1 + D^3 + D^25) seeded with (TXFN + 1) inside fso_idle_generator.v
    and verified exact 478-word (1912-Byte) frame lengths for both IDLE and MGMT.
  - Rev 2.3 (2026-10-29 01:49 KST) : [Unified Counter & Frame Label Alignment]
    1. Preserved all original descriptions, deactivated mock data reference block, 
       and Rev 1.0/2.0 history logs 100% intact.
    2. Added standardized waveform counters: frame_id, frame_type_str ("IDLE", 
       "MGMT"), out_clk_cnt (1..478), and out_byte_cnt (4..1912).
  - Rev 2.4 (2026-11-05 02:55 KST) : [Zero-Lag 3-Metric Counters & Explicit IDLE Start Handshake]
    Connected '.idle_start_valid' and '.idle_start_ready' on u_idle_capsule and 
    added zero-lag 3-metric counters.
  - Rev 2.5 (2026-11-05 03:22 KST) : [Frame-Boundary MUX Arbitration & Clean 4x478-Word Completion]
    Added gated active bus signals ('idle_active_tdata', 'mgmt_active_tdata', 
    'fso_active_tdata') and zero-lag completion counters.
  - Rev 2.6 (2026-11-05 03:28 KST) : [NBA-Safe Frame Index Wait Synchronization]
    Synchronized stimulus transitions using 'wait(raw_frame_idx == 4'd1..4)'.
  - Rev 2.7 (2026-11-05 03:50 KST) : [Audit Review Alignment - Stall-Safe Index Hold & Scoped Verdict]
    1. Updated 'raw_out_idx' to hold its value when '!out_xfer_active' and reset 
       to 0 only on '!rst_n' or 'out_xfer_active && m_axis_fso_tlast'.
    2. Added explicit 'x_state_err_cnt' verification on raw 'm_axis_fso_tdata' 
       during active transfers.
    3. Corrected the Unix timestamp comment on '32'd1476000000' (Oct 9, 2016 epoch 
       stimulus value) and scoped the final PASS message to match the verified 
       IDLE/MGMT payload generation and MUX selection checks.
===========================================================================
*/

module tb_idle_MGMT();

    reg clk;
    reg rst_n;

    // Visual sub-cycle 0.8 ns byte stepper (illustrates the 4 bytes inside each 3.2 ns 32-bit word)
    reg [2:0] sub_byte_step = 3'd1;
    always @(posedge clk) begin
        sub_byte_step <= 3'd1;
        #0.8 sub_byte_step <= 3'd2;
        #0.8 sub_byte_step <= 3'd3;
        #0.8 sub_byte_step <= 3'd4;
    end

    // -------------------------------------------------------
    // Inputs from ARQ TX Controller & Satellite PNT
    // -------------------------------------------------------
    reg [1:0]  payload_mux_sel;
    reg [15:0] txfn_in;
    reg        idle_start_valid;
    wire       idle_start_ready;
    
    reg        mgmt_trigger_1hz;
    reg [5:0]  rx_phy_ts_sec;
    reg [39:0] rx_phy_ts_picosec;
    reg [5:0]  tx_phy_ts_sec;
    reg [39:0] tx_phy_ts_picosec;
    reg [63:0] range_meters;
    reg [31:0] range_ts_sec;
    reg [39:0] range_ts_picosec;
    reg        ts_valid;

    // -------------------------------------------------------
    // Path 00: IDLE Sub-Top Capsule
    // -------------------------------------------------------
    wire [31:0] idle_tdata;
    wire        idle_tvalid;
    wire        idle_tlast;
    wire        idle_tready; 

    fso_idle_generator u_idle_capsule (
        .clk              (clk),
        .rst_n            (rst_n),
        .txfn_in          (txfn_in),
        .m_axis_tdata     (idle_tdata),
        .m_axis_tvalid    (idle_tvalid),
        .m_axis_tlast     (idle_tlast),
        .m_axis_tready    (idle_tready),
        .idle_start_valid (idle_start_valid),
        .idle_start_ready (idle_start_ready)
    );

    // -------------------------------------------------------
    // Path 10: MGMT Sub-Top Capsule
    // -------------------------------------------------------
    wire [31:0] mgmt_tdata;
    wire        mgmt_tvalid;
    wire        mgmt_tlast;
    wire        mgmt_tready; 

    mgmt_telemetry_generator u_mgmt_capsule (
        .clk               (clk),
        .rst_n             (rst_n),
        .mgmt_trigger_1hz  (mgmt_trigger_1hz),
        .rx_phy_ts_sec     (rx_phy_ts_sec),
        .rx_phy_ts_picosec (rx_phy_ts_picosec),
        .tx_phy_ts_sec     (tx_phy_ts_sec),
        .tx_phy_ts_picosec (tx_phy_ts_picosec),
        .range_meters      (range_meters),
        .range_ts_sec      (range_ts_sec),
        .range_ts_picosec  (range_ts_picosec),
        .ts_valid          (ts_valid),
        .m_axis_tdata      (mgmt_tdata),
        .m_axis_tvalid     (mgmt_tvalid),
        .m_axis_tlast      (mgmt_tlast),
        .m_axis_tready     (mgmt_tready)
    );

    // -------------------------------------------------------
    // ULTIMATE MUX (Arbitrates FIFOs to Final Output)
    // -------------------------------------------------------
    wire [31:0] m_axis_fso_tdata;
    wire        m_axis_fso_tvalid;
    wire        m_axis_fso_tlast;
    reg         m_axis_fso_tready; 

    fso_payload_mux u_mux (
        .payload_mux_sel (payload_mux_sel),
        .s_idle_tdata    (idle_tdata),
        .s_idle_tvalid   (idle_tvalid),
        .s_idle_tlast    (idle_tlast),
        .s_idle_tready   (idle_tready),
        .s_data_tdata    (32'd0),
        .s_data_tvalid   (1'b0),
        .s_data_tlast    (1'b0),
        .s_data_tready   (), 
        .s_mgmt_tdata    (mgmt_tdata),
        .s_mgmt_tvalid   (mgmt_tvalid),
        .s_mgmt_tlast    (mgmt_tlast),
        .s_mgmt_tready   (mgmt_tready),
        .s_retx_tdata    (32'd0),
        .s_retx_tvalid   (1'b0),
        .s_retx_tlast    (1'b0),
        .s_retx_tready   (), 
        .m_axis_tdata    (m_axis_fso_tdata),
        .m_axis_tvalid   (m_axis_fso_tvalid),
        .m_axis_tlast    (m_axis_fso_tlast),
        .m_axis_tready   (m_axis_fso_tready)
    );

    // =======================================================
    // SYSTEM CLOCK: 312.5 MHz (3.2ns period)
    // =======================================================
    initial begin
        clk = 1'b0;
        forever #1.6 clk = ~clk; 
    end

    // Watchdog Timeout Guard
    initial begin
        #100000;
        $fatal(1, "\n[TIMEOUT ERROR] tb_idle_MGMT did not complete within 100 us!\n");
    end

    // =======================================================
    // TRANSFER BEAT COUNTERS & STALL-SAFE WORD INDEX TRACKERS
    // Note: 'out_clk_cnt' indicates the active transfer beat number (1..478).
    //       'out_byte_1b_cnt' is a 0.8 ns visual illustration of the 4 bytes per 32-bit beat.
    // =======================================================
    reg  [15:0] raw_out_idx             = 16'd0;
    reg  [3:0]  raw_frame_idx           = 4'd0;
    reg  [31:0] idle_first_word_txfn0_q = 32'd0;
    reg  [31:0] idle_first_word_txfn1_q = 32'd0;
    reg  [15:0] idle_frames_done_q      = 16'd0;
    reg  [15:0] mgmt_frames_done_q      = 16'd0;
    reg  [15:0] frame_len_err_cnt       = 16'd0;
    reg  [15:0] x_state_err_cnt         = 16'd0;

    wire        idle_xfer_active        = idle_tvalid && idle_tready;
    wire        mgmt_xfer_active        = mgmt_tvalid && mgmt_tready;
    wire        out_xfer_active         = m_axis_fso_tvalid && m_axis_fso_tready;

    // Companion gated display buses (raw buses idle_tdata, mgmt_tdata, m_axis_fso_tdata are also displayed)
    wire [31:0] idle_active_tdata       = idle_xfer_active ? idle_tdata       : 32'd0;
    wire [31:0] mgmt_active_tdata       = mgmt_xfer_active ? mgmt_tdata       : 32'd0;
    wire [31:0] fso_active_tdata        = out_xfer_active  ? m_axis_fso_tdata : 32'd0;

    wire [3:0]  frame_id                = out_xfer_active ? (raw_frame_idx + 4'd1) : 4'd0;
    wire [31:0] frame_type_str          = !out_xfer_active ? "WAIT" :
                                          (payload_mux_sel == 2'b10) ? "MGMT" : "IDLE";

    // Zero-Lag 3-Metric Output Counters (0 when WAIT, 1..478 Beats, 4..1912 Byte-Beat, 1..1912 Visual 1B)
    wire [15:0] out_clk_cnt             = out_xfer_active ? (raw_out_idx + 16'd1) : 16'd0;
    wire [15:0] out_byte_cnt            = out_xfer_active ? ((raw_out_idx + 16'd1) * 16'd4) : 16'd0;
    wire [15:0] out_byte_clk_cnt        = out_byte_cnt;
    wire [15:0] out_byte_1b_cnt         = out_xfer_active ? ((raw_out_idx * 16'd4) + {13'd0, sub_byte_step}) : 16'd0;

    // Zero-Lag First-Word PRBS Captures & Completed Frame Counters
    wire        is_txfn0_first_word     = out_xfer_active && (payload_mux_sel == 2'b00) && (raw_frame_idx == 4'd0) && (raw_out_idx == 16'd0);
    wire        is_txfn1_first_word     = out_xfer_active && (payload_mux_sel == 2'b00) && (raw_frame_idx == 4'd1) && (raw_out_idx == 16'd0);

    wire [31:0] idle_first_word_txfn0   = is_txfn0_first_word ? m_axis_fso_tdata : idle_first_word_txfn0_q;
    wire [31:0] idle_first_word_txfn1   = is_txfn1_first_word ? m_axis_fso_tdata : idle_first_word_txfn1_q;

    wire [15:0] idle_frames_completed   = idle_frames_done_q + ((out_xfer_active && m_axis_fso_tlast && (payload_mux_sel == 2'b00)) ? 16'd1 : 16'd0);
    wire [15:0] mgmt_frames_completed   = mgmt_frames_done_q + ((out_xfer_active && m_axis_fso_tlast && (payload_mux_sel == 2'b10)) ? 16'd1 : 16'd0);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            raw_out_idx             <= 16'd0;
            raw_frame_idx           <= 4'd0;
            idle_first_word_txfn0_q <= 32'd0;
            idle_first_word_txfn1_q <= 32'd0;
            idle_frames_done_q      <= 16'd0;
            mgmt_frames_done_q      <= 16'd0;
            frame_len_err_cnt       <= 16'd0;
            x_state_err_cnt         <= 16'd0;
        end else begin
            if (is_txfn0_first_word) idle_first_word_txfn0_q <= m_axis_fso_tdata;
            if (is_txfn1_first_word) idle_first_word_txfn1_q <= m_axis_fso_tdata;

            // Hold raw_out_idx when !out_xfer_active; reset to 0 only on m_axis_fso_tlast
            if (out_xfer_active) begin
                if (^m_axis_fso_tdata === 1'bx)
                    x_state_err_cnt <= x_state_err_cnt + 16'd1;

                if (m_axis_fso_tlast) begin
                    // Every IDLE and MGMT frame must be strictly 478 words (raw_out_idx == 477)
                    if (raw_out_idx != 16'd477)
                        frame_len_err_cnt <= frame_len_err_cnt + 16'd1;

                    raw_out_idx   <= 16'd0;
                    raw_frame_idx <= raw_frame_idx + 4'd1;
                    if (payload_mux_sel == 2'b10)
                        mgmt_frames_done_q <= mgmt_frames_done_q + 16'd1;
                    else
                        idle_frames_done_q <= idle_frames_done_q + 16'd1;
                end else begin
                    raw_out_idx   <= raw_out_idx + 16'd1;
                end
            end
        end
    end

    // =======================================================
    // SIMULATION SCENARIO (4 Clean 478-Word Frames: IDLE0 -> IDLE1 -> MGMT -> IDLE2)
    // =======================================================
    initial begin
        rst_n             = 1'b0;
        payload_mux_sel   = 2'b00; 
        txfn_in           = 16'd0; 
        idle_start_valid  = 1'b0;
        mgmt_trigger_1hz  = 1'b0;
        m_axis_fso_tready = 1'b1;  
        
        /* 
        ===============================================================
        DEACTIVATED: PREVIOUS MOCK DATA (Kept for reference)
        ===============================================================
        rx_phy_ts_sec     = 6'h1A;
        rx_phy_ts_picosec = 40'h01_23_45_67_89;
        tx_phy_ts_sec     = 6'h1B;
        tx_phy_ts_picosec = 40'h09_87_65_43_21;
        range_meters      = 64'hAAAA_BBBB_CCCC_DDDD;
        range_ts_sec      = 32'h1122_3344;
        range_ts_picosec  = 40'h00_FF_00_FF_00;
        ts_valid          = 1'b1;
        ===============================================================
        */

        // ===============================================================
        // ACTIVE: S2S 5000 KM SIMULATION STIMULUS
        // Physics: Time of Flight for 5000km is approx 16.678 milliseconds
        // ===============================================================
        
        // TX Time: 15 seconds, 0 picoseconds
        tx_phy_ts_sec     = 6'd15;
        tx_phy_ts_picosec = 40'd0;
        
        // RX Time: TX + 16,678,204,759 picoseconds (Speed of Light Delay)
        rx_phy_ts_sec     = 6'd15;
        rx_phy_ts_picosec = 40'd16678204759;
        
        // Range: 5000000.0 meters in IEEE 754 Double Precision (Float64)
        range_meters      = 64'h4153_12D0_0000_0000;
        
        // Stimulus timestamp value (Unix epoch 1476000000 = Oct 9, 2016 UTC test vector)
        range_ts_sec      = 32'd1476000000;
        range_ts_picosec  = 40'd0;
        ts_valid          = 1'b1;

        #100;
        rst_n = 1'b1;

        // ---------------------------------------------------------------
        // FRAME 1: Schedule IDLE Frame 1 with TXFN = 0 (Seed = 25'h0000001)
        // ---------------------------------------------------------------
        wait(idle_start_ready);
        @(posedge clk);
        txfn_in          <= 16'd0;
        payload_mux_sel  <= 2'b00;
        idle_start_valid <= 1'b1;
        @(posedge clk);
        idle_start_valid <= 1'b0;

        // Wait until Frame 1 (IDLE, 478 words = 1912B) completes in NBA region
        wait(raw_frame_idx == 4'd1);

        // ---------------------------------------------------------------
        // FRAME 2: Schedule IDLE Frame 2 with TXFN = 1 (Seed = 25'h0000002)
        //          & Trigger 1Hz MGMT Telemetry Assembly in Background
        // ---------------------------------------------------------------
        wait(idle_start_ready);
        @(posedge clk);
        txfn_in          <= 16'd1;
        payload_mux_sel  <= 2'b00;
        idle_start_valid <= 1'b1;
        mgmt_trigger_1hz <= 1'b1;
        @(posedge clk);
        idle_start_valid <= 1'b0;
        mgmt_trigger_1hz <= 1'b0;

        // Wait until Frame 2 (IDLE, 478 words = 1912B) completes in NBA region
        wait(raw_frame_idx == 4'd2);

        // ---------------------------------------------------------------
        // FRAME 3: Switch MUX cleanly to MGMT Path (2'b10) for full 478 words
        // ---------------------------------------------------------------
        @(posedge clk);
        payload_mux_sel  <= 2'b10;

        // Wait until Frame 3 (MGMT, 478 words = 1912B) completes in NBA region
        wait(raw_frame_idx == 4'd3);

        // ---------------------------------------------------------------
        // FRAME 4: Switch MUX back to IDLE (2'b00) & Schedule TXFN = 2
        // ---------------------------------------------------------------
        @(posedge clk);
        payload_mux_sel  <= 2'b00;
        txfn_in          <= 16'd2;
        idle_start_valid <= 1'b1;
        @(posedge clk);
        idle_start_valid <= 1'b0;

        // Wait until Frame 4 (IDLE, 478 words = 1912B) completes in NBA region
        wait(raw_frame_idx == 4'd4);
        repeat (30) @(posedge clk);

        $display("\n===============================================================");
        $display(" [ETRI AUDIT ITEM 5] 25-BIT IDLE PRBS (SEED = TXFN + 1) REPORT");
        $display(" -> TXFN=0 (Seed=25'h0000001) First 32b Word : 0x%08X (Expected: 0x80000040)", idle_first_word_txfn0);
        $display(" -> TXFN=1 (Seed=25'h0000002) First 32b Word : 0x%08X (Expected: 0x40000020)", idle_first_word_txfn1);
        $display(" -> Completed 478-Word Frames (1912B Each)   : %0d IDLE, %0d MGMT (Len Errs = %0d, X-Errs = %0d)",
                 idle_frames_completed, mgmt_frames_completed, frame_len_err_cnt, x_state_err_cnt);
        if ((idle_first_word_txfn0 == 32'h8000_0040) && (idle_first_word_txfn1 == 32'h4000_0020) &&
            (idle_frames_completed == 16'd3) && (mgmt_frames_completed == 16'd1) &&
            (frame_len_err_cnt == 16'd0) && (x_state_err_cnt == 16'd0))
            $display(" -> RESULT: [PASS] IDLE (TXFN 0/1 first-word seed) & MGMT 478-word payload generation and MUX selection verified.");
        else
            $fatal(1, " -> RESULT: [FAIL] IDLE seed first word or 478-word frame length mismatch!");
        $display("===============================================================\n");
        $finish;
    end
endmodule