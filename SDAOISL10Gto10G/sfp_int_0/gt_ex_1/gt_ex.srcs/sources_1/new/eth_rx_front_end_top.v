`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : eth_rx_front_end_top
Description  : Top-Level 10G Ethernet Receive Front-End (Ingress from PC 1).
               Integrates the 10G Ethernet PCS/PMA RX IP Core, 32-bit XGMII 
               Parser, Ethernet Preamble & SFD Remover, and Fixed 1900-Byte 
               FSO Payload Packaging & Segmentation unit.

               Revision Notes:
               1. Preserved all original architecture descriptions.
               2. Wrapped eth_10g_pcs_pma_rx_0 inside a generate block 
                  controlled by RUN_MODE (1 = Simulation / XGMII Direct Input, 
                  0 = Hardware SFP+ Mode).
               3. Matched exact port connections on u_rx_parser 
                  (xgmii_rx_parser) and physical_mac_rx_inst 
                  (eth_10g_pcs_pma_rx_0 with DRP loopback and 
                  configuration_vector) so both SIM_MODE=1 and SIM_MODE=0 
                  synthesize cleanly without [Synth 8-11365].
               4. [Rev 2.2 - 2026-10-28 14:55 KST]: Exported 'seg_valid_bytes'
                  output port to propagate exact ingress packet/segment 
                  byte length metadata to sda_encoder.
               5. [Rev 2.5 - 2026-10-29 16:42 KST - Audit Fix R12]: Connected 
                  3-bit valid byte count ('parsed_tkeep_bytes' and 
                  'clean_mac_tkeep_bytes') from u_rx_parser -> u_preamble_remover 
                  -> u_segmenter for byte-accurate non-multiple-of-4 packets.
               6. [Rev 2.8 - 2026-10-30 11:30 KST - Audit Fix A18]: Standardized 
                  'seg_valid_bytes' output port width to 14 bits ([13:0]) to 
                  match packaging_and_segmentation.v and downstream modules 
                  with zero width-mismatch warnings.
               7. [Rev 3.0 - 2026-11-04 11:30 KST - Clean 1-File-Per-Module Separation]:
                  Extracted 'eth_rx_segment_cdc' into its own standalone source 
                  file (eth_rx_segment_cdc.v) and bound 'guard' (eth_packet_cdc) 
                  with fixed OUTPUT_PACKET_GAP_CYCLES = 0 inside the hardware 
                  branch (RUN_MODE == 0).
===========================================================================
*/

module eth_rx_front_end_top #(
    parameter RUN_MODE = 1 // 1 = Simulation / XGMII Direct Mode, 0 = Hardware SFP+ Mode
)(
    input  wire        clk,             // 312.5 MHz Clock
    input  wire        rst_n,           // Active-low reset

    // Direct XGMII Input (Used when RUN_MODE == 1)
    input  wire [31:0] xgmii_rxd,
    input  wire [3:0]  xgmii_rxc,

    // Segmented 1900-Byte FSO Payload Stream & 14-Bit Length Metadata Output to sda_encoder
    output wire [31:0] fso_data_out,
    output wire        fso_valid,
    output wire        fso_last,
    input  wire        fso_ready,
    output wire [13:0] seg_valid_bytes,

    // Physical SFP+ & Clocking Ports for 10G PCS/PMA RX IP Core
    input  wire        refclk_p,
    input  wire        refclk_n,
    input  wire        reset,
    input  wire        dclk,
    input  wire        rxp,
    input  wire        rxn
);

    wire phy_clk, phy_reset;
    wire datapath_clk;
    wire datapath_rst_n;
    generate if (RUN_MODE == 0) begin : native_clock
        assign datapath_clk = phy_clk;
        assign datapath_rst_n = rst_n && !phy_reset;
    end else begin : simulation_clock
        assign datapath_clk = clk;
        assign datapath_rst_n = rst_n;
    end endgenerate

    wire [31:0] active_xgmii_rxd;
    wire [3:0]  active_xgmii_rxc;

    generate
        if (RUN_MODE == 0) begin : gen_hw_eth_phy_rx
            wire [31:0] phy_xgmii_rxd;
            wire [3:0]  phy_xgmii_rxc;
            wire        txp_unused, txn_unused;
            wire        drp_gnt_w;
            wire        drp_den_w;
            wire        drp_dwe_w;
            wire [15:0] drp_daddr_w;
            wire [15:0] drp_di_w;
            wire        drp_drdy_w;
            wire [15:0] drp_drpdo_w;

            eth_10g_pcs_pma_rx_0 physical_mac_rx_inst (
                .dclk                   (dclk),
                .rxrecclk_out           (),
                .refclk_p               (refclk_p),
                .refclk_n               (refclk_n),
                .sim_speedup_control    (1'b0),
                .coreclk_out            (),
                .qpll0outclk_out         (),
                .qpll0outrefclk_out      (),
                .qpll0lock_out           (),
                .txusrclk_out           (),
                .txusrclk2_out          (phy_clk),
                .areset_datapathclk_out (phy_reset),
                .areset_coreclk_out     (),
                .gttxreset_out          (),
                .gtrxreset_out          (),
                .txuserrdy_out          (),
                .reset_counter_done_out (),
                .reset                  (reset),
                .xgmii_txd              (32'h0707_0707),
                .xgmii_txc              (4'b1111),
                .xgmii_rxd              (phy_xgmii_rxd),
                .xgmii_rxc              (phy_xgmii_rxc),
                .txp                    (txp_unused),
                .txn                    (txn_unused),
                .rxp                    (rxp),
                .rxn                    (rxn),
                // MDIO is enabled in the generated XCI. No management transactions:
                // MDC idle low, pulled-up MDIO, PHY address zero; reset defaults apply.
                .mdc                    (1'b0),
                .mdio_in                (1'b1),
                .mdio_out               (),
                .mdio_tri               (),
                .prtad                  (5'd0),
                .core_status            (),
                .resetdone_out          (),
                .signal_detect          (1'b1),
                .tx_fault               (1'b0),
                .drp_req                (drp_gnt_w),
                .drp_gnt                (drp_gnt_w),
                .core_to_gt_drpen       (drp_den_w),
                .core_to_gt_drpwe       (drp_dwe_w),
                .core_to_gt_drpaddr     (drp_daddr_w),
                .core_to_gt_drpdi       (drp_di_w),
                .gt_drprdy              (drp_drdy_w),
                .gt_drpdo               (drp_drpdo_w),
                .gt_drpen               (drp_den_w),
                .gt_drpwe               (drp_dwe_w),
                .gt_drpaddr             (drp_daddr_w),
                .gt_drpdi               (drp_di_w),
                .core_to_gt_drprdy      (drp_drdy_w),
                .core_to_gt_drpdo       (drp_drpdo_w),
                .pma_pmd_type           (3'b101),
                .tx_disable             ()
            );

            assign active_xgmii_rxd = phy_xgmii_rxd;
            assign active_xgmii_rxc = phy_xgmii_rxc;
        end else begin : gen_sim_eth_phy_rx_bypass
            assign active_xgmii_rxd = xgmii_rxd;
            assign active_xgmii_rxc = xgmii_rxc;
        end
    endgenerate

    wire [31:0] segment_data;
    wire        segment_valid, segment_last, segment_ready;
    wire [13:0] segment_bytes;
    generate if (RUN_MODE == 0) begin : stream_cdc
        eth_rx_segment_cdc bridge (
            .s_clk   (datapath_clk),
            .m_clk   (clk),
            .rst_n   (datapath_rst_n),
            .s_data  (segment_data),
            .s_valid (segment_valid),
            .s_last  (segment_last),
            .s_bytes (segment_bytes),
            .s_ready (segment_ready),
            .m_data  (fso_data_out),
            .m_valid (fso_valid),
            .m_last  (fso_last),
            .m_bytes (seg_valid_bytes),
            .m_ready (fso_ready)
        );
    end else begin : stream_direct
        assign fso_data_out    = segment_data;
        assign fso_valid       = segment_valid;
        assign fso_last        = segment_last;
        assign seg_valid_bytes = segment_bytes;
        assign segment_ready   = fso_ready;
    end endgenerate

    // Stage 1: 32-bit XGMII Receive Frame Delimiter Parser (/S/ 0xFB & /T/ 0xFD)
    wire [31:0] parsed_tdata;
    wire        parsed_tvalid;
    wire        parsed_tlast;
    wire        parsed_tready;
    wire [2:0]  parsed_tkeep_bytes;

    xgmii_rx_parser u_rx_parser (
        .clk                (datapath_clk),
        .rst_n              (datapath_rst_n),
        .xgmii_rxd          (active_xgmii_rxd),
        .xgmii_rxc          (active_xgmii_rxc),
        .m_axis_tdata       (parsed_tdata),
        .m_axis_tvalid      (parsed_tvalid),
        .m_axis_tlast       (parsed_tlast),
        .m_axis_tkeep_bytes (parsed_tkeep_bytes)
    );

    wire [31:0] guarded_data;
    wire        guarded_valid, guarded_last;
    wire [2:0]  guarded_keep;
    generate if (RUN_MODE == 0) begin : ingress_admission
        wire [31:0] dropped_packets, overflow_words, underflow_count;
        eth_packet_cdc #(
            .DATA_WIDTH               (35),
            .END_ON_VALID_GAP         (0),
            .OUTPUT_PACKET_GAP_CYCLES (0)
        ) guard (
            .s_clk            (datapath_clk),
            .s_rst_n          (datapath_rst_n),
            .m_clk            (datapath_clk),
            .m_rst_n          (datapath_rst_n),
            .s_data           ({parsed_tkeep_bytes, parsed_tdata}),
            .s_valid          (parsed_tvalid),
            .s_last           (parsed_tlast),
            .m_data           ({guarded_keep, guarded_data}),
            .m_valid          (guarded_valid),
            .m_last           (guarded_last),
            .m_ready          (parsed_tready),
            .dropped_packets  (dropped_packets),
            .overflow_words   (overflow_words),
            .underflow_count  (underflow_count),
            .source_occupancy ()
        );
    end else begin : ingress_direct
        assign guarded_data  = parsed_tdata;
        assign guarded_valid = parsed_tvalid;
        assign guarded_last  = parsed_tlast;
        assign guarded_keep  = parsed_tkeep_bytes;
    end endgenerate

    // Stage 2: 8-Byte Ethernet Preamble & SFD (0x55..0xD5) Remover
    wire [31:0] clean_mac_tdata;
    wire        clean_mac_tvalid;
    wire        clean_mac_tlast;
    wire        clean_mac_tready;
    wire [2:0]  clean_mac_tkeep_bytes;

    eth_preamble_remover u_preamble_remover (
        .clk                (datapath_clk),
        .rst_n              (datapath_rst_n),
        .s_axis_tdata       (guarded_data),
        .s_axis_tvalid      (guarded_valid),
        .s_axis_tlast       (guarded_last),
        .s_axis_tready      (parsed_tready),
        .s_axis_tkeep_bytes (guarded_keep),
        .m_axis_tdata       (clean_mac_tdata),
        .m_axis_tvalid      (clean_mac_tvalid),
        .m_axis_tlast       (clean_mac_tlast),
        .m_axis_tready      (clean_mac_tready),
        .m_axis_tkeep_bytes (clean_mac_tkeep_bytes)
    );

    // Stage 3: Fixed 1900-Byte (475-Word) FSO Payload Segmentation & Padding
    packaging_and_segmentation u_segmenter (
        .clk                (datapath_clk),
        .rst_n              (datapath_rst_n),
        .s_axis_tdata       (clean_mac_tdata),
        .s_axis_tvalid      (clean_mac_tvalid),
        .s_axis_tlast       (clean_mac_tlast),
        .s_axis_tready      (clean_mac_tready),
        .s_axis_tkeep_bytes (clean_mac_tkeep_bytes),
        .m_axis_tdata       (segment_data),
        .m_axis_tvalid      (segment_valid),
        .m_axis_tlast       (segment_last),
        .m_axis_tready      (segment_ready),
        .seg_valid_bytes    (segment_bytes)
    );

endmodule