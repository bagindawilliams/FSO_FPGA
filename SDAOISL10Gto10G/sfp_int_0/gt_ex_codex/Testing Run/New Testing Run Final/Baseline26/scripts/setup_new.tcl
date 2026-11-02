# REPORT25-WAVE02: Preserve escaped hierarchical identifiers as one list element for add_wave.
# REPORT25-WAVE01. Enumerate actual objects; do not query a guessed top prefix.
set roots [get_scopes -quiet /*]
puts "REPORT25_ACTUAL_SCOPES $roots"
set candidates {}
foreach scope $roots {
 set canonical [string trim [string map [list "\\" ""] $scope] "/ "]
 if {$canonical eq $report_top || [string first "${report_top}(" $canonical] == 0} {lappend candidates $scope}
}
if {[llength $candidates] != 1} {error "ROOT_RESOLUTION expected=$report_top actual=$roots candidates=$candidates"}
set root [lindex $candidates 0]
set all_objects [get_objects -quiet -r /*]
set prefix "${root}/"
set object_index [dict create]
foreach obj $all_objects {
 if {[string first $prefix $obj] == 0} {dict set object_index [string range $obj [string length $prefix] end] $obj}
}
# REPORT25-WAVE03: xelab flattens this generate scope into escaped dotted names.
# Exact names were observed in run085051 actual_objects.txt, not inferred prefixes.
if {$report_top eq "tb_SDAOISL10Gto10G_top"} {
 foreach field {input_bytes output_bytes packets segs mgmt acks naks replays outstanding} {
  set actual [format {\basic_report.%s } $field]
  if {![dict exists $object_index $actual]} {error "MISSING_ELABORATED_GENERATE_OBJECT $actual"}
  dict set object_index basic_report/$field [dict get $object_index $actual]
  puts "REPORT25_OBJECT_ALIAS basic_report/$field => [dict get $object_index $actual]"
 }
}
if {[dict size $object_index] == 0} {error "ROOT_HAS_NO_OBJECTS root=$root"}
set param_obj [dict get $object_index $report_parameter]
if {[info exists report_offline] && $report_offline} {
 set effective [get_value_database -time 0ns -radix unsigned $param_obj]
} else {set effective [get_value -radix unsigned $param_obj]}
puts "REPORT25_PARAMETER root=$root parameter=$report_parameter effective=$effective expected=$report_expected"
if {$effective ne $report_expected} {error "PARAMETER_MISMATCH $report_parameter=$effective"}
set f [open actual_objects.txt w]
puts $f "ROOT=$root PARAMETER=$report_parameter VALUE=$effective"
foreach obj [dict values $object_index] {puts $f $obj}
close $f
create_wave_config
set group_count 0
set signal_count 0
proc report_group {label specs} {
 global object_index group_count signal_count
 set g [add_wave_group $label]
 incr group_count
 foreach {name radix} $specs {
  if {![dict exists $object_index $name]} {error "MISSING_REPORT_SIGNAL $name"}
  set obj [dict get $object_index $name]
  add_wave -into $g -radix $radix [list $obj]
  incr signal_count
 }
}
if {![info exists report_offline] || !$report_offline} {log_wave [dict values $object_index]}
if {$report_top eq "tb_RS"} {
 report_group {Clock / Reset} {clk bin rst_n bin cycle unsigned}
 report_group {Input / FEC reference} {eh bin hi hex ep bin pi hex}
 report_group {RS codewords / Scrambler / LPC} {tx/encoder_dv bin tx/rs_head hex tx/rs_load_dv bin tx/rs_load hex tx/scrambler_dv bin tx/scrambler hex fv bin fd hex}
 report_group {Preamble / Byte transport} {gv bin gd hex gk hex bw unsigned br unsigned}
 report_group {Injector / XOR mask} {iv bin id hex injector/applied_mask hex ov bin od hex masked unsigned changedbytes unsigned flippedbits unsigned}
 report_group {RX / LPC / Descrambler} {rv bin rd hex rx/lpc_valid_raw bin rx/lpc_data_raw hex rx/descrambler_dv bin rx/descrambled_data hex}
 report_group {RS decoded / Comparison} {hv bin ho hex pv bin po hex hc unsigned pc unsigned mismatch unsigned th unsigned tp unsigned rh unsigned rp unsigned lock bin}
} elseif {$report_top eq "tb_arq"} {
 report_group {Clock / Reset} {clk bin rst_n bin cyc unsigned}
 report_group {Input / Segmentation} {gv bin gr bin gd hex gl bin sb unsigned sent unsigned segs unsigned}
 report_group {TX / RAM} {fr/tx_txfn_out unsigned fr/frame_type_out unsigned fr/payload_mux_sel unsigned fr/ddr4_write_req bin fr/ddr4_read_req bin fr/ddr4_delete_req bin fr/ddr4_addr unsigned actual_write_slot unsigned actual_read_slot unsigned}
 report_group {CRC16 / CRC32} {rx/u_deframer/hdr_check_done bin hgood bin rx/u_deframer/pld_check_done bin pgood bin bad_headers unsigned bad_payloads unsigned}
 report_group {Feedback / Retry / Reorder} {lv bin lf unsigned la bin retries unsigned outstanding unsigned drops unsigned selected_cause unsigned replay_n unsigned fr/u_arq_tx_controller/timer_tick_en bin reorder_hold_seen unsigned fr/u_arq_tx_controller/del_q_cnt unsigned}
 report_group {Output / Result} {ov bin orr bin od hex ol bin ev bin ed hex el bin recv unsigned packets unsigned errors unsigned}
} elseif {$report_top eq "tb_arq_tx_controller"} {
 report_group {Clock / Reset} {clk bin rst_n bin}
 report_group {Input / Request} {fso_data_valid bin mgmt_tick_1hz bin header_gen_busy bin}
 report_group {TX state / Identity} {u_dut/state unsigned tx_txfn_out unsigned tx_frame_type unsigned tx_trigger_gen bin}
 report_group {Feedback} {rx_ack_valid_in bin rx_rxfn_in unsigned rx_ack_in bin}
 report_group {RAM commands} {ddr4_write_req bin ddr4_read_req bin ddr4_delete_req bin ddr4_addr unsigned}
 report_group {Counters} {write_req_cnt unsigned retx_req_cnt unsigned delete_req_cnt unsigned mgmt_tx_cnt unsigned u_dut/active_holdoff_limit unsigned}
} else {
 report_group {Clock / Reset} {clk_tx bin clk_rx bin u_dut/rst_n bin}
 report_group {Ethernet input} {grp1_pc1_gen_valid bin grp1_pc1_gen_data hex basic_report/input_bytes unsigned}
 report_group {Segments / ARQ} {u_dut/seg_axis_tvalid bin u_dut/seg_axis_tready bin u_dut/seg_axis_tlast bin u_dut/seg_valid_bytes unsigned basic_report/segs unsigned basic_report/acks unsigned basic_report/naks unsigned basic_report/replays unsigned}
 report_group {FSO transport} {tx_fso_valid_out bin tx_fso_data_out hex rx_fso_valid_out bin rx_fso_data_out hex rx_preamble_locked bin rx_block_locked bin}
 report_group {CRC / Reassembly} {grp7_hdr_crc16_ok bin grp7_pld_crc32_ok bin grp8_reasm_eth_valid bin grp8_reasm_eth_data hex}
 report_group {XGMII / Result} {pc2_xgmii_txd hex pc2_xgmii_txc hex basic_report/output_bytes unsigned basic_report/packets unsigned basic_report/mgmt unsigned basic_report/outstanding unsigned scb_matched_words unsigned scb_error_words unsigned}
}
save_wave_config report.wcfg
puts "REPORT25_WAVE_READY top=$root groups=$group_count signals=$signal_count"
