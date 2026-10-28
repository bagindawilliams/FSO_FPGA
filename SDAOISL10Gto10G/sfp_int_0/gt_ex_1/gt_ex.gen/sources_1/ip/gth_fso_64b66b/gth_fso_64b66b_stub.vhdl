-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
-- Date        : Fri Aug 28 16:33:36 2026
-- Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top gth_fso_64b66b -prefix
--               gth_fso_64b66b_ gth_fso_64b66b_stub.vhdl
-- Design      : gth_fso_64b66b
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku060-ffva1156-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gth_fso_64b66b is
  Port ( 
    gtwiz_userclk_tx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_all_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_cdr_stable_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userdata_tx_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gtwiz_userdata_rx_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gtrefclk00_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0outclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0outrefclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxn_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxp_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxgearboxslip_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxusrclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txheader_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    txsequence_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    txusrclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gthtxn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthtxp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtpowergood_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxdatavalid_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxheader_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    rxheadervalid_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxoutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxpmaresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxstartofseq_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    txoutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txpmaresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of gth_fso_64b66b : entity is "gth_fso_64b66b,gth_fso_64b66b_gtwizard_top,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of gth_fso_64b66b : entity is "gth_fso_64b66b,gth_fso_64b66b_gtwizard_top,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=gtwizard_ultrascale,x_ipVersion=1.7,x_ipCoreRevision=22,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_CHANNEL_ENABLE=000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000,C_PCIE_ENABLE=0,C_PCIE_CORECLK_FREQ=250,C_COMMON_SCALING_FACTOR=1,C_CPLL_VCO_FREQUENCY=2578.125,C_FORCE_COMMONS=0,C_FREERUN_FREQUENCY=100,C_GT_TYPE=0,C_GT_REV=17,C_INCLUDE_CPLL_CAL=2,C_ENABLE_COMMON_USRCLK=0,C_USER_GTPOWERGOOD_DELAY_EN=0,C_SIM_CPLL_CAL_BYPASS=1,C_LOCATE_COMMON=0,C_LOCATE_RESET_CONTROLLER=0,C_LOCATE_USER_DATA_WIDTH_SIZING=0,C_LOCATE_RX_BUFFER_BYPASS_CONTROLLER=0,C_LOCATE_IN_SYSTEM_IBERT_CORE=2,C_LOCATE_RX_USER_CLOCKING=1,C_LOCATE_TX_BUFFER_BYPASS_CONTROLLER=0,C_LOCATE_TX_USER_CLOCKING=1,C_RESET_CONTROLLER_INSTANCE_CTRL=0,C_RX_BUFFBYPASS_MODE=0,C_RX_BUFFER_BYPASS_INSTANCE_CTRL=0,C_RX_BUFFER_MODE=1,C_RX_CB_DISP=00000000,C_RX_CB_K=00000000,C_RX_CB_MAX_LEVEL=1,C_RX_CB_LEN_SEQ=1,C_RX_CB_NUM_SEQ=0,C_RX_CB_VAL=00000000000000000000000000000000000000000000000000000000000000000000000000000000,C_RX_CC_DISP=00000000,C_RX_CC_ENABLE=0,C_RESET_SEQUENCE_INTERVAL=0,C_RX_CC_K=00000000,C_RX_CC_LEN_SEQ=1,C_RX_CC_NUM_SEQ=0,C_RX_CC_PERIODICITY=5000,C_RX_CC_VAL=00000000000000000000000000000000000000000000000000000000000000000000000000000000,C_RX_COMMA_M_ENABLE=0,C_RX_COMMA_M_VAL=1010000011,C_RX_COMMA_P_ENABLE=0,C_RX_COMMA_P_VAL=0101111100,C_RX_DATA_DECODING=2,C_RX_ENABLE=1,C_RX_INT_DATA_WIDTH=32,C_RX_LINE_RATE=10.3125,C_RX_MASTER_CHANNEL_IDX=12,C_RX_OUTCLK_BUFG_GT_DIV=1,C_RX_OUTCLK_FREQUENCY=322.2656250,C_RX_OUTCLK_SOURCE=1,C_RX_PLL_TYPE=0,C_RX_RECCLK_OUTPUT=0x000000000000000000000000000000000000000000000000,C_RX_REFCLK_FREQUENCY=156.25,C_RX_SLIDE_MODE=0,C_RX_USER_CLOCKING_CONTENTS=0,C_RX_USER_CLOCKING_INSTANCE_CTRL=0,C_RX_USER_CLOCKING_RATIO_FSRC_FUSRCLK=1,C_RX_USER_CLOCKING_RATIO_FUSRCLK_FUSRCLK2=1,C_RX_USER_CLOCKING_SOURCE=0,C_RX_USER_DATA_WIDTH=32,C_RX_USRCLK_FREQUENCY=322.2656250,C_RX_USRCLK2_FREQUENCY=322.2656250,C_SECONDARY_QPLL_ENABLE=0,C_SECONDARY_QPLL_REFCLK_FREQUENCY=257.8125,C_TOTAL_NUM_CHANNELS=1,C_TOTAL_NUM_COMMONS=1,C_TOTAL_NUM_COMMONS_EXAMPLE=0,C_TXPROGDIV_FREQ_ENABLE=0,C_TXPROGDIV_FREQ_SOURCE=0,C_TXPROGDIV_FREQ_VAL=322.265625,C_TX_BUFFBYPASS_MODE=0,C_TX_BUFFER_BYPASS_INSTANCE_CTRL=0,C_TX_BUFFER_MODE=1,C_TX_DATA_ENCODING=2,C_TX_ENABLE=1,C_TX_INT_DATA_WIDTH=32,C_TX_LINE_RATE=10.3125,C_TX_MASTER_CHANNEL_IDX=12,C_TX_OUTCLK_BUFG_GT_DIV=1,C_TX_OUTCLK_FREQUENCY=322.2656250,C_TX_OUTCLK_SOURCE=1,C_TX_PLL_TYPE=0,C_TX_REFCLK_FREQUENCY=156.25,C_TX_USER_CLOCKING_CONTENTS=0,C_TX_USER_CLOCKING_INSTANCE_CTRL=0,C_TX_USER_CLOCKING_RATIO_FSRC_FUSRCLK=1,C_TX_USER_CLOCKING_RATIO_FUSRCLK_FUSRCLK2=1,C_TX_USER_CLOCKING_SOURCE=0,C_TX_USER_DATA_WIDTH=32,C_TX_USRCLK_FREQUENCY=322.2656250,C_TX_USRCLK2_FREQUENCY=322.2656250}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of gth_fso_64b66b : entity is "yes";
end gth_fso_64b66b;

architecture stub of gth_fso_64b66b is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "gtwiz_userclk_tx_active_in[0:0],gtwiz_userclk_rx_active_in[0:0],gtwiz_reset_clk_freerun_in[0:0],gtwiz_reset_all_in[0:0],gtwiz_reset_tx_pll_and_datapath_in[0:0],gtwiz_reset_tx_datapath_in[0:0],gtwiz_reset_rx_pll_and_datapath_in[0:0],gtwiz_reset_rx_datapath_in[0:0],gtwiz_reset_rx_cdr_stable_out[0:0],gtwiz_reset_tx_done_out[0:0],gtwiz_reset_rx_done_out[0:0],gtwiz_userdata_tx_in[31:0],gtwiz_userdata_rx_out[31:0],gtrefclk00_in[0:0],qpll0outclk_out[0:0],qpll0outrefclk_out[0:0],gthrxn_in[0:0],gthrxp_in[0:0],rxgearboxslip_in[0:0],rxusrclk_in[0:0],rxusrclk2_in[0:0],txheader_in[5:0],txsequence_in[6:0],txusrclk_in[0:0],txusrclk2_in[0:0],gthtxn_out[0:0],gthtxp_out[0:0],gtpowergood_out[0:0],rxdatavalid_out[1:0],rxheader_out[5:0],rxheadervalid_out[1:0],rxoutclk_out[0:0],rxpmaresetdone_out[0:0],rxstartofseq_out[1:0],txoutclk_out[0:0],txpmaresetdone_out[0:0]";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "gth_fso_64b66b_gtwizard_top,Vivado 2025.2";
begin
end;
