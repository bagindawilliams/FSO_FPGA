-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.
-- IP VLNV: xilinx.com:ip:ten_gig_eth_pcs_pma:6.0
-- IP Revision: 32

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT eth_10g_pcs_pma_rx_0
  PORT (
    refclk_p : IN STD_LOGIC;
    refclk_n : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    resetdone_out : OUT STD_LOGIC;
    coreclk_out : OUT STD_LOGIC;
    rxrecclk_out : OUT STD_LOGIC;
    dclk : IN STD_LOGIC;
    txp : OUT STD_LOGIC;
    txn : OUT STD_LOGIC;
    rxp : IN STD_LOGIC;
    rxn : IN STD_LOGIC;
    sim_speedup_control : IN STD_LOGIC;
    txusrclk_out : OUT STD_LOGIC;
    txusrclk2_out : OUT STD_LOGIC;
    areset_coreclk_out : OUT STD_LOGIC;
    areset_datapathclk_out : OUT STD_LOGIC;
    gttxreset_out : OUT STD_LOGIC;
    gtrxreset_out : OUT STD_LOGIC;
    txuserrdy_out : OUT STD_LOGIC;
    reset_counter_done_out : OUT STD_LOGIC;
    qpll0lock_out : OUT STD_LOGIC;
    qpll0outclk_out : OUT STD_LOGIC;
    qpll0outrefclk_out : OUT STD_LOGIC;
    xgmii_txd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    xgmii_txc : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    xgmii_rxd : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    xgmii_rxc : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    mdc : IN STD_LOGIC;
    mdio_in : IN STD_LOGIC;
    mdio_out : OUT STD_LOGIC;
    mdio_tri : OUT STD_LOGIC;
    prtad : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    core_status : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal_detect : IN STD_LOGIC;
    tx_fault : IN STD_LOGIC;
    drp_req : OUT STD_LOGIC;
    drp_gnt : IN STD_LOGIC;
    core_to_gt_drpen : OUT STD_LOGIC;
    core_to_gt_drpwe : OUT STD_LOGIC;
    core_to_gt_drpaddr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    core_to_gt_drpdi : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    gt_drprdy : OUT STD_LOGIC;
    gt_drpdo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    gt_drpen : IN STD_LOGIC;
    gt_drpwe : IN STD_LOGIC;
    gt_drpaddr : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    gt_drpdi : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    core_to_gt_drprdy : IN STD_LOGIC;
    core_to_gt_drpdo : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    tx_disable : OUT STD_LOGIC;
    pma_pmd_type : IN STD_LOGIC_VECTOR(2 DOWNTO 0) 
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : eth_10g_pcs_pma_rx_0
  PORT MAP (
    refclk_p => refclk_p,
    refclk_n => refclk_n,
    reset => reset,
    resetdone_out => resetdone_out,
    coreclk_out => coreclk_out,
    rxrecclk_out => rxrecclk_out,
    dclk => dclk,
    txp => txp,
    txn => txn,
    rxp => rxp,
    rxn => rxn,
    sim_speedup_control => sim_speedup_control,
    txusrclk_out => txusrclk_out,
    txusrclk2_out => txusrclk2_out,
    areset_coreclk_out => areset_coreclk_out,
    areset_datapathclk_out => areset_datapathclk_out,
    gttxreset_out => gttxreset_out,
    gtrxreset_out => gtrxreset_out,
    txuserrdy_out => txuserrdy_out,
    reset_counter_done_out => reset_counter_done_out,
    qpll0lock_out => qpll0lock_out,
    qpll0outclk_out => qpll0outclk_out,
    qpll0outrefclk_out => qpll0outrefclk_out,
    xgmii_txd => xgmii_txd,
    xgmii_txc => xgmii_txc,
    xgmii_rxd => xgmii_rxd,
    xgmii_rxc => xgmii_rxc,
    mdc => mdc,
    mdio_in => mdio_in,
    mdio_out => mdio_out,
    mdio_tri => mdio_tri,
    prtad => prtad,
    core_status => core_status,
    signal_detect => signal_detect,
    tx_fault => tx_fault,
    drp_req => drp_req,
    drp_gnt => drp_gnt,
    core_to_gt_drpen => core_to_gt_drpen,
    core_to_gt_drpwe => core_to_gt_drpwe,
    core_to_gt_drpaddr => core_to_gt_drpaddr,
    core_to_gt_drpdi => core_to_gt_drpdi,
    gt_drprdy => gt_drprdy,
    gt_drpdo => gt_drpdo,
    gt_drpen => gt_drpen,
    gt_drpwe => gt_drpwe,
    gt_drpaddr => gt_drpaddr,
    gt_drpdi => gt_drpdi,
    core_to_gt_drprdy => core_to_gt_drprdy,
    core_to_gt_drpdo => core_to_gt_drpdo,
    tx_disable => tx_disable,
    pma_pmd_type => pma_pmd_type
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file eth_10g_pcs_pma_rx_0.vhd when simulating
-- the core, eth_10g_pcs_pma_rx_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.



