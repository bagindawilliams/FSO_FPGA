// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// DO NOT MODIFY THIS FILE.

// MODULE VLNV: xilinx.com:ip:gtwizard_ultrascale:1.7

`timescale 1ps / 1ps

`include "vivado_interfaces.svh"

module gt_sv (
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [0:0] gtwiz_userclk_tx_active_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [0:0] gtwiz_userclk_rx_active_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [0:0] gtwiz_reset_clk_freerun_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [0:0] gtwiz_reset_all_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [0:0] gtwiz_reset_tx_pll_and_datapath_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [0:0] gtwiz_reset_tx_datapath_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [0:0] gtwiz_reset_rx_pll_and_datapath_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [0:0] gtwiz_reset_rx_datapath_in,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [0:0] gtwiz_reset_rx_cdr_stable_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [0:0] gtwiz_reset_tx_done_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [0:0] gtwiz_reset_rx_done_out,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [127:0] gtwiz_userdata_tx_in,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [127:0] gtwiz_userdata_rx_out,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [0:0] gtrefclk00_in,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [0:0] qpll0outclk_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [0:0] qpll0outrefclk_out,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] gthrxn_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] gthrxp_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] rx8b10ben_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] rxbufreset_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] rxchbonden_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [19:0] rxchbondi_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [11:0] rxchbondlevel_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] rxchbondmaster_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] rxchbondslave_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] rxcommadeten_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] rxlpmen_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] rxmcommaalignen_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] rxpcommaalignen_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] rxusrclk_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] rxusrclk2_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] tx8b10ben_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [63:0] txctrl0_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [63:0] txctrl1_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [31:0] txctrl2_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [15:0] txdiffctrl_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [19:0] txpostcursor_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [19:0] txprecursor_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] txusrclk_in,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] txusrclk2_in,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] gthtxn_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] gthtxp_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] gtpowergood_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [11:0] rxbufstatus_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] rxbyteisaligned_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] rxbyterealign_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] rxchanbondseq_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] rxchanisaligned_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] rxchanrealign_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [19:0] rxchbondo_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [7:0] rxclkcorcnt_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] rxcommadet_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [63:0] rxctrl0_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [63:0] rxctrl1_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [31:0] rxctrl2_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [31:0] rxctrl3_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] rxoutclk_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] rxpmaresetdone_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] txoutclk_out,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] txpmaresetdone_out
);

  gt inst (
    .gtwiz_userclk_tx_active_in(gtwiz_userclk_tx_active_in),
    .gtwiz_userclk_rx_active_in(gtwiz_userclk_rx_active_in),
    .gtwiz_reset_clk_freerun_in(gtwiz_reset_clk_freerun_in),
    .gtwiz_reset_all_in(gtwiz_reset_all_in),
    .gtwiz_reset_tx_pll_and_datapath_in(gtwiz_reset_tx_pll_and_datapath_in),
    .gtwiz_reset_tx_datapath_in(gtwiz_reset_tx_datapath_in),
    .gtwiz_reset_rx_pll_and_datapath_in(gtwiz_reset_rx_pll_and_datapath_in),
    .gtwiz_reset_rx_datapath_in(gtwiz_reset_rx_datapath_in),
    .gtwiz_reset_rx_cdr_stable_out(gtwiz_reset_rx_cdr_stable_out),
    .gtwiz_reset_tx_done_out(gtwiz_reset_tx_done_out),
    .gtwiz_reset_rx_done_out(gtwiz_reset_rx_done_out),
    .gtwiz_userdata_tx_in(gtwiz_userdata_tx_in),
    .gtwiz_userdata_rx_out(gtwiz_userdata_rx_out),
    .gtrefclk00_in(gtrefclk00_in),
    .qpll0outclk_out(qpll0outclk_out),
    .qpll0outrefclk_out(qpll0outrefclk_out),
    .gthrxn_in(gthrxn_in),
    .gthrxp_in(gthrxp_in),
    .rx8b10ben_in(rx8b10ben_in),
    .rxbufreset_in(rxbufreset_in),
    .rxchbonden_in(rxchbonden_in),
    .rxchbondi_in(rxchbondi_in),
    .rxchbondlevel_in(rxchbondlevel_in),
    .rxchbondmaster_in(rxchbondmaster_in),
    .rxchbondslave_in(rxchbondslave_in),
    .rxcommadeten_in(rxcommadeten_in),
    .rxlpmen_in(rxlpmen_in),
    .rxmcommaalignen_in(rxmcommaalignen_in),
    .rxpcommaalignen_in(rxpcommaalignen_in),
    .rxusrclk_in(rxusrclk_in),
    .rxusrclk2_in(rxusrclk2_in),
    .tx8b10ben_in(tx8b10ben_in),
    .txctrl0_in(txctrl0_in),
    .txctrl1_in(txctrl1_in),
    .txctrl2_in(txctrl2_in),
    .txdiffctrl_in(txdiffctrl_in),
    .txpostcursor_in(txpostcursor_in),
    .txprecursor_in(txprecursor_in),
    .txusrclk_in(txusrclk_in),
    .txusrclk2_in(txusrclk2_in),
    .gthtxn_out(gthtxn_out),
    .gthtxp_out(gthtxp_out),
    .gtpowergood_out(gtpowergood_out),
    .rxbufstatus_out(rxbufstatus_out),
    .rxbyteisaligned_out(rxbyteisaligned_out),
    .rxbyterealign_out(rxbyterealign_out),
    .rxchanbondseq_out(rxchanbondseq_out),
    .rxchanisaligned_out(rxchanisaligned_out),
    .rxchanrealign_out(rxchanrealign_out),
    .rxchbondo_out(rxchbondo_out),
    .rxclkcorcnt_out(rxclkcorcnt_out),
    .rxcommadet_out(rxcommadet_out),
    .rxctrl0_out(rxctrl0_out),
    .rxctrl1_out(rxctrl1_out),
    .rxctrl2_out(rxctrl2_out),
    .rxctrl3_out(rxctrl3_out),
    .rxoutclk_out(rxoutclk_out),
    .rxpmaresetdone_out(rxpmaresetdone_out),
    .txoutclk_out(txoutclk_out),
    .txpmaresetdone_out(txpmaresetdone_out)
  );

endmodule
