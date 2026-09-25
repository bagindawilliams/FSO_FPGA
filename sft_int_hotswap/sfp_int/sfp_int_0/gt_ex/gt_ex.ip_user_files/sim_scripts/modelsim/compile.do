vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -mfcu  -sv "+incdir+../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" "+incdir+../../../imports" \
"/2025.2/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/2025.2/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/2025.2/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" "+incdir+../../../imports" \
"../../../gt_ex.srcs/sources_1/new/eth_mac_segmenter.v" \
"../../../gt_ex.srcs/sources_1/new/eth_preamble_remover.v" \
"../../../gt_ex.srcs/sources_1/new/eth_rx_front_end_top.v" \
"../../../gt_ex.srcs/sources_1/new/xgmii_packet_gen.v" \
"../../../gt_ex.srcs/sources_1/new/xgmii_rx_parser.v" \
"../../../gt_ex.srcs/sources_1/new/tb_eth_rx_front_end_top.v" \

vlog -work xil_defaultlib \
"glbl.v"

