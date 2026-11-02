vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/gtwizard_ultrascale_v1_7_22
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/fifo_generator_v13_2_14

vmap xpm modelsim_lib/msim/xpm
vmap gtwizard_ultrascale_v1_7_22 modelsim_lib/msim/gtwizard_ultrascale_v1_7_22
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap fifo_generator_v13_2_14 modelsim_lib/msim/fifo_generator_v13_2_14

vlog -work xpm -64 -incr -mfcu  -sv "+incdir+../../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" \
"/2025.2/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/2025.2/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/2025.2/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work gtwizard_ultrascale_v1_7_22 -64 -incr -mfcu  "+incdir+../../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" \
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

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gtwizard_ultrascale_v1_7_gthe3_channel.v" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b_gthe3_channel_wrapper.v" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gtwizard_ultrascale_v1_7_gthe3_common.v" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b_gthe3_common_wrapper.v" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b_gtwizard_gthe3.v" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b_gtwizard_top.v" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b.v" \

vlog -work fifo_generator_v13_2_14 -64 -incr -mfcu  "+incdir+../../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" \
"../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_14 -64 -93  \
"../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_14 -64 -incr -mfcu  "+incdir+../../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" \
"../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" \
"../../../sda_codec_0.gen/sources_1/ip/cross_logic_gth/sim/cross_logic_gth.v" \
"../../../gt_ex.srcs/sources_1/new/error_inject.v" \
"../../../gt_ex.srcs/sources_1/new/fso_gth_core_wrapper.v" \
"../../../gt_ex.srcs/sources_1/new/gth64b66b_rx.v" \
"../../../gt_ex.srcs/sources_1/new/gth64b66b_tx.v" \
"../../../gt_ex.srcs/sources_1/new/encoder/x_logic_gth.v" \
"../../../gt_ex.srcs/sources_1/new/tb_gth64b66b_loopback.v" \

vlog -work xil_defaultlib \
"glbl.v"

