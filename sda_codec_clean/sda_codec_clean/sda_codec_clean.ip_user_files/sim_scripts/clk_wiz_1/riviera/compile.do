transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../ipstatic" "+incdir+../../../../../../../../2025_vivado/2025.2/data/rsb/busdef" -l xpm -l xil_defaultlib \
"/home/rofiq/Documents/2025_vivado/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/rofiq/Documents/2025_vivado/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/home/rofiq/Documents/2025_vivado/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../ipstatic" "+incdir+../../../../../../../../2025_vivado/2025.2/data/rsb/busdef" -l xpm -l xil_defaultlib \
"../../../../sda_codec_clean.gen/sources_1/ip/clk_wiz_1/clk_wiz_1_clk_wiz.v" \
"../../../../sda_codec_clean.gen/sources_1/ip/clk_wiz_1/clk_wiz_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

