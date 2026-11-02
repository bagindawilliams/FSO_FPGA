# BASIC23-GUI01. Use in the official open project; no simulation is launched.
# Set report_tb before sourcing, e.g. set report_tb tb_demux_decoder.
if {![info exists report_tb]} {set report_tb tb_demux_decoder}
set root [file normalize [file join [file dirname [info script]] ../../..]]
set actual [file normalize [get_property DIRECTORY [current_project]]/[get_property NAME [current_project]].xpr]
if {$actual ne [file join $root gt_ex.xpr]} {error "Wrong project: $actual"}
set allowed {tb_FEC_Demux tb_FEC_RS tb_Scrambler_LPC tb_cdc3_rx_gth_logic tb_cdc4_rx_logic_gth tb_cdc_logic_gth tb_demux_decoder tb_demux_preamble_128 tb_error_inject tb_eth_rx_front_end_top tb_eth_tx_back_end_top tb_gth64b66b_loopback tb_header tb_idle_MGMT tb_lpc_dec_descrambler tb_mux_eth_32 tb_mux_gearbox tb_payload tb_rs_decoder_rx}
# Read the original-TB allowlist supplied with this report (not profile aliases).
set index [file join $root audit 20261102_basic23 ORIGINAL_TOPS.txt]
if {[file exists $index]} {set h [open $index r];set allowed [split [string trim [read $h]] \n];close $h}
if {[lsearch -exact $allowed $report_tb]<0} {error "Unknown original report TB: $report_tb"}
set files [get_files -all -quiet */${report_tb}.v]
if {[llength $files]!=1} {error "Expected one resolved original TB; found: $files"}
set fs report_modules
if {![llength [get_filesets -quiet $fs]]} {create_fileset -simset $fs}
set_property SOURCE_SET sources_1 [get_filesets $fs]
set absolute_file [file normalize [lindex $files 0]]
set relative_file [string range $absolute_file [expr {[string length $root]+1}] end]
cd $root
add_files -fileset $fs -norecurse [list $relative_file]
set_property top $report_tb [get_filesets $fs]
set_property top_lib xil_defaultlib [get_filesets $fs]
set_property xsim.simulate.runtime 0ns [get_filesets $fs]
set_property xsim.elaborate.debug_level typical [get_filesets $fs]
current_fileset -simset [get_filesets $fs]
update_compile_order -fileset $fs
puts "REPORT_TB_SELECTED $report_tb; launch/rebuild, load matching live setup, then run to the documented stop condition."
