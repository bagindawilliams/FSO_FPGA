transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" "+incdir+../../../imports" -l xpm -l xil_defaultlib \
"/2025.2/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/2025.2/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/2025.2/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" "+incdir+../../../imports" -l xpm -l xil_defaultlib \
"../../../gt_ex.srcs/sources_1/new/eth_mac_segmenter.v" \
"../../../gt_ex.srcs/sources_1/new/eth_preamble_remover.v" \
"../../../gt_ex.srcs/sources_1/new/eth_rx_front_end_top.v" \
"../../../gt_ex.srcs/sources_1/new/xgmii_packet_gen.v" \
"../../../gt_ex.srcs/sources_1/new/xgmii_rx_parser.v" \
"../../../gt_ex.srcs/sources_1/new/tb_eth_rx_front_end_top.v" \

vlog -work xil_defaultlib \
"glbl.v"

