`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : arq_rx_controller
Description  : Selective Repeat ARQ Receiver Controller (Control Plane).

               KEY OPERATIONS:
               1. Peer Feedback Forwarding (To Local arq_tx_controller):
                  When a valid FSO Header arrives (hdr_crc_ok == 1) with 
                  rx_ack_valid == 1, forwards (rx_rxfn, rx_ack, rx_ack_valid)
                  to the local transmitter so ACKed frames are deleted from 
                  TX DDR4 RAM and NAKed frames are immediately retransmitted.
               2. Local RX CRC-32 Decision & ACK/NAK Generation:
                  Upon completion of the 1912-Byte Payload CRC-32 check 
                  (pld_check_done == 1):
                  - For DATA frames (rx_frame_type == 2'b01):
                    Generates ACK (local_fb_ack = 1) if pld_crc_ok == 1, or 
                    NAK (local_fb_ack = 0) if pld_crc_ok == 0, with 
                    local_fb_rxfn = rx_txfn.
                  - For IDLE (2'b00) or MGMT (2'b10) frames:
                    Asserts non_data_seq_adv so the Selective Repeat Reorder 
                    Buffer advances its expected sequence pointer past the 
                    non-data frame number without stalling.

Revision History:
  - Rev 1.0 (Initial) : Selective Repeat ARQ Receiver Control Plane.
  - Rev 3.1 (2026-10-31 14:25 KST) : [Audit Fix OISL-MGMT-001 (D06) - MGMT ACK/NAK, Trusted Header Gating & Age Window]
    1. [Fix OISL-MGMT-001 Complete MGMT Feedback]: Extended local Payload CRC-32
       feedback generation to cover MGMT frames ('eff_ftype == 2'b10'). Verified
       MGMT frames with 'pld_crc_ok == 1'b1' emit ACK ('local_fb_ack = 1'b1',
       incrementing 'ack_sent_cnt') while asserting 'non_data_seq_adv = 1'b1'.
       MGMT frames with verified Header CRC-16 ('eff_hdr_ok == 1'b1') but failed
       Payload CRC-32 ('pld_crc_ok == 1'b0') emit NAK ('local_fb_ack = 1'b0',
       incrementing 'nak_sent_cnt') without advancing 'non_data_seq_adv'.
    2. [Fix OISL-MGMT-001 Trusted Header Identity]: Added internal header context
       registers ('hdr_ctx_valid', 'hdr_ok_latched', 'txfn_latched', 'ftype_latched')
       captured on 'hdr_check_done' (with transparent combinational fallback for
       single-cycle unit tests) so corrupted headers ('!eff_hdr_ok') with untrusted
       TXFN never trigger false NAKs or false sequence advancements.
    3. [Fix OISL-MGMT-001 64-Entry MGMT History & Out-of-Window Stale Protection]:
       Tracked the last 64 valid MGMT transactions ('mgmt_hist_txfn[0:63]') with
       modular 16-bit sequence age bounding ('MAX_MGMT_AGE_FRAMES = 16'd24576').
       Duplicate in-window MGMT retransmissions (e.g., A -> B -> A) re-emit ACK to
       free the transmitter tracker, whereas stale out-of-window MGMT frames are
       ignored without corrupting sequence tracking across 16-bit TXFN wrap-around.
===========================================================================
*/

module arq_rx_controller (
    input  wire        clk,
    input  wire        rst_n,

    // Inputs from deframer_header
    input  wire        hdr_check_done,
    input  wire        hdr_crc_ok,
    input  wire [15:0] rx_txfn,
    input  wire [15:0] rx_rxfn,
    input  wire        rx_ack,
    input  wire        rx_ack_valid,
    input  wire [1:0]  rx_frame_type,

    // Inputs from deframer_payload
    input  wire        pld_check_done,
    input  wire        pld_crc_ok,

    // Output 1: Peer ARQ Feedback (Forwarded to Local TX arq_tx_controller)
    output reg  [15:0] peer_rxfn_out,
    output reg         peer_ack_out,
    output reg         peer_ack_valid_out,

    // Output 2: Local RX ACK/NAK Feedback (To Local TX Header Generator)
    output reg  [15:0] local_fb_rxfn,
    output reg         local_fb_ack,
    output reg         local_fb_ack_valid,

    // Output 3: Control Commands to Selective Repeat Reorder Buffer
    output reg         non_data_seq_adv,
    output reg  [15:0] non_data_txfn,
    output reg  [15:0] ack_sent_cnt,
    output reg  [15:0] nak_sent_cnt
);

    // =======================================================
    // [Rev 3.1 - Fix OISL-MGMT-001] HEADER CONTEXT LATCH & 64-ENTRY MGMT WINDOW
    // Preserves Header CRC-16, TXFN, and Frame Type from hdr_check_done to
    // pld_check_done while remaining 100% compatible with direct pld_check_done tests.
    // =======================================================
    localparam [15:0] MAX_MGMT_AGE_FRAMES = 16'd24576; // Exceeds (5+1)*4080 = 24,480 max ARQ lifetime

    reg        hdr_ctx_valid;
    reg        hdr_ok_latched;
    reg [15:0] txfn_latched;
    reg [1:0]  ftype_latched;

    wire        eff_hdr_ok = hdr_check_done ? hdr_crc_ok    : (hdr_ctx_valid ? hdr_ok_latched : hdr_crc_ok);
    wire [15:0] eff_txfn   = hdr_check_done ? rx_txfn       : (hdr_ctx_valid ? txfn_latched   : rx_txfn);
    wire [1:0]  eff_ftype  = hdr_check_done ? rx_frame_type : (hdr_ctx_valid ? ftype_latched  : rx_frame_type);

    reg        mgmt_hist_valid [0:63];
    reg [15:0] mgmt_hist_txfn  [0:63];
    reg [5:0]  mgmt_hist_wr_ptr;
    reg        seq_anchor_valid;
    reg [15:0] highest_rx_txfn;
    integer    mh_i;

    wire [15:0] seq_ahead_dist  = eff_txfn - highest_rx_txfn;
    wire [15:0] seq_behind_dist = highest_rx_txfn - eff_txfn;
    wire        is_forward_seq  = (!seq_anchor_valid) || (seq_ahead_dist < 16'h8000);
    wire        is_past_seq     = seq_anchor_valid && (seq_ahead_dist >= 16'h8000);
    wire        mgmt_is_stale   = is_past_seq && (seq_behind_dist > MAX_MGMT_AGE_FRAMES);

    reg         mgmt_is_dup_hit;
    always @(*) begin
        mgmt_is_dup_hit = 1'b0;
        for (mh_i = 0; mh_i < 64; mh_i = mh_i + 1) begin
            if (mgmt_hist_valid[mh_i] && (mgmt_hist_txfn[mh_i] == eff_txfn)) begin
                mgmt_is_dup_hit = 1'b1;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            peer_rxfn_out      <= 16'd0;
            peer_ack_out       <= 1'b0;
            peer_ack_valid_out <= 1'b0;
            local_fb_rxfn      <= 16'd0;
            local_fb_ack       <= 1'b0;
            local_fb_ack_valid <= 1'b0;
            non_data_seq_adv   <= 1'b0;
            non_data_txfn      <= 16'd0;
            ack_sent_cnt       <= 16'd0;
            nak_sent_cnt       <= 16'd0;
            hdr_ctx_valid      <= 1'b0;
            hdr_ok_latched     <= 1'b0;
            txfn_latched       <= 16'd0;
            ftype_latched      <= 2'd0;
            mgmt_hist_wr_ptr   <= 6'd0;
            seq_anchor_valid   <= 1'b0;
            highest_rx_txfn    <= 16'd0;
            for (mh_i = 0; mh_i < 64; mh_i = mh_i + 1) begin
                mgmt_hist_valid[mh_i] <= 1'b0;
                mgmt_hist_txfn[mh_i]  <= 16'd0;
            end
        end else begin
            peer_ack_valid_out <= 1'b0;
            local_fb_ack_valid <= 1'b0;
            non_data_seq_adv   <= 1'b0;

            // Capture Header context when hdr_check_done asserts
            if (hdr_check_done) begin
                hdr_ctx_valid  <= !pld_check_done;
                hdr_ok_latched <= hdr_crc_ok;
                txfn_latched   <= rx_txfn;
                ftype_latched  <= rx_frame_type;
            end else if (pld_check_done) begin
                hdr_ctx_valid  <= 1'b0;
            end

            // 1. Forward incoming peer ACK/NAK from verified Header to local TX Controller
            if (hdr_check_done && hdr_crc_ok && rx_ack_valid) begin
                peer_rxfn_out      <= rx_rxfn;
                peer_ack_out       <= rx_ack;
                peer_ack_valid_out <= 1'b1;
            end

            // 2. Evaluate local Payload CRC-32 result & generate outgoing ACK/NAK
            if (pld_check_done) begin
                if (!eff_hdr_ok) begin
                    // Header was corrupted: cannot trust rx_txfn (never emit false NAK/ACK)
                    local_fb_ack_valid <= 1'b0;
                end else begin
                    // Update highest verified sequence anchor and age-out expired MGMT history entries
                    if (pld_crc_ok && is_forward_seq) begin
                        seq_anchor_valid <= 1'b1;
                        highest_rx_txfn  <= eff_txfn;
                        for (mh_i = 0; mh_i < 64; mh_i = mh_i + 1) begin
                            if (mgmt_hist_valid[mh_i] &&
                                ((eff_txfn - mgmt_hist_txfn[mh_i]) > MAX_MGMT_AGE_FRAMES)) begin
                                mgmt_hist_valid[mh_i] <= 1'b0;
                            end
                        end
                    end

                    if (eff_ftype == 2'b01) begin
                        // DATA Frame: Generate ACK (1) on CRC-32 Pass, or NAK (0) on CRC-32 Fail
                        local_fb_rxfn      <= eff_txfn;
                        local_fb_ack       <= pld_crc_ok;
                        local_fb_ack_valid <= 1'b1;

                        if (pld_crc_ok)
                            ack_sent_cnt <= ack_sent_cnt + 16'd1;
                        else
                            nak_sent_cnt <= nak_sent_cnt + 16'd1;
                    end else if (eff_ftype == 2'b10) begin
                        // [Rev 3.1 - Fix OISL-MGMT-001] MGMT Frame (2'b10):
                        // Generate ACK (1) on CRC-32 Pass, or NAK (0) on CRC-32 Fail (if within age window)
                        if (!mgmt_is_stale) begin
                            local_fb_rxfn      <= eff_txfn;
                            local_fb_ack       <= pld_crc_ok;
                            local_fb_ack_valid <= 1'b1;

                            if (pld_crc_ok) begin
                                ack_sent_cnt <= ack_sent_cnt + 16'd1;
                                if (!mgmt_is_dup_hit) begin
                                    mgmt_hist_valid[mgmt_hist_wr_ptr] <= 1'b1;
                                    mgmt_hist_txfn[mgmt_hist_wr_ptr]  <= eff_txfn;
                                    mgmt_hist_wr_ptr                  <= mgmt_hist_wr_ptr + 6'd1;
                                    non_data_seq_adv                  <= 1'b1;
                                    non_data_txfn                     <= eff_txfn;
                                end
                            end else begin
                                nak_sent_cnt <= nak_sent_cnt + 16'd1;
                            end
                        end
                    end else if (pld_crc_ok) begin
                        // Verified IDLE (2'b00) frame:
                        // Notify Reorder Buffer to advance expected_txfn if it matches rx_txfn
                        non_data_seq_adv <= 1'b1;
                        non_data_txfn    <= eff_txfn;
                    end
                end
            end
        end
    end

endmodule