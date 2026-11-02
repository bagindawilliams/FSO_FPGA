# Configuration only; interactive GUI execution is not verified.
set expected {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/gt_ex.xpr}
set actual [file normalize [get_property DIRECTORY [current_project]]/[get_property NAME [current_project]].xpr]
if {$actual ne $expected} {error "Open the official project first"}
if {![llength [get_filesets -quiet module_wave_review]]} {create_fileset -simset module_wave_review}
set_property SOURCE_SET sources_1 [get_filesets module_wave_review]
add_files -fileset module_wave_review -norecurse {/home/williams/MYFPGA/FPGA Final/SDAOISL/sfp_int/sfp_int_0/gt_ex (CODEX)/gt_ex.srcs/sources_1/new/tb_demux_decoder.v}
set_property top tb_demux_decoder [get_filesets module_wave_review]
set_property xsim.simulate.runtime 0ns [get_filesets module_wave_review]
set_property xsim.elaborate.debug_level typical [get_filesets module_wave_review]
update_compile_order -fileset module_wave_review
current_fileset -simset [get_filesets module_wave_review]
# Launch behavioral simulation at0ns, then source setup_new.tcl before running.
