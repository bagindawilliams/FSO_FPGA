-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
-- Date        : Tue Aug 11 23:52:56 2026
-- Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gt_stub.vhdl
-- Design      : gt
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku060-ffva1156-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
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
    gtwiz_userdata_tx_in : in STD_LOGIC_VECTOR ( 127 downto 0 );
    gtwiz_userdata_rx_out : out STD_LOGIC_VECTOR ( 127 downto 0 );
    gtrefclk00_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0outclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0outrefclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxn_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gthrxp_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rx8b10ben_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxbufreset_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxchbonden_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxchbondi_in : in STD_LOGIC_VECTOR ( 19 downto 0 );
    rxchbondlevel_in : in STD_LOGIC_VECTOR ( 11 downto 0 );
    rxchbondmaster_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxchbondslave_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxcommadeten_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxlpmen_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxmcommaalignen_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxpcommaalignen_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxusrclk_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxusrclk2_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    tx8b10ben_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    txctrl0_in : in STD_LOGIC_VECTOR ( 63 downto 0 );
    txctrl1_in : in STD_LOGIC_VECTOR ( 63 downto 0 );
    txctrl2_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    txdiffctrl_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    txpostcursor_in : in STD_LOGIC_VECTOR ( 19 downto 0 );
    txprecursor_in : in STD_LOGIC_VECTOR ( 19 downto 0 );
    txusrclk_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    txusrclk2_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gthtxn_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    gthtxp_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    gtpowergood_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rxbufstatus_out : out STD_LOGIC_VECTOR ( 11 downto 0 );
    rxbyteisaligned_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rxbyterealign_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rxchanbondseq_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rxchanisaligned_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rxchanrealign_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rxchbondo_out : out STD_LOGIC_VECTOR ( 19 downto 0 );
    rxclkcorcnt_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxcommadet_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rxctrl0_out : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rxctrl1_out : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rxctrl2_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rxctrl3_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rxoutclk_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rxpmaresetdone_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    txoutclk_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    txpmaresetdone_out : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "gt,gt_gtwizard_top,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "gt,gt_gtwizard_top,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=gtwizard_ultrascale,x_ipVersion=1.7,x_ipCoreRevision=22,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_CHANNEL_ENABLE=000000000000000000000000000000000000000000000000000000000000000000000000000000000000111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,C_PCIE_ENABLE=0,C_PCIE_CORECLK_FREQ=250,C_COMMON_SCALING_FACTOR=1,C_CPLL_VCO_FREQUENCY=2578.125,C_FORCE_COMMONS=0,C_FREERUN_FREQUENCY=100,C_GT_TYPE=0,C_GT_REV=17,C_INCLUDE_CPLL_CAL=2,C_ENABLE_COMMON_USRCLK=0,C_USER_GTPOWERGOOD_DELAY_EN=0,C_SIM_CPLL_CAL_BYPASS=1,C_LOCATE_COMMON=0,C_LOCATE_RESET_CONTROLLER=0,C_LOCATE_USER_DATA_WIDTH_SIZING=0,C_LOCATE_RX_BUFFER_BYPASS_CONTROLLER=0,C_LOCATE_IN_SYSTEM_IBERT_CORE=2,C_LOCATE_RX_USER_CLOCKING=1,C_LOCATE_TX_BUFFER_BYPASS_CONTROLLER=0,C_LOCATE_TX_USER_CLOCKING=1,C_RESET_CONTROLLER_INSTANCE_CTRL=0,C_RX_BUFFBYPASS_MODE=0,C_RX_BUFFER_BYPASS_INSTANCE_CTRL=0,C_RX_BUFFER_MODE=1,C_RX_CB_DISP=00000000,C_RX_CB_K=00000001,C_RX_CB_MAX_LEVEL=2,C_RX_CB_LEN_SEQ=1,C_RX_CB_NUM_SEQ=1,C_RX_CB_VAL=00000000000000000000000000000000000000000000000000000000000000000000000001111100,C_RX_CC_DISP=00000000,C_RX_CC_ENABLE=1,C_RESET_SEQUENCE_INTERVAL=0,C_RX_CC_K=00001111,C_RX_CC_LEN_SEQ=4,C_RX_CC_NUM_SEQ=1,C_RX_CC_PERIODICITY=5000,C_RX_CC_VAL=00000000000000000000000000000000000000000011110111001111011100111101110011110111,C_RX_COMMA_M_ENABLE=1,C_RX_COMMA_M_VAL=1010000011,C_RX_COMMA_P_ENABLE=1,C_RX_COMMA_P_VAL=0101111100,C_RX_DATA_DECODING=1,C_RX_ENABLE=1,C_RX_INT_DATA_WIDTH=40,C_RX_LINE_RATE=10,C_RX_MASTER_CHANNEL_IDX=107,C_RX_OUTCLK_BUFG_GT_DIV=1,C_RX_OUTCLK_FREQUENCY=250.0000000,C_RX_OUTCLK_SOURCE=1,C_RX_PLL_TYPE=0,C_RX_RECCLK_OUTPUT=0x000000000000000000000000000000000000000000000000,C_RX_REFCLK_FREQUENCY=156.25,C_RX_SLIDE_MODE=0,C_RX_USER_CLOCKING_CONTENTS=0,C_RX_USER_CLOCKING_INSTANCE_CTRL=0,C_RX_USER_CLOCKING_RATIO_FSRC_FUSRCLK=1,C_RX_USER_CLOCKING_RATIO_FUSRCLK_FUSRCLK2=1,C_RX_USER_CLOCKING_SOURCE=0,C_RX_USER_DATA_WIDTH=32,C_RX_USRCLK_FREQUENCY=250.0000000,C_RX_USRCLK2_FREQUENCY=250.0000000,C_SECONDARY_QPLL_ENABLE=0,C_SECONDARY_QPLL_REFCLK_FREQUENCY=257.8125,C_TOTAL_NUM_CHANNELS=4,C_TOTAL_NUM_COMMONS=1,C_TOTAL_NUM_COMMONS_EXAMPLE=0,C_TXPROGDIV_FREQ_ENABLE=0,C_TXPROGDIV_FREQ_SOURCE=0,C_TXPROGDIV_FREQ_VAL=250,C_TX_BUFFBYPASS_MODE=0,C_TX_BUFFER_BYPASS_INSTANCE_CTRL=0,C_TX_BUFFER_MODE=1,C_TX_DATA_ENCODING=1,C_TX_ENABLE=1,C_TX_INT_DATA_WIDTH=40,C_TX_LINE_RATE=10,C_TX_MASTER_CHANNEL_IDX=107,C_TX_OUTCLK_BUFG_GT_DIV=1,C_TX_OUTCLK_FREQUENCY=250.0000000,C_TX_OUTCLK_SOURCE=1,C_TX_PLL_TYPE=0,C_TX_REFCLK_FREQUENCY=156.25,C_TX_USER_CLOCKING_CONTENTS=0,C_TX_USER_CLOCKING_INSTANCE_CTRL=0,C_TX_USER_CLOCKING_RATIO_FSRC_FUSRCLK=1,C_TX_USER_CLOCKING_RATIO_FUSRCLK_FUSRCLK2=1,C_TX_USER_CLOCKING_SOURCE=0,C_TX_USER_DATA_WIDTH=32,C_TX_USRCLK_FREQUENCY=250.0000000,C_TX_USRCLK2_FREQUENCY=250.0000000}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "gtwiz_userclk_tx_active_in[0:0],gtwiz_userclk_rx_active_in[0:0],gtwiz_reset_clk_freerun_in[0:0],gtwiz_reset_all_in[0:0],gtwiz_reset_tx_pll_and_datapath_in[0:0],gtwiz_reset_tx_datapath_in[0:0],gtwiz_reset_rx_pll_and_datapath_in[0:0],gtwiz_reset_rx_datapath_in[0:0],gtwiz_reset_rx_cdr_stable_out[0:0],gtwiz_reset_tx_done_out[0:0],gtwiz_reset_rx_done_out[0:0],gtwiz_userdata_tx_in[127:0],gtwiz_userdata_rx_out[127:0],gtrefclk00_in[0:0],qpll0outclk_out[0:0],qpll0outrefclk_out[0:0],gthrxn_in[3:0],gthrxp_in[3:0],rx8b10ben_in[3:0],rxbufreset_in[3:0],rxchbonden_in[3:0],rxchbondi_in[19:0],rxchbondlevel_in[11:0],rxchbondmaster_in[3:0],rxchbondslave_in[3:0],rxcommadeten_in[3:0],rxlpmen_in[3:0],rxmcommaalignen_in[3:0],rxpcommaalignen_in[3:0],rxusrclk_in[3:0],rxusrclk2_in[3:0],tx8b10ben_in[3:0],txctrl0_in[63:0],txctrl1_in[63:0],txctrl2_in[31:0],txdiffctrl_in[15:0],txpostcursor_in[19:0],txprecursor_in[19:0],txusrclk_in[3:0],txusrclk2_in[3:0],gthtxn_out[3:0],gthtxp_out[3:0],gtpowergood_out[3:0],rxbufstatus_out[11:0],rxbyteisaligned_out[3:0],rxbyterealign_out[3:0],rxchanbondseq_out[3:0],rxchanisaligned_out[3:0],rxchanrealign_out[3:0],rxchbondo_out[19:0],rxclkcorcnt_out[7:0],rxcommadet_out[3:0],rxctrl0_out[63:0],rxctrl1_out[63:0],rxctrl2_out[31:0],rxctrl3_out[31:0],rxoutclk_out[3:0],rxpmaresetdone_out[3:0],txoutclk_out[3:0],txpmaresetdone_out[3:0]";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "gt_gtwizard_top,Vivado 2025.2";
begin
end;
