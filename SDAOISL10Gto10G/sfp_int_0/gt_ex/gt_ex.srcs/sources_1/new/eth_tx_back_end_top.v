`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : eth_tx_back_end_top
Description  : 10G Ethernet Transmit Back-End Top Module (Egress to PC 2).
               Integrates the MAC Transmit Stream Packer, the 32-bit XGMII 
               Formatter, and the Xilinx 10G Ethernet PCS/PMA IP Core 
               (eth_10g_pcs_pma_tx_0.xci).
               
               Revision Notes:
               1. Aligned hierarchy with handwritten system architecture:
                  eth_preamble_gen and mux_eth_32 are now housed inside 
                  ethernet_frame_reassembly.v, while eth_tx_back_end_top.v 
                  houses eth_mac_packing_tx, xgmii_tx_formatter, and 
                  eth_10g_pcs_pma_tx_0.
               2. Added RUN_MODE parameter (1 = Simulation Mode, 0 = Hardware 
                  SFP+ Mode) using a generate block to mirror eth_rx_front_end_top.v.
               3. Encapsulated ILA 3 (RX & PC 2 Egress Stage) telemetry 
                  registers (dbg_pc2_xgmii_txd, dbg_pc2_xgmii_txc, 
                  dbg_rx_eth_byte_cnt, dbg_rx_eth_pkt_cnt) inside this module 
                  so SDAOISL10Gto10G_top schematic remains 100% clean.
               4. Connected exact eth_10g_pcs_pma_tx_0 port list including 
                  configuration_vector(536'd0), pma_pmd_type(3'b101), and 
                  internal DRP loopback (drp_req -> drp_gnt, drp_*_o -> drp_*_i) 
                  so the 10G PCS/PMA core completes hardware reset properly.
               5. [Rev 2026-10-22 07:09 KST]: Updated timescale precision to 
                  1ns/1ps for project-wide simulation consistency.
===========================================================================
*/

module eth_tx_back_end_top #(
    parameter RUN_MODE = 1 // 1 = Simulation Mode, 0 = Hardware SFP+ Mode
)(
    input  wire        clk,       // 312.5 MHz Clock
    input  wire        rst_n,     // Active-low reset
    
    // Input 1922 Byte / 2008 Byte Reassembled Ethernet Frame from ethernet_frame_reassembly
    input  wire [31:0] data_in,
    input  wire        en,
    
    // Output menuju Simulasi Testbench (XGMII Probing Output)
    output wire [31:0] xgmii_txd,
    output wire [3:0]  xgmii_txc,

    // Port SFP+ & Clocking Fisik untuk IP Core
    input  wire        refclk_p,
    input  wire        refclk_n,
    input  wire        reset,
    input  wire        dclk,
    output wire        txp,
    output wire        txn
);

    wire [31:0] pack_data;
    wire        pack_valid;
    wire [15:0] tx_word_cnt;
    wire [15:0] tx_byte_cnt;

    wire [31:0] xgmii_txd_wire;
    wire [3:0]  xgmii_txc_wire;

    // 1. Dynamic MAC Stream Packer (Packing and Segmentation)
    eth_mac_packing_tx u_packing (
        .clk         (clk),
        .rst_n       (rst_n),
        .mux_data    (data_in),
        .mux_valid   (en),
        .pack_data   (pack_data),
        .pack_valid  (pack_valid),
        .tx_word_cnt (tx_word_cnt),
        .tx_byte_cnt (tx_byte_cnt)
    );

    // 2. IEEE 802.3ae 32-bit XGMII Transmit Formatter
    xgmii_tx_formatter u_formatter (
        .clk       (clk),
        .rst_n     (rst_n),
        .mac_data  (pack_data),
        .mac_valid (pack_valid),
        .xgmii_txd (xgmii_txd_wire),
        .xgmii_txc (xgmii_txc_wire)
    );

    // CABANG 1: Teruskan ke pin output untuk Testbench Simulasi
    assign xgmii_txd = xgmii_txd_wire;
    assign xgmii_txc = xgmii_txc_wire;

    // =========================================================================
    // CABANG 2: IP Core 10G Ethernet PCS/PMA (Pemancar Optik SFP+ ke PC 2)
    //           Synthesized in Hardware Mode (RUN_MODE == 0)
    // =========================================================================
    generate
        if (RUN_MODE == 0) begin : gen_hw_eth_phy_tx
            wire        drp_gnt_w;
            wire        drp_den_w;
            wire        drp_dwe_w;
            wire [15:0] drp_daddr_w;
            wire [15:0] drp_di_w;
            wire        drp_drdy_w;
            wire [15:0] drp_drpdo_w;

            eth_10g_pcs_pma_tx_0 physical_mac_tx_inst (
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
                .xgmii_txd              (xgmii_txd_wire),
                .xgmii_txc              (xgmii_txc_wire),
                .xgmii_rxd              (),
                .xgmii_rxc              (),
                .txp                    (txp),
                .txn                    (txn),
                .rxp                    (1'b0),
                .rxn                    (1'b0),
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
        end else begin : gen_sim_eth_phy_tx_bypass
            assign txp = 1'b0;
            assign txn = 1'b1;
        end
    endgenerate

    // =========================================================================
    // 3. INTERNAL ILA 3 (u_ila_2) RX & PC 2 EGRESS TELEMETRY COUNTERS
    //    Housed inside eth_tx_back_end_top so Top Schematic stays clean!
    // =========================================================================
    (* mark_debug = "true", dont_touch = "true" *) reg [31:0] dbg_pc2_xgmii_txd;
    (* mark_debug = "true", dont_touch = "true" *) reg [3:0]  dbg_pc2_xgmii_txc;
    (* mark_debug = "true", dont_touch = "true" *) reg [15:0] dbg_rx_eth_byte_cnt;
    (* mark_debug = "true", dont_touch = "true" *) reg [15:0] dbg_rx_eth_pkt_cnt;

    wire xgmii_is_active = (xgmii_txd_wire != 32'h0707_0707);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            dbg_pc2_xgmii_txd   <= 32'h0707_0707;
            dbg_pc2_xgmii_txc   <= 4'b1111;
            dbg_rx_eth_byte_cnt <= 16'd0;
            dbg_rx_eth_pkt_cnt  <= 16'd0;
        end else begin
            dbg_pc2_xgmii_txd <= xgmii_txd_wire;
            dbg_pc2_xgmii_txc <= xgmii_txc_wire;

            if (xgmii_is_active) begin
                dbg_rx_eth_byte_cnt <= dbg_rx_eth_byte_cnt + 16'd4;
                if (xgmii_txd_wire == 32'h0707_07FD) begin
                    dbg_rx_eth_pkt_cnt <= dbg_rx_eth_pkt_cnt + 16'd1;
                end
            end else begin
                dbg_rx_eth_byte_cnt <= 16'd0;
            end
        end
    end

endmodule