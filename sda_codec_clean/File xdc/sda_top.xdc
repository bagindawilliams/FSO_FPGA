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
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {autorun_inst/count[0]} {autorun_inst/count[1]} {autorun_inst/count[2]} {autorun_inst/count[3]} {autorun_inst/count[4]} {autorun_inst/count[5]} {autorun_inst/count[6]} {autorun_inst/count[7]} {autorun_inst/count[8]} {autorun_inst/count[9]} {autorun_inst/count[10]} {autorun_inst/count[11]} {autorun_inst/count[12]} {autorun_inst/count[13]} {autorun_inst/count[14]} {autorun_inst/count[15]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_gth]
