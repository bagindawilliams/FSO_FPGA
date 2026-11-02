# New simulation only: exact tested top/profile required.
foreach path {{/tb_mux_gearbox/clk} {/tb_mux_gearbox/rst_n} {/tb_mux_gearbox/lpc_data} {/tb_mux_gearbox/track_lpc_bytes} {/tb_mux_gearbox/preamble_data} {/tb_mux_gearbox/frame_id} {/tb_mux_gearbox/cdc_data} {/tb_mux_gearbox/cdc_keep} {/tb_mux_gearbox/frame_type_str} {/tb_mux_gearbox/lpc_valid} {/tb_mux_gearbox/cdc_valid}} {
 if {![llength [get_objects -quiet $path]]} {error "Unresolved waveform object: $path. Wrong top/profile; do not ignore."}
 log_wave [get_objects $path]
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/tb_mux_gearbox_detail__tb_mux_gearbox__historical.wcfg}
