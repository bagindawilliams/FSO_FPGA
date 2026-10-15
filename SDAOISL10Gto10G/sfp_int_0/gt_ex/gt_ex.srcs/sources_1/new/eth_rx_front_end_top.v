`timescale 1ns / 1ps
/*
===========================================================================
Company      : WiComAI Lab, Kookmin University
Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
Description  : Hardware/Simulation Multiplexed Top Ingress Module.
               Routes either Physical SFP+ traffic or Simulated internal
               traffic into the FSO 1908-Byte Segmentation Engine.
===========================================================================
*/

module eth_rx_front_end_top #(
    parameter RUN_MODE = 1 // 1=Sim, 0=Hardware SFP+
)(
    input  wire        clk,       
    input  wire        rst_n,
    
    input  wire [31:0] xgmii_rxd,
    input  wire [3:0]  xgmii_rxc,
    
    output wire [31:0] fso_data_out,
    output wire        fso_valid,
    output wire        fso_last,
    input  wire        fso_ready,

    input  wire        refclk_p,
    input  wire        refclk_n,
    input  wire        reset,
    input  wire        dclk,
    input  wire        rxp,
    input  wire        rxn
);

    wire [31:0] phy_xgmii_rxd;
    wire [3:0]  phy_xgmii_rxc;

    // PHY IP Core Instantiation
    eth_10g_pcs_pma_rx_0 physical_mac_rx_inst (
        .refclk_p           (refclk_p),
        .refclk_n           (refclk_n),
        .reset              (reset),
        .dclk               (dclk),
        .txp                (),     
        .txn                (),     
        .rxp                (rxp),
        .rxn                (rxn),
        .xgmii_txd          (32'd0), 
        .xgmii_txc          (4'd0),
        .xgmii_rxd          (phy_xgmii_rxd), 
        .xgmii_rxc          (phy_xgmii_rxc), 
        .sim_speedup_control(1'b0),
        .mdc                (1'b0),
        .mdio_in            (1'b0),
        .prtad              (5'd0),
        .signal_detect      (1'b1),
        .tx_fault           (1'b0),
        .pma_pmd_type       (3'b000)
    );

    wire [31:0] active_xgmii_rxd = (RUN_MODE == 1) ? xgmii_rxd : phy_xgmii_rxd;
    wire [3:0]  active_xgmii_rxc = (RUN_MODE == 1) ? xgmii_rxc : phy_xgmii_rxc;

    wire [31:0] parsed_tdata;
    wire        parsed_tvalid, parsed_tlast, parsed_tuser;

    xgmii_rx_parser u_parser (
        .clk          (clk),
        .rst_n        (rst_n),
        .xgmii_rxd    (active_xgmii_rxd),
        .xgmii_rxc    (active_xgmii_rxc),
        .m_axis_tdata (parsed_tdata),
        .m_axis_tvalid(parsed_tvalid),
        .m_axis_tlast (parsed_tlast),
        .m_axis_tuser (parsed_tuser)
    );

    wire [31:0] clean_tdata;
    wire        clean_tvalid, clean_tlast, clean_tready;

    eth_preamble_remover u_remover (
        .clk          (clk),
        .rst_n        (rst_n),
        .s_axis_tdata (parsed_tdata),
        .s_axis_tvalid(parsed_tvalid),
        .s_axis_tlast (parsed_tlast),
        .s_axis_tready(), // Parser ignores backpressure
        
        .m_axis_tdata (clean_tdata),
        .m_axis_tvalid(clean_tvalid),
        .m_axis_tlast (clean_tlast),
        .m_axis_tready(clean_tready)
    );

    packaging_and_segmentation u_segmenter (
        .clk          (clk),
        .rst_n        (rst_n),
        .s_axis_tdata (clean_tdata),
        .s_axis_tvalid(clean_tvalid),
        .s_axis_tlast (clean_tlast),
        .s_axis_tready(clean_tready), // Linked to Remover & FIFO
        
        .m_axis_tdata (fso_data_out),
        .m_axis_tvalid(fso_valid),
        .m_axis_tlast (fso_last),
        .m_axis_tready(fso_ready)
    );

endmodule