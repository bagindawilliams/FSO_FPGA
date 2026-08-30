vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -mfcu  -sv "+incdir+../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" \
"/2025.2/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/2025.2/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/2025.2/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" \
"../../../gt_ex.srcs/sources_1/new/demux_preamble_hotswap.v" \
"../../../gt_ex.srcs/sources_1/new/tb_demux_preamble_hotswap.v" \

vlog -work xil_defaultlib \
"glbl.v"

