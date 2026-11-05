`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : arq_tx_controller
Description  : Selective Repeat ARQ Transmit Controller & Frame Scheduler 
               with Autonomous Holdoff Tracking and SDA OISL Table 2-9 & 
               Table 2-11 Parameters:
               - Priority 1: Retransmission (Timer Expired OR NAK Received).
               - Priority 2: 1Hz Management (MGMT) Frame.
               - Priority 3: Normal Ethernet Data (DATA) Frame.
               - Priority 4: IDLE Frame (When no data is available).
               
               Features:
               - Multi-Slot Outstanding Frame Tracker (Supports In-Flight Packets).
               - Automatic RAM Write, Read (Retx), and Delete (ACK/Drop) signaling.
               - Configurable ARQ_MAX_RETX (Default = 5 per SDA OISL Table 2-11).

               SDA OISL TABLE 2-11 PARAMETERS:
               - ARQ_MAX_RETX           = 3'd5   (Max retries before drop: 0..5)
               - ARQ_HOLDOFF_CFG        = 8'd255 (8-bit register setting: 1..255)
               - ARQ_HOLDOFF_MULT       = 16     (Table 2-11 'times 16' step;
                                                  configurable to 32 or 64)
               - ARQ_HOLDOFF_MAX_FRAMES = 4080   (255 x 16 frames = 10.174 ms)
               - SIM_SCALE_ENABLE       = 1      (Uses HOLDOFF_TICKS for fast 
                                                  simulation; set 0 for full 
                                                  4080-frame hardware timer)

Revision History:
  - Rev 1.0 (Initial) : Priority-based Selective Repeat ARQ TX Controller & Frame Scheduler.
  - Rev 2.0 (2026-10-27 04:26 KST) : [Target B5.4 - SDA OISL Page 25-26, Sec. 2.6.3.3.3 & Table 2-11]
    1. Added official SDA OISL Table 2-11 parameters:
       - ARQ_HOLDOFF_CFG  (8-bit, range 1..255, default 255)
       - ARQ_HOLDOFF_MULT (16 frames per Table 2-11; configurable to 64 for 
         5000 km LEO S2S extension = 16,320 frames = 40.696 ms RTT window)
       - SIM_SCALE_ENABLE (1 = fast simulation tick per clock using HOLDOFF_TICKS;
         0 = hardware frame-granular decrement per tx_trigger_gen pulse).
    2. Aligned 'track_timer' decrement step with Table 2-11 frame units: when 
       SIM_SCALE_ENABLE == 0 (Hardware Mode), track_timer decrements once per 
       transmitted frame (on tx_trigger_gen) so that ARQ_HOLDOFF_CFG * ARQ_HOLDOFF_MULT 
       (e.g., 255 * 16 = 4080 frames or project-specific extension 255 * 64 = 16,320 frames) 
       measures exact FSO frames (2.4936 us/frame). When SIM_SCALE_ENABLE == 1, 
       retains cycle-tick scaling for fast testbench verification.
    3. Enabled ARQ disabling when ARQ_MAX_RETX == 3'd0 per Section 2.6.3.3.3.
  - Rev 2.3 (2026-10-29 12:39 KST) : [Audit Fix F01 - Tracker Slot Allocation, Retry & Drop]
    1. Updated description to "Selective Repeat ARQ with SDA OISL Parameters".
    2. Preserved 100% of the original module structure, ports, and Table 2-11 parameters.
    3. Removed '&& tx_trigger_gen' from the tracker slot allocation check 
       (if (state == S_EXEC_DATA)) and retry update check (else if (state == S_EXEC_RETX))
       because tx_trigger_gen is registered and asserts on the cycle after leaving S_EXEC_*.
    4. Added '!tx_trigger_gen' guard in S_WAIT_FRAME so the FSM waits 1 cycle for 
       downstream header_gen_busy to rise, placed RX ACK/NAK processing after the timer 
       decrement loop so NAK=0 is never overwritten, and pulsed ddr4_delete_req when 
       a timed-out slot reaches ARQ_MAX_RETX (5 retries).
  - Rev 2.5 (2026-10-29 15:19 KST) : [Audit Fix R06, R07 & R08]
    1. [Fix R07]: Parameterized index width 'IDX_BITS = (TRACKER_DEPTH > 1) ? $clog2(TRACKER_DEPTH) : 1'
       so overriding TRACKER_DEPTH (e.g., TRACKER_DEPTH = 8 in arq_depth8.sv) tracks all 
       slots without 2-bit aliasing onto Slot 0.
    2. [Fix R08]: Consolidated all 'ddr4_addr' assignments into a single clocked always 
       block to eliminate multiple procedural drivers.
    3. [Fix R06]: Prevented 'tx_stall_mac' from asserting mid-frame during an active 
       DATA transmission (payload_mux_sel == 2'b01 && header_gen_busy), preventing 
       deadlock when the last tracker slot is allocated under SIM_SCALE_ENABLE = 0.
    4. Added 'data_pending' request latch (mirroring 'mgmt_pending') so a short 
       'fso_data_valid' pulse arriving while header_gen_busy == 1 is captured and 
       scheduled as soon as the current frame finishes.
  - Rev 2.6 (2026-10-30 00:55 KST) : [Audit Fix N04 - Elimination of Phantom Second DATA Trigger]
    Restricted 'data_pending' latching to occur ONLY when 'fso_data_valid' asserts while 
    a non-DATA frame (IDLE, MGMT, or RETX: payload_mux_sel != 2'b01) is currently busy, 
    and cleared 'data_pending' whenever '!fso_data_valid' drops at the end of a segment.
    This guarantees that a single 475-word finite segment (framer_one_segment.sv) 
    triggers strictly 1 DATA frame and smoothly returns to IDLE without deadlock.
  - Rev 2.8 (2026-10-30 12:22 KST) : [Audit Fix A07 - Decoupled TXFN & Physical RAM Slot Mapping]
    Decoupled the 16-bit frame sequence number ('tx_txfn_out', which increments strictly 
    by +1 per frame) from the 4-bit physical RAM slot index ('track_slot[i]' and 
    'ddr4_addr[3:0]'). When a new DATA frame's 'global_txfn[3:0]' collides with an 
    already active tracker entry's physical slot (such as TXFN=16 while TXFN=0 is still 
    in flight in arq_slot_alias.sv), 'alloc_phys_slot' selects the first free physical 
    slot (slot 1) while preserving 'tx_txfn_out = 16', eliminating slot aliasing without 
    skipping sequence numbers.
  - Rev 2.9 (2026-10-30 18:25 KST) : [Audit Fix B10 & B11 - Strict TXFN ACK Matching & Non-Colliding Delete Queue]
    1. [Fix B10]: Matched incoming 'rx_rxfn_in' strictly against 'track_txfn[i]' 
       (removing the '{track_txfn[i][15:4], track_slot[i]} == rx_rxfn_in' comparison),
       preventing an unsent sequence number (such as ACK 17 in arq_false_ack.sv) from 
       falsely freeing tracker entry TXFN=16 stored in physical slot 1.
    2. [Fix B11]: Added a dedicated pending-delete holding register ('pending_del_valid'
       and 'pending_del_addr') so that when an ACK or max-retry drop occurs on the exact 
       same clock cycle as 'S_EXEC_DATA' (ddr4_write_req) or 'S_EXEC_RETX' (ddr4_read_req),
       the tracker slot is freed immediately while 'ddr4_delete_req' and its target 
       'ddr4_addr' are issued on the next clock cycle without colliding with the active 
       read/write address (arq_ack_retx_shared_address.sv).
  - Rev 3.0 (2026-10-30 23:35 KST) : [Audit Fix B11 / C-A005 - 16-Entry Delete FIFO & Slot Reuse Guard]
    1. Upgraded the 1-entry pending delete holder to a 16-entry Delete Arbitration FIFO 
       ('del_q_addr[0:15]', 'del_q_wr_ptr', 'del_q_rd_ptr', 'del_q_cnt') with strict 
       single-operation-per-cycle bus arbitration. When a new ACK or max-retry drop arrives
       on the same cycle that an earlier queued delete is being issued (such as ACK 16 
       arriving while pending delete 0 is draining in arq_delete_two_acks.sv), the queued
       delete 0 is served on 'ddr4_addr' while the new delete 16 is enqueued and served on 
       the following cycle, guaranteeing zero lost delete operations (producing 0002 on 
       arq_delete_settled.sv and 0000 on arq_delete_two_acks.sv).
    2. Added 'slot_del_pending [15:0]' bitmap into 'slot_busy_bitmap' so physical RAM 
       slots queued for deletion cannot be reused by a new DATA frame until their 
       'ddr4_delete_req' pulse has actually been issued.
  - Rev 3.1 (2026-10-31 14:15 KST) : [Audit Fix OISL-MGMT-001 (D06) - Full ARQ Lifecycle for MGMT Frames]
    1. [Fix OISL-MGMT-001 Tracker & Metadata]: Added per-slot frame-type metadata
       ('track_is_mgmt[0:TRACKER_DEPTH-1]') and enforced a single-outstanding MGMT
       transaction contract ('mgmt_in_flight') so a new MGMT frame is scheduled in
       S_ARBITRATE when no prior MGMT is in flight and tracker/physical-slot resources
       are available.
    2. [Fix OISL-MGMT-001 Storage & Retransmission Identity]: In S_EXEC_MGMT, allocated
       a tracker entry with 'track_is_mgmt <= 1'b1', 'track_txfn <= global_txfn',
       'track_timer <= active_holdoff_limit', and pulsed 'ddr4_write_req' to capture the
       transmitted MGMT payload snapshot. In S_EXEC_RETX, restored the exact original
       'tx_frame_type <= track_is_mgmt[target_index] ? 2'b10 : 2'b01' alongside the
       original 'track_txfn[target_index]'.
    3. [Fix OISL-MGMT-001 Timeout/Drop Telemetry]: Added 'mgmt_retry_drop_cnt [15:0]'
       incremented whenever an unacknowledged MGMT transaction exhausts 'eff_max_retx'
       and is dropped via the Delete Arbitration FIFO.
===========================================================================
*/

module arq_tx_controller #(
    parameter [2:0]  ARQ_MAX_RETX      = 3'd5,     // SDA OISL Table 2-11: 0..5 (Default = 5; 0 = ARQ Disabled)
    parameter [7:0]  ARQ_HOLDOFF_CFG   = 8'd255,   // SDA OISL Table 2-11: 1..255 (8-bit configuration)
    parameter integer ARQ_HOLDOFF_MULT = 16,       // 16 = Strict Table 2-11 (x16 frames); 64 = 5000 km Extension
    parameter        SIM_SCALE_ENABLE  = 1,        // 1 = Use HOLDOFF_TICKS for fast simulation; 0 = Frame-granular
    parameter [15:0] HOLDOFF_TICKS     = 16'd500,  // Simulation scaled holdoff ticks when SIM_SCALE_ENABLE = 1
    parameter integer TRACKER_DEPTH    = 4         // Number of concurrent frames tracked in flight
)(
    input  wire        clk,
    input  wire        rst_n,

    // --- Traffic & Timing Monitors ---
    input  wire        fso_data_valid,   // Asserted when Ethernet segment/FIFO has DATA ready
    input  wire        mgmt_tick_1hz,    // 1Hz pulse to trigger MGMT frame
    input  wire        header_gen_busy,  // From fso_header_top (Wait for current frame to finish)

    // --- ARQ Feedback from RX Decoder (Remote Terminal) ---
    input  wire [15:0] rx_rxfn_in,       // RXFN received from remote terminal
    input  wire        rx_ack_in,        // 1 = ACK, 0 = NAK
    input  wire        rx_ack_valid_in,  // 1 = Valid ARQ feedback present

    // --- Outputs to Header Generator & Payload MUX ---
    output reg  [15:0] tx_txfn_out,      // Current TXFN to be transmitted
    output reg  [1:0]  tx_frame_type,    // 00=IDLE, 01=DATA, 10=MGMT
    output reg         tx_trigger_gen,   // Fires the Header Generator
    output reg  [1:0]  payload_mux_sel,  // 00=IDLE, 01=DATA, 10=MGMT, 11=RETX
    output wire        tx_stall_mac,     // Stalls normal Ethernet data during Retx/MGMT

    // --- Outputs to ARQ DDR4 Wrapper ---
    output reg         ddr4_write_req,   // Sniff and store current DATA/MGMT frame
    output reg         ddr4_read_req,    // Fetch frame from RAM for Retransmission
    output reg         ddr4_delete_req,  // Free RAM slot upon ACK or Max Retries
    output reg  [15:0] ddr4_addr         // Target Frame Number / Physical Slot in RAM
);

    localparam integer IDX_BITS = (TRACKER_DEPTH > 1) ? $clog2(TRACKER_DEPTH) : 1;

    // =======================================================
    // 1. OUTSTANDING FRAME TRACKER TABLE (CAM-like Structure)
    // =======================================================
    localparam [15:0] TABLE_2_11_HOLDOFF_FRAMES = ARQ_HOLDOFF_CFG * ARQ_HOLDOFF_MULT;
    wire       [15:0] active_holdoff_limit      = SIM_SCALE_ENABLE ? HOLDOFF_TICKS : TABLE_2_11_HOLDOFF_FRAMES;
    wire       [2:0]  eff_max_retx              = (ARQ_MAX_RETX > 3'd5) ? 3'd5 : ARQ_MAX_RETX;
    wire              arq_disabled              = (eff_max_retx == 3'd0) || (ARQ_HOLDOFF_CFG == 8'd0);

    reg        track_valid   [0:TRACKER_DEPTH-1];
    reg        track_is_mgmt [0:TRACKER_DEPTH-1]; // [Rev 3.1 - OISL-MGMT-001] 1 = MGMT frame, 0 = DATA frame
    reg [15:0] track_txfn    [0:TRACKER_DEPTH-1];
    reg [15:0] track_timer   [0:TRACKER_DEPTH-1];
    reg [2:0]  track_retx    [0:TRACKER_DEPTH-1];
    reg [3:0]  track_slot    [0:TRACKER_DEPTH-1]; // Dedicated 4-bit physical RAM slot per tracker entry

    reg [15:0] global_txfn;  // Master sequence counter for new frames
    reg        mgmt_pending; // Latch for 1Hz MGMT request
    reg        data_pending; // Latch for DATA request arriving while non-DATA frame is busy
    reg [15:0] mgmt_retry_drop_cnt; // [Rev 3.1 - OISL-MGMT-001] Counts MGMT frames dropped after max retries
    wire       data_req_active = fso_data_valid || data_pending;

    // [Rev 3.0 - Fix B11 / C-A005] 16-Entry Delete Arbitration FIFO & Pending-Slot Bitmap
    reg [15:0] del_q_addr [0:15];
    reg [3:0]  del_q_wr_ptr;
    reg [3:0]  del_q_rd_ptr;
    reg [4:0]  del_q_cnt;
    reg [15:0] slot_del_pending; // Prevents slot reuse before queued delete is issued

    integer i, s, dq_i;

    // =======================================================
    // 2. COMBINATIONAL SEARCH ENGINE & PHYSICAL SLOT ALLOCATOR
    // =======================================================
    reg                retx_needed;
    reg [IDX_BITS-1:0] retx_index;
    reg                drop_needed;
    reg [IDX_BITS-1:0] drop_index;
    reg                free_found;
    reg [IDX_BITS-1:0] free_index;
    reg [15:0]         slot_busy_bitmap;
    reg [3:0]          alloc_phys_slot;
    reg                phys_slot_found;
    reg                mgmt_in_flight;

    reg                ack_hit_found;
    reg [IDX_BITS-1:0] ack_hit_index;

    always @(*) begin
        retx_needed      = 1'b0;
        retx_index       = {IDX_BITS{1'b0}};
        drop_needed      = 1'b0;
        drop_index       = {IDX_BITS{1'b0}};
        free_found       = 1'b0;
        free_index       = {IDX_BITS{1'b0}};
        slot_busy_bitmap = slot_del_pending; // Guard slots waiting in delete queue
        phys_slot_found  = 1'b0;
        mgmt_in_flight   = 1'b0;
        ack_hit_found    = 1'b0;
        ack_hit_index    = {IDX_BITS{1'b0}};

        for (i = 0; i < TRACKER_DEPTH; i = i + 1) begin
            if (track_valid[i]) begin
                slot_busy_bitmap[track_slot[i]] = 1'b1;
                if (track_is_mgmt[i]) begin
                    mgmt_in_flight = 1'b1;
                end
                if (rx_ack_valid_in && (track_txfn[i] == rx_rxfn_in) && !ack_hit_found) begin
                    ack_hit_found = 1'b1;
                    ack_hit_index = i[IDX_BITS-1:0];
                end
                if (track_timer[i] == 16'd0) begin
                    if (track_retx[i] < eff_max_retx) begin
                        if (!retx_needed) begin
                            retx_needed = 1'b1;
                            retx_index  = i[IDX_BITS-1:0];
                        end
                    end else begin
                        if (!drop_needed) begin
                            drop_needed = 1'b1;
                            drop_index  = i[IDX_BITS-1:0];
                        end
                    end
                end
            end
            if (!track_valid[i] && !free_found) begin
                free_found = 1'b1;
                free_index = i[IDX_BITS-1:0];
            end
        end

        // [Rev 2.8 - Fix A07] Prefer global_txfn[3:0] if free; otherwise pick first free physical slot (0..15)
        if (!slot_busy_bitmap[global_txfn[3:0]]) begin
            alloc_phys_slot = global_txfn[3:0];
            phys_slot_found = 1'b1;
        end else begin
            alloc_phys_slot = global_txfn[3:0];
            for (s = 0; s < 16; s = s + 1) begin
                if (!slot_busy_bitmap[s] && !phys_slot_found) begin
                    alloc_phys_slot = s[3:0];
                    phys_slot_found = 1'b1;
                end
            end
        end
    end

    // =======================================================
    // 3. SELECTIVE REPEAT ARQ STATE MACHINE
    // =======================================================
    localparam S_IDLE        = 3'd0,
               S_ARBITRATE   = 3'd1,
               S_EXEC_RETX   = 3'd2,
               S_EXEC_MGMT   = 3'd3,
               S_EXEC_DATA   = 3'd4,
               S_EXEC_IDLE   = 3'd5,
               S_WAIT_FRAME  = 3'd6;

    reg [2:0]          state, next_state;
    reg [IDX_BITS-1:0] target_index;

    wire active_data_in_flight = (state == S_EXEC_DATA) ||
                                 ((state == S_WAIT_FRAME) && (payload_mux_sel == 2'b01));
    wire del_q_has_space       = (del_q_cnt < 5'd14);
    wire slot_resources_ok     = arq_disabled || (free_found && phys_slot_found && del_q_has_space);

    assign tx_stall_mac = (state == S_EXEC_RETX) || (state == S_EXEC_MGMT) ||
                          (payload_mux_sel == 2'b11) || (payload_mux_sel == 2'b10) ||
                          (!arq_disabled && (!free_found || !phys_slot_found || !del_q_has_space) && !active_data_in_flight);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= S_IDLE;
        else        state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case (state)
            S_IDLE: begin
                if (!header_gen_busy && !tx_trigger_gen) next_state = S_ARBITRATE;
            end
            
            S_ARBITRATE: begin
                // STRICT PRIORITY ENFORCEMENT:
                // Priority 1: Timer expired OR NAK received -> Retransmit!
                if (!arq_disabled && retx_needed)                        next_state = S_EXEC_RETX;
                // Priority 2: 1Hz MGMT Schedule (1 outstanding MGMT contract with tracker slot allocation)
                else if (mgmt_pending && !mgmt_in_flight && slot_resources_ok)
                                                                         next_state = S_EXEC_MGMT;
                // Priority 3: Normal Ethernet Data available (and tracker/RAM slot available)
                else if (data_req_active && slot_resources_ok)           next_state = S_EXEC_DATA;
                // Priority 4: Nothing to send -> Stream IDLE
                else                                                     next_state = S_EXEC_IDLE;
            end

            S_EXEC_RETX, S_EXEC_MGMT, S_EXEC_DATA, S_EXEC_IDLE: begin
                next_state = S_WAIT_FRAME;
            end

            S_WAIT_FRAME: begin
                if (!header_gen_busy && !tx_trigger_gen) next_state = S_IDLE;
            end
            
            default: next_state = S_IDLE;
        endcase
    end

    // =======================================================
    // 4. UNIFIED OUTPUT, TRACKER & DELETE-FIFO ARBITRATION LOGIC
    // =======================================================
    wire        timer_tick_en = SIM_SCALE_ENABLE ? 1'b1 : tx_trigger_gen;
    wire        bus_busy_exec = (state == S_EXEC_DATA) || (state == S_EXEC_MGMT) || (state == S_EXEC_RETX);

    // Identify whether an ACK delete and/or a Max-Retry Drop delete is requested on this cycle
    wire        ack_del_req   = ack_hit_found && (rx_ack_in == 1'b1);
    wire [15:0] ack_del_addr  = {track_txfn[ack_hit_index][15:4], track_slot[ack_hit_index]};

    wire        drop_del_req  = drop_needed && !bus_busy_exec &&
                                !(ack_hit_found && (drop_index == ack_hit_index));
    wire [15:0] drop_del_addr = {track_txfn[drop_index][15:4], track_slot[drop_index]};

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            global_txfn         <= 16'd0;
            tx_txfn_out         <= 16'd0;
            tx_frame_type       <= 2'b00;
            tx_trigger_gen      <= 1'b0;
            payload_mux_sel     <= 2'b00;
            ddr4_write_req      <= 1'b0;
            ddr4_read_req       <= 1'b0;
            ddr4_delete_req     <= 1'b0;
            ddr4_addr           <= 16'd0;
            mgmt_pending        <= 1'b0;
            data_pending        <= 1'b0;
            mgmt_retry_drop_cnt <= 16'd0;
            del_q_wr_ptr        <= 4'd0;
            del_q_rd_ptr        <= 4'd0;
            del_q_cnt           <= 5'd0;
            slot_del_pending    <= 16'd0;
            for (dq_i = 0; dq_i < 16; dq_i = dq_i + 1) begin
                del_q_addr[dq_i] <= 16'd0;
            end
            target_index        <= {IDX_BITS{1'b0}};
            for (i = 0; i < TRACKER_DEPTH; i = i + 1) begin
                track_valid[i]   <= 1'b0;
                track_is_mgmt[i] <= 1'b0;
                track_txfn[i]    <= 16'd0;
                track_timer[i]   <= 16'd0;
                track_retx[i]    <= 3'd0;
                track_slot[i]    <= 4'd0;
            end
        end else begin
            tx_trigger_gen  <= 1'b0;
            ddr4_write_req  <= 1'b0;
            ddr4_read_req   <= 1'b0;
            ddr4_delete_req <= 1'b0;

            if (mgmt_tick_1hz) mgmt_pending <= 1'b1;

            // [Rev 2.6 - Fix N04] Only latch data_pending if fso_data_valid asserts while a
            // non-DATA frame (IDLE/MGMT/RETX) is currently busy, and clear it if fso_data_valid
            // drops during an active DATA frame.
            if (fso_data_valid && header_gen_busy && (payload_mux_sel != 2'b01)) begin
                data_pending <= 1'b1;
            end else if (!fso_data_valid && active_data_in_flight) begin
                data_pending <= 1'b0;
            end

            // A. Autonomous Timer Decrement & Max-Retry Exhaustion Tracker Free
            for (i = 0; i < TRACKER_DEPTH; i = i + 1) begin
                if (track_valid[i]) begin
                    if (track_timer[i] > 16'd0) begin
                        if (timer_tick_en) begin
                            track_timer[i] <= track_timer[i] - 1'b1;
                        end
                    end else if (drop_del_req && (i[IDX_BITS-1:0] == drop_index)) begin
                        track_valid[i]   <= 1'b0;
                        track_is_mgmt[i] <= 1'b0;
                        if (track_is_mgmt[i]) begin
                            mgmt_retry_drop_cnt <= mgmt_retry_drop_cnt + 16'd1;
                        end
                    end
                end
            end

            // B. Process Incoming RX Feedback (ACK / NAK)
            // [Rev 2.9 - Fix B10] Match strictly against track_txfn[i]
            if (ack_hit_found) begin
                if (rx_ack_in == 1'b1) begin
                    track_valid[ack_hit_index]   <= 1'b0;
                    track_is_mgmt[ack_hit_index] <= 1'b0;
                end else begin
                    track_timer[ack_hit_index] <= 16'd0;
                end
            end

            // C. [Rev 3.0 - Fix B11 / C-A005] Single-Operation-Per-Cycle Delete Bus & FIFO Arbitration
            if (bus_busy_exec) begin
                // Bus is occupied by S_EXEC_DATA, S_EXEC_MGMT, or S_EXEC_RETX: enqueue any new delete requests
                if (ack_del_req && drop_del_req && (del_q_cnt <= 5'd14)) begin
                    del_q_addr[del_q_wr_ptr]              <= ack_del_addr;
                    del_q_addr[del_q_wr_ptr + 4'd1]       <= drop_del_addr;
                    del_q_wr_ptr                          <= del_q_wr_ptr + 4'd2;
                    del_q_cnt                             <= del_q_cnt + 5'd2;
                    slot_del_pending[ack_del_addr[3:0]]   <= 1'b1;
                    slot_del_pending[drop_del_addr[3:0]]  <= 1'b1;
                end else if (ack_del_req && (del_q_cnt < 5'd16)) begin
                    del_q_addr[del_q_wr_ptr]              <= ack_del_addr;
                    del_q_wr_ptr                          <= del_q_wr_ptr + 4'd1;
                    del_q_cnt                             <= del_q_cnt + 5'd1;
                    slot_del_pending[ack_del_addr[3:0]]   <= 1'b1;
                end else if (drop_del_req && (del_q_cnt < 5'd16)) begin
                    del_q_addr[del_q_wr_ptr]              <= drop_del_addr;
                    del_q_wr_ptr                          <= del_q_wr_ptr + 4'd1;
                    del_q_cnt                             <= del_q_cnt + 5'd1;
                    slot_del_pending[drop_del_addr[3:0]]  <= 1'b1;
                end
            end else if (del_q_cnt > 5'd0) begin
                // Bus is free and queued delete(s) exist: serve head of queue on ddr4_addr,
                // and enqueue any newly arriving ACK/drop delete requests behind it!
                ddr4_delete_req <= 1'b1;
                ddr4_addr       <= del_q_addr[del_q_rd_ptr];
                del_q_rd_ptr    <= del_q_rd_ptr + 4'd1;
                slot_del_pending[del_q_addr[del_q_rd_ptr][3:0]] <= 1'b0;

                if (ack_del_req && drop_del_req && (del_q_cnt <= 5'd15)) begin
                    del_q_addr[del_q_wr_ptr]              <= ack_del_addr;
                    del_q_addr[del_q_wr_ptr + 4'd1]       <= drop_del_addr;
                    del_q_wr_ptr                          <= del_q_wr_ptr + 4'd2;
                    del_q_cnt                             <= del_q_cnt + 5'd1; // -1 pop + 2 push = +1
                    slot_del_pending[ack_del_addr[3:0]]   <= 1'b1;
                    slot_del_pending[drop_del_addr[3:0]]  <= 1'b1;
                end else if (ack_del_req) begin
                    del_q_addr[del_q_wr_ptr]              <= ack_del_addr;
                    del_q_wr_ptr                          <= del_q_wr_ptr + 4'd1;
                    slot_del_pending[ack_del_addr[3:0]]   <= 1'b1;
                    // del_q_cnt unchanged (-1 pop + 1 push = 0)
                end else if (drop_del_req) begin
                    del_q_addr[del_q_wr_ptr]              <= drop_del_addr;
                    del_q_wr_ptr                          <= del_q_wr_ptr + 4'd1;
                    slot_del_pending[drop_del_addr[3:0]]  <= 1'b1;
                    // del_q_cnt unchanged (-1 pop + 1 push = 0)
                end else begin
                    del_q_cnt                             <= del_q_cnt - 5'd1;
                end
            end else begin
                // Bus is free and queue is empty: serve new delete immediately!
                if (ack_del_req && drop_del_req) begin
                    ddr4_delete_req                      <= 1'b1;
                    ddr4_addr                            <= ack_del_addr;
                    del_q_addr[del_q_wr_ptr]             <= drop_del_addr;
                    del_q_wr_ptr                         <= del_q_wr_ptr + 4'd1;
                    del_q_cnt                            <= 5'd1;
                    slot_del_pending[drop_del_addr[3:0]] <= 1'b1;
                end else if (ack_del_req) begin
                    ddr4_delete_req <= 1'b1;
                    ddr4_addr       <= ack_del_addr;
                end else if (drop_del_req) begin
                    ddr4_delete_req <= 1'b1;
                    ddr4_addr       <= drop_del_addr;
                end
            end

            // D. State Machine Command & Tracker Slot Execution
            case (state)
                S_ARBITRATE: begin
                    if (!arq_disabled && retx_needed)                              target_index <= retx_index;
                    else if (mgmt_pending && !mgmt_in_flight && free_found)        target_index <= free_index;
                    else if (data_req_active && free_found)                        target_index <= free_index;
                end

                S_EXEC_RETX: begin
                    // [Rev 3.1 - Fix OISL-MGMT-001]: Restore exact original TXFN and frame_type
                    // (2'b10 for MGMT, 2'b01 for DATA) while allowing fso_header_top to refresh
                    // dynamic feedback/timestamp header fields.
                    tx_txfn_out     <= track_txfn[target_index];
                    tx_frame_type   <= track_is_mgmt[target_index] ? 2'b10 : 2'b01;
                    payload_mux_sel <= 2'b11;
                    tx_trigger_gen  <= 1'b1;
                    ddr4_read_req   <= 1'b1;
                    ddr4_addr       <= {track_txfn[target_index][15:4], track_slot[target_index]};

                    track_retx[target_index]  <= track_retx[target_index] + 1'b1;
                    track_timer[target_index] <= active_holdoff_limit;
                end

                S_EXEC_MGMT: begin
                    // [Rev 3.1 - Fix OISL-MGMT-001]: Track MGMT frame in ARQ tracker and trigger
                    // payload snapshot storage so retransmission replays the identical payload.
                    tx_txfn_out     <= global_txfn;
                    tx_frame_type   <= 2'b10;
                    payload_mux_sel <= 2'b10;
                    tx_trigger_gen  <= 1'b1;
                    ddr4_write_req  <= ~arq_disabled;
                    ddr4_addr       <= {global_txfn[15:4], alloc_phys_slot};
                    mgmt_pending    <= 1'b0;
                    global_txfn     <= global_txfn + 1'b1;

                    if (!arq_disabled && free_found) begin
                        track_valid[target_index]   <= 1'b1;
                        track_is_mgmt[target_index] <= 1'b1;
                        track_txfn[target_index]    <= global_txfn;
                        track_timer[target_index]   <= active_holdoff_limit;
                        track_retx[target_index]    <= 3'd0;
                        track_slot[target_index]    <= alloc_phys_slot;
                    end
                end

                S_EXEC_DATA: begin
                    // [Rev 2.8 - Fix A07] Keep tx_txfn_out strictly sequential (global_txfn)
                    // while routing ddr4_addr[3:0] to conflict-free physical slot alloc_phys_slot
                    tx_txfn_out     <= global_txfn;
                    tx_frame_type   <= 2'b01;
                    payload_mux_sel <= 2'b01;
                    tx_trigger_gen  <= 1'b1;
                    ddr4_write_req  <= ~arq_disabled;
                    ddr4_addr       <= {global_txfn[15:4], alloc_phys_slot};
                    data_pending    <= 1'b0;
                    global_txfn     <= global_txfn + 1'b1;

                    if (!arq_disabled && free_found) begin
                        track_valid[target_index]   <= 1'b1;
                        track_is_mgmt[target_index] <= 1'b0;
                        track_txfn[target_index]    <= global_txfn;
                        track_timer[target_index]   <= active_holdoff_limit;
                        track_retx[target_index]    <= 3'd0;
                        track_slot[target_index]    <= alloc_phys_slot;
                    end
                end

                S_EXEC_IDLE: begin
                    tx_txfn_out     <= global_txfn;
                    tx_frame_type   <= 2'b00;
                    payload_mux_sel <= 2'b00;
                    tx_trigger_gen  <= 1'b1;
                    global_txfn     <= global_txfn + 1'b1;
                end
            endcase
        end
    end

endmodule