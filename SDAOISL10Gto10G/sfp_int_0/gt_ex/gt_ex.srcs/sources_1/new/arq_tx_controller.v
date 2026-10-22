`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : arq_tx_controller
Description  : Selective Repeat ARQ Transmit Controller with Autonomous 
               Holdoff Tracking.
               
               SDA OISL TABLE 2-11 PARAMETERS:
               - ARQ_MAX_RETX           = 3'd5   (Max retries before drop: 0..7)
               - ARQ_HOLDOFF_CFG        = 8'd255 (8-bit register setting: 1..255)
               - ARQ_HOLDOFF_MULT       = 16     (Table 2-11 'times 16' step;
                                                  configurable to 32 or 64)
               - ARQ_HOLDOFF_MAX_FRAMES = 4080   (255 x 16 frames = 10.174 ms)
               - SIM_SCALE_ENABLE       = 1      (Uses HOLDOFF_TICKS for fast 
                                                  simulation; set 0 for full 
                                                  4080-frame hardware timer)
===========================================================================
*/

module arq_tx_controller #(
    parameter [2:0]  ARQ_MAX_RETX     = 3'd5,     // SDA OISL Table 2-11 (Default = 5)
    parameter [7:0]  ARQ_HOLDOFF_CFG  = 8'd255,   // SDA OISL Table 2-11 (1..255)
    parameter        ARQ_HOLDOFF_MULT = 16,       // Table 2-11: 'times 16' (or 32 / 64)
    parameter        SIM_SCALE_ENABLE = 1,        // 1 = Fast Sim Timer, 0 = Full 4080 Frames
    parameter [15:0] HOLDOFF_TICKS    = 16'd500,  // Scaled ticks when SIM_SCALE_ENABLE = 1
    parameter        TRACKER_DEPTH    = 4
)(
    input  wire        clk,
    input  wire        rst_n,

    // Traffic Monitors
    input  wire        fso_data_valid,
    input  wire        mgmt_tick_1hz,
    input  wire        header_gen_busy,

    // ARQ RX Feedback (From arq_rx_controller)
    input  wire [15:0] rx_rxfn_in,
    input  wire        rx_ack_in,
    input  wire        rx_ack_valid_in,

    // Commands to Header Generator
    output reg  [15:0] tx_txfn_out,
    output reg  [1:0]  tx_frame_type,
    output reg         tx_trigger_gen,

    // Commands to Payload MUX & Segmenter
    output reg  [1:0]  payload_mux_sel,
    output reg         tx_stall_mac,

    // Commands to AXI4 DDR4 Wrapper
    output reg         ddr4_write_req,
    output reg         ddr4_read_req,
    output reg         ddr4_delete_req,
    output reg  [15:0] ddr4_addr
);

    // Table 2-11 Holdoff Frame Calculation: 255 x 16 = 4080 frames
    localparam [15:0] TABLE_2_11_HOLDOFF_FRAMES = ARQ_HOLDOFF_CFG * ARQ_HOLDOFF_MULT;
    wire [15:0] active_holdoff_limit = (SIM_SCALE_ENABLE == 1) ? HOLDOFF_TICKS : TABLE_2_11_HOLDOFF_FRAMES;

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
    reg        mgmt_pending;

    // Pending Acknowledgment Table (Selective Repeat Tracker)
    reg        track_valid [0:TRACKER_DEPTH-1];
    reg [15:0] track_txfn  [0:TRACKER_DEPTH-1];
    reg [15:0] track_timer [0:TRACKER_DEPTH-1];
    reg [2:0]  track_retx  [0:TRACKER_DEPTH-1];

    integer i;
    reg        slot_allocated;
    reg        timeout_pending;
    reg [15:0] timeout_target_fn;
    reg [31:0] target_index;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < TRACKER_DEPTH; i = i + 1) begin
                track_valid[i] <= 1'b0;
                track_txfn[i]  <= 16'd0;
                track_timer[i] <= 16'd0;
                track_retx[i]  <= 3'd0;
            end
            slot_allocated    <= 1'b0;
            timeout_pending   <= 1'b0;
            timeout_target_fn <= 16'd0;
            target_index      <= 32'd0;
            ddr4_delete_req   <= 1'b0;
        end else begin
            ddr4_delete_req <= 1'b0;
            timeout_pending <= 1'b0;

            // 1. Process Incoming Selective Repeat Feedback (ACK / NAK)
            if (rx_ack_valid_in) begin
                for (i = 0; i < TRACKER_DEPTH; i = i + 1) begin
                    if (track_valid[i] && (track_txfn[i] == rx_rxfn_in)) begin
                        if (rx_ack_in == 1'b1) begin
                            // ACK received: release tracker slot & delete from DDR4
                            track_valid[i]  <= 1'b0;
                            ddr4_delete_req <= 1'b1;
                        end else begin
                            // NAK received: expire timer immediately to trigger S_EXEC_RETX
                            track_timer[i]  <= 16'd0;
                        end
                    end
                end
            end

            // 2. Decrement Timers & Detect Holdoff Timeouts / ARQ_MAX_RETX = 5
            for (i = 0; i < TRACKER_DEPTH; i = i + 1) begin
                if (track_valid[i]) begin
                    if (track_timer[i] > 16'd0) begin
                        track_timer[i] <= track_timer[i] - 16'd1;
                    end else if (!timeout_pending) begin
                        if (track_retx[i] >= ARQ_MAX_RETX) begin
                            track_valid[i]  <= 1'b0;
                            ddr4_delete_req <= 1'b1;
                        end else begin
                            timeout_pending   <= 1'b1;
                            timeout_target_fn <= track_txfn[i];
                            target_index      <= i;
                        end
                    end
                end
            end

            // 3. Allocate Tracker Slot on New DATA Transmission
            if (state == S_EXEC_DATA && tx_trigger_gen) begin
                slot_allocated = 1'b0;
                for (i = 0; i < TRACKER_DEPTH; i = i + 1) begin
                    if (!track_valid[i] && !slot_allocated) begin
                        track_valid[i] <= 1'b1;
                        track_txfn[i]  <= txfn_counter;
                        track_timer[i] <= active_holdoff_limit;
                        track_retx[i]  <= 3'd0;
                        slot_allocated = 1'b1;
                    end
                end
            end

            // 4. Reload Holdoff Timer & Increment Retry Count (TX_NUM) on Retransmission
            if (state == S_EXEC_RETX && tx_trigger_gen) begin
                track_timer[target_index[1:0]] <= active_holdoff_limit;
                track_retx[target_index[1:0]]  <= track_retx[target_index[1:0]] + 3'd1;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mgmt_pending <= 1'b0;
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
                    if (timeout_pending)     state <= S_EXEC_RETX; // Priority 1: ARQ Retransmission
                    else if (mgmt_pending)   state <= S_EXEC_MGMT; // Priority 2: 1Hz Management Frame
                    else if (fso_data_valid) state <= S_EXEC_DATA; // Priority 3: New Ethernet Data
                    else                     state <= S_EXEC_IDLE; // Priority 4: PRBS Idle Frame
                end

                S_EXEC_RETX: begin
                    tx_stall_mac    <= 1'b1;
                    tx_txfn_out     <= timeout_target_fn;
                    tx_frame_type   <= 2'b01;
                    payload_mux_sel <= 2'b11;
                    ddr4_addr       <= timeout_target_fn;
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
                    ddr4_write_req  <= 1'b1;
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
                        // Wait until current frame completes
                    end else if (!tx_trigger_gen) begin
                        if (payload_mux_sel != 2'b11) txfn_counter <= txfn_counter + 16'd1;
                        state <= S_IDLE;
                    end
                end

                default: state <= S_IDLE;
            endcase
        end
    end

endmodule