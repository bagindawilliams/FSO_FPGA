transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/gtwizard_ultrascale_v1_7_22
vlib riviera/xil_defaultlib
vlib riviera/fifo_generator_v13_2_14

vmap xpm riviera/xpm
vmap gtwizard_ultrascale_v1_7_22 riviera/gtwizard_ultrascale_v1_7_22
vmap xil_defaultlib riviera/xil_defaultlib
vmap fifo_generator_v13_2_14 riviera/fifo_generator_v13_2_14

vlog -work xpm  -incr "+incdir+../../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" -l xpm -l gtwizard_ultrascale_v1_7_22 -l xil_defaultlib -l fifo_generator_v13_2_14 \
"/2025.2/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/2025.2/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/2025.2/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work gtwizard_ultrascale_v1_7_22  -incr -v2k5 "+incdir+../../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" -l xpm -l gtwizard_ultrascale_v1_7_22 -l xil_defaultlib -l fifo_generator_v13_2_14 \
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

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" -l xpm -l gtwizard_ultrascale_v1_7_22 -l xil_defaultlib -l fifo_generator_v13_2_14 \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gtwizard_ultrascale_v1_7_gthe3_channel.v" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b_gthe3_channel_wrapper.v" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gtwizard_ultrascale_v1_7_gthe3_common.v" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b_gthe3_common_wrapper.v" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b_gtwizard_gthe3.v" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b_gtwizard_top.v" \
"../../../gt_ex.gen/sources_1/ip/gth_fso_64b66b/sim/gth_fso_64b66b.v" \

vlog -work fifo_generator_v13_2_14  -incr -v2k5 "+incdir+../../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" -l xpm -l gtwizard_ultrascale_v1_7_22 -l xil_defaultlib -l fifo_generator_v13_2_14 \
"../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_14 -93  -incr \
"../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_14  -incr -v2k5 "+incdir+../../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" -l xpm -l gtwizard_ultrascale_v1_7_22 -l xil_defaultlib -l fifo_generator_v13_2_14 \
"../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../../imports" "+incdir+../../ipstatic" -l xpm -l gtwizard_ultrascale_v1_7_22 -l xil_defaultlib -l fifo_generator_v13_2_14 \
"../../../sda_codec_0.gen/sources_1/ip/cross_logic_gth/sim/cross_logic_gth.v" \
"../../../gt_ex.srcs/sources_1/new/error_inject.v" \
"../../../gt_ex.srcs/sources_1/new/fso_gth_core_wrapper.v" \
"../../../gt_ex.srcs/sources_1/new/gth64b66b_rx.v" \
"../../../gt_ex.srcs/sources_1/new/gth64b66b_tx.v" \
"../../../gt_ex.srcs/sources_1/new/encoder/x_logic_gth.v" \
"../../../gt_ex.srcs/sources_1/new/tb_gth64b66b_loopback.v" \

vlog -work xil_defaultlib \
"glbl.v"

