# New simulation only: exact tested top/profile required.
foreach path {{/tb_mux_eth_32/clk} {/tb_mux_eth_32/rst_n} {/tb_mux_eth_32/asm_data_in} {/tb_mux_eth_32/in_byte_cnt} {/tb_mux_eth_32/i} {/tb_mux_eth_32/preamble_sfd} {/tb_mux_eth_32/eth_data_out} {/tb_mux_eth_32/out_byte_cnt} {/tb_mux_eth_32/out_word_cnt} {/tb_mux_eth_32/err_cnt} {/tb_mux_eth_32/asm_valid_in} {/tb_mux_eth_32/asm_last_in} {/tb_mux_eth_32/eth_valid_out} {/tb_mux_eth_32/eth_last_out}} {
 if {![llength [get_objects -quiet $path]]} {error "Unresolved waveform object: $path. Wrong top/profile; do not ignore."}
 log_wave [get_objects $path]
}
open_wave_config {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/Testing Run/New Testing Run Final/tb_mux_eth_32__tb_mux_eth_32__historical.wcfg}
