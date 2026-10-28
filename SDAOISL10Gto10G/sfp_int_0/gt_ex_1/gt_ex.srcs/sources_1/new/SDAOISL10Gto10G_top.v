`timescale 1ns / 100ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Module Name  : SDAOISL10Gto10G_top
Description  : Complete End-to-End SDA OISL 10G-to-10G Grand Top Module.
               Integrates:
               1. Ingress Packet Generator / Ethernet RX Front-End (PC 1)
               2. SDA Encoder (Framer, ARQ TX, CDC 1, FEC Core TX, CDC 2, Error Inject)
               3. Modular GTH 64B/66B Optical Transceiver (TX, Core Wrapper, RX)
               4. SDA Decoder (CDC 3, FEC Core RX, CDC 4, Deframer, ARQ RX, Reassembly)
               5. Egress Ethernet TX Back-End to PC 2 (eth_tx_back_end_top)

               Revision Notes:
               1. Preserved all original architecture connections and port names.
               2. Moved all ILA telemetry registers inside their respective 
                  hierarchical sub-modules (u_gth64b66b_tx, u_gth64b66b_rx, 
                  and back_end_inst) so SDAOISL10Gto10G_top is 100% purely 
                  structural with ZERO loose yellow flip-flop boxes in the 
                  Vivado RTL Schematic (identical layout to image_1335e3.png).
===========================================================================
*/

module SDAOISL10Gto10G_top #(
    // 1 = Simulation / Internal Packet Gen Mode
    // 0 = External SFP+ 10G Ethernet PHY Mode (PC 1 -> FPGA -> PC 2)
    parameter SIM_MODE = 1 
)(
    input  wire        sys_clk_p,
    input  wire        sys_clk_n,
    
    output wire [1:0]  tx_disable,
    input  wire        mgtrefclk_n,
    input  wire        mgtrefclk_p,    
    input  wire        fso_refclk_n,
    input  wire        fso_refclk_p,
    input  wire [3:0]  RXN_IN,
    input  wire [3:0]  RXP_IN,
    output wire [3:0]  TXN_OUT,
    output wire [3:0]  TXP_OUT,
    output wire        fan,
    
    // Probing & Status Outputs
    output wire [31:0] tx_fso_data_out,
    output wire        tx_fso_valid_out,
    output wire [31:0] rx_fso_data_out,
    output wire        rx_fso_valid_out,
    output wire [7:0]  rx_dec_hdr_tdata,
    output wire        rx_dec_hdr_tvalid,
    output wire [31:0] rx_dec_pld_tdata,
    output wire        rx_dec_pld_tvalid,
    output wire [31:0] pc2_xgmii_txd,
    output wire [3:0]  pc2_xgmii_txc,
    output wire        rx_preamble_locked,
    output wire        rx_block_locked,
    output wire        gth_link_up,
    output wire        eth_data_error_flag
);

    assign tx_disable = 2'b00;
    assign fan        = 1'b0;
    
    wire rst_n     = 1'b1; 
    wire eth_reset = ~rst_n;

    wire sys_clk;
    wire clk_100M;
    wire clk_logic;
    wire tx0_clk;
    wire rx0_clk;

    IBUFGDS sys_clk_inst (
        .I  (sys_clk_p),
        .IB (sys_clk_n),
        .O  (sys_clk)
    );

    clk_wiz_0 clk_wiz_0_inst (
        .clk_in1  (sys_clk),
        .reset    (1'b0),
        .locked   (),
        .clk_out1 (clk_100M),
        .clk_out2 (clk_logic)
    );

    // =======================================================
    // 1. INGRESS TRAFFIC SOURCE (SIMULATION vs HARDWARE)
    // =======================================================
    wire [31:0] xgmii_txd_in;
    wire [3:0]  xgmii_txc_in;

    generate
        if (SIM_MODE == 1) begin : gen_sim_mode
            wire        trigger_en;
            wire [31:0] gen_axis_tdata;
            wire [3:0]  gen_axis_tkeep;
            wire        gen_axis_tvalid;
            wire        gen_axis_tlast;
            wire        gen_axis_tready;

            autorun autorun_inst (
                .clk   (tx0_clk),
                .rst_n (rst_n),
                .flag  (trigger_en) 
            );

            eth_axis_packet_gen packet_gen_inst (
                .clk              (tx0_clk),
                .rst_n            (rst_n),
                .trigger          (trigger_en),
                .frame_size_bytes (16'd2000), 
                .m_axis_tdata     (gen_axis_tdata),
                .m_axis_tkeep     (gen_axis_tkeep),
                .m_axis_tvalid    (gen_axis_tvalid),
                .m_axis_tlast     (gen_axis_tlast),
                .m_axis_tready    (gen_axis_tready)
            );

            xgmii_tx_encoder xgmii_encoder_inst (
                .clk              (tx0_clk),
                .rst_n            (rst_n),
                .s_axis_tdata     (gen_axis_tdata),
                .s_axis_tkeep     (gen_axis_tkeep),
                .s_axis_tvalid    (gen_axis_tvalid),
                .s_axis_tlast     (gen_axis_tlast),
                .s_axis_tready    (gen_axis_tready),
                .xgmii_txd        (xgmii_txd_in),
                .xgmii_txc        (xgmii_txc_in)
            );
        end else begin : gen_hw_mode
            assign xgmii_txd_in = 32'd0;
            assign xgmii_txc_in = 4'd0;
        end
    endgenerate

    // =======================================================
    // 2. ETHERNET RX FRONT-END (SFP+ Channel 0 RX from PC 1)
    // =======================================================
    wire [31:0] seg_axis_tdata;
    wire        seg_axis_tvalid;
    wire        seg_axis_tlast;
    wire        seg_axis_tready;

    eth_rx_front_end_top #(
        .RUN_MODE (SIM_MODE)
    ) front_end_inst (
        .clk          (tx0_clk),
        .rst_n        (rst_n),
        .xgmii_rxd    (xgmii_txd_in),  
        .xgmii_rxc    (xgmii_txc_in),
        .fso_data_out (seg_axis_tdata),     
        .fso_valid    (seg_axis_tvalid),
        .fso_last     (seg_axis_tlast),
        .fso_ready    (seg_axis_tready),
        .refclk_p     (mgtrefclk_p),
        .refclk_n     (mgtrefclk_n),
        .reset        (eth_reset),
        .dclk         (clk_100M),
        .rxp          (RXP_IN[0]),    
        .rxn          (RXN_IN[0])
    );

    // =======================================================
    // 3. SDA ENCODER (Connected to Closed-Loop ARQ Feedback)
    // =======================================================
    wire [15:0] arq_fb_rxfn;
    wire        arq_fb_ack;
    wire        arq_fb_ack_valid;

    sda_encoder #(
        .SIM_MODE            (SIM_MODE)
    ) sda_encoder_inst (
        .clk_logic           (clk_logic), 
        .clk_gth             (tx0_clk),   
        .rst_n               (rst_n),
        .s_axis_eth_tdata    (seg_axis_tdata),
        .s_axis_eth_tvalid   (seg_axis_tvalid),
        .s_axis_eth_tlast    (seg_axis_tlast),
        .s_axis_eth_tready   (seg_axis_tready),
        .mgmt_trigger_1hz    (1'b0),
        .rx_phy_ts_sec       (6'd15),
        .rx_phy_ts_picosec   (40'd16678204759),
        .tx_phy_ts_sec       (6'd15),
        .tx_phy_ts_picosec   (40'd0),
        .range_meters        (64'h4153_12D0_0000_0000),
        .range_ts_sec        (32'd1476000000),
        .range_ts_picosec    (40'd0),
        .ts_valid            (1'b1),
        .tod_seconds_in      (6'd15), 
        .fcch_opcode         (4'hA),    
        .fcch_pl             (16'hF001),        
        .rx_rxfn_in          (arq_fb_rxfn),      
        .rx_ack_in           (arq_fb_ack),       
        .rx_ack_valid_in     (arq_fb_ack_valid), 
        .tx_fso_data_out     (tx_fso_data_out),
        .tx_fso_valid_out    (tx_fso_valid_out),
        .eth_data_error_flag (eth_data_error_flag)
    );

    // =======================================================
    // 4. GTH 64B/66B OPTICAL TRANSCEIVER (SFP+ Channel 1)
    // =======================================================
    wire        gth_tx_ready;
    wire        gth_rx_ready;
    wire        tx_gearbox_stall;
    wire [31:0] gt_txdata_int;
    wire [5:0]  gt_txheader_int;
    wire [6:0]  gt_txsequence_int;

    wire [31:0] gt_rxdata_int;
    wire [1:0]  gt_rxdatavalid_int;
    wire [5:0]  gt_rxheader_int;
    wire [1:0]  gt_rxheadervalid_int;
    wire [1:0]  gt_rxstartofseq_int;
    wire        gt_rxgearboxslip_int;

    wire        fso_txp_ch1, fso_txn_ch1;
    wire        eth_txp_ch0, eth_txn_ch0;

    gth64b66b_tx u_gth64b66b_tx (
        .clk_312_5         (tx0_clk),
        .clk_gth           (tx0_clk),
        .rst_n             (rst_n),
        .gth_tx_ready      (gth_tx_ready),
        .up_data_in        (tx_fso_data_out),
        .up_valid_in       (tx_fso_valid_out),
        .tx_stall_out      (tx_gearbox_stall),
        .gt_txdata_out     (gt_txdata_int),
        .gt_txheader_out   (gt_txheader_int),
        .gt_txsequence_out (gt_txsequence_int)
    );

    fso_gth_core_wrapper u_fso_gth_core (
        .clk_100_freerun      (clk_100M),
        .sys_rst_n            (rst_n),
        .gt_refclk_p          (fso_refclk_p),
        .gt_refclk_n          (fso_refclk_n),
        .txp_out              (fso_txp_ch1),
        .txn_out              (fso_txn_ch1),
        .rxp_in               (RXP_IN[1]),
        .rxn_in               (RXN_IN[1]),
        .tx0_clk              (tx0_clk),
        .rx0_clk              (rx0_clk),
        .gth_tx_ready         (gth_tx_ready),
        .gth_rx_ready         (gth_rx_ready),
        .gth_link_up          (gth_link_up),
        .gt_txdata_in         (gt_txdata_int),
        .gt_txheader_in       (gt_txheader_int),
        .gt_txsequence_in     (gt_txsequence_int),
        .gt_rxdata_out        (gt_rxdata_int),
        .gt_rxdatavalid_out   (gt_rxdatavalid_int),
        .gt_rxheader_out      (gt_rxheader_int),
        .gt_rxheadervalid_out (gt_rxheadervalid_int),
        .gt_rxstartofseq_out  (gt_rxstartofseq_int),
        .gt_rxgearboxslip_in  (gt_rxgearboxslip_int)
    );

    gth64b66b_rx u_gth64b66b_rx (
        .clk_gth              (rx0_clk),
        .clk_312_5            (rx0_clk),
        .rst_n                (rst_n),
        .gth_rx_ready         (gth_rx_ready),
        .gt_rxdata_in         (gt_rxdata_int),
        .gt_rxdatavalid_in    (gt_rxdatavalid_int),
        .gt_rxheader_in       (gt_rxheader_int),
        .gt_rxheadervalid_in  (gt_rxheadervalid_int),
        .gt_rxgearboxslip_out (gt_rxgearboxslip_int),
        .rx_block_locked      (rx_block_locked),
        .down_data            (rx_fso_data_out),
        .down_dv              (rx_fso_valid_out)
    );

    // =======================================================
    // 5. SDA DECODER (CDC 3 -> core_rx -> CDC 4 -> Deframer -> Reassembly)
    // =======================================================
    wire [31:0] reassembled_eth_tdata;
    wire        reassembled_eth_tvalid;
    wire        reassembled_eth_tlast;

    sda_decoder sda_decoder_inst (
        .clk_gth            (rx0_clk),
        .clk_logic          (clk_logic),
        .rst_n              (rst_n),
        .rx_fso_valid_in    (rx_fso_valid_out),
        .rx_fso_data_in     (rx_fso_data_out),
        .m_axis_eth_tdata   (reassembled_eth_tdata),
        .m_axis_eth_tvalid  (reassembled_eth_tvalid),
        .m_axis_eth_tlast   (reassembled_eth_tlast),
        .arq_fb_rxfn        (arq_fb_rxfn),
        .arq_fb_ack         (arq_fb_ack),
        .arq_fb_ack_valid   (arq_fb_ack_valid),
        .m_axis_hdr_tvalid  (rx_dec_hdr_tvalid),
        .m_axis_hdr_tdata   (rx_dec_hdr_tdata),
        .m_axis_fso_tvalid  (rx_dec_pld_tvalid),
        .m_axis_fso_tdata   (rx_dec_pld_tdata),
        .rx_preamble_locked (rx_preamble_locked),
        .hdr_crc_ok         (),
        .pld_crc_ok         ()
    );

    // =======================================================
    // 6. ETHERNET TX BACK-END (SFP+ Channel 0 TX to PC 2)
    // =======================================================
    eth_tx_back_end_top #(
        .RUN_MODE (SIM_MODE)
    ) back_end_inst (
        .clk       (rx0_clk),
        .rst_n     (rst_n),
        .data_in   (reassembled_eth_tdata),
        .en        (reassembled_eth_tvalid),
        .xgmii_txd (pc2_xgmii_txd),
        .xgmii_txc (pc2_xgmii_txc),
        .refclk_p  (mgtrefclk_p),
        .refclk_n  (mgtrefclk_n),
        .reset     (eth_reset),
        .dclk      (clk_100M),
        .txp       (eth_txp_ch0),
        .txn       (eth_txn_ch0)
    );

    assign TXP_OUT = {2'b00, fso_txp_ch1, eth_txp_ch0};
    assign TXN_OUT = {2'b00, fso_txn_ch1, eth_txn_ch0};

endmodule