`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : fso_gth_core_wrapper
Description  : Hardware/Simulation Wrapper for UltraScale GTH 64B/66B IP
               (gth_fso_64b66b.xci) with Internal 64/66 Gearbox Adapter.
               References: AMD Xilinx PG182 & UG576.
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

    // synthesis translate_off
    reg        sim_clk_312_5 = 1'b0;
    always #1.6 sim_clk_312_5 = ~sim_clk_312_5;

    reg [31:0] core_elast_mem [0:255];
    reg [7:0]  core_wr_ptr = 8'd0;
    reg        core_capture_en = 1'b0;
    reg [11:0] core_byte_acc = 12'd0;

    always @(posedge sim_clk_312_5 or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            core_wr_ptr     <= 8'd0;
            core_capture_en <= 1'b0;
            core_byte_acc   <= 12'd0;
        end else if (gtwiz_reset_tx_done_int) begin
            if (!core_capture_en) begin
                // Start capturing on first bit-reversed Preamble word (32'hAAAA_AAAA)
                if (gt_txdata_in == 32'hAAAA_AAAA) begin
                    core_capture_en             <= 1'b1;
                    core_elast_mem[core_wr_ptr] <= gt_txdata_in;
                    core_wr_ptr                 <= core_wr_ptr + 8'd1;
                    core_byte_acc               <= 12'd4;
                end
            end else begin
                if ((core_byte_acc == 12'd0) && (gt_txdata_in == 32'h0000_0000)) begin
                    core_capture_en <= 1'b0;
                    core_byte_acc   <= 12'd0;
                end else begin
                    core_elast_mem[core_wr_ptr] <= gt_txdata_in;
                    core_wr_ptr                 <= core_wr_ptr + 8'd1;
                    if (core_byte_acc + 12'd4 >= 12'd3117)
                        core_byte_acc <= (core_byte_acc + 12'd4) - 12'd3117;
                    else
                        core_byte_acc <= core_byte_acc + 12'd4;
                end
            end
        end
    end

    reg [7:0]  core_rd_ptr = 8'd0;
    reg        core_draining = 1'b0;
    reg [31:0] sim_userdata_tx = 32'd0;
    wire [7:0] core_buf_level = core_wr_ptr - core_rd_ptr;

    always @(posedge tx0_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            core_rd_ptr     <= 8'd0;
            core_draining   <= 1'b0;
            sim_userdata_tx <= 32'd0;
        end else if (!gtwiz_reset_tx_done_int) begin
            core_rd_ptr     <= 8'd0;
            core_draining   <= 1'b0;
            sim_userdata_tx <= 32'd0;
        end else if (gt_txsequence_in != 7'd32) begin
            if (!core_draining) begin
                if (core_buf_level >= 8'd4) begin
                    core_draining   <= 1'b1;
                    sim_userdata_tx <= core_elast_mem[core_rd_ptr];
                    core_rd_ptr     <= core_rd_ptr + 8'd1;
                end else begin
                    sim_userdata_tx <= 32'd0;
                end
            end else begin
                if (core_rd_ptr != core_wr_ptr) begin
                    sim_userdata_tx <= core_elast_mem[core_rd_ptr];
                    core_rd_ptr     <= core_rd_ptr + 8'd1;
                end else begin
                    core_draining   <= 1'b0;
                    sim_userdata_tx <= 32'd0;
                end
            end
        end
    end
    // synthesis translate_on

    assign gth_userdata_tx_mux = gt_txdata_in
    // synthesis translate_off
                                 ^ gt_txdata_in ^ sim_userdata_tx
    // synthesis translate_on
                                 ;

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