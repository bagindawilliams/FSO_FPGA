// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Thu Aug 27 20:38:06 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top eth_10g_pcs_pma_rx_0 -prefix
//               eth_10g_pcs_pma_rx_0_ eth_10g_pcs_pma_rx_0_stub.v
// Design      : eth_10g_pcs_pma_rx_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CORE_GENERATION_INFO = "eth_10g_pcs_pma_rx_0,ten_gig_eth_pcs_pma_v6_0_32,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=ten_gig_eth_pcs_pma,x_ipVersion=6.0,x_ipCoreRevision=32,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,c_family=kintexu,c_component_name=eth_10g_pcs_pma_rx_0,c_has_mdio=true,c_has_fec=false,c_has_an=false,c_is_kr=false,c_is_32bit=true,c_no_ebuff=false,c_gttype=2,c_1588=0,c_gtif_width=32,c_speed10_25=10,c_sub_core_name=eth_10g_pcs_pma_rx_0_gt,c_gt_loc=X0Y12,c_refclk=clk0,c_refclkrate=156,c_dclkrate=100.00,x_ipLicense=ten_gig_eth_pcs_pma_basekr@2015.04(design_linking)}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "ten_gig_eth_pcs_pma_v6_0_32,Vivado 2025.2" *) 
module eth_10g_pcs_pma_rx_0(dclk, rxrecclk_out, refclk_p, refclk_n, 
  sim_speedup_control, coreclk_out, qpll0outclk_out, qpll0outrefclk_out, qpll0lock_out, 
  txusrclk_out, txusrclk2_out, areset_datapathclk_out, areset_coreclk_out, gttxreset_out, 
  gtrxreset_out, txuserrdy_out, reset_counter_done_out, reset, xgmii_txd, xgmii_txc, xgmii_rxd, 
  xgmii_rxc, txp, txn, rxp, rxn, mdc, mdio_in, mdio_out, mdio_tri, prtad, core_status, resetdone_out, 
  signal_detect, tx_fault, drp_req, drp_gnt, core_to_gt_drpen, core_to_gt_drpwe, 
  core_to_gt_drpaddr, core_to_gt_drpdi, gt_drprdy, gt_drpdo, gt_drpen, gt_drpwe, gt_drpaddr, 
  gt_drpdi, core_to_gt_drprdy, core_to_gt_drpdo, pma_pmd_type, tx_disable)
/* synthesis syn_black_box black_box_pad_pin="refclk_p,refclk_n,sim_speedup_control,qpll0outclk_out,qpll0outrefclk_out,qpll0lock_out,areset_datapathclk_out,areset_coreclk_out,gttxreset_out,gtrxreset_out,txuserrdy_out,reset_counter_done_out,reset,xgmii_txd[31:0],xgmii_txc[3:0],xgmii_rxd[31:0],xgmii_rxc[3:0],txp,txn,rxp,rxn,mdc,mdio_in,mdio_out,mdio_tri,prtad[4:0],core_status[7:0],resetdone_out,signal_detect,tx_fault,drp_req,drp_gnt,core_to_gt_drpen,core_to_gt_drpwe,core_to_gt_drpaddr[15:0],core_to_gt_drpdi[15:0],gt_drprdy,gt_drpdo[15:0],gt_drpen,gt_drpwe,gt_drpaddr[15:0],gt_drpdi[15:0],core_to_gt_drprdy,core_to_gt_drpdo[15:0],pma_pmd_type[2:0],tx_disable" */
/* synthesis syn_force_seq_prim="dclk" */
/* synthesis syn_force_seq_prim="rxrecclk_out" */
/* synthesis syn_force_seq_prim="coreclk_out" */
/* synthesis syn_force_seq_prim="txusrclk_out" */
/* synthesis syn_force_seq_prim="txusrclk2_out" */;
  input dclk /* synthesis syn_isclock = 1 */;
  output rxrecclk_out /* synthesis syn_isclock = 1 */;
  input refclk_p;
  input refclk_n;
  input sim_speedup_control;
  output coreclk_out /* synthesis syn_isclock = 1 */;
  output qpll0outclk_out;
  output qpll0outrefclk_out;
  output qpll0lock_out;
  output txusrclk_out /* synthesis syn_isclock = 1 */;
  output txusrclk2_out /* synthesis syn_isclock = 1 */;
  output areset_datapathclk_out;
  output areset_coreclk_out;
  output gttxreset_out;
  output gtrxreset_out;
  output txuserrdy_out;
  output reset_counter_done_out;
  input reset;
  input [31:0]xgmii_txd;
  input [3:0]xgmii_txc;
  output [31:0]xgmii_rxd;
  output [3:0]xgmii_rxc;
  output txp;
  output txn;
  input rxp;
  input rxn;
  input mdc;
  input mdio_in;
  output mdio_out;
  output mdio_tri;
  input [4:0]prtad;
  output [7:0]core_status;
  output resetdone_out;
  input signal_detect;
  input tx_fault;
  output drp_req;
  input drp_gnt;
  output core_to_gt_drpen;
  output core_to_gt_drpwe;
  output [15:0]core_to_gt_drpaddr;
  output [15:0]core_to_gt_drpdi;
  output gt_drprdy;
  output [15:0]gt_drpdo;
  input gt_drpen;
  input gt_drpwe;
  input [15:0]gt_drpaddr;
  input [15:0]gt_drpdi;
  input core_to_gt_drprdy;
  input [15:0]core_to_gt_drpdo;
  input [2:0]pma_pmd_type;
  output tx_disable;
endmodule
