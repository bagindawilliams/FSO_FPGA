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
                  [10:0] output port to propagate exact ingress packet/segment 
                  byte length metadata to sda_encoder -> ethernet_fso_framer -> 
                  fso_payload_top -> fso_payload.
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

    // Segmented 1900-Byte FSO Payload Stream & Length Metadata Output to sda_encoder
    output wire [31:0] fso_data_out,
    output wire        fso_valid,
    output wire        fso_last,
    input  wire        fso_ready,
    output wire [10:0] seg_valid_bytes, // [Rev 2.2] Dynamic packet/segment length metadata

    // Physical SFP+ & Clocking Ports for 10G PCS/PMA RX IP Core
    input  wire        refclk_p,
    input  wire        refclk_n,
    input  wire        reset,
    input  wire        dclk,
    input  wire        rxp,
    input  wire        rxn
);

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
                .qplloutclk_out         (),
                .qplloutrefclk_out      (),
                .qplllock_out           (),
                .txusrclk_out           (),
                .txusrclk2_out          (),
                .areset_datapathclk_out (),
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
                .configuration_vector   (536'd0),
                .status_vector          (),
                .core_status            (),
                .resetdone_out          (),
                .signal_detect          (1'b1),
                .tx_fault               (1'b0),
                .drp_req                (drp_gnt_w),
                .drp_gnt                (drp_gnt_w),
                .drp_den_o              (drp_den_w),
                .drp_dwe_o              (drp_dwe_w),
                .drp_daddr_o            (drp_daddr_w),
                .drp_di_o               (drp_di_w),
                .drp_drdy_o             (drp_drdy_w),
                .drp_drpdo_o            (drp_drpdo_w),
                .drp_den_i              (drp_den_w),
                .drp_dwe_i              (drp_dwe_w),
                .drp_daddr_i            (drp_daddr_w),
                .drp_di_i               (drp_di_w),
                .drp_drdy_i             (drp_drdy_w),
                .drp_drpdo_i            (drp_drpdo_w),
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

    // Stage 1: 32-bit XGMII Receive Frame Delimiter Parser (/S/ 0xFB & /T/ 0xFD)
    wire [31:0] parsed_tdata;
    wire        parsed_tvalid;
    wire        parsed_tlast;
    wire        parsed_tready;

    xgmii_rx_parser u_rx_parser (
        .clk           (clk),
        .rst_n         (rst_n),
        .xgmii_rxd     (active_xgmii_rxd),
        .xgmii_rxc     (active_xgmii_rxc),
        .m_axis_tdata  (parsed_tdata),
        .m_axis_tvalid (parsed_tvalid),
        .m_axis_tlast  (parsed_tlast)
    );

    // Stage 2: 8-Byte Ethernet Preamble & SFD (0x55..0xD5) Remover
    wire [31:0] clean_mac_tdata;
    wire        clean_mac_tvalid;
    wire        clean_mac_tlast;
    wire        clean_mac_tready;

    eth_preamble_remover u_preamble_remover (
        .clk           (clk),
        .rst_n         (rst_n),
        .s_axis_tdata  (parsed_tdata),
        .s_axis_tvalid (parsed_tvalid),
        .s_axis_tlast  (parsed_tlast),
        .s_axis_tready (parsed_tready),
        .m_axis_tdata  (clean_mac_tdata),
        .m_axis_tvalid (clean_mac_tvalid),
        .m_axis_tlast  (clean_mac_tlast),
        .m_axis_tready (clean_mac_tready)
    );

    // Stage 3: Fixed 1900-Byte (475-Word) FSO Payload Segmentation & Padding
    packaging_and_segmentation u_segmenter (
        .clk             (clk),
        .rst_n           (rst_n),
        .s_axis_tdata    (clean_mac_tdata),
        .s_axis_tvalid   (clean_mac_tvalid),
        .s_axis_tlast    (clean_mac_tlast),
        .s_axis_tready   (clean_mac_tready),
        .m_axis_tdata    (fso_data_out),
        .m_axis_tvalid   (fso_valid),
        .m_axis_tlast    (fso_last),
        .m_axis_tready   (fso_ready),
        .seg_valid_bytes (seg_valid_bytes)
    );

endmodule