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
    // Instantiate DUT (SDA OCT v4.0.0 Parameters)
    // =======================================================
    arq_tx_controller #(
        .ARQ_MAX_RETX(3'd5),      // Flowchart: Max Retries is strictly 5
        .HOLDOFF_TICKS(16'd50),   // Flowchart: ARQ_HOLDOFF Timer duration
        .TRACKER_DEPTH(4)         // Table capacity
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
    // Tcl Logger (Flowchart Mapping)
    // =======================================================
    always @(posedge clk) begin
        if (tx_trigger_gen) begin
            if (ddr4_write_req) 
                $display("[%0t ns] [FLOWCHART: Store frame copy in RAM] -> TXFN %0d Transmitted & Saved.", $time, tx_txfn_out);
            else if (ddr4_read_req)
                $display("[%0t ns] [FLOWCHART: Retrieve frame from RAM] -> TXFN %0d Retransmitting (Priority 1).", $time, tx_txfn_out);
        end
        if (ddr4_delete_req) begin
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

        $display("\n--- SIMULATION COMPLETE ---");
        $finish;
    end
endmodule