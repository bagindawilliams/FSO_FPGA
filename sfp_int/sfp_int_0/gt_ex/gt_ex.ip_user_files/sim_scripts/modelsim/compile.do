vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/gtwizard_ultrascale_v1_7_22
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap gtwizard_ultrascale_v1_7_22 modelsim_lib/msim/gtwizard_ultrascale_v1_7_22
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -mfcu  -sv "+incdir+../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" "+incdir+../../../imports" \
"/2025.2/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/2025.2/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/2025.2/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work gtwizard_ultrascale_v1_7_22 -64 -incr -mfcu  "+incdir+../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" "+incdir+../../../imports" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_bit_sync.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gte4_drp_arb.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_delay_powergood.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_delay_powergood.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe3_cpll_cal.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe3_cal_freqcnt.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_rx.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_tx.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_cal_freqcnt.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_rx.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_tx.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_cal_freqcnt.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_rx.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_tx.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_reset.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_rx.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_tx.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_rx.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_tx.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_reset_sync.v" \
"../../ipstatic/hdl/gtwizard_ultrascale_v1_7_reset_inv_sync.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" "+incdir+../../../imports" \
"../../../gt_ex.gen/sources_1/ip/gt/sim/gtwizard_ultrascale_v1_7_gthe3_channel.v" \
"../../../gt_ex.gen/sources_1/ip/gt/sim/gt_gthe3_channel_wrapper.v" \
"../../../gt_ex.gen/sources_1/ip/gt/sim/gtwizard_ultrascale_v1_7_gthe3_common.v" \
"../../../gt_ex.gen/sources_1/ip/gt/sim/gt_gthe3_common_wrapper.v" \
"../../../gt_ex.gen/sources_1/ip/gt/sim/gt_gtwizard_gthe3.v" \
"../../../gt_ex.gen/sources_1/ip/gt/sim/gt_gtwizard_top.v" \
"../../../gt_ex.gen/sources_1/ip/gt/sim/gt.v" \
"../../../gt_ex.gen/sources_1/ip/gt_vio_0/sim/gt_vio_0.v" \
"../../../imports/gt_example_bit_sync.v" \
"../../../imports/gt_example_gtwiz_userclk_rx.v" \
"../../../imports/gt_example_gtwiz_userclk_tx.v" \
"../../../imports/gt_example_init.v" \
"../../../imports/gt_example_reset_sync.v" \
"../../../imports/gt_example_top.v" \
"../../../imports/gt_example_wrapper.v" \
"../../../imports/gt_example_top_sim.v" \

vlog -work xil_defaultlib \
"glbl.v"

