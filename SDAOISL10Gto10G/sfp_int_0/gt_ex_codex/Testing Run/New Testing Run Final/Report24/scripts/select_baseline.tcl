# REPORT24-GUI01. Run from the official open project; do not change design top.
# report_choice: top, controller, arq-clean, arq-payload, arq-header, rs-clean, rs-mem.
if {![info exists report_choice]} {set report_choice top}
set root [file normalize [file join [file dirname [info script]] ../../../..]]
set actual [file normalize [file join [get_property DIRECTORY [current_project]] gt_ex.xpr]]
if {$actual ne [file join $root gt_ex.xpr]} {error "Wrong project: $actual"}
set fs report_baseline
if {![llength [get_filesets -quiet $fs]]} {create_fileset -simset $fs}
set_property SOURCE_SET sources_1 [get_filesets $fs]
cd $root
foreach f {audit/20261102_report24/tb/tb_arq.sv audit/20261102_report24/tb/tb_RS.sv audit/20261102_report24/tb/report24_frame_transport.sv} {
 if {![file exists $f]} {error "Missing report TB: $f"}
 add_files -fileset $fs -norecurse [list $f]
}
switch -- $report_choice {
 top {set top tb_SDAOISL10Gto10G_top;set params {BASIC_REPORT=1};set runtime {500 us}}
 controller {set top tb_arq_tx_controller;set params {};set runtime {50 us}}
 arq-clean {set top tb_arq;set params {CASE=0};set runtime {300 us}}
 arq-payload {set top tb_arq;set params {CASE=1};set runtime {300 us}}
 arq-header {set top tb_arq;set params {CASE=2};set runtime {300 us}}
 rs-clean {set top tb_RS;set params {CHANNEL_ERROR=0};set runtime {100 us}}
 rs-mem {set top tb_RS;set params {CHANNEL_ERROR=1};set runtime {100 us}}
 default {error "Unknown report_choice: $report_choice"}
}
add_files -fileset $fs -norecurse [list gt_ex.srcs/sources_1/new/error.mem]
# Match the CLI language used for the original top with its new checker loops.
set_property file_type SystemVerilog [get_files -all */tb_SDAOISL10Gto10G_top.v]
set_property top $top [get_filesets $fs]
set_property generic $params [get_filesets $fs]
set_property xsim.simulate.runtime 0ns [get_filesets $fs]
set_property xsim.elaborate.debug_level all [get_filesets $fs]
current_fileset -simset [get_filesets $fs]
update_compile_order -fileset $fs
puts "REPORT24_CONFIGURED top=$top params=$params; rebuild simulation. At0ns source setup_new.tcl, then run $runtime (checker may finish earlier)."
