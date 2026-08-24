transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/fifo_generator_v13_2_14
vlib riviera/xil_defaultlib
vlib riviera/blk_mem_gen_v8_4_12

vmap xpm riviera/xpm
vmap fifo_generator_v13_2_14 riviera/fifo_generator_v13_2_14
vmap xil_defaultlib riviera/xil_defaultlib
vmap blk_mem_gen_v8_4_12 riviera/blk_mem_gen_v8_4_12

vlog -work xpm  -incr "+incdir+../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" -l xpm -l fifo_generator_v13_2_14 -l xil_defaultlib -l blk_mem_gen_v8_4_12 \
"/2025.2/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/2025.2/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/2025.2/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_2_14  -incr -v2k5 "+incdir+../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" -l xpm -l fifo_generator_v13_2_14 -l xil_defaultlib -l blk_mem_gen_v8_4_12 \
"../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_14 -93  -incr \
"../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_14  -incr -v2k5 "+incdir+../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" -l xpm -l fifo_generator_v13_2_14 -l xil_defaultlib -l blk_mem_gen_v8_4_12 \
"../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" -l xpm -l fifo_generator_v13_2_14 -l xil_defaultlib -l blk_mem_gen_v8_4_12 \
"../../../sda_codec_clean.gen/sources_1/ip/serdes_assembler/sim/serdes_assembler.v" \
"../../../sda_codec_clean.gen/sources_1/ip/cross_logic_gth_load/sim/cross_logic_gth_load.v" \
"../../../sda_codec_clean.gen/sources_1/ip/cross_logic_gth_head/sim/cross_logic_gth_head.v" \

vlog -work blk_mem_gen_v8_4_12  -incr -v2k5 "+incdir+../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" -l xpm -l fifo_generator_v13_2_14 -l xil_defaultlib -l blk_mem_gen_v8_4_12 \
"../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../../../../../2025.2/2025.2/data/rsb/busdef" "+incdir+../../ipstatic" -l xpm -l fifo_generator_v13_2_14 -l xil_defaultlib -l blk_mem_gen_v8_4_12 \
"../../../sda_codec_clean.gen/sources_1/ip/bram_rs/sim/bram_rs.v" \
"../../../sda_codec_clean.gen/sources_1/ip/cross_gth_logic/sim/cross_gth_logic.v" \
"../../../sda_codec_clean.gen/sources_1/ip/cross_logic_gth/sim/cross_logic_gth.v" \
"../../../sda_codec_clean.gen/sources_1/ip/delay_combiner/sim/delay_combiner.v" \
"../../../sda_codec_clean.gen/sources_1/ip/cross_gth_logic_load/sim/cross_gth_logic_load.v" \
"../../../sda_codec_clean.gen/sources_1/ip/cross_gth_logic_head/sim/cross_gth_logic_head.v" \
"../../../sda_codec_clean.gen/sources_1/ip/serdes_framer/sim/serdes_framer.v" \
"../../../sda_codec_clean.gen/sources_1/ip/clk_wiz_1/clk_wiz_1_clk_wiz.v" \
"../../../sda_codec_clean.gen/sources_1/ip/clk_wiz_1/clk_wiz_1.v" \
"../../../sda_codec_clean.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
"../../../sda_codec_clean.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/decoder/assembler.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/decoder/assembler_top.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/autorun.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/rs_codec/chien_search.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/combiner.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/decoder/core_rx.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/core_tx.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/crc_16.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/crc_32.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/decoder/decoder_top.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/encoder_top.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/error_inject.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/rs_codec/euclid_proc.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/rs_codec/forney_math.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/framer.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/framer_top.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/rs_codec/inverter.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/lpc.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/decoder/lpc_dec.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/decoder/lpc_dec_top.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/lpc_top.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/rs_codec/multiplier.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/rs_codec/rs_decoder.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/decoder/rs_decoder_64.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/rs_codec/rs_encoder.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/rs_encoder_64.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/decoder/rx_gth_logic.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/decoder/rx_logic_gth.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/scrambler.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/decoder/separator.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/stream_input.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/rs_codec/syndrome_unit.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/x_gth_logic.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/encoder/x_logic_gth.v" \
"../../../sda_codec_clean.srcs/sources_1/imports/Source core file/top.v" \

vlog -work xil_defaultlib \
"glbl.v"

