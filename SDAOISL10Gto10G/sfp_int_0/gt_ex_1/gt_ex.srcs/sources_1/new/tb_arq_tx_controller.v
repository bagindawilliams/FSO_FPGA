`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Flowchart-Driven Verification Testbench for ARQ TX Controller.
               Directly maps to the "SDA OCT ARQ System Architecture".
               - SCENARIO 1: Transmit -> Received ACK -> Delete RAM.
               - SCENARIO 2: Transmit -> Received NAK -> Retransmit.
               - SCENARIO 3: Transmit -> Timer Expired -> Max Retries -> Drop.
               Configured with ARQ_MAX_RETX = 5 as per SDA OCT Standard 4.0.0.

Revision History:
  - Rev 1.0 (Initial) : 3-Scenario ARQ TX Controller verification testbench.
  - Rev 2.0 (2026-10-27 15:20 KST) : [Target B5.4 & SDA OISL Page 25-26 Table 2-11 Verification]
    1. Configured ARQ_HOLDOFF_CFG = 8'd255 and ARQ_HOLDOFF_MULT = 64 to verify 
       the 16,320-frame (40.696 ms > 35 ms RTT at 5,000 km) project-specific 
       extension alongside SIM_SCALE_ENABLE = 1 (HOLDOFF_TICKS = 16'd50) for 
       fast simulation turnaround.
    2. Added Scenario 4 to verify Priority 2 (1Hz MGMT frame preemption via 
       mgmt_tick_1hz) and automatic pass/fail self-checking counters across all 
       4 scenarios.
===========================================================================
*/

module tb_arq_tx_controller();

    // System Signals
    reg clk;
    reg rst_n;

    // Traffic Monitors (Inputs)
    reg fso_data_valid;
    reg mgmt_tick_1hz;
    reg header_gen_busy;

    // ARQ RX Feedback (Inputs)
    reg [15:0] rx_rxfn_in;
    reg        rx_ack_in;
    reg        rx_ack_valid_in;

    // Outputs
    wire [15:0] tx_txfn_out;
    wire [1:0]  tx_frame_type;
    wire        tx_trigger_gen;
    wire [1:0]  payload_mux_sel;
    wire        tx_stall_mac;

    wire        ddr4_write_req;
    wire        ddr4_read_req;
    wire        ddr4_delete_req;
    wire [15:0] ddr4_addr;

    // =======================================================
    // Instantiate DUT (SDA OISL Table 2-11 + 5000 km x64 Extension)
    // =======================================================
    arq_tx_controller #(
        .ARQ_MAX_RETX     (3'd5),    // Table 2-11: Max Retries is strictly 5
        .ARQ_HOLDOFF_CFG  (8'd255),  // Table 2-11: 8-bit config (1..255)
        .ARQ_HOLDOFF_MULT (64),      // Project-specific x64 extension -> 16,320 frames (40.696 ms)
        .SIM_SCALE_ENABLE (1),       // 1 = Fast simulation timer using HOLDOFF_TICKS
        .HOLDOFF_TICKS    (16'd50),  // Flowchart: ARQ_HOLDOFF Timer duration in sim
        .TRACKER_DEPTH    (4)        // Table capacity
    ) u_dut (
        .clk             (clk),
        .rst_n           (rst_n),
        .fso_data_valid  (fso_data_valid),
        .mgmt_tick_1hz   (mgmt_tick_1hz),
        .header_gen_busy (header_gen_busy),
        .rx_rxfn_in      (rx_rxfn_in),
        .rx_ack_in       (rx_ack_in),
        .rx_ack_valid_in (rx_ack_valid_in),
        .tx_txfn_out     (tx_txfn_out),
        .tx_frame_type   (tx_frame_type),
        .tx_trigger_gen  (tx_trigger_gen),
        .payload_mux_sel (payload_mux_sel),
        .tx_stall_mac    (tx_stall_mac),
        .ddr4_write_req  (ddr4_write_req),
        .ddr4_read_req   (ddr4_read_req),
        .ddr4_delete_req (ddr4_delete_req),
        .ddr4_addr       (ddr4_addr)
    );

    // Clock Generation (312.5 MHz)
    initial begin
        clk = 1'b0;
        forever #1.6 clk = ~clk; 
    end

    // =======================================================
    // Mock Header Generator (Simulates transmission delay)
    // =======================================================
    reg [4:0] busy_counter;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            header_gen_busy <= 1'b0;
            busy_counter    <= 5'd0;
        end else begin
            if (tx_trigger_gen) begin
                header_gen_busy <= 1'b1;
                busy_counter    <= 5'd16; // 16 clock cycles processing
            end else if (busy_counter > 0) begin
                busy_counter <= busy_counter - 1'b1;
                if (busy_counter == 5'd1) header_gen_busy <= 1'b0;
            end
        end
    end

    // =======================================================
    // Tcl Logger (Flowchart Mapping) & Verification Counters
    // =======================================================
    integer write_req_cnt  = 0;
    integer retx_req_cnt   = 0;
    integer delete_req_cnt = 0;
    integer mgmt_tx_cnt    = 0;

    always @(posedge clk) begin
        if (tx_trigger_gen) begin
            if (ddr4_write_req) begin
                write_req_cnt <= write_req_cnt + 1;
                $display("[%0t ns] [FLOWCHART: Store frame copy in RAM] -> TXFN %0d Transmitted & Saved.", $time, tx_txfn_out);
            end else if (ddr4_read_req) begin
                retx_req_cnt <= retx_req_cnt + 1;
                $display("[%0t ns] [FLOWCHART: Retrieve frame from RAM] -> TXFN %0d Retransmitting (Priority 1, Retry #%0d).",
                         $time, tx_txfn_out, u_dut.track_retx[0] + 1);
            end else if (tx_frame_type == 2'b10) begin
                mgmt_tx_cnt <= mgmt_tx_cnt + 1;
                $display("[%0t ns] [FLOWCHART: Priority 2 MGMT 1Hz]     -> TXFN %0d MGMT Frame Transmitted.", $time, tx_txfn_out);
            end
        end
        if (ddr4_delete_req) begin
            delete_req_cnt <= delete_req_cnt + 1;
            $display("[%0t ns] [FLOWCHART: Delete frame / Drop Frame] -> RAM Address %0d Freed.", $time, ddr4_addr);
        end
    end

    // =======================================================
    // Scenario Execution (Following the Flowchart Paths)
    // =======================================================
    initial begin
        rst_n           = 0;
        fso_data_valid  = 0;
        mgmt_tick_1hz   = 0;
        rx_rxfn_in      = 0;
        rx_ack_in       = 0;
        rx_ack_valid_in = 0;

        #30 rst_n = 1;
        $display("\n[CONFIG] Table 2-11 Extended Holdoff Window = %0d Frames (ARQ_MAX_RETX = %0d)",
                 u_dut.TABLE_2_11_HOLDOFF_FRAMES, u_dut.ARQ_MAX_RETX);

        $display("\n=======================================================");
        $display("SCENARIO 1: The 'Happy Path' (Transmit -> ACK -> Delete)");
        $display("=======================================================");
        // Transmit Frame 0
        @(posedge clk); fso_data_valid = 1;
        #20; 
        @(posedge clk); fso_data_valid = 0;
        
        // Wait for transmission to finish, then send ACK
        wait(header_gen_busy == 0);
        #10;
        @(posedge clk); rx_rxfn_in = 16'd0; rx_ack_in = 1'b1; rx_ack_valid_in = 1'b1;
        @(posedge clk); rx_ack_valid_in = 1'b0;
        #100;

        $display("\n=======================================================");
        $display("SCENARIO 2: The 'Fast Error Path' (Transmit -> NAK -> Retx -> ACK)");
        $display("=======================================================");
        // Transmit Frame 1
        @(posedge clk); fso_data_valid = 1;
        #20;
        @(posedge clk); fso_data_valid = 0;
        
        // Receive NAK before timer expires
        wait(header_gen_busy == 0);
        #10;
        @(posedge clk); rx_rxfn_in = 16'd1; rx_ack_in = 1'b0; rx_ack_valid_in = 1'b1; // NAK
        @(posedge clk); rx_ack_valid_in = 1'b0;
        
        // Wait for Retransmission to complete, then send ACK to clear it
        wait(header_gen_busy == 1);
        wait(header_gen_busy == 0);
        #10;
        @(posedge clk); rx_rxfn_in = 16'd1; rx_ack_in = 1'b1; rx_ack_valid_in = 1'b1; // ACK
        @(posedge clk); rx_ack_valid_in = 1'b0;
        #100;

        $display("\n=======================================================");
        $display("SCENARIO 3: The 'Silent Path' (Timer Expired -> Max Retries -> Drop)");
        $display("=======================================================");
        // Transmit Frame 2
        @(posedge clk); fso_data_valid = 1;
        #20;
        @(posedge clk); fso_data_valid = 0;
        
        // Do NOTHING. Let the holdoff timer expire (50 ticks = ~160ns).
        // System will autonomously retry exactly 5 times (ARQ_MAX_RETX = 5).
        // After the 5th retry fails (6th timeout), it will drop the frame and free DDR4.
        #2000; 

        $display("\n=======================================================");
        $display("SCENARIO 4: Priority 2 MGMT 1Hz Frame Schedule Check");
        $display("=======================================================");
        @(posedge clk); mgmt_tick_1hz = 1'b1;
        @(posedge clk); mgmt_tick_1hz = 1'b0;
        #150;

        $display("\n=======================================================");
        $display(" ARQ TX CONTROLLER VERIFICATION SUMMARY");
        $display(" -> Total New DATA Writes  : %0d (Expected: >= 3)", write_req_cnt);
        $display(" -> Total Retransmissions  : %0d (Expected: 6 [1 NAK + 5 Timeout Retries])", retx_req_cnt);
        $display(" -> Total RAM Frees/Drops  : %0d (Expected: 3 [2 ACKed + 1 Max-Retry Drop])", delete_req_cnt);
        $display(" -> Total 1Hz MGMT Frames  : %0d (Expected: 1)", mgmt_tx_cnt);
        if (retx_req_cnt == 6 && delete_req_cnt == 3 && mgmt_tx_cnt == 1)
            $display(" -> RESULT: [PASS] ALL ARQ FLOWCHART PATHS VERIFIED 100%%!");
        $display("=======================================================\n");
        $finish;
    end
endmodule