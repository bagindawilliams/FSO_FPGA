
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 8 [current_design]
set_property CONFIG_MODE SPIx8 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]

create_clock -period 5.000 -name sys_clk_in_p -waveform {0.000 2.500} [get_ports sys_clk_p]

set_property PACKAGE_PIN AK11 [get_ports fan]
set_property PACKAGE_PIN AK17 [get_ports sys_clk_p]

set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports sys_clk_p]
set_property IOSTANDARD LVCMOS18 [get_ports fan]



