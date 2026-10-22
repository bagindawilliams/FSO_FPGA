#==============================================================================
# Company      : WiComAI Lab, Kookmin University
# Engineers    : Williamsyah Baginda Miraj & Giovanni Dwi
# File Name    : SDAOISL10Gto10G.xdc
# Target Board : ALINX AXKU062 (AMD Xilinx Kintex UltraScale xcku060-ffva1156-2-i)
# Description  : Physical Pin, GTH Quad X1Y2 Co-Location, CDC Timing, and 
#                3 Stage-Dedicated ChipScope ILA Cores (TX, GTH, RX)
#==============================================================================

# -----------------------------------------------------------------------------
# 1. BITSTREAM & SPI FLASH CONFIGURATION PROPERTIES
# -----------------------------------------------------------------------------
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 8 [current_design]
set_property CONFIG_MODE SPIx8 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]

# -----------------------------------------------------------------------------
# 2. SYSTEM DIFFERENTIAL CLOCK (200 MHz Oscillator -> Pin AK17 / AL17)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN AK17 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports sys_clk_p]

# -----------------------------------------------------------------------------
# 3. GTH REFERENCE CLOCK & QUAD X1Y2 CO-LOCATION (156.25 MHz -> Pin T6 / T5)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN T6 [get_ports fso_refclk_p]
create_clock -name clk_fso_refclk_p -period 6.400 [get_ports fso_refclk_p]

set_property LOC GTHE3_COMMON_X1Y2 [get_cells {u_fso_gth_core/u_gth_fso_64b66b/inst/gen_gtwizard_gthe3_top.gth_fso_64b66b_gtwizard_gthe3_inst/gen_gtwizard_gthe3.gen_common.gen_common_container[3].gen_enabled_common.gthe3_common_wrapper_inst/common_inst/gthe3_common_gen.GTHE3_COMMON_PRIM_INST}]
set_property LOC GTHE3_CHANNEL_X1Y8 [get_cells {u_fso_gth_core/u_gth_fso_64b66b/inst/gen_gtwizard_gthe3_top.gth_fso_64b66b_gtwizard_gthe3_inst/gen_gtwizard_gthe3.gen_channel_container[3].gen_enabled_channel.gthe3_channel_wrapper_inst/channel_inst/gthe3_channel_gen.gen_gthe3_channel_inst[0].GTHE3_CHANNEL_PRIM_INST}]

# -----------------------------------------------------------------------------
# 4. SFP+ OPTICAL MODULE CONTROL & BOARD COOLING FAN PINS (LVCMOS18)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN AN11 [get_ports {tx_disable[0]}]
set_property PACKAGE_PIN AM11 [get_ports {tx_disable[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {tx_disable[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {tx_disable[1]}]

set_property PACKAGE_PIN AK11 [get_ports fan]
set_property IOSTANDARD LVCMOS18 [get_ports fan]

# -----------------------------------------------------------------------------
# 5. ASYNCHRONOUS CLOCK DOMAIN CROSSING (CDC) & GTH CLOCK GROUPS
# -----------------------------------------------------------------------------
set_clock_groups -asynchronous \
    -group [get_clocks -include_generated_clocks -of_objects [get_pins clk_wiz_0_inst/inst/mmcme3_adv_inst/CLKOUT0]] \
    -group [get_clocks -include_generated_clocks -of_objects [get_pins clk_wiz_0_inst/inst/mmcme3_adv_inst/CLKOUT1]] \
    -group [get_clocks -include_generated_clocks -of_objects [get_pins u_fso_gth_core/u_bufg_gt_tx/O]] \
    -group [get_clocks -include_generated_clocks -of_objects [get_pins u_fso_gth_core/u_bufg_gt_rx/O]]

# -----------------------------------------------------------------------------
# 6. FALSE PATH & DRC RELAXATION FOR SIMULATION-ONLY TOP-LEVEL PROBING PORTS
# -----------------------------------------------------------------------------
set_false_path -to [get_ports {tx_fso_data_out[*] tx_fso_valid_out}]
set_false_path -to [get_ports {rx_fso_data_out[*] rx_fso_valid_out}]
set_false_path -to [get_ports {rx_dec_hdr_tdata[*] rx_dec_hdr_tvalid}]
set_false_path -to [get_ports {rx_dec_pld_tdata[*] rx_dec_pld_tvalid}]
set_false_path -to [get_ports {pc2_xgmii_txd[*] pc2_xgmii_txc[*]}]
set_false_path -to [get_ports {rx_preamble_locked rx_block_locked gth_link_up eth_data_error_flag}]

set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]

# =============================================================================
# 7. STAGE-BASED INTEGRATED LOGIC ANALYZER (ILA) CONFIGURATION
# =============================================================================

# -----------------------------------------------------------------------------
# ILA 1 (u_ila_0): TX STAGE MONITOR (Inside u_gth64b66b_tx, Clock: tx0_clk)
# -----------------------------------------------------------------------------
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]

set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list tx0_clk]]

set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 33 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list u_gth64b66b_tx/dbg_tx_fso_valid \
    {u_gth64b66b_tx/dbg_tx_fso_data[0]}  {u_gth64b66b_tx/dbg_tx_fso_data[1]}  {u_gth64b66b_tx/dbg_tx_fso_data[2]}  {u_gth64b66b_tx/dbg_tx_fso_data[3]} \
    {u_gth64b66b_tx/dbg_tx_fso_data[4]}  {u_gth64b66b_tx/dbg_tx_fso_data[5]}  {u_gth64b66b_tx/dbg_tx_fso_data[6]}  {u_gth64b66b_tx/dbg_tx_fso_data[7]} \
    {u_gth64b66b_tx/dbg_tx_fso_data[8]}  {u_gth64b66b_tx/dbg_tx_fso_data[9]}  {u_gth64b66b_tx/dbg_tx_fso_data[10]} {u_gth64b66b_tx/dbg_tx_fso_data[11]} \
    {u_gth64b66b_tx/dbg_tx_fso_data[12]} {u_gth64b66b_tx/dbg_tx_fso_data[13]} {u_gth64b66b_tx/dbg_tx_fso_data[14]} {u_gth64b66b_tx/dbg_tx_fso_data[15]} \
    {u_gth64b66b_tx/dbg_tx_fso_data[16]} {u_gth64b66b_tx/dbg_tx_fso_data[17]} {u_gth64b66b_tx/dbg_tx_fso_data[18]} {u_gth64b66b_tx/dbg_tx_fso_data[19]} \
    {u_gth64b66b_tx/dbg_tx_fso_data[20]} {u_gth64b66b_tx/dbg_tx_fso_data[21]} {u_gth64b66b_tx/dbg_tx_fso_data[22]} {u_gth64b66b_tx/dbg_tx_fso_data[23]} \
    {u_gth64b66b_tx/dbg_tx_fso_data[24]} {u_gth64b66b_tx/dbg_tx_fso_data[25]} {u_gth64b66b_tx/dbg_tx_fso_data[26]} {u_gth64b66b_tx/dbg_tx_fso_data[27]} \
    {u_gth64b66b_tx/dbg_tx_fso_data[28]} {u_gth64b66b_tx/dbg_tx_fso_data[29]} {u_gth64b66b_tx/dbg_tx_fso_data[30]} {u_gth64b66b_tx/dbg_tx_fso_data[31]}]]

create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 16 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list \
    {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[0]}  {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[1]}  {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[2]}  {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[3]} \
    {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[4]}  {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[5]}  {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[6]}  {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[7]} \
    {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[8]}  {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[9]}  {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[10]} {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[11]} \
    {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[12]} {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[13]} {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[14]} {u_gth64b66b_tx/dbg_tx_fso_byte_cnt[15]}]]

create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list \
    {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[0]}  {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[1]}  {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[2]}  {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[3]} \
    {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[4]}  {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[5]}  {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[6]}  {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[7]} \
    {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[8]}  {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[9]}  {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[10]} {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[11]} \
    {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[12]} {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[13]} {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[14]} {u_gth64b66b_tx/dbg_tx_fso_frame_cnt[15]}]]

# -----------------------------------------------------------------------------
# ILA 2 (u_ila_1): GTH OPTICAL LINK MONITOR (Inside u_gth64b66b_rx, Clock: rx0_clk)
# -----------------------------------------------------------------------------
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]

set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list rx0_clk]]

set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 2 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list \
    u_gth64b66b_rx/dbg_gth_rx_ready u_gth64b66b_rx/dbg_rx_block_locked]]

create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 33 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list u_gth64b66b_rx/dbg_gth_rx_valid \
    {u_gth64b66b_rx/dbg_gth_rx_data[0]}  {u_gth64b66b_rx/dbg_gth_rx_data[1]}  {u_gth64b66b_rx/dbg_gth_rx_data[2]}  {u_gth64b66b_rx/dbg_gth_rx_data[3]} \
    {u_gth64b66b_rx/dbg_gth_rx_data[4]}  {u_gth64b66b_rx/dbg_gth_rx_data[5]}  {u_gth64b66b_rx/dbg_gth_rx_data[6]}  {u_gth64b66b_rx/dbg_gth_rx_data[7]} \
    {u_gth64b66b_rx/dbg_gth_rx_data[8]}  {u_gth64b66b_rx/dbg_gth_rx_data[9]}  {u_gth64b66b_rx/dbg_gth_rx_data[10]} {u_gth64b66b_rx/dbg_gth_rx_data[11]} \
    {u_gth64b66b_rx/dbg_gth_rx_data[12]} {u_gth64b66b_rx/dbg_gth_rx_data[13]} {u_gth64b66b_rx/dbg_gth_rx_data[14]} {u_gth64b66b_rx/dbg_gth_rx_data[15]} \
    {u_gth64b66b_rx/dbg_gth_rx_data[16]} {u_gth64b66b_rx/dbg_gth_rx_data[17]} {u_gth64b66b_rx/dbg_gth_rx_data[18]} {u_gth64b66b_rx/dbg_gth_rx_data[19]} \
    {u_gth64b66b_rx/dbg_gth_rx_data[20]} {u_gth64b66b_rx/dbg_gth_rx_data[21]} {u_gth64b66b_rx/dbg_gth_rx_data[22]} {u_gth64b66b_rx/dbg_gth_rx_data[23]} \
    {u_gth64b66b_rx/dbg_gth_rx_data[24]} {u_gth64b66b_rx/dbg_gth_rx_data[25]} {u_gth64b66b_rx/dbg_gth_rx_data[26]} {u_gth64b66b_rx/dbg_gth_rx_data[27]} \
    {u_gth64b66b_rx/dbg_gth_rx_data[28]} {u_gth64b66b_rx/dbg_gth_rx_data[29]} {u_gth64b66b_rx/dbg_gth_rx_data[30]} {u_gth64b66b_rx/dbg_gth_rx_data[31]}]]

create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 16 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list \
    {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[0]}  {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[1]}  {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[2]}  {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[3]} \
    {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[4]}  {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[5]}  {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[6]}  {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[7]} \
    {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[8]}  {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[9]}  {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[10]} {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[11]} \
    {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[12]} {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[13]} {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[14]} {u_gth64b66b_rx/dbg_gth_rx_byte_cnt[15]}]]

create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 16 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list \
    {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[0]}  {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[1]}  {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[2]}  {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[3]} \
    {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[4]}  {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[5]}  {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[6]}  {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[7]} \
    {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[8]}  {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[9]}  {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[10]} {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[11]} \
    {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[12]} {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[13]} {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[14]} {u_gth64b66b_rx/dbg_gth_rx_frame_cnt[15]}]]

# -----------------------------------------------------------------------------
# ILA 3 (u_ila_2): RX & PC 2 EGRESS MONITOR (Inside back_end_inst, Clock: rx0_clk)
# -----------------------------------------------------------------------------
create_debug_core u_ila_2 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_2]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_2]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_2]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_2]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_2]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_2]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_2]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_2]

set_property port_width 1 [get_debug_ports u_ila_2/clk]
connect_debug_port u_ila_2/clk [get_nets [list rx0_clk]]

set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe0]
set_property port_width 36 [get_debug_ports u_ila_2/probe0]
connect_debug_port u_ila_2/probe0 [get_nets [list \
    {back_end_inst/dbg_pc2_xgmii_txd[0]}  {back_end_inst/dbg_pc2_xgmii_txd[1]}  {back_end_inst/dbg_pc2_xgmii_txd[2]}  {back_end_inst/dbg_pc2_xgmii_txd[3]} \
    {back_end_inst/dbg_pc2_xgmii_txd[4]}  {back_end_inst/dbg_pc2_xgmii_txd[5]}  {back_end_inst/dbg_pc2_xgmii_txd[6]}  {back_end_inst/dbg_pc2_xgmii_txd[7]} \
    {back_end_inst/dbg_pc2_xgmii_txd[8]}  {back_end_inst/dbg_pc2_xgmii_txd[9]}  {back_end_inst/dbg_pc2_xgmii_txd[10]} {back_end_inst/dbg_pc2_xgmii_txd[11]} \
    {back_end_inst/dbg_pc2_xgmii_txd[12]} {back_end_inst/dbg_pc2_xgmii_txd[13]} {back_end_inst/dbg_pc2_xgmii_txd[14]} {back_end_inst/dbg_pc2_xgmii_txd[15]} \
    {back_end_inst/dbg_pc2_xgmii_txd[16]} {back_end_inst/dbg_pc2_xgmii_txd[17]} {back_end_inst/dbg_pc2_xgmii_txd[18]} {back_end_inst/dbg_pc2_xgmii_txd[19]} \
    {back_end_inst/dbg_pc2_xgmii_txd[20]} {back_end_inst/dbg_pc2_xgmii_txd[21]} {back_end_inst/dbg_pc2_xgmii_txd[22]} {back_end_inst/dbg_pc2_xgmii_txd[23]} \
    {back_end_inst/dbg_pc2_xgmii_txd[24]} {back_end_inst/dbg_pc2_xgmii_txd[25]} {back_end_inst/dbg_pc2_xgmii_txd[26]} {back_end_inst/dbg_pc2_xgmii_txd[27]} \
    {back_end_inst/dbg_pc2_xgmii_txd[28]} {back_end_inst/dbg_pc2_xgmii_txd[29]} {back_end_inst/dbg_pc2_xgmii_txd[30]} {back_end_inst/dbg_pc2_xgmii_txd[31]} \
    {back_end_inst/dbg_pc2_xgmii_txc[0]}  {back_end_inst/dbg_pc2_xgmii_txc[1]}  {back_end_inst/dbg_pc2_xgmii_txc[2]}  {back_end_inst/dbg_pc2_xgmii_txc[3]}]]

create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe1]
set_property port_width 16 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list \
    {back_end_inst/dbg_rx_eth_byte_cnt[0]}  {back_end_inst/dbg_rx_eth_byte_cnt[1]}  {back_end_inst/dbg_rx_eth_byte_cnt[2]}  {back_end_inst/dbg_rx_eth_byte_cnt[3]} \
    {back_end_inst/dbg_rx_eth_byte_cnt[4]}  {back_end_inst/dbg_rx_eth_byte_cnt[5]}  {back_end_inst/dbg_rx_eth_byte_cnt[6]}  {back_end_inst/dbg_rx_eth_byte_cnt[7]} \
    {back_end_inst/dbg_rx_eth_byte_cnt[8]}  {back_end_inst/dbg_rx_eth_byte_cnt[9]}  {back_end_inst/dbg_rx_eth_byte_cnt[10]} {back_end_inst/dbg_rx_eth_byte_cnt[11]} \
    {back_end_inst/dbg_rx_eth_byte_cnt[12]} {back_end_inst/dbg_rx_eth_byte_cnt[13]} {back_end_inst/dbg_rx_eth_byte_cnt[14]} {back_end_inst/dbg_rx_eth_byte_cnt[15]}]]

create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe2]
set_property port_width 16 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list \
    {back_end_inst/dbg_rx_eth_pkt_cnt[0]}  {back_end_inst/dbg_rx_eth_pkt_cnt[1]}  {back_end_inst/dbg_rx_eth_pkt_cnt[2]}  {back_end_inst/dbg_rx_eth_pkt_cnt[3]} \
    {back_end_inst/dbg_rx_eth_pkt_cnt[4]}  {back_end_inst/dbg_rx_eth_pkt_cnt[5]}  {back_end_inst/dbg_rx_eth_pkt_cnt[6]}  {back_end_inst/dbg_rx_eth_pkt_cnt[7]} \
    {back_end_inst/dbg_rx_eth_pkt_cnt[8]}  {back_end_inst/dbg_rx_eth_pkt_cnt[9]}  {back_end_inst/dbg_rx_eth_pkt_cnt[10]} {back_end_inst/dbg_rx_eth_pkt_cnt[11]} \
    {back_end_inst/dbg_rx_eth_pkt_cnt[12]} {back_end_inst/dbg_rx_eth_pkt_cnt[13]} {back_end_inst/dbg_rx_eth_pkt_cnt[14]} {back_end_inst/dbg_rx_eth_pkt_cnt[15]}]]

# Connect Debug Hub to Global 100 MHz BUFG Clock (clk_100M)
set_property C_CLK_INPUT_FREQ_HZ 100000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_100M]