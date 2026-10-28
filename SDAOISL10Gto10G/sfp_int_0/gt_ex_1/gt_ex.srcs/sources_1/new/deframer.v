`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : deframer
Description  : Sub-Top Deframer Module.
               Connects the 4 core pillars of the FSO Deframer:
               1. deframer_header    (CRC-16 Check & Header Parser)
               2. deframer_payload   (CRC-32 Check & Store-and-Verify FIFO)
               3. arq_rx_controller  (Control Plane: Selective Repeat ARQ)
               4. frame_demultiplexer(Data Plane: IDLE, MGMT & DATA Reorder)

               Revision History:
               - Rev 1.0 (Initial) : 4-pillar FSO Deframer sub-top integration.
               - Rev 1.1 (2026-10-22 07:01 KST) :
                 1. Updated timescale to 1ns/1ps for project-wide consistency.
                 2. Added combinational bypass on hdr_check_done for ingress 
                    context (ing_hdr_ok, ing_txfn, ing_ftype) so u_arq_rx_controller 
                    and u_deframer_payload see the new frame's TXFN and FRAME_TYPE 
                    on the exact cycle hdr_check_done asserts (zero 1-cycle lag).
                 3. Added dedicated egress context registers (egr_txfn, egr_ftype) 
                    latched on pld_check_done so u_frame_demultiplexer retains 
                    the draining frame's metadata across all 477 words even if 
                    the next frame's header arrives early.
===========================================================================
*/

module deframer (
    input  wire        clk,
    input  wire        rst_n,

    // Inputs from CDC 4 (rx_logic_gth @ 312.5 MHz)
    input  wire        header_dv,
    input  wire [7:0]  header_in,
    input  wire        payload_dv,
    input  wire [31:0] payload_in,

    // In-Order 1908-Byte DATA Output to ethernet_frame_reassembly
    output wire [31:0] m_axis_fso_tdata,
    output wire        m_axis_fso_tvalid,
    output wire        m_axis_fso_tlast,
    input  wire        m_axis_fso_tready,

    // ARQ Feedback Outputs (To Local TX Encoder / ARQ TX Controller)
    output wire [15:0] local_fb_rxfn,
    output wire        local_fb_ack,
    output wire        local_fb_ack_valid,
    output wire [15:0] peer_rxfn_out,
    output wire        peer_ack_out,
    output wire        peer_ack_valid_out,

    // Extracted Header & MGMT Telemetry Outputs
    output wire        hdr_crc_ok,
    output wire        pld_crc_ok,
    output wire [15:0] rx_txfn,
    output wire [1:0]  rx_frame_type,
    output wire [39:0] rx_tx_ts,
    output wire [3:0]  rx_fcch_op,
    output wire [15:0] rx_fcch_pl,
    output wire [63:0] mgmt_range_meters,
    output wire        mgmt_telemetry_valid,
    output wire [15:0] expected_txfn
);

    wire        hdr_check_done;
    wire [15:0] rx_rxfn;
    wire        rx_ack;
    wire        rx_ack_valid;
    wire [5:0]  rx_tod_sec;
    wire [2:0]  rx_ts_applies;
    wire [15:0] rx_hdr_crc16;

    wire        pld_check_done;
    wire [31:0] verified_pld_tdata;
    wire        verified_pld_tvalid;
    wire        verified_pld_tlast;

    wire        non_data_seq_adv;
    wire [15:0] non_data_txfn;

    // 1. Ingress Header Context (Valid from hdr_check_done through pld_check_done)
    reg         latched_hdr_ok;
    reg  [15:0] latched_txfn;
    reg  [1:0]  latched_ftype;

    // 2. Egress Drain Context (Valid across the 477-word verified_pld_tvalid drain)
    reg  [15:0] egr_txfn;
    reg  [1:0]  egr_ftype;

    wire        active_ing_hdr_ok = hdr_check_done ? hdr_crc_ok    : latched_hdr_ok;
    wire [15:0] active_ing_txfn   = hdr_check_done ? rx_txfn       : latched_txfn;
    wire [1:0]  active_ing_ftype  = hdr_check_done ? rx_frame_type : latched_ftype;

    wire [15:0] active_egr_txfn   = pld_check_done ? active_ing_txfn  : egr_txfn;
    wire [1:0]  active_egr_ftype  = pld_check_done ? active_ing_ftype : egr_ftype;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            latched_hdr_ok <= 1'b0;
            latched_txfn   <= 16'd0;
            latched_ftype  <= 2'd0;
            egr_txfn       <= 16'd0;
            egr_ftype      <= 2'd0;
        end else begin
            if (hdr_check_done) begin
                latched_hdr_ok <= hdr_crc_ok;
                latched_txfn   <= rx_txfn;
                latched_ftype  <= rx_frame_type;
            end
            if (pld_check_done) begin
                egr_txfn  <= active_ing_txfn;
                egr_ftype <= active_ing_ftype;
            end
        end
    end

    // 1. Header Deframer
    deframer_header u_deframer_header (
        .clk            (clk),
        .rst_n          (rst_n),
        .header_dv      (header_dv),
        .header_in      (header_in),
        .hdr_check_done (hdr_check_done),
        .hdr_crc_ok     (hdr_crc_ok),
        .rx_txfn        (rx_txfn),
        .rx_rxfn        (rx_rxfn),
        .rx_ack         (rx_ack),
        .rx_ack_valid   (rx_ack_valid),
        .rx_frame_type  (rx_frame_type),
        .rx_tx_ts       (rx_tx_ts),
        .rx_tod_sec     (rx_tod_sec),
        .rx_ts_applies  (rx_ts_applies),
        .rx_fcch_op     (rx_fcch_op),
        .rx_fcch_pl     (rx_fcch_pl),
        .rx_hdr_crc16   (rx_hdr_crc16)
    );

    // 2. Payload Deframer
    deframer_payload u_deframer_payload (
        .clk               (clk),
        .rst_n             (rst_n),
        .payload_dv        (payload_dv),
        .payload_in        (payload_in),
        .hdr_crc_ok        (active_ing_hdr_ok),
        .rx_txfn           (active_ing_txfn),
        .pld_check_done    (pld_check_done),
        .pld_crc_ok        (pld_crc_ok),
        .m_axis_pld_tdata  (verified_pld_tdata),
        .m_axis_pld_tvalid (verified_pld_tvalid),
        .m_axis_pld_tlast  (verified_pld_tlast)
    );

    // 3. Control Plane: Selective Repeat ARQ RX Controller
    arq_rx_controller u_arq_rx_controller (
        .clk                (clk),
        .rst_n              (rst_n),
        .hdr_check_done     (hdr_check_done),
        .hdr_crc_ok         (hdr_crc_ok),
        .rx_txfn            (active_ing_txfn),
        .rx_rxfn            (rx_rxfn),
        .rx_ack             (rx_ack),
        .rx_ack_valid       (rx_ack_valid),
        .rx_frame_type      (active_ing_ftype),
        .pld_check_done     (pld_check_done),
        .pld_crc_ok         (pld_crc_ok),
        .peer_rxfn_out      (peer_rxfn_out),
        .peer_ack_out       (peer_ack_out),
        .peer_ack_valid_out (peer_ack_valid_out),
        .local_fb_rxfn      (local_fb_rxfn),
        .local_fb_ack       (local_fb_ack),
        .local_fb_ack_valid (local_fb_ack_valid),
        .non_data_seq_adv   (non_data_seq_adv),
        .non_data_txfn      (non_data_txfn),
        .ack_sent_cnt       (),
        .nak_sent_cnt       ()
    );

    // 4. Data Plane: Frame Demultiplexer & Selective Repeat Reorder Buffer
    frame_demultiplexer u_frame_demultiplexer (
        .clk                    (clk),
        .rst_n                  (rst_n),
        .s_axis_pld_tdata       (verified_pld_tdata),
        .s_axis_pld_tvalid      (verified_pld_tvalid),
        .s_axis_pld_tlast       (verified_pld_tlast),
        .rx_frame_type          (active_egr_ftype),
        .rx_txfn                (active_egr_txfn),
        .non_data_seq_adv       (non_data_seq_adv),
        .non_data_txfn          (non_data_txfn),
        .m_axis_data_tdata      (m_axis_fso_tdata),
        .m_axis_data_tvalid     (m_axis_fso_tvalid),
        .m_axis_data_tlast      (m_axis_fso_tlast),
        .m_axis_data_tready     (m_axis_fso_tready),
        .mgmt_rx_phy_ts_sec     (),
        .mgmt_rx_phy_ts_picosec (),
        .mgmt_tx_phy_ts_sec     (),
        .mgmt_tx_phy_ts_picosec (),
        .mgmt_range_meters      (mgmt_range_meters),
        .mgmt_range_ts_sec      (),
        .mgmt_range_ts_picosec  (),
        .mgmt_ts_valid          (),
        .mgmt_telemetry_valid   (mgmt_telemetry_valid),
        .expected_txfn          (expected_txfn),
        .idle_frame_cnt         (),
        .mgmt_frame_cnt         ()
    );

endmodule