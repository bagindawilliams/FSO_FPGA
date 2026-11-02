#------------------------------------------------------------------------------
#  (c) Copyright 2023 Advanced Micro Devices, Inc. All rights reserved.
#------------------------------------------------------------------------------

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 8 [current_design]
set_property CONFIG_MODE SPIx8 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]

# --- PERBAIKAN: Matikan pin yang sudah tidak ada di top.v ---
# set_property package_pin V5 [get_ports mgtrefclk0_x1y2_n]
# set_property package_pin V6 [get_ports mgtrefclk0_x1y2_p]
# create_clock -name clk_freerun -period 10.0 [get_ports hb_gtwiz_reset_clk_freerun_in]
# create_clock -name clk_mgtrefclk0_x1y2_p -period 6.4 [get_ports mgtrefclk0_x1y2_p]
# ------------------------------------------------------------

# --- PERBAIKAN: Tambahkan constraint clock referensi yang benar ---
create_clock -name clk_mgtrefclk_p -period 6.4 [get_ports mgtrefclk_p]
# ------------------------------------------------------------------

set_property PACKAGE_PIN T6 [get_ports mgtrefclk_p]
set_property PACKAGE_PIN AK17 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports sys_clk_p]
set_property PACKAGE_PIN AN11 [get_ports {tx_disable[0]}]
set_property PACKAGE_PIN AM11 [get_ports {tx_disable[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {tx_disable[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {tx_disable[0]}]

set_property PACKAGE_PIN AK11 [get_ports fan]
set_property IOSTANDARD LVCMOS18 [get_ports fan]

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
connect_debug_port u_ila_0/clk [get_nets [list {gtx_exdes_m0/example_wrapper_inst/gtwiz_userclk_rx_inst/rxusrclk2_in[0]}]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {decoder_top_inst/header[0]} {decoder_top_inst/header[1]} {decoder_top_inst/header[2]} {decoder_top_inst/header[3]} {decoder_top_inst/header[4]} {decoder_top_inst/header[5]} {decoder_top_inst/header[6]} {decoder_top_inst/header[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {decoder_top_inst/payload[0]} {decoder_top_inst/payload[1]} {decoder_top_inst/payload[2]} {decoder_top_inst/payload[3]} {decoder_top_inst/payload[4]} {decoder_top_inst/payload[5]} {decoder_top_inst/payload[6]} {decoder_top_inst/payload[7]} {decoder_top_inst/payload[8]} {decoder_top_inst/payload[9]} {decoder_top_inst/payload[10]} {decoder_top_inst/payload[11]} {decoder_top_inst/payload[12]} {decoder_top_inst/payload[13]} {decoder_top_inst/payload[14]} {decoder_top_inst/payload[15]} {decoder_top_inst/payload[16]} {decoder_top_inst/payload[17]} {decoder_top_inst/payload[18]} {decoder_top_inst/payload[19]} {decoder_top_inst/payload[20]} {decoder_top_inst/payload[21]} {decoder_top_inst/payload[22]} {decoder_top_inst/payload[23]} {decoder_top_inst/payload[24]} {decoder_top_inst/payload[25]} {decoder_top_inst/payload[26]} {decoder_top_inst/payload[27]} {decoder_top_inst/payload[28]} {decoder_top_inst/payload[29]} {decoder_top_inst/payload[30]} {decoder_top_inst/payload[31]}]]

# [CATATAN: Probe packet_rec_m0 dimatikan otomatis oleh Vivado saat disintesis karena modulnya dinonaktifkan di top.v]

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
connect_debug_port u_ila_1/clk [get_nets [list clk_wiz_0_inst/inst/clk_out2]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 96 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {decoder_top_inst/core_data[0]} {decoder_top_inst/core_data[1]} {decoder_top_inst/core_data[2]} {decoder_top_inst/core_data[3]} {decoder_top_inst/core_data[4]} {decoder_top_inst/core_data[5]} {decoder_top_inst/core_data[6]} {decoder_top_inst/core_data[7]} {decoder_top_inst/core_data[8]} {decoder_top_inst/core_data[9]} {decoder_top_inst/core_data[10]} {decoder_top_inst/core_data[11]} {decoder_top_inst/core_data[12]} {decoder_top_inst/core_data[13]} {decoder_top_inst/core_data[14]} {decoder_top_inst/core_data[15]} {decoder_top_inst/core_data[16]} {decoder_top_inst/core_data[17]} {decoder_top_inst/core_data[18]} {decoder_top_inst/core_data[19]} {decoder_top_inst/core_data[20]} {decoder_top_inst/core_data[21]} {decoder_top_inst/core_data[22]} {decoder_top_inst/core_data[23]} {decoder_top_inst/core_data[24]} {decoder_top_inst/core_data[25]} {decoder_top_inst/core_data[26]} {decoder_top_inst/core_data[27]} {decoder_top_inst/core_data[28]} {decoder_top_inst/core_data[29]} {decoder_top_inst/core_data[30]} {decoder_top_inst/core_data[31]} {decoder_top_inst/core_data[32]} {decoder_top_inst/core_data[33]} {decoder_top_inst/core_data[34]} {decoder_top_inst/core_data[35]} {decoder_top_inst/core_data[36]} {decoder_top_inst/core_data[37]} {decoder_top_inst/core_data[38]} {decoder_top_inst/core_data[39]} {decoder_top_inst/core_data[40]} {decoder_top_inst/core_data[41]} {decoder_top_inst/core_data[42]} {decoder_top_inst/core_data[43]} {decoder_top_inst/core_data[44]} {decoder_top_inst/core_data[45]} {decoder_top_inst/core_data[46]} {decoder_top_inst/core_data[47]} {decoder_top_inst/core_data[48]} {decoder_top_inst/core_data[49]} {decoder_top_inst/core_data[50]} {decoder_top_inst/core_data[51]} {decoder_top_inst/core_data[52]} {decoder_top_inst/core_data[53]} {decoder_top_inst/core_data[54]} {decoder_top_inst/core_data[55]} {decoder_top_inst/core_data[56]} {decoder_top_inst/core_data[57]} {decoder_top_inst/core_data[58]} {decoder_top_inst/core_data[59]} {decoder_top_inst/core_data[60]} {decoder_top_inst/core_data[61]} {decoder_top_inst/core_data[62]} {decoder_top_inst/core_data[63]} {decoder_top_inst/core_data[64]} {decoder_top_inst/core_data[65]} {decoder_top_inst/core_data[66]} {decoder_top_inst/core_data[67]} {decoder_top_inst/core_data[68]} {decoder_top_inst/core_data[69]} {decoder_top_inst/core_data[70]} {decoder_top_inst/core_data[71]} {decoder_top_inst/core_data[72]} {decoder_top_inst/core_data[73]} {decoder_top_inst/core_data[74]} {decoder_top_inst/core_data[75]} {decoder_top_inst/core_data[76]} {decoder_top_inst/core_data[77]} {decoder_top_inst/core_data[78]} {decoder_top_inst/core_data[79]} {decoder_top_inst/core_data[80]} {decoder_top_inst/core_data[81]} {decoder_top_inst/core_data[82]} {decoder_top_inst/core_data[83]} {decoder_top_inst/core_data[84]} {decoder_top_inst/core_data[85]} {decoder_top_inst/core_data[86]} {decoder_top_inst/core_data[87]} {decoder_top_inst/core_data[88]} {decoder_top_inst/core_data[89]} {decoder_top_inst/core_data[90]} {decoder_top_inst/core_data[91]} {decoder_top_inst/core_data[92]} {decoder_top_inst/core_data[93]} {decoder_top_inst/core_data[94]} {decoder_top_inst/core_data[95]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 8 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {decoder_top_inst/rs_head[0]} {decoder_top_inst/rs_head[1]} {decoder_top_inst/rs_head[2]} {decoder_top_inst/rs_head[3]} {decoder_top_inst/rs_head[4]} {decoder_top_inst/rs_head[5]} {decoder_top_inst/rs_head[6]} {decoder_top_inst/rs_head[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 64 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {decoder_top_inst/rs_load[0]} {decoder_top_inst/rs_load[1]} {decoder_top_inst/rs_load[2]} {decoder_top_inst/rs_load[3]} {decoder_top_inst/rs_load[4]} {decoder_top_inst/rs_load[5]} {decoder_top_inst/rs_load[6]} {decoder_top_inst/rs_load[7]} {decoder_top_inst/rs_load[8]} {decoder_top_inst/rs_load[9]} {decoder_top_inst/rs_load[10]} {decoder_top_inst/rs_load[11]} {decoder_top_inst/rs_load[12]} {decoder_top_inst/rs_load[13]} {decoder_top_inst/rs_load[14]} {decoder_top_inst/rs_load[15]} {decoder_top_inst/rs_load[16]} {decoder_top_inst/rs_load[17]} {decoder_top_inst/rs_load[18]} {decoder_top_inst/rs_load[19]} {decoder_top_inst/rs_load[20]} {decoder_top_inst/rs_load[21]} {decoder_top_inst/rs_load[22]} {decoder_top_inst/rs_load[23]} {decoder_top_inst/rs_load[24]} {decoder_top_inst/rs_load[25]} {decoder_top_inst/rs_load[26]} {decoder_top_inst/rs_load[27]} {decoder_top_inst/rs_load[28]} {decoder_top_inst/rs_load[29]} {decoder_top_inst/rs_load[30]} {decoder_top_inst/rs_load[31]} {decoder_top_inst/rs_load[32]} {decoder_top_inst/rs_load[33]} {decoder_top_inst/rs_load[34]} {decoder_top_inst/rs_load[35]} {decoder_top_inst/rs_load[36]} {decoder_top_inst/rs_load[37]} {decoder_top_inst/rs_load[38]} {decoder_top_inst/rs_load[39]} {decoder_top_inst/rs_load[40]} {decoder_top_inst/rs_load[41]} {decoder_top_inst/rs_load[42]} {decoder_top_inst/rs_load[43]} {decoder_top_inst/rs_load[44]} {decoder_top_inst/rs_load[45]} {decoder_top_inst/rs_load[46]} {decoder_top_inst/rs_load[47]} {decoder_top_inst/rs_load[48]} {decoder_top_inst/rs_load[49]} {decoder_top_inst/rs_load[50]} {decoder_top_inst/rs_load[51]} {decoder_top_inst/rs_load[52]} {decoder_top_inst/rs_load[53]} {decoder_top_inst/rs_load[54]} {decoder_top_inst/rs_load[55]} {decoder_top_inst/rs_load[56]} {decoder_top_inst/rs_load[57]} {decoder_top_inst/rs_load[58]} {decoder_top_inst/rs_load[59]} {decoder_top_inst/rs_load[60]} {decoder_top_inst/rs_load[61]} {decoder_top_inst/rs_load[62]} {decoder_top_inst/rs_load[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 1 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list decoder_top_inst/core_dv]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 1 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list decoder_top_inst/rs_head_dv]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 1 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list decoder_top_inst/rs_load_dv]]
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
connect_debug_port u_ila_2/clk [get_nets [list {gtx_exdes_m0/example_wrapper_inst/gtwiz_userclk_tx_inst/txusrclk2_in[0]}]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe0]
set_property port_width 16 [get_debug_ports u_ila_2/probe0]
connect_debug_port u_ila_2/probe0 [get_nets [list {autorun_inst/count[0]} {autorun_inst/count[1]} {autorun_inst/count[2]} {autorun_inst/count[3]} {autorun_inst/count[4]} {autorun_inst/count[5]} {autorun_inst/count[6]} {autorun_inst/count[7]} {autorun_inst/count[8]} {autorun_inst/count[9]} {autorun_inst/count[10]} {autorun_inst/count[11]} {autorun_inst/count[12]} {autorun_inst/count[13]} {autorun_inst/count[14]} {autorun_inst/count[15]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe1]
set_property port_width 16 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list {data_in[0]} {data_in[1]} {data_in[2]} {data_in[3]} {data_in[4]} {data_in[5]} {data_in[6]} {data_in[7]} {data_in[8]} {data_in[9]} {data_in[10]} {data_in[11]} {data_in[12]} {data_in[13]} {data_in[14]} {data_in[15]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe2]
set_property port_width 4 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list {data_ctrl[0]} {data_ctrl[1]} {data_ctrl[2]} {data_ctrl[3]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe3]
set_property port_width 32 [get_debug_ports u_ila_2/probe3]
connect_debug_port u_ila_2/probe3 [get_nets [list {data_tx[0]} {data_tx[1]} {data_tx[2]} {data_tx[3]} {data_tx[4]} {data_tx[5]} {data_tx[6]} {data_tx[7]} {data_tx[8]} {data_tx[9]} {data_tx[10]} {data_tx[11]} {data_tx[12]} {data_tx[13]} {data_tx[14]} {data_tx[15]} {data_tx[16]} {data_tx[17]} {data_tx[18]} {data_tx[19]} {data_tx[20]} {data_tx[21]} {data_tx[22]} {data_tx[23]} {data_tx[24]} {data_tx[25]} {data_tx[26]} {data_tx[27]} {data_tx[28]} {data_tx[29]} {data_tx[30]} {data_tx[31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe4]
set_property port_width 1 [get_debug_ports u_ila_2/probe4]
connect_debug_port u_ila_2/probe4 [get_nets [list data_dv]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe5]
set_property port_width 1 [get_debug_ports u_ila_2/probe5]
connect_debug_port u_ila_2/probe5 [get_nets [list en]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe6]
set_property port_width 1 [get_debug_ports u_ila_2/probe6]
connect_debug_port u_ila_2/probe6 [get_nets [list fso_dv]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe7]
set_property port_width 1 [get_debug_ports u_ila_2/probe7]
connect_debug_port u_ila_2/probe7 [get_nets [list tx_dv]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]