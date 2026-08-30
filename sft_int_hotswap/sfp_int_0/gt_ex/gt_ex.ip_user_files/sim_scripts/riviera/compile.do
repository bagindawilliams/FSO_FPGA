transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" -l xpm -l xil_defaultlib \
"/2025.2/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/2025.2/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/2025.2/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" -l xpm -l xil_defaultlib \
"../../../gt_ex.srcs/sources_1/new/demux_preamble_hotswap.v" \
"../../../gt_ex.srcs/sources_1/new/tb_demux_preamble_hotswap.v" \

vlog -work xil_defaultlib \
"glbl.v"

