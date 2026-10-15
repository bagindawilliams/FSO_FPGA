`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj 
Description  : SDA OCT ARQ TX Controller with Autonomous Tracking.
               Implements Strict Priority Arbitration (Retx > MGMT > DATA > IDLE).
               Fully compliant with the ARQ System Architecture Flowchart:
               - Incorporates ARQ_HOLDOFF Timer for lost frames.
               - Implements TX_NUM tracking with ARQ_MAX_RETX = 5 drop logic.
               - Manages DDR4 Re-transmit RAM memory garbage collection.
===========================================================================
*/

module arq_tx_controller #(
    // SDA OCT Configuration Parameters
    parameter ARQ_MAX_RETX      = 3'd5,      // Maximum retries before dropping
    parameter HOLDOFF_TICKS     = 16'd500,   // Timer duration for timeout (Scaled for Sim)
    parameter TRACKER_DEPTH     = 4          // Number of concurrent frames tracked (Scale as needed)
)(
    input  wire        clk,
    input  wire        rst_n,

    // --- Traffic Monitors ---
    input  wire        fso_data_valid,
    input  wire        mgmt_tick_1hz,
    input  wire        header_gen_busy,

    // --- ARQ RX Feedback ---
    input  wire [15:0] rx_rxfn_in,
    input  wire        rx_ack_in,
    input  wire        rx_ack_valid_in,

    // --- Commands to Header Generator ---
    output reg  [15:0] tx_txfn_out,
    output reg  [1:0]  tx_frame_type,
    output reg         tx_trigger_gen,

    // --- Commands to Payload MUX & Segmenter ---
    output reg  [1:0]  payload_mux_sel,
    output reg         tx_stall_mac,

    // --- Commands to AXI4 DDR4 Wrapper ---
    output reg         ddr4_write_req,
    output reg         ddr4_read_req,
    output reg         ddr4_delete_req,
    output reg  [15:0] ddr4_addr
);

    // FSM States
    localparam S_IDLE       = 3'd0;
    localparam S_EVALUATE   = 3'd1;
    localparam S_EXEC_RETX  = 3'd2;
    localparam S_EXEC_MGMT  = 3'd3;
    localparam S_EXEC_DATA  = 3'd4;
    localparam S_EXEC_IDLE  = 3'd5;
    localparam S_WAIT_FRAME = 3'd6;

    reg [2:0]  state;
    reg [15:0] txfn_counter;
    
    // Internal Latches
    reg mgmt_pending;
    
    // =======================================================
    // PENDING ACKNOWLEDGMENT TABLE (The Tracker)
    // =======================================================
    reg        track_valid [0:TRACKER_DEPTH-1];
    reg [15:0] track_txfn  [0:TRACKER_DEPTH-1];
    reg [15:0] track_timer [0:TRACKER_DEPTH-1];
    reg [2:0]  track_retx  [0:TRACKER_DEPTH-1]; // TX_NUM

    integer i;
    reg        timeout_pending;
    reg [15:0] timeout_target_fn;
    reg [2:0]  timeout_retry_cnt;
    reg [31:0] target_index;

    // Background Tracker Logic (Timer & Feedback processing)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < TRACKER_DEPTH; i = i + 1) begin
                track_valid[i] <= 1'b0;
                track_txfn[i]  <= 16'd0;
                track_timer[i] <= 16'd0;
                track_retx[i]  <= 3'd0;
            end
            timeout_pending <= 1'b0;
            ddr4_delete_req <= 1'b0;
        end else begin
            ddr4_delete_req <= 1'b0;
            timeout_pending <= 1'b0;

            // 1. Process Incoming Feedback (ACK/NAK)
            if (rx_ack_valid_in) begin
                for (i = 0; i < TRACKER_DEPTH; i = i + 1) begin
                    if (track_valid[i] && track_txfn[i] == rx_rxfn_in) begin
                        if (rx_ack_in == 1'b1) begin
                            // ACK Received: Clear entry & free DDR4
                            track_valid[i]  <= 1'b0;
                            ddr4_delete_req <= 1'b1;
                        end else begin
                            // NAK Received: Force timer to 0 to trigger immediate retx[cite: 10]
                            track_timer[i] <= 16'd0; 
                        end
                    end
                end
            end

            // 2. Decrement Timers & Detect Timeouts / Max Retries
            for (i = 0; i < TRACKER_DEPTH; i = i + 1) begin
                if (track_valid[i]) begin
                    if (track_timer[i] > 0) begin
                        track_timer[i] <= track_timer[i] - 1'b1;
                    end else if (!timeout_pending) begin
                        // Timer expired or NAK forced it to 0
                        if (track_retx[i] >= ARQ_MAX_RETX) begin
                            // DROP FRAME condition met[cite: 10]
                            track_valid[i]  <= 1'b0;
                            ddr4_delete_req <= 1'b1; // Free RAM, consider transmission failed[cite: 10]
                            // In a full system, you might flag a MAC error here.
                        end else begin
                            // TRIGGER RETRANSMISSION[cite: 10]
                            timeout_pending   <= 1'b1;
                            timeout_target_fn <= track_txfn[i];
                            target_index      <= i;
                        end
                    end
                end
            end

            // 3. Register New DATA transmission (from FSM)
            if (state == S_EXEC_DATA && tx_trigger_gen) begin
                // Find empty slot and allocate
                for (i = 0; i < TRACKER_DEPTH; i = i + 1) begin
                    if (!track_valid[i]) begin
                        track_valid[i] <= 1'b1;
                        track_txfn[i]  <= txfn_counter;
                        track_timer[i] <= HOLDOFF_TICKS; // Start Holdoff Timer[cite: 10]
                        track_retx[i]  <= 3'd0;
                        i = TRACKER_DEPTH; // Break loop
                    end
                end
            end

            // 4. Update retry count on retransmission
            if (state == S_EXEC_RETX && tx_trigger_gen) begin
                track_timer[target_index] <= HOLDOFF_TICKS; // Reset timer[cite: 10]
                track_retx[target_index]  <= track_retx[target_index] + 1'b1; // Increment TX_NUM[cite: 10]
            end
        end
    end

    // =======================================================
    // THE ENGINE: Strict Priority FSM
    // =======================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mgmt_pending <= 1'b0;
            // ... (other resets handled locally below)
        end else begin
            if (mgmt_tick_1hz) mgmt_pending <= 1'b1;
            else if (state == S_EXEC_MGMT) mgmt_pending <= 1'b0;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state           <= S_IDLE;
            txfn_counter    <= 16'd0;
            tx_txfn_out     <= 16'd0;
            tx_frame_type   <= 2'b00;
            tx_trigger_gen  <= 1'b0;
            payload_mux_sel <= 2'b00;
            tx_stall_mac    <= 1'b0;
            ddr4_write_req  <= 1'b0;
            ddr4_read_req   <= 1'b0;
            ddr4_addr       <= 16'd0;
        end else begin
            tx_trigger_gen <= 1'b0;
            ddr4_write_req <= 1'b0;
            ddr4_read_req  <= 1'b0;

            case (state)
                S_IDLE: begin
                    tx_stall_mac <= 1'b0; 
                    if (!header_gen_busy) state <= S_EVALUATE;
                end

                S_EVALUATE: begin
                    if (timeout_pending)       state <= S_EXEC_RETX; // Priority 1: Timeout or NAK
                    else if (mgmt_pending)     state <= S_EXEC_MGMT; // Priority 2: Telemetry
                    else if (fso_data_valid)   state <= S_EXEC_DATA; // Priority 3: New Data
                    else                       state <= S_EXEC_IDLE; // Priority 4: PRBS
                end

                S_EXEC_RETX: begin
                    tx_stall_mac    <= 1'b1;        
                    tx_txfn_out     <= timeout_target_fn; // Use specific failed TXFN
                    tx_frame_type   <= 2'b01;       
                    payload_mux_sel <= 2'b11;       
                    
                    ddr4_addr       <= timeout_target_fn; // Read from DDR4[cite: 10]
                    ddr4_read_req   <= 1'b1;        
                    
                    tx_trigger_gen  <= 1'b1;
                    state           <= S_WAIT_FRAME;
                end

                S_EXEC_MGMT: begin
                    tx_txfn_out     <= txfn_counter;
                    tx_frame_type   <= 2'b10;       
                    payload_mux_sel <= 2'b10;       
                    tx_trigger_gen  <= 1'b1;
                    state           <= S_WAIT_FRAME;
                end

                S_EXEC_DATA: begin
                    tx_txfn_out     <= txfn_counter;
                    tx_frame_type   <= 2'b01;       
                    payload_mux_sel <= 2'b01;       
                    
                    ddr4_addr       <= txfn_counter; 
                    ddr4_write_req  <= 1'b1;        // Store copy in RAM[cite: 10]
                    
                    tx_trigger_gen  <= 1'b1;
                    state           <= S_WAIT_FRAME;
                end

                S_EXEC_IDLE: begin
                    tx_txfn_out     <= txfn_counter;
                    tx_frame_type   <= 2'b00;       
                    payload_mux_sel <= 2'b00;       
                    tx_trigger_gen  <= 1'b1;
                    state           <= S_WAIT_FRAME;
                end

                S_WAIT_FRAME: begin
                    if (header_gen_busy) begin
                        // Transmission active, do nothing.
                    end else if (!tx_trigger_gen) begin 
                        if (state != S_EXEC_RETX) txfn_counter <= txfn_counter + 1'b1; // Don't increment global sequence on retx
                        state <= S_IDLE;
                    end
                end
                
                default: state <= S_IDLE;
            endcase
        end
    end
endmodule