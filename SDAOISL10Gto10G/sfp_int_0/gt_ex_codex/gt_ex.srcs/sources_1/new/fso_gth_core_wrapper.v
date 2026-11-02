`timescale 1ns / 100ps

/*
Revision BASELINE10-APPLY-C02-01 | 2026-11-01T15:49:41.899581+09:00 (Asia/Seoul, UTC+09:00)
PM-approved application of the reviewed C02 simulation baseline.
Functional change: Retain the tested C03 primitive interface and transport wiring. Earlier pipeline descriptions apply only to the historical revisions that introduced them.
Effect: preserve the demonstrated two-packet DATA/IDLE/MGMT, FEC and ARQ
behavior; admission latency and buffering remain within the tested scope.
Evidence: RELEASE09 run1344 acceptance, run1420 FEC/peer regression,
and run1513 header contract; Vivado/XSim 2025.2. These are candidate-run
results, not results of a new official-source execution.
This revision entry is documentation-only relative to the tested final
candidate. Earlier module descriptions, attributions and revision notes
are retained. Historical behavior is not a claim about this active version.
Hardware timing, reset/CDC signoff and board testing remain separate.
*/
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : fso_gth_core_wrapper
Description  : Hardware/Simulation Wrapper for UltraScale GTH 64B/66B IP
               (gth_fso_64b66b.xci) with Internal 64/66 Gearbox Adapter.
               References: AMD Xilinx PG182 & UG576.

Revision History:
  - Rev 1.0 (Initial) : GTH 64B/66B IP wrapper with BUFG_GT clocking and 64/66 rate-matching adapter.
  - Rev 2.0 (2026-10-27 04:19 KST) : [Target B1.3 - ETRI Audit Item 1, SDA OISL Page 23, Table 2-8]
    Updated simulation rate-matching adapter start trigger (line 118) to detect the 
    bit-reversed first 32-bit word of the official SDA OISL Preamble 
    (bit_rev32(32'h77AD_5B58) = 32'h1ADA_B5EE) in addition to the legacy marker 
    (bit_rev32(32'h5555_5555) = 32'hAAAA_AAAA).
===========================================================================
*/

module fso_gth_core_wrapper (
    // System Free-Running Clock (100 MHz) & Master Reset
    input  wire        clk_100_freerun,
    input  wire        sys_rst_n,

    // Physical Differential Reference Clock (156.25 MHz)
    input  wire        gt_refclk_p,
    input  wire        gt_refclk_n,

    // High-Speed Serial SFP+ Pins (10.3125 Gbps)
    output wire        txp_out,
    output wire        txn_out,
    input  wire        rxp_in,
    input  wire        rxn_in,

    // Generated Parallel User Clocks (322.265625 MHz) & Link Status
    output wire        tx0_clk,
    output wire        rx0_clk,
    output wire        gth_tx_ready,
    output wire        gth_rx_ready,
    output wire        gth_link_up,

    // Interface from gth64b66b_tx.v (TX Synchronous Gearbox)
    input  wire [31:0] gt_txdata_in,
    input  wire [5:0]  gt_txheader_in,
    input  wire [6:0]  gt_txsequence_in,

    // Interface to gth64b66b_rx.v (RX Synchronous Gearbox)
    output wire [31:0] gt_rxdata_out,
    output wire [1:0]  gt_rxdatavalid_out,
    output wire [5:0]  gt_rxheader_out,
    output wire [1:0]  gt_rxheadervalid_out,
    output wire [1:0]  gt_rxstartofseq_out,
    input  wire        gt_rxgearboxslip_in
);

    // =======================================================
    // 1. REFERENCE CLOCK BUFFER (156.25 MHz -> QPLL0)
    // =======================================================
    wire gtrefclk00_int;

    IBUFDS_GTE3 #(
        .REFCLK_EN_TX_PATH  (1'b0),
        .REFCLK_HROW_CK_SEL (2'b00),
        .REFCLK_ICNTL_RX    (2'b00)
    ) u_ibufds_gte3_refclk (
        .I     (gt_refclk_p),
        .IB    (gt_refclk_n),
        .CEB   (1'b0),
        .O     (gtrefclk00_int),
        .ODIV2 ()
    );

    // =======================================================
    // 2. USER CLOCKING NETWORK (BUFG_GT @ 322.265625 MHz)
    // =======================================================
    wire txoutclk_int;
    wire rxoutclk_int;
    wire txpmaresetdone_int;
    wire rxpmaresetdone_int;

    BUFG_GT u_bufg_gt_tx (
        .O       (tx0_clk),
        .CE      (1'b1),
        .CEMASK  (1'b0),
        .CLR     (~txpmaresetdone_int),
        .CLRMASK (1'b0),
        .DIV     (3'b000),
        .I       (txoutclk_int)
    );

    BUFG_GT u_bufg_gt_rx (
        .O       (rx0_clk),
        .CE      (1'b1),
        .CEMASK  (1'b0),
        .CLR     (~rxpmaresetdone_int),
        .CLRMASK (1'b0),
        .DIV     (3'b000),
        .I       (rxoutclk_int)
    );

    reg tx_usrclk_active = 1'b0;
    reg rx_usrclk_active = 1'b0;

    always @(posedge tx0_clk or negedge txpmaresetdone_int) begin
        if (!txpmaresetdone_int) tx_usrclk_active <= 1'b0;
        else                     tx_usrclk_active <= 1'b1;
    end

    always @(posedge rx0_clk or negedge rxpmaresetdone_int) begin
        if (!rxpmaresetdone_int) rx_usrclk_active <= 1'b0;
        else                     rx_usrclk_active <= 1'b1;
    end

    // =======================================================
    // 3. INTERNAL 64/66 GEARBOX RATE-MATCHING ADAPTER
    // Absorbs the 2-cycle pause when gt_txsequence_in == 7'd32
    // =======================================================
    wire gtwiz_reset_tx_done_int;
    wire gtwiz_reset_rx_done_int;
    wire [31:0] gth_userdata_tx_mux;

    // OISL-GTH-002 candidate: simulation and synthesis use the same
    // synchronous gearbox inputs. The previous sim-only 312.5 MHz sampler
    // resampled already gearbox-paced TXDATA and did not honor TXSEQUENCE.
    assign gth_userdata_tx_mux = gt_txdata_in;

    // =======================================================
    // 4. INSTANTIATION OF GTH IP CORE (gth_fso_64b66b.xci)
    // =======================================================
    gth_fso_64b66b u_gth_fso_64b66b (
        .gtwiz_userclk_tx_active_in         (tx_usrclk_active),
        .gtwiz_userclk_rx_active_in         (rx_usrclk_active),
        .gtwiz_reset_clk_freerun_in         (clk_100_freerun),
        .gtwiz_reset_all_in                 (~sys_rst_n),
        .gtwiz_reset_tx_pll_and_datapath_in (1'b0),
        .gtwiz_reset_tx_datapath_in         (1'b0),
        .gtwiz_reset_rx_pll_and_datapath_in (1'b0),
        .gtwiz_reset_rx_datapath_in         (1'b0),
        .gtwiz_reset_rx_cdr_stable_out      (),
        .gtwiz_reset_tx_done_out            (gtwiz_reset_tx_done_int),
        .gtwiz_reset_rx_done_out            (gtwiz_reset_rx_done_int),
        .gtwiz_userdata_tx_in               (gth_userdata_tx_mux),
        .gtwiz_userdata_rx_out              (gt_rxdata_out),
        .gtrefclk00_in                      (gtrefclk00_int),
        .qpll0outclk_out                    (),
        .qpll0outrefclk_out                 (),
        .gthrxn_in                          (rxn_in),
        .gthrxp_in                          (rxp_in),
        .rxgearboxslip_in                   (gt_rxgearboxslip_in),
        .rxusrclk_in                        (rx0_clk),
        .rxusrclk2_in                       (rx0_clk),
        .txheader_in                        (gt_txheader_in),
        .txsequence_in                      (gt_txsequence_in),
        .txusrclk_in                        (tx0_clk),
        .txusrclk2_in                       (tx0_clk),
        .gthtxn_out                         (txn_out),
        .gthtxp_out                         (txp_out),
        .gtpowergood_out                    (),
        .rxdatavalid_out                    (gt_rxdatavalid_out),
        .rxheader_out                       (gt_rxheader_out),
        .rxheadervalid_out                  (gt_rxheadervalid_out),
        .rxoutclk_out                       (rxoutclk_int),
        .rxpmaresetdone_out                 (rxpmaresetdone_int),
        .rxstartofseq_out                   (gt_rxstartofseq_out),
        .txoutclk_out                       (txoutclk_int),
        .txpmaresetdone_out                 (txpmaresetdone_int)
    );

    assign gth_tx_ready = gtwiz_reset_tx_done_int;
    assign gth_rx_ready = gtwiz_reset_rx_done_int;
    assign gth_link_up  = gtwiz_reset_tx_done_int & gtwiz_reset_rx_done_int;

endmodule