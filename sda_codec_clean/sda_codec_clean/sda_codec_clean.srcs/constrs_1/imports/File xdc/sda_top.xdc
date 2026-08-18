# --- Pengaturan Clock ---
set_property PACKAGE_PIN AK17 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports sys_clk_p]
create_clock -period 3.333 -name sys_clk [get_ports sys_clk_p]

# --- Pengaturan Kipas (Fan) ---
set_property PACKAGE_PIN AK11 [get_ports fan]
set_property IOSTANDARD LVCMOS18 [get_ports fan]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_wiz_0_inst/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {tx_data[0]} {tx_data[1]} {tx_data[2]} {tx_data[3]} {tx_data[4]} {tx_data[5]} {tx_data[6]} {tx_data[7]} {tx_data[8]} {tx_data[9]} {tx_data[10]} {tx_data[11]} {tx_data[12]} {tx_data[13]} {tx_data[14]} {tx_data[15]} {tx_data[16]} {tx_data[17]} {tx_data[18]} {tx_data[19]} {tx_data[20]} {tx_data[21]} {tx_data[22]} {tx_data[23]} {tx_data[24]} {tx_data[25]} {tx_data[26]} {tx_data[27]} {tx_data[28]} {tx_data[29]} {tx_data[30]} {tx_data[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {fso_data[0]} {fso_data[1]} {fso_data[2]} {fso_data[3]} {fso_data[4]} {fso_data[5]} {fso_data[6]} {fso_data[7]} {fso_data[8]} {fso_data[9]} {fso_data[10]} {fso_data[11]} {fso_data[12]} {fso_data[13]} {fso_data[14]} {fso_data[15]} {fso_data[16]} {fso_data[17]} {fso_data[18]} {fso_data[19]} {fso_data[20]} {fso_data[21]} {fso_data[22]} {fso_data[23]} {fso_data[24]} {fso_data[25]} {fso_data[26]} {fso_data[27]} {fso_data[28]} {fso_data[29]} {fso_data[30]} {fso_data[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {data_out[0]} {data_out[1]} {data_out[2]} {data_out[3]} {data_out[4]} {data_out[5]} {data_out[6]} {data_out[7]} {data_out[8]} {data_out[9]} {data_out[10]} {data_out[11]} {data_out[12]} {data_out[13]} {data_out[14]} {data_out[15]} {data_out[16]} {data_out[17]} {data_out[18]} {data_out[19]} {data_out[20]} {data_out[21]} {data_out[22]} {data_out[23]} {data_out[24]} {data_out[25]} {data_out[26]} {data_out[27]} {data_out[28]} {data_out[29]} {data_out[30]} {data_out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {data_in[0]} {data_in[1]} {data_in[2]} {data_in[3]} {data_in[4]} {data_in[5]} {data_in[6]} {data_in[7]} {data_in[8]} {data_in[9]} {data_in[10]} {data_in[11]} {data_in[12]} {data_in[13]} {data_in[14]} {data_in[15]} {data_in[16]} {data_in[17]} {data_in[18]} {data_in[19]} {data_in[20]} {data_in[21]} {data_in[22]} {data_in[23]} {data_in[24]} {data_in[25]} {data_in[26]} {data_in[27]} {data_in[28]} {data_in[29]} {data_in[30]} {data_in[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 16 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {autorun_inst/count[0]} {autorun_inst/count[1]} {autorun_inst/count[2]} {autorun_inst/count[3]} {autorun_inst/count[4]} {autorun_inst/count[5]} {autorun_inst/count[6]} {autorun_inst/count[7]} {autorun_inst/count[8]} {autorun_inst/count[9]} {autorun_inst/count[10]} {autorun_inst/count[11]} {autorun_inst/count[12]} {autorun_inst/count[13]} {autorun_inst/count[14]} {autorun_inst/count[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list data_dv]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list flag]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list fso_dv]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list tx_dv]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_gth]
