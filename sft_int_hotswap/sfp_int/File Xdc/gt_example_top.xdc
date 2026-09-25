#------------------------------------------------------------------------------
#  (c) Copyright 2023 Advanced Micro Devices, Inc. All rights reserved.
#
#  This file contains confidential and proprietary information
#  of AMD, Inc. and is protected under U.S. and
#  international copyright and other intellectual property
#  laws.
#
#  DISCLAIMER
#  This disclaimer is not a license and does not grant any
#  rights to the materials distributed herewith. Except as
#  otherwise provided in a valid license issued to you by
#  AMD, and to the maximum extent permitted by applicable
#  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
#  WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
#  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
#  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
#  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
#  (2) AMD shall not be liable (whether in contract or tort,
#  including negligence, or under any other theory of
#  liability) for any loss or damage of any kind or nature
#  related to, arising under or in connection with these
#  materials, including for any direct, or any indirect,
#  special, incidental, or consequential loss or damage
#  (including loss of data, profits, goodwill, or any type of
#  loss or damage suffered as a result of any action brought
#  by a third party) even if such damage or loss was
#  reasonably foreseeable or AMD had been advised of the
#  possibility of the same.
#
#  CRITICAL APPLICATIONS
#  AMD products are not designed or intended to be fail-
#  safe, or for use in any application requiring fail-safe
#  performance, such as life-support or safety devices or
#  systems, Class III medical devices, nuclear facilities,
#  applications related to the deployment of airbags, or any
#  other applications that could lead to death, personal
#  injury, or severe property or environmental damage
#  (individually and collectively, "Critical
#  Applications"). Customer assumes the sole risk and
#  liability of any use of AMD products in Critical
#  Applications, subject only to applicable laws and
#  regulations governing limitations on product liability.
#
#  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
#  PART OF THIS FILE AT ALL TIMES.
#------------------------------------------------------------------------------

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 8 [current_design]
set_property CONFIG_MODE SPIx8 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]

# --- PERBAIKAN: Matikan pin yang sudah tidak ada di top.v ---
# set_property package_pin V5 [get_ports mgtrefclk0_x1y2_n]
# set_property package_pin V6 [get_ports mgtrefclk0_x1y2_p]
# create_clock -name clk_freerun -period 10.0 [get_ports hb_gtwiz_reset_clk_freerun_in]
# create_clock -name clk_mgtrefclk0_x1y2_p -period 6.4 [get_ports mgtrefclk0_x1y2_p]
# ------------------------------------------------------------

# --- PERBAIKAN: Tambahkan constraint clock referensi yang benar ---
create_clock -name clk_mgtrefclk_p -period 6.4 [get_ports mgtrefclk_p]
# ------------------------------------------------------------------

set_property PACKAGE_PIN T6 [get_ports mgtrefclk_p]
set_property PACKAGE_PIN AK17 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports sys_clk_p]
set_property PACKAGE_PIN AN11 [get_ports {tx_disable[0]}]
set_property PACKAGE_PIN AM11 [get_ports {tx_disable[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {tx_disable[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {tx_disable[0]}]

set_property PACKAGE_PIN AK11 [get_ports fan]
set_property IOSTANDARD LVCMOS18 [get_ports fan]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list {gtx_exdes_m0/example_wrapper_inst/gtwiz_userclk_rx_inst/rxusrclk2_in[0]}]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {decoder_top_inst/header[0]} {decoder_top_inst/header[1]} {decoder_top_inst/header[2]} {decoder_top_inst/header[3]} {decoder_top_inst/header[4]} {decoder_top_inst/header[5]} {decoder_top_inst/header[6]} {decoder_top_inst/header[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {decoder_top_inst/payload[0]} {decoder_top_inst/payload[1]} {decoder_top_inst/payload[2]} {decoder_top_inst/payload[3]} {decoder_top_inst/payload[4]} {decoder_top_inst/payload[5]} {decoder_top_inst/payload[6]} {decoder_top_inst/payload[7]} {decoder_top_inst/payload[8]} {decoder_top_inst/payload[9]} {decoder_top_inst/payload[10]} {decoder_top_inst/payload[11]} {decoder_top_inst/payload[12]} {decoder_top_inst/payload[13]} {decoder_top_inst/payload[14]} {decoder_top_inst/payload[15]} {decoder_top_inst/payload[16]} {decoder_top_inst/payload[17]} {decoder_top_inst/payload[18]} {decoder_top_inst/payload[19]} {decoder_top_inst/payload[20]} {decoder_top_inst/payload[21]} {decoder_top_inst/payload[22]} {decoder_top_inst/payload[23]} {decoder_top_inst/payload[24]} {decoder_top_inst/payload[25]} {decoder_top_inst/payload[26]} {decoder_top_inst/payload[27]} {decoder_top_inst/payload[28]} {decoder_top_inst/payload[29]} {decoder_top_inst/payload[30]} {decoder_top_inst/payload[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {packet_rec_m0/check_sum[0]} {packet_rec_m0/check_sum[1]} {packet_rec_m0/check_sum[2]} {packet_rec_m0/check_sum[3]} {packet_rec_m0/check_sum[4]} {packet_rec_m0/check_sum[5]} {packet_rec_m0/check_sum[6]} {packet_rec_m0/check_sum[7]} {packet_rec_m0/check_sum[8]} {packet_rec_m0/check_sum[9]} {packet_rec_m0/check_sum[10]} {packet_rec_m0/check_sum[11]} {packet_rec_m0/check_sum[12]} {packet_rec_m0/check_sum[13]} {packet_rec_m0/check_sum[14]} {packet_rec_m0/check_sum[15]} {packet_rec_m0/check_sum[16]} {packet_rec_m0/check_sum[17]} {packet_rec_m0/check_sum[18]} {packet_rec_m0/check_sum[19]} {packet_rec_m0/check_sum[20]} {packet_rec_m0/check_sum[21]} {packet_rec_m0/check_sum[22]} {packet_rec_m0/check_sum[23]} {packet_rec_m0/check_sum[24]} {packet_rec_m0/check_sum[25]} {packet_rec_m0/check_sum[26]} {packet_rec_m0/check_sum[27]} {packet_rec_m0/check_sum[28]} {packet_rec_m0/check_sum[29]} {packet_rec_m0/check_sum[30]} {packet_rec_m0/check_sum[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {packet_rec_m0/last_sequence_number[0]} {packet_rec_m0/last_sequence_number[1]} {packet_rec_m0/last_sequence_number[2]} {packet_rec_m0/last_sequence_number[3]} {packet_rec_m0/last_sequence_number[4]} {packet_rec_m0/last_sequence_number[5]} {packet_rec_m0/last_sequence_number[6]} {packet_rec_m0/last_sequence_number[7]} {packet_rec_m0/last_sequence_number[8]} {packet_rec_m0/last_sequence_number[9]} {packet_rec_m0/last_sequence_number[10]} {packet_rec_m0/last_sequence_number[11]} {packet_rec_m0/last_sequence_number[12]} {packet_rec_m0/last_sequence_number[13]} {packet_rec_m0/last_sequence_number[14]} {packet_rec_m0/last_sequence_number[15]} {packet_rec_m0/last_sequence_number[16]} {packet_rec_m0/last_sequence_number[17]} {packet_rec_m0/last_sequence_number[18]} {packet_rec_m0/last_sequence_number[19]} {packet_rec_m0/last_sequence_number[20]} {packet_rec_m0/last_sequence_number[21]} {packet_rec_m0/last_sequence_number[22]} {packet_rec_m0/last_sequence_number[23]} {packet_rec_m0/last_sequence_number[24]} {packet_rec_m0/last_sequence_number[25]} {packet_rec_m0/last_sequence_number[26]} {packet_rec_m0/last_sequence_number[27]} {packet_rec_m0/last_sequence_number[28]} {packet_rec_m0/last_sequence_number[29]} {packet_rec_m0/last_sequence_number[30]} {packet_rec_m0/last_sequence_number[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {packet_rec_m0/sequence_number[0]} {packet_rec_m0/sequence_number[1]} {packet_rec_m0/sequence_number[2]} {packet_rec_m0/sequence_number[3]} {packet_rec_m0/sequence_number[4]} {packet_rec_m0/sequence_number[5]} {packet_rec_m0/sequence_number[6]} {packet_rec_m0/sequence_number[7]} {packet_rec_m0/sequence_number[8]} {packet_rec_m0/sequence_number[9]} {packet_rec_m0/sequence_number[10]} {packet_rec_m0/sequence_number[11]} {packet_rec_m0/sequence_number[12]} {packet_rec_m0/sequence_number[13]} {packet_rec_m0/sequence_number[14]} {packet_rec_m0/sequence_number[15]} {packet_rec_m0/sequence_number[16]} {packet_rec_m0/sequence_number[17]} {packet_rec_m0/sequence_number[18]} {packet_rec_m0/sequence_number[19]} {packet_rec_m0/sequence_number[20]} {packet_rec_m0/sequence_number[21]} {packet_rec_m0/sequence_number[22]} {packet_rec_m0/sequence_number[23]} {packet_rec_m0/sequence_number[24]} {packet_rec_m0/sequence_number[25]} {packet_rec_m0/sequence_number[26]} {packet_rec_m0/sequence_number[27]} {packet_rec_m0/sequence_number[28]} {packet_rec_m0/sequence_number[29]} {packet_rec_m0/sequence_number[30]} {packet_rec_m0/sequence_number[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {data_out[0]} {data_out[1]} {data_out[2]} {data_out[3]} {data_out[4]} {data_out[5]} {data_out[6]} {data_out[7]} {data_out[8]} {data_out[9]} {data_out[10]} {data_out[11]} {data_out[12]} {data_out[13]} {data_out[14]} {data_out[15]} {data_out[16]} {data_out[17]} {data_out[18]} {data_out[19]} {data_out[20]} {data_out[21]} {data_out[22]} {data_out[23]} {data_out[24]} {data_out[25]} {data_out[26]} {data_out[27]} {data_out[28]} {data_out[29]} {data_out[30]} {data_out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 4 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {rx1_ctrl_align[0]} {rx1_ctrl_align[1]} {rx1_ctrl_align[2]} {rx1_ctrl_align[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {rx1_data_align[0]} {rx1_data_align[1]} {rx1_data_align[2]} {rx1_data_align[3]} {rx1_data_align[4]} {rx1_data_align[5]} {rx1_data_align[6]} {rx1_data_align[7]} {rx1_data_align[8]} {rx1_data_align[9]} {rx1_data_align[10]} {rx1_data_align[11]} {rx1_data_align[12]} {rx1_data_align[13]} {rx1_data_align[14]} {rx1_data_align[15]} {rx1_data_align[16]} {rx1_data_align[17]} {rx1_data_align[18]} {rx1_data_align[19]} {rx1_data_align[20]} {rx1_data_align[21]} {rx1_data_align[22]} {rx1_data_align[23]} {rx1_data_align[24]} {rx1_data_align[25]} {rx1_data_align[26]} {rx1_data_align[27]} {rx1_data_align[28]} {rx1_data_align[29]} {rx1_data_align[30]} {rx1_data_align[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 32 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {rx1_error_packet_cnt_o[0]} {rx1_error_packet_cnt_o[1]} {rx1_error_packet_cnt_o[2]} {rx1_error_packet_cnt_o[3]} {rx1_error_packet_cnt_o[4]} {rx1_error_packet_cnt_o[5]} {rx1_error_packet_cnt_o[6]} {rx1_error_packet_cnt_o[7]} {rx1_error_packet_cnt_o[8]} {rx1_error_packet_cnt_o[9]} {rx1_error_packet_cnt_o[10]} {rx1_error_packet_cnt_o[11]} {rx1_error_packet_cnt_o[12]} {rx1_error_packet_cnt_o[13]} {rx1_error_packet_cnt_o[14]} {rx1_error_packet_cnt_o[15]} {rx1_error_packet_cnt_o[16]} {rx1_error_packet_cnt_o[17]} {rx1_error_packet_cnt_o[18]} {rx1_error_packet_cnt_o[19]} {rx1_error_packet_cnt_o[20]} {rx1_error_packet_cnt_o[21]} {rx1_error_packet_cnt_o[22]} {rx1_error_packet_cnt_o[23]} {rx1_error_packet_cnt_o[24]} {rx1_error_packet_cnt_o[25]} {rx1_error_packet_cnt_o[26]} {rx1_error_packet_cnt_o[27]} {rx1_error_packet_cnt_o[28]} {rx1_error_packet_cnt_o[29]} {rx1_error_packet_cnt_o[30]} {rx1_error_packet_cnt_o[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 32 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {rx1_packet_cnt_o[0]} {rx1_packet_cnt_o[1]} {rx1_packet_cnt_o[2]} {rx1_packet_cnt_o[3]} {rx1_packet_cnt_o[4]} {rx1_packet_cnt_o[5]} {rx1_packet_cnt_o[6]} {rx1_packet_cnt_o[7]} {rx1_packet_cnt_o[8]} {rx1_packet_cnt_o[9]} {rx1_packet_cnt_o[10]} {rx1_packet_cnt_o[11]} {rx1_packet_cnt_o[12]} {rx1_packet_cnt_o[13]} {rx1_packet_cnt_o[14]} {rx1_packet_cnt_o[15]} {rx1_packet_cnt_o[16]} {rx1_packet_cnt_o[17]} {rx1_packet_cnt_o[18]} {rx1_packet_cnt_o[19]} {rx1_packet_cnt_o[20]} {rx1_packet_cnt_o[21]} {rx1_packet_cnt_o[22]} {rx1_packet_cnt_o[23]} {rx1_packet_cnt_o[24]} {rx1_packet_cnt_o[25]} {rx1_packet_cnt_o[26]} {rx1_packet_cnt_o[27]} {rx1_packet_cnt_o[28]} {rx1_packet_cnt_o[29]} {rx1_packet_cnt_o[30]} {rx1_packet_cnt_o[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list flag]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list decoder_top_inst/header_dv]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list decoder_top_inst/payload_dv]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list rx1_dv]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list clk_wiz_0_inst/inst/clk_out2]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 96 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {decoder_top_inst/core_data[0]} {decoder_top_inst/core_data[1]} {decoder_top_inst/core_data[2]} {decoder_top_inst/core_data[3]} {decoder_top_inst/core_data[4]} {decoder_top_inst/core_data[5]} {decoder_top_inst/core_data[6]} {decoder_top_inst/core_data[7]} {decoder_top_inst/core_data[8]} {decoder_top_inst/core_data[9]} {decoder_top_inst/core_data[10]} {decoder_top_inst/core_data[11]} {decoder_top_inst/core_data[12]} {decoder_top_inst/core_data[13]} {decoder_top_inst/core_data[14]} {decoder_top_inst/core_data[15]} {decoder_top_inst/core_data[16]} {decoder_top_inst/core_data[17]} {decoder_top_inst/core_data[18]} {decoder_top_inst/core_data[19]} {decoder_top_inst/core_data[20]} {decoder_top_inst/core_data[21]} {decoder_top_inst/core_data[22]} {decoder_top_inst/core_data[23]} {decoder_top_inst/core_data[24]} {decoder_top_inst/core_data[25]} {decoder_top_inst/core_data[26]} {decoder_top_inst/core_data[27]} {decoder_top_inst/core_data[28]} {decoder_top_inst/core_data[29]} {decoder_top_inst/core_data[30]} {decoder_top_inst/core_data[31]} {decoder_top_inst/core_data[32]} {decoder_top_inst/core_data[33]} {decoder_top_inst/core_data[34]} {decoder_top_inst/core_data[35]} {decoder_top_inst/core_data[36]} {decoder_top_inst/core_data[37]} {decoder_top_inst/core_data[38]} {decoder_top_inst/core_data[39]} {decoder_top_inst/core_data[40]} {decoder_top_inst/core_data[41]} {decoder_top_inst/core_data[42]} {decoder_top_inst/core_data[43]} {decoder_top_inst/core_data[44]} {decoder_top_inst/core_data[45]} {decoder_top_inst/core_data[46]} {decoder_top_inst/core_data[47]} {decoder_top_inst/core_data[48]} {decoder_top_inst/core_data[49]} {decoder_top_inst/core_data[50]} {decoder_top_inst/core_data[51]} {decoder_top_inst/core_data[52]} {decoder_top_inst/core_data[53]} {decoder_top_inst/core_data[54]} {decoder_top_inst/core_data[55]} {decoder_top_inst/core_data[56]} {decoder_top_inst/core_data[57]} {decoder_top_inst/core_data[58]} {decoder_top_inst/core_data[59]} {decoder_top_inst/core_data[60]} {decoder_top_inst/core_data[61]} {decoder_top_inst/core_data[62]} {decoder_top_inst/core_data[63]} {decoder_top_inst/core_data[64]} {decoder_top_inst/core_data[65]} {decoder_top_inst/core_data[66]} {decoder_top_inst/core_data[67]} {decoder_top_inst/core_data[68]} {decoder_top_inst/core_data[69]} {decoder_top_inst/core_data[70]} {decoder_top_inst/core_data[71]} {decoder_top_inst/core_data[72]} {decoder_top_inst/core_data[73]} {decoder_top_inst/core_data[74]} {decoder_top_inst/core_data[75]} {decoder_top_inst/core_data[76]} {decoder_top_inst/core_data[77]} {decoder_top_inst/core_data[78]} {decoder_top_inst/core_data[79]} {decoder_top_inst/core_data[80]} {decoder_top_inst/core_data[81]} {decoder_top_inst/core_data[82]} {decoder_top_inst/core_data[83]} {decoder_top_inst/core_data[84]} {decoder_top_inst/core_data[85]} {decoder_top_inst/core_data[86]} {decoder_top_inst/core_data[87]} {decoder_top_inst/core_data[88]} {decoder_top_inst/core_data[89]} {decoder_top_inst/core_data[90]} {decoder_top_inst/core_data[91]} {decoder_top_inst/core_data[92]} {decoder_top_inst/core_data[93]} {decoder_top_inst/core_data[94]} {decoder_top_inst/core_data[95]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 8 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {decoder_top_inst/rs_head[0]} {decoder_top_inst/rs_head[1]} {decoder_top_inst/rs_head[2]} {decoder_top_inst/rs_head[3]} {decoder_top_inst/rs_head[4]} {decoder_top_inst/rs_head[5]} {decoder_top_inst/rs_head[6]} {decoder_top_inst/rs_head[7]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 64 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list {decoder_top_inst/rs_load[0]} {decoder_top_inst/rs_load[1]} {decoder_top_inst/rs_load[2]} {decoder_top_inst/rs_load[3]} {decoder_top_inst/rs_load[4]} {decoder_top_inst/rs_load[5]} {decoder_top_inst/rs_load[6]} {decoder_top_inst/rs_load[7]} {decoder_top_inst/rs_load[8]} {decoder_top_inst/rs_load[9]} {decoder_top_inst/rs_load[10]} {decoder_top_inst/rs_load[11]} {decoder_top_inst/rs_load[12]} {decoder_top_inst/rs_load[13]} {decoder_top_inst/rs_load[14]} {decoder_top_inst/rs_load[15]} {decoder_top_inst/rs_load[16]} {decoder_top_inst/rs_load[17]} {decoder_top_inst/rs_load[18]} {decoder_top_inst/rs_load[19]} {decoder_top_inst/rs_load[20]} {decoder_top_inst/rs_load[21]} {decoder_top_inst/rs_load[22]} {decoder_top_inst/rs_load[23]} {decoder_top_inst/rs_load[24]} {decoder_top_inst/rs_load[25]} {decoder_top_inst/rs_load[26]} {decoder_top_inst/rs_load[27]} {decoder_top_inst/rs_load[28]} {decoder_top_inst/rs_load[29]} {decoder_top_inst/rs_load[30]} {decoder_top_inst/rs_load[31]} {decoder_top_inst/rs_load[32]} {decoder_top_inst/rs_load[33]} {decoder_top_inst/rs_load[34]} {decoder_top_inst/rs_load[35]} {decoder_top_inst/rs_load[36]} {decoder_top_inst/rs_load[37]} {decoder_top_inst/rs_load[38]} {decoder_top_inst/rs_load[39]} {decoder_top_inst/rs_load[40]} {decoder_top_inst/rs_load[41]} {decoder_top_inst/rs_load[42]} {decoder_top_inst/rs_load[43]} {decoder_top_inst/rs_load[44]} {decoder_top_inst/rs_load[45]} {decoder_top_inst/rs_load[46]} {decoder_top_inst/rs_load[47]} {decoder_top_inst/rs_load[48]} {decoder_top_inst/rs_load[49]} {decoder_top_inst/rs_load[50]} {decoder_top_inst/rs_load[51]} {decoder_top_inst/rs_load[52]} {decoder_top_inst/rs_load[53]} {decoder_top_inst/rs_load[54]} {decoder_top_inst/rs_load[55]} {decoder_top_inst/rs_load[56]} {decoder_top_inst/rs_load[57]} {decoder_top_inst/rs_load[58]} {decoder_top_inst/rs_load[59]} {decoder_top_inst/rs_load[60]} {decoder_top_inst/rs_load[61]} {decoder_top_inst/rs_load[62]} {decoder_top_inst/rs_load[63]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
set_property port_width 1 [get_debug_ports u_ila_1/probe3]
connect_debug_port u_ila_1/probe3 [get_nets [list decoder_top_inst/core_dv]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe4]
set_property port_width 1 [get_debug_ports u_ila_1/probe4]
connect_debug_port u_ila_1/probe4 [get_nets [list decoder_top_inst/rs_head_dv]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe5]
set_property port_width 1 [get_debug_ports u_ila_1/probe5]
connect_debug_port u_ila_1/probe5 [get_nets [list decoder_top_inst/rs_load_dv]]
create_debug_core u_ila_2 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_2]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_2]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_2]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_2]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_2]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_2]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_2]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_2]
set_property port_width 1 [get_debug_ports u_ila_2/clk]
connect_debug_port u_ila_2/clk [get_nets [list {gtx_exdes_m0/example_wrapper_inst/gtwiz_userclk_tx_inst/txusrclk2_in[0]}]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe0]
set_property port_width 16 [get_debug_ports u_ila_2/probe0]
connect_debug_port u_ila_2/probe0 [get_nets [list {autorun_inst/count[0]} {autorun_inst/count[1]} {autorun_inst/count[2]} {autorun_inst/count[3]} {autorun_inst/count[4]} {autorun_inst/count[5]} {autorun_inst/count[6]} {autorun_inst/count[7]} {autorun_inst/count[8]} {autorun_inst/count[9]} {autorun_inst/count[10]} {autorun_inst/count[11]} {autorun_inst/count[12]} {autorun_inst/count[13]} {autorun_inst/count[14]} {autorun_inst/count[15]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe1]
set_property port_width 16 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list {packet_send_m0/data_cnt[0]} {packet_send_m0/data_cnt[1]} {packet_send_m0/data_cnt[2]} {packet_send_m0/data_cnt[3]} {packet_send_m0/data_cnt[4]} {packet_send_m0/data_cnt[5]} {packet_send_m0/data_cnt[6]} {packet_send_m0/data_cnt[7]} {packet_send_m0/data_cnt[8]} {packet_send_m0/data_cnt[9]} {packet_send_m0/data_cnt[10]} {packet_send_m0/data_cnt[11]} {packet_send_m0/data_cnt[12]} {packet_send_m0/data_cnt[13]} {packet_send_m0/data_cnt[14]} {packet_send_m0/data_cnt[15]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe2]
set_property port_width 4 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list {packet_send_m0/state[0]} {packet_send_m0/state[1]} {packet_send_m0/state[2]} {packet_send_m0/state[3]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe3]
set_property port_width 4 [get_debug_ports u_ila_2/probe3]
connect_debug_port u_ila_2/probe3 [get_nets [list {data_ctrl[0]} {data_ctrl[1]} {data_ctrl[2]} {data_ctrl[3]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe4]
set_property port_width 32 [get_debug_ports u_ila_2/probe4]
connect_debug_port u_ila_2/probe4 [get_nets [list {data_tx[0]} {data_tx[1]} {data_tx[2]} {data_tx[3]} {data_tx[4]} {data_tx[5]} {data_tx[6]} {data_tx[7]} {data_tx[8]} {data_tx[9]} {data_tx[10]} {data_tx[11]} {data_tx[12]} {data_tx[13]} {data_tx[14]} {data_tx[15]} {data_tx[16]} {data_tx[17]} {data_tx[18]} {data_tx[19]} {data_tx[20]} {data_tx[21]} {data_tx[22]} {data_tx[23]} {data_tx[24]} {data_tx[25]} {data_tx[26]} {data_tx[27]} {data_tx[28]} {data_tx[29]} {data_tx[30]} {data_tx[31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe5]
set_property port_width 32 [get_debug_ports u_ila_2/probe5]
connect_debug_port u_ila_2/probe5 [get_nets [list {data_in[0]} {data_in[1]} {data_in[2]} {data_in[3]} {data_in[4]} {data_in[5]} {data_in[6]} {data_in[7]} {data_in[8]} {data_in[9]} {data_in[10]} {data_in[11]} {data_in[12]} {data_in[13]} {data_in[14]} {data_in[15]} {data_in[16]} {data_in[17]} {data_in[18]} {data_in[19]} {data_in[20]} {data_in[21]} {data_in[22]} {data_in[23]} {data_in[24]} {data_in[25]} {data_in[26]} {data_in[27]} {data_in[28]} {data_in[29]} {data_in[30]} {data_in[31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe6]
set_property port_width 32 [get_debug_ports u_ila_2/probe6]
connect_debug_port u_ila_2/probe6 [get_nets [list {fso_data[0]} {fso_data[1]} {fso_data[2]} {fso_data[3]} {fso_data[4]} {fso_data[5]} {fso_data[6]} {fso_data[7]} {fso_data[8]} {fso_data[9]} {fso_data[10]} {fso_data[11]} {fso_data[12]} {fso_data[13]} {fso_data[14]} {fso_data[15]} {fso_data[16]} {fso_data[17]} {fso_data[18]} {fso_data[19]} {fso_data[20]} {fso_data[21]} {fso_data[22]} {fso_data[23]} {fso_data[24]} {fso_data[25]} {fso_data[26]} {fso_data[27]} {fso_data[28]} {fso_data[29]} {fso_data[30]} {fso_data[31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe7]
set_property port_width 32 [get_debug_ports u_ila_2/probe7]
connect_debug_port u_ila_2/probe7 [get_nets [list {tx_data[0]} {tx_data[1]} {tx_data[2]} {tx_data[3]} {tx_data[4]} {tx_data[5]} {tx_data[6]} {tx_data[7]} {tx_data[8]} {tx_data[9]} {tx_data[10]} {tx_data[11]} {tx_data[12]} {tx_data[13]} {tx_data[14]} {tx_data[15]} {tx_data[16]} {tx_data[17]} {tx_data[18]} {tx_data[19]} {tx_data[20]} {tx_data[21]} {tx_data[22]} {tx_data[23]} {tx_data[24]} {tx_data[25]} {tx_data[26]} {tx_data[27]} {tx_data[28]} {tx_data[29]} {tx_data[30]} {tx_data[31]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe8]
set_property port_width 1 [get_debug_ports u_ila_2/probe8]
connect_debug_port u_ila_2/probe8 [get_nets [list data_dv]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe9]
set_property port_width 1 [get_debug_ports u_ila_2/probe9]
connect_debug_port u_ila_2/probe9 [get_nets [list en]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe10]
set_property port_width 1 [get_debug_ports u_ila_2/probe10]
connect_debug_port u_ila_2/probe10 [get_nets [list fso_dv]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe11]
set_property port_width 1 [get_debug_ports u_ila_2/probe11]
connect_debug_port u_ila_2/probe11 [get_nets [list tx_dv]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe12]
set_property port_width 1 [get_debug_ports u_ila_2/probe12]
connect_debug_port u_ila_2/probe12 [get_nets [list tx_packet_data_rd]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]