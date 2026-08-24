vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/fifo_generator_v13_2_14
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap fifo_generator_v13_2_14 modelsim_lib/msim/fifo_generator_v13_2_14
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -mfcu  -sv "+incdir+../../../../../../../../2025_vivado/2025.2/data/rsb/busdef" \
"/home/rofiq/Documents/2025_vivado/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/rofiq/Documents/2025_vivado/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/home/rofiq/Documents/2025_vivado/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_2_14 -64 -incr -mfcu  "+incdir+../../../../../../../../2025_vivado/2025.2/data/rsb/busdef" \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_14 -64 -93  \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_14 -64 -incr -mfcu  "+incdir+../../../../../../../../2025_vivado/2025.2/data/rsb/busdef" \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../2025_vivado/2025.2/data/rsb/busdef" \
"../../../../sda_codec_clean.gen/sources_1/ip/cross_logic_gth/sim/cross_logic_gth.v" \

vlog -work xil_defaultlib \
"glbl.v"

