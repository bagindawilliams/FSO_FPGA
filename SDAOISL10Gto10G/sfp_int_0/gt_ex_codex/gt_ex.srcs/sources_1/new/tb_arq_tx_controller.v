// REPORT25-TIME01: 2026-11-02 KST. Label only: default %t is in ps; stimulus and checking are unchanged.
`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Verification Testbench for Selective Repeat ARQ TX Controller
               (arq_tx_controller.v) with SDA OISL Table 2-11 Parameters.
               Tests all 4 scenarios of the ARQ State Machine:
               - Scenario 1: The 'Happy Path' (Transmit -> ACK -> Delete from RAM)
               - Scenario 2: The 'Fast Error Path' (Transmit -> NAK -> Immediate Retx -> ACK)
               - Scenario 3: The 'Silent Path' (Holdoff Timer Expired -> 5x Max Retries -> Drop)
               - Scenario 4: Priority 2 1Hz MGMT Frame Scheduling

Revision History:
  - Rev 1.0 (Initial) : 4-scenario ARQ TX Controller flowchart verification testbench.
  - Rev 2.0 (2026-10-27 15:11 KST) : Added Table 2-11 parameter verification and counters.
  - Rev 2.5 (2026-10-29 16:42 KST) : [Audit Fix - Dynamic TXFN Capture & Handshake Sync]
    Captured the dynamically assigned 'last_data_txfn' upon 'ddr4_write_req' assertion
    so Scenario 1 (ACK) and Scenario 2 (NAK -> Retx -> ACK) target the exact active
    DATA frame sequence number even when intervening IDLE frames advance global_txfn.
===========================================================================
*/

module tb_arq_tx_controller();

    reg clk;
    reg rst_n;

    reg        fso_data_valid;
    reg        mgmt_tick_1hz;
    reg        header_gen_busy;

    reg [15:0] rx_rxfn_in;
    reg        rx_ack_in;
    reg        rx_ack_valid_in;

    wire [15:0] tx_txfn_out;
    wire [1:0]  tx_frame_type;
    wire        tx_trigger_gen;
    wire [1:0]  payload_mux_sel;
    wire        tx_stall_mac;

    wire        ddr4_write_req;
    wire        ddr4_read_req;
    wire        ddr4_delete_req;
    wire [15:0] ddr4_addr;

    // Instantiate DUT with fast simulation holdoff timer (50 ticks) and Table 2-11 x64 extension
    arq_tx_controller #(
        .ARQ_MAX_RETX      (3'd5),
        .ARQ_HOLDOFF_CFG   (8'd255),
        .ARQ_HOLDOFF_MULT  (64),
        .SIM_SCALE_ENABLE  (1),
        .HOLDOFF_TICKS     (16'd50),
        .TRACKER_DEPTH     (4)
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

    initial begin
        clk = 1'b0;
        forever #2.5 clk = ~clk; // 200 MHz
    end

    // Simulate realistic downstream Frame Transmission Busy duration (10 clocks per trigger)
    always @(posedge clk) begin
        if (!rst_n) begin
            header_gen_busy <= 1'b0;
        end else if (tx_trigger_gen) begin
            header_gen_busy <= 1'b1;
            repeat (10) @(posedge clk);
            header_gen_busy <= 1'b0;
        end
    end

    // Verification Counters & Dynamic TXFN Tracker
    integer    write_req_cnt  = 0;
    integer    retx_req_cnt   = 0;
    integer    delete_req_cnt = 0;
    integer    mgmt_tx_cnt    = 0;
    reg [15:0] last_data_txfn = 16'd0;

    always @(posedge clk) begin
        if (rst_n) begin
            if (ddr4_write_req) begin
                write_req_cnt  <= write_req_cnt + 1;
                last_data_txfn <= ddr4_addr;
                $display("[%0t ps] [FLOWCHART: Store frame copy in RAM] -> TXFN %0d Transmitted & Saved.", $time, tx_txfn_out);
            end
            if (ddr4_read_req) begin
                retx_req_cnt <= retx_req_cnt + 1;
                $display("[%0t ps] [FLOWCHART: Retrieve frame from RAM] -> TXFN %0d Retransmitted (Attempt #%0d).", $time, tx_txfn_out, retx_req_cnt + 1);
            end
            if (ddr4_delete_req) begin
                delete_req_cnt <= delete_req_cnt + 1;
                $display("[%0t ps] [FLOWCHART: Delete frame / Drop Frame] -> RAM Address %0d Freed.", $time, ddr4_addr);
            end
            if (tx_trigger_gen && (tx_frame_type == 2'b10)) begin
                mgmt_tx_cnt <= mgmt_tx_cnt + 1;
                $display("[%0t ps] [FLOWCHART: Priority 2 MGMT 1Hz]     -> TXFN %0d MGMT Frame Transmitted.", $time, tx_txfn_out);
            end
        end
    end

    initial begin
        rst_n           = 1'b0;
        fso_data_valid  = 1'b0;
        mgmt_tick_1hz   = 1'b0;
        header_gen_busy = 1'b0;
        rx_rxfn_in      = 16'd0;
        rx_ack_in       = 1'b0;
        rx_ack_valid_in = 1'b0;

        #20;
        rst_n = 1'b1;
        #15;

        $display("\n[CONFIG] Table 2-11 Extended Holdoff Window = %0d Frames (ARQ_MAX_RETX = %0d)",
                 u_dut.TABLE_2_11_HOLDOFF_FRAMES, u_dut.ARQ_MAX_RETX);

        // =======================================================
        // SCENARIO 1: The 'Happy Path' (Transmit -> ACK -> Delete)
        // =======================================================
        $display("\n=======================================================");
        $display("SCENARIO 1: The 'Happy Path' (Transmit -> ACK -> Delete)");
        $display("=======================================================");
        @(posedge clk); fso_data_valid = 1'b1;
        wait(ddr4_write_req == 1'b1);
        @(posedge clk); fso_data_valid = 1'b0;

        repeat (12) @(posedge clk);
        @(posedge clk);
        rx_rxfn_in      = last_data_txfn;
        rx_ack_in       = 1'b1; // Positive ACK
        rx_ack_valid_in = 1'b1;
        @(posedge clk);
        rx_ack_valid_in = 1'b0;
        repeat (5) @(posedge clk);

        // =======================================================
        // SCENARIO 2: The 'Fast Error Path' (Transmit -> NAK -> Retx -> ACK)
        // =======================================================
        $display("\n=======================================================");
        $display("SCENARIO 2: The 'Fast Error Path' (Transmit -> NAK -> Retx -> ACK)");
        $display("=======================================================");
        @(posedge clk); fso_data_valid = 1'b1;
        wait(ddr4_write_req == 1'b1);
        @(posedge clk); fso_data_valid = 1'b0;

        repeat (12) @(posedge clk);
        // Send NAK (rx_ack_in = 0) -> Forces immediate Retransmission!
        @(posedge clk);
        rx_rxfn_in      = last_data_txfn;
        rx_ack_in       = 1'b0; // NAK!
        rx_ack_valid_in = 1'b1;
        @(posedge clk);
        rx_ack_valid_in = 1'b0;

        // Wait for Priority 1 Retransmission to fire
        wait(ddr4_read_req == 1'b1);
        repeat (14) @(posedge clk);

        // Send Positive ACK to clear the retransmitted frame
        @(posedge clk);
        rx_rxfn_in      = last_data_txfn;
        rx_ack_in       = 1'b1; // ACK!
        rx_ack_valid_in = 1'b1;
        @(posedge clk);
        rx_ack_valid_in = 1'b0;
        repeat (5) @(posedge clk);

        // =======================================================
        // SCENARIO 3: The 'Silent Path' (Timer Expired -> 5x Max Retries -> Drop)
        // =======================================================
        $display("\n=======================================================");
        $display("SCENARIO 3: The 'Silent Path' (Timer Expired -> Max Retries -> Drop)");
        $display("=======================================================");
        @(posedge clk); fso_data_valid = 1'b1;
        wait(ddr4_write_req == 1'b1);
        @(posedge clk); fso_data_valid = 1'b0;

        // Wait for all 5 autonomous timeout retransmissions + final max-retry drop
        wait(delete_req_cnt == 3);
        repeat (5) @(posedge clk);

        // =======================================================
        // SCENARIO 4: Priority 2 MGMT 1Hz Frame Schedule Check
        // =======================================================
        $display("\n=======================================================");
        $display("SCENARIO 4: Priority 2 MGMT 1Hz Frame Schedule Check");
        $display("=======================================================");
        @(posedge clk); mgmt_tick_1hz = 1'b1;
        @(posedge clk); mgmt_tick_1hz = 1'b0;
        wait(mgmt_tx_cnt == 1);
        repeat (15) @(posedge clk);

        $display("\n=======================================================");
        $display(" ARQ TX CONTROLLER VERIFICATION SUMMARY");
        $display(" -> Total New DATA Writes  : %0d (Expected: >= 3)", write_req_cnt);
        $display(" -> Total Retransmissions  : %0d (Expected: 6 [1 NAK + 5 Timeout Retries])", retx_req_cnt);
        $display(" -> Total RAM Frees/Drops  : %0d (Expected: 3 [2 ACKed + 1 Max-Retry Drop])", delete_req_cnt);
        $display(" -> Total 1Hz MGMT Frames  : %0d (Expected: 1)", mgmt_tx_cnt);
        if ((write_req_cnt >= 3) && (retx_req_cnt == 6) && (delete_req_cnt == 3) && (mgmt_tx_cnt == 1))
            $display(" -> RESULT: [PASS] ALL 4 SELECTIVE REPEAT ARQ SCENARIOS VERIFIED 100%%!");
        else
            $fatal(1, " -> RESULT: [FAIL] ARQ TX Controller scenario count mismatch!");
        $display("=======================================================\n");
        $finish;
    end

endmodule