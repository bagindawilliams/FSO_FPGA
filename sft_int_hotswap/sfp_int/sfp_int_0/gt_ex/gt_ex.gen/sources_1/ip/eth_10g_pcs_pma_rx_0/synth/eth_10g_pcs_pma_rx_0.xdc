## (c) Copyright 2014 Advanced Micro Devices, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Advanced Micro Devices, Inc. and is protected under U.S. and 
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Advanced Micro Devices, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Advanced Micro Devices shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Advanced Micro Devices had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Advanced Micro Devices products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Advanced Micro Devices products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.

create_clock -period 6.400 [get_ports refclk_p]



#set_multicycle_path 2 -from [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_timer_125us_resync*d4_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_timer_125us_resync*d5_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]
#set_multicycle_path -hold 1 -from [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_timer_125us_resync*d4_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_timer_125us_resync*d5_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]
set_multicycle_path 2 -to [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_timer_125us_resync*outreg_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]
set_multicycle_path -hold 1 -to [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_timer_125us_resync*outreg_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]
set_multicycle_path 2 -from [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_timer_125us_resync*outreg_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *mcp1_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]
set_multicycle_path -hold 1 -from [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_timer_125us_resync*outreg_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *mcp1_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]

#set_multicycle_path 2 -from [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_resyncs_i*d4_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_resyncs_i*d5_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]
#set_multicycle_path -hold 1 -from [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_resyncs_i*d4_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_resyncs_i*d5_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]
set_multicycle_path 2 -to [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_resyncs_i*outreg_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]
set_multicycle_path -hold 1 -to [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_resyncs_i*outreg_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]
set_multicycle_path 2 -from [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_resyncs_i*outreg_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *mcp1_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]
set_multicycle_path -hold 1 -from [get_cells * -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_resyncs_i*outreg_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *mcp1_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]

set_multicycle_path 2 -from [get_cells * -hierarchical -filter {NAME =~ *mcp1_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *mcp1_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR || PRIMITIVE_SUBGROUP =~ srl)}]
set_multicycle_path -hold 1 -from [get_cells * -hierarchical -filter {NAME =~ *mcp1_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *mcp1_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR || PRIMITIVE_SUBGROUP =~ srl)}]
set_multicycle_path 2 -from [get_cells * -hierarchical -filter {NAME =~ *mcp4_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *mcp4_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR || PRIMITIVE_SUBGROUP =~ srl)}]
set_multicycle_path -hold 1 -from [get_cells * -hierarchical -filter {NAME =~ *mcp4_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *mcp4_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR || PRIMITIVE_SUBGROUP =~ srl)}]
set_multicycle_path 2 -from [get_cells * -hierarchical -filter {NAME =~ *mcp5_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *mcp5_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR || PRIMITIVE_SUBGROUP =~ srl)}]
set_multicycle_path -hold 1 -from [get_cells * -hierarchical -filter {NAME =~ *mcp5_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells * -hierarchical -filter {NAME =~ *mcp5_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR || PRIMITIVE_SUBGROUP =~ srl)}]
#set_multicycle_path 2 -from [get_cells * -hierarchical -filter {NAME =~ *mcp1_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells -of [filter [all_fanout -flat -endpoints_only -from [get_pins -filter {NAME=~*/Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *rxusrclk2_en156_reg*}]]] {NAME =~ *WE}]]
#set_multicycle_path -hold 1 -from [get_cells * -hierarchical -filter {NAME =~ *mcp1_* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells -of [filter [all_fanout -flat -endpoints_only -from [get_pins -filter {NAME=~*/Q} -of_objects [get_cells -hierarchical -filter {NAME =~ *rxusrclk2_en156_reg*}]]] {NAME =~ *WE}]]

# Set max delays between clock domain crossing data path regs in the rx elastic buffer
set_max_delay -from [get_cells -hierarchical -filter {NAME =~ *elastic*rd_truegray_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells -hierarchical -filter {NAME =~ *elastic*rag_writesync0_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -datapath_only 3.200
set_max_delay -from [get_cells -hierarchical -filter {NAME =~ *elastic*wr_gray_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells -hierarchical -filter {NAME =~ *elastic*wr_gray_rdclk0_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -datapath_only 3.100
set_max_delay -from [get_cells -hierarchical -filter {NAME =~ *elastic*rd_lastgray_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_cells -hierarchical -filter {NAME =~ *elastic*rd_lastgray_wrclk0_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -datapath_only 3.200
set_false_path -from [get_pins -of [get_cells -of [all_fanin -flat [get_pins -of [get_cells -hier -filter {NAME =~ *asynch_fifo_i/dp_ram_i/rd_data_reg*}] -filter {NAME =~ *D}]]  -filter {is_sequential == 1 && NAME =~ "*ten_gig_disti_ram*"}] -filter {NAME =~ *CLK}]  -to [get_cells -hier -filter {NAME =~ *asynch_fifo_i/dp_ram_i/rd_data_reg*}]
# Set false paths and max delays between clock domain crossing reset regs
#set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *sync1_r_reg[0]}] -filter {NAME =~ *D}]
set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *gt0_rxresetdone_i_sync_i/data_out_reg}] -to [get_cells -hier -filter {NAME =~ *rxresetdone_dclk_sync_i/sync1_r_reg[0]}] 6.400
set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *gt0_rxresetdone_reg1_reg}] -to [get_cells -hier -filter {NAME =~ *gt0_rxresetdone_i_sync_i/sync1_r_reg[0]}] 6.400
set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *gt0_txresetdone_reg1_reg}] -to [get_cells -hier -filter {NAME =~ *gt0_txresetdone_i_sync_i/sync1_r_reg[0]}] 3.100
set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *rxusrclk2_coreclk_resyncs_i/resynch[0].synch_inst/q_reg}] -to [get_cells -hier -filter {NAME =~ *block_lock_sync_i/sync1_r_reg[0]}] 3.100
set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *core_in_testmode_reg}] -to [get_cells -hier -filter {NAME =~ *core_in_testmode_sync_i/sync1_r_reg[0]}] 6.400
#set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *resyncs*d1_reg}] -filter {NAME =~ *D}]
set_max_delay -from [get_cells -of [all_fanin -flat [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *resyncs*d1_reg}] -filter {NAME =~ *D}]] -filter {IS_SEQUENTIAL=="1" && NAME !~ "*resyncs*d1_reg"}] -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *resyncs*d1_reg}] -filter {NAME =~ *D}] 3.100 -datapath_only
#set_false_path -to [get_pins -hier -filter {NAME =~ *rxprogdivresetdone_reg_reg/D}]
#set_false_path -to [get_pins -hier -filter {NAME =~ *rxprogdivresetdone_rising_reg/D}]
set_false_path -from [get_cells -hierarchical -filter {NAME =~ *cable_*pull_reset_reg}] -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *sync1_r_reg[0]}] -filter {NAME =~ *D}]
set_false_path -from [get_cells -hierarchical -filter {NAME =~ *cable_pull_reg}] -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *sync1_r_reg[0]}] -filter {NAME =~ *D}]
set_false_path -from [get_cells -hierarchical -filter {(REF_NAME =~ "GT*E3_CHANNEL")}] -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *sync1_r_reg[0]}] -filter {NAME =~ *D}]

# False paths for async reset removal synchronizers
set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *sync1_r_reg*}] -filter {NAME =~ *PRE}]
set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *sync1_r_reg*}] -filter {NAME =~ *CLR}]
set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *shared*sync1_r_reg*}] -filter {NAME =~ *PRE}]
set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *shared*sync1_r_reg*}] -filter {NAME =~ *CLR}]

# False paths to the resetdone registers which merely tidy up combo logic on the way to synchronizers
set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *gt0_rxresetdone_reg*}] -filter {NAME =~ *D}]
set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *gt0_txresetdone_reg*}] -filter {NAME =~ *D}]

# Max delays to control skew into coherent synchronizers
set_max_delay -datapath_only -from [get_clocks -of_objects [get_pins -hier -filter {NAME =~ *ten_gig_eth_pcs_pma_shared_clock_reset_block/txoutclk_bufg_gt_i/O}]] -to [get_pins -of_objects [get_cells -hier -filter {NAME =~ *coreclk_rxusrclk2_timer_125us_resync/*synchc_inst*d1_reg}] -filter {NAME =~ *D}] 3.200
#set_max_delay -datapath_only -from [get_clocks -of_objects [get_pins -hier -filter {NAME =~ *ten_gig_eth_pcs_pma_shared_clock_reset_block/txoutclk_bufg_gt_i/O}]] -to [get_pins -of_objects [get_cells -hier -filter {NAME =~ *coreclk_rxusrclk2_resyncs_i/*synchc_inst*d1_reg}] -filter {NAME =~ *D}] 3.200

# DRP clock crossing logic
set_max_delay -datapath_only -from [get_cells -hierarchical -filter {NAME =~ *drp_ipif_i*synch_*d_reg_reg* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}] -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *drp_ipif_i*synch_*q_reg*}] -filter {NAME =~ *D || NAME =~ *R || NAME =~ *S}] 3.100

set_false_path -to [get_cells -hierarchical -filter {NAME =~ *synch_*d1_reg}]
set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *can_insert_synch*d1_reg}] -filter {NAME =~ *D}]
set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *psynch_*newedge_reg_reg}] -filter {NAME =~ *D}]
set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *coreclk_rxusrclk2_resyncs2_i*newedge_reg_reg}] -filter {NAME =~ *D}]

set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *mdc_reg1_reg}] -filter {NAME =~ *D}]
set_false_path -to [get_pins -of_objects [get_cells -hierarchical -filter {NAME =~ *mdio_in_reg1_reg}] -filter {NAME =~ *D}]

##################################################################
# Transceiver Placement
# Transceivers should be adjacent to allow timing constraints to be met easily.
# Full details of available transceiver locations can be found in the UltraScale documentation.
##################################################################
set_property LOC GTHE3_COMMON_X0Y3  [get_cells -hier -filter {NAME=~  *ten_gig_eth_pcs_pma_gt_common_block/*gthe3_common*}]
set_property LOC GTHE3_COMMON_X0Y3  [get_cells -hier -filter {NAME=~  *shared*ibufds_inst}]
##################################################################

create_waiver -internal -scope -type CDC -id {CDC-10} -user "ten_gig_eth_pcs_pma" -tags "11999" -desc "Combi logic will be not result in glitched and thus safe to ignore"\
-from [get_pins -of [get_cells -hier -filter {name =~ */*gt*xreset_i*}] -filter {name =~ *C}]\
-to [get_pins -of [get_cells -hier -filter {name =~ */reset_synchronizer_gtwiz_reset*/rst_in_meta_reg*}] -filter {name =~ *PRE}] 
