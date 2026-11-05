`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : eth_tx_back_end_top
Description  : Top-Level 10G Ethernet Transmit Back-End (Egress to PC 2).
               Integrates the Ethernet MAC TX Packing Buffer, 32-bit XGMII 
               TX Formatter (/S/ 0xFB & /T/ 0xFD), 10G Ethernet PCS/PMA TX 
               IP Core, and ChipScope ILA 3 (u_ila_2) telemetry counters.

               Revision Notes:
               1. Preserved all original architecture descriptions.
               2. Wrapped eth_10g_pcs_pma_tx_0 inside a generate block 
                  controlled by RUN_MODE (1 = Simulation / XGMII Direct Output, 
                  0 = Hardware SFP+ Mode).
               3. Placed ILA 3 (u_ila_2) telemetry registers inside this 
                  sub-module so SDAOISL10Gto10G_top remains 100% structural.
               4. Connected DRP loopback and configuration_vector on 
                  physical_mac_tx_inst so the 10G PCS/PMA core completes 
                  hardware reset properly.
               5. [Rev 2026-10-22 07:09 KST]: Updated timescale precision to 
                  1ns/1ps for project-wide simulation consistency.
               6. [Rev 2.4 - 2026-10-29 13:07 KST - Deep Audit Section 6 Fix]:
                  Updated 'xgmii_is_active' detection from '(xgmii_txd != 32'h0707_0707)'
                  to '(xgmii_txc_wire != 4'b1111)' so legal Ethernet payload words 
                  matching 0x07070707 (with TXC == 4'b0000) are counted accurately.
               7. [Rev 2.5 - 2026-10-29 15:19 KST - Audit Fix R01 & R14]:
                  Restored exact child port connections on u_packing and u_formatter.
               8. [Rev 2.6 - 2026-10-30 00:55 KST - Audit Fix N09]:
                  Moved 'dbg_rx_eth_pkt_cnt' increment outside the 'if (xgmii_is_active)'
                  block and triggered it on the XGMII Terminate delimiter (/T/ = 0xFD,
                  where xgmii_txc_wire == 4'b1111 and xgmii_txd_wire[7:0] == 8'hFD, or any
                  control lane containing 8'hFD), ensuring backend_counter.sv counts every
                  transmitted Ethernet packet accurately.
               9. [Rev 2.9 - 2026-10-30 18:25 KST - Audit Fix B21 - Explicit Telemetry Counter Separation]:
                  Separated egress telemetry into three unambiguous metrics:
                    (a) 'dbg_rx_eth_pkt_cnt'       : Completed Ethernet packets (incremented on /T/).
                    (b) 'dbg_rx_eth_data_byte_cnt' : Pure Layer-2 Ethernet MAC frame bytes (DA..FCS,
                        excluding /S/, 8-Byte Preamble/SFD, and /T/ control lanes; counts 2,000B).
                    (c) 'dbg_rx_eth_byte_cnt'      : Active 32-bit XGMII bus-slot burst bytes
                        (includes 8B Preamble/SFD + MAC payload + 4B /T/ word = 2,012B).
               10. [Rev 3.0 - 2026-11-04 11:30 KST - Clean 1-File-Per-Module Separation & Hardware Egress Gap]:
                   Extracted 'eth_packet_cdc' into its own standalone source file 
                   (eth_packet_cdc.v) and bound the hardware egress bridge instance 
                   (active when RUN_MODE == 0) with OUTPUT_PACKET_GAP_CYCLES = 4 so 
                   xgmii_tx_formatter always receives 4 cycles of m_valid == 0 (1 cycle 
                   /T/ + 3 cycles IPG_WAIT) between back-to-back queued packets.
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

    wire [31:0] pack_data;
    wire        pack_valid;
    wire [15:0] tx_word_cnt;
    wire [15:0] tx_byte_cnt;

    wire [31:0] xgmii_txd_wire;
    wire [3:0]  xgmii_txc_wire;

    wire [31:0] native_data;
    wire        native_en;
    generate if (RUN_MODE == 0) begin : stream_cdc
        wire [31:0] dropped_packets, overflow_count, underflow_count;
        wire [12:0] source_occupancy;
        eth_packet_cdc #(
            .DATA_WIDTH               (32),
            .DATA_DEPTH               (4096),
            .MAX_PACKET_WORDS         (512),
            .END_ON_VALID_GAP         (1),
            .OUTPUT_PACKET_GAP_CYCLES (4)
        ) bridge (
            .s_clk            (clk),
            .s_rst_n          (rst_n),
            .m_clk            (datapath_clk),
            .m_rst_n          (datapath_rst_n),
            .s_data           (data_in),
            .s_valid          (en),
            .s_last           (1'b0),
            .m_data           (native_data),
            .m_valid          (native_en),
            .m_last           (),
            .m_ready          (1'b1),
            .dropped_packets  (dropped_packets),
            .overflow_words   (overflow_count),
            .underflow_count  (underflow_count),
            .source_occupancy (source_occupancy)
        );
    end else begin : stream_direct
        assign native_data = data_in;
        assign native_en   = en;
    end endgenerate

    // 1. Dynamic MAC Stream Packer (Packing and Segmentation)
    eth_mac_packing_tx u_packing (
        .clk         (datapath_clk),
        .rst_n       (datapath_rst_n),
        .mux_data    (native_data),
        .mux_valid   (native_en),
        .pack_data   (pack_data),
        .pack_valid  (pack_valid),
        .tx_word_cnt (tx_word_cnt),
        .tx_byte_cnt (tx_byte_cnt)
    );

    // 2. IEEE 802.3ae 32-bit XGMII Transmit Formatter
    xgmii_tx_formatter u_formatter (
        .clk       (datapath_clk),
        .rst_n     (datapath_rst_n),
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
                .xgmii_txd              (xgmii_txd_wire),
                .xgmii_txc              (xgmii_txc_wire),
                .xgmii_rxd              (),
                .xgmii_rxc              (),
                .txp                    (txp),
                .txn                    (txn),
                .rxp                    (1'b0),
                .rxn                    (1'b1),
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
    (* mark_debug = "true", dont_touch = "true" *) reg [15:0] dbg_rx_eth_byte_cnt;      // Active XGMII bus-slot bytes (4..2012)
    (* mark_debug = "true", dont_touch = "true" *) reg [15:0] dbg_rx_eth_pkt_cnt;       // Completed Ethernet packet count
    reg [15:0] dbg_rx_eth_data_byte_cnt; // [Rev 2.9 - Fix B21] Pure Layer-2 MAC bytes (DA..FCS = 2000B)
    reg [15:0] last_eth_data_byte_cnt;   // Latched Layer-2 MAC byte count of most recent completed packet
    reg [1:0]  preamble_word_skip;       // Skips first 2 words (8B Preamble/SFD) for pure MAC byte count

    wire       xgmii_is_active  = (xgmii_txc_wire != 4'b1111);
    wire [2:0] valid_data_lanes = (!xgmii_txc_wire[3]) + (!xgmii_txc_wire[2]) +
                                  (!xgmii_txc_wire[1]) + (!xgmii_txc_wire[0]);

    // [Rev 2.6 - Fix N09] Detect XGMII Terminate (/T/ = 0xFD) on any control lane
    wire xgmii_has_term = (xgmii_txc_wire[0] && (xgmii_txd_wire[7:0]   == 8'hFD)) ||
                          (xgmii_txc_wire[1] && (xgmii_txd_wire[15:8]  == 8'hFD)) ||
                          (xgmii_txc_wire[2] && (xgmii_txd_wire[23:16] == 8'hFD)) ||
                          (xgmii_txc_wire[3] && (xgmii_txd_wire[31:24] == 8'hFD));

    always @(posedge datapath_clk or negedge datapath_rst_n) begin
        if (!datapath_rst_n) begin
            dbg_pc2_xgmii_txd        <= 32'h0707_0707;
            dbg_pc2_xgmii_txc        <= 4'b1111;
            dbg_rx_eth_byte_cnt      <= 16'd0;
            dbg_rx_eth_pkt_cnt       <= 16'd0;
            dbg_rx_eth_data_byte_cnt <= 16'd0;
            last_eth_data_byte_cnt   <= 16'd0;
            preamble_word_skip       <= 2'd0;
        end else begin
            dbg_pc2_xgmii_txd <= xgmii_txd_wire;
            dbg_pc2_xgmii_txc <= xgmii_txc_wire;

            if (xgmii_has_term) begin
                dbg_rx_eth_pkt_cnt       <= dbg_rx_eth_pkt_cnt + 16'd1;
                dbg_rx_eth_byte_cnt      <= dbg_rx_eth_byte_cnt + 16'd4;
                dbg_rx_eth_data_byte_cnt <= dbg_rx_eth_data_byte_cnt + {13'd0, valid_data_lanes};
                last_eth_data_byte_cnt   <= dbg_rx_eth_data_byte_cnt + {13'd0, valid_data_lanes};
                preamble_word_skip       <= 2'd0;
            end else if (xgmii_is_active) begin
                dbg_rx_eth_byte_cnt <= dbg_rx_eth_byte_cnt + 16'd4;
                if (preamble_word_skip < 2'd2) begin
                    // Skip Word 0 (/S/ + 3B Preamble) and Word 1 (3B Preamble + SFD)
                    preamble_word_skip <= preamble_word_skip + 2'd1;
                end else begin
                    // Count pure Layer-2 Ethernet MAC bytes (DA, SA, EtherType, Payload, FCS)
                    dbg_rx_eth_data_byte_cnt <= dbg_rx_eth_data_byte_cnt + {13'd0, valid_data_lanes};
                end
            end else begin
                dbg_rx_eth_byte_cnt      <= 16'd0;
                dbg_rx_eth_data_byte_cnt <= 16'd0;
                preamble_word_skip       <= 2'd0;
            end
        end
    end

endmodule