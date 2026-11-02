set root [file normalize [file join [file dirname [info script]] ../../../..]]
set report_top [get_property top [current_fileset -simset]]
source [file join $root audit 20261102_report24 scripts wave_setup.tcl]
