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
        end else begin
            peer_ack_valid_out <= 1'b0;
            local_fb_ack_valid <= 1'b0;
            non_data_seq_adv   <= 1'b0;

            // 1. Forward incoming peer ACK/NAK from verified Header to local TX Controller
            if (hdr_check_done && hdr_crc_ok && rx_ack_valid) begin
                peer_rxfn_out      <= rx_rxfn;
                peer_ack_out       <= rx_ack;
                peer_ack_valid_out <= 1'b1;
            end

            // 2. Evaluate local Payload CRC-32 result & generate outgoing ACK/NAK
            if (pld_check_done) begin
                if (!hdr_crc_ok) begin
                    // Header was corrupted: cannot trust rx_txfn
                    local_fb_ack_valid <= 1'b0;
                end else if (rx_frame_type == 2'b01) begin
                    // DATA Frame: Generate ACK (1) on CRC-32 Pass, or NAK (0) on CRC-32 Fail
                    local_fb_rxfn      <= rx_txfn;
                    local_fb_ack       <= pld_crc_ok;
                    local_fb_ack_valid <= 1'b1;

                    if (pld_crc_ok)
                        ack_sent_cnt <= ack_sent_cnt + 16'd1;
                    else
                        nak_sent_cnt <= nak_sent_cnt + 16'd1;
                end else if (pld_crc_ok) begin
                    // Verified IDLE (2'b00) or MGMT (2'b10) frame:
                    // Notify Reorder Buffer to advance expected_txfn if it matches rx_txfn
                    non_data_seq_adv <= 1'b1;
                    non_data_txfn    <= rx_txfn;
                end
            end
        end
    end

endmodule