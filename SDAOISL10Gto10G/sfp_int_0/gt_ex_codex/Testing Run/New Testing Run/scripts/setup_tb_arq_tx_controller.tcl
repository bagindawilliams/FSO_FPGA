# New simulation only: configure and elaborate matching top, remain at0ns, then log selected signals.
if {![llength [get_objects /tb_arq_tx_controller/*]]} {error "Wrong simulation top"}
foreach p [list {/tb_arq_tx_controller/delete_req_cnt} {/tb_arq_tx_controller/retx_req_cnt} {/tb_arq_tx_controller/write_req_cnt} {/tb_arq_tx_controller/tx_stall_mac} {/tb_arq_tx_controller/ddr4_addr} {/tb_arq_tx_controller/ddr4_delete_req} {/tb_arq_tx_controller/ddr4_read_req} {/tb_arq_tx_controller/ddr4_write_req} {/tb_arq_tx_controller/tx_frame_type} {/tb_arq_tx_controller/tx_trigger_gen} {/tb_arq_tx_controller/mgmt_tx_cnt} {/tb_arq_tx_controller/mgmt_tick_1hz} {/tb_arq_tx_controller/header_gen_busy} {/tb_arq_tx_controller/rx_rxfn_in} {/tb_arq_tx_controller/tx_txfn_out} {/tb_arq_tx_controller/rx_ack_in} {/tb_arq_tx_controller/payload_mux_sel}] {
 set o [get_objects -quiet $p]
 if {[llength $o]} {log_wave $o} else {puts "LOGGING_PATH_UNRESOLVED $p"}
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run/tb_arq_tx_controller.wcfg}
# This script does not run the simulation.
