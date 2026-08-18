// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:56 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FPGA
//               Final/sda_codec_clean/sda_codec_clean/sda_codec_clean.gen/sources_1/ip/delay_combiner/delay_combiner_sim_netlist.v}
// Design      : delay_combiner
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "delay_combiner,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module delay_combiner
   (clk,
    srst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [63:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [7:0]din;
  wire [63:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [11:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [11:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "12" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "64" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "kintexu" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "2" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "4kx9" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "4094" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "4093" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "12" *) 
  (* C_WR_DEPTH = "4096" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "12" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  delay_combiner_fifo_generator_v13_2_7 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[11:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[8:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(srst),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[11:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
uS/dIpDTldS7400uyLsI6bJxO+WmZJrKXsU8qB+wpyI+d4PWZVO6Cm0qMQFNUZb63p6zCI5fvnQy
SxjaSP1nCte/oQZc55w1rQbTqy54T9kryRoH26nDjSBVZvJ8hffw7NONwiKrqeB6I7HJKX5RKw73
wIJxNNH7BCiCEtRLIxc=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L7q2sHnC0pU7uHs8shPm9nAcqyU+hUFnNkd6BPHl+ureEVBUvubWhEbLRLiFFJveufcmAfAXTzae
tWbKcVVt/zKzWEtv0onUXoSEgyS4+QaTAFeCPHR2bbnlP0aCCG2SYmC1dv16cFoAk/NLitClNXAv
h+UBGzod+suWv55DaNHeHtSZ/YLZxHdn/R47atTiQM+A1TWQkpa3faF/L9ANZISSe/OR6mPfQ/Zk
4AptHNmW/pWpd3JL4e06iK9P6ZLLRqSMR9mu6AFIeWYBVz+KkxgSIWgQO7/AHBUFjlIiMFhyQR5Y
UC1fo4CPZX7fMdUPwQiC+eZ7UtxMAUzovIzwEw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KZhqqPnSEvcItoYRHrFT/Wt2IEXHe7pq5lmAOfYqAaaoY8mpIG3Kd8B/C4s9kNUbktSOX78NnnrJ
brxcu/1EAlI9itnDH8ahxble+2Nt/Lj3dQ1/wbDy3HOKlwBVuOvVDArOpgho+BAnoLUZXrpsw8EI
FSIPKmsETVzLzZDw6m0=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WZbb0PsQl1vn7dY/rZzI8ZGsAP5Ad4C/d2cBXS49yTbQqKMTY7r1YHlrjBGteY6wrhKVmM92u/3/
/UJWPyNVqwcsrRAHhR/Lp3Mg87NIhYzETdNAOpnc7rWC9ieIeEiyPM734sI7QtAMVrZxXoUXnCjp
fjQhaMqv+HsuEWpFhDail+v8Ftwmr5xP1JSpqPfxLz5a6+q8/lTxRGeWZokM7vP2YFKg7L7Yoowh
gOm5w3JhR2fXZsksWxfQk7885JzsI4yZOrU8dY667YWWhkjZE/SKo2TMksiasL22T6CpyUbMwQm2
DJ+cMJbr9/8csBEifIsopc4V9zFbSU9eoxlqZA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Adid/GOKDljgmM7UpkmD6EVL+5rt6bnWK9P8RIZiI3EkLW96rM6eCs7jkLeKnEW/WPGRhlZrGw8p
C7Ni27oibJKJT5xUBJDymbO+yheaaTI0GaeDMIzks860gYA3qdvTPxTBotaOg6MIpnYd070NhTod
Qq5XNnxLuF7/s5rAZANJHyRQKwu4gVBfs5SU2FSjF546M5FvN7BX6G7B76ALW6vKqGyKxwoHkc52
Bm8/jGTxJ6zbwn2v31NEfjO6nM5m6yYwY0476QLXWI6+7/ILkSvDVTt7B9HpcaRg3n3T4AEQDMyX
8bBPgm0qFbWZue0dlr9ljYOl0dgwaO8G9uYe9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tq2b3cw7fnIOEbRUxnQIgAjXwRE3aRwj2IBVmS0S998fvCLPMUtm5MVXAqk0TwuEzKG3br/oRham
Oe5KAx6FauTTVpRhLH5RY3832M9OVTSW/bNq12/dXnJyOfYS76FQtd9HNFrSkVPMONGMD0ZQXRic
Yr0MaeflUHQmU6QUCt5OJkbG4F8qJLMWJsg03K7dNzDfkvev3QVf72bmHTm4SF6/cs94NXQl/NPr
CzQorTZ5BgCzVAui7mM0eu3mu6OPkecNQ3Ih+1zsJuGkAHWC7aFgh7ii6xEj1upD365TzJUF1ZCe
0jZj/Ub1m5OgZMbjbLYn/Fh5nqi+fAmL7jDAHQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
S+EkimFGNL3D/SKyjUVYhIZzRbEoTqlnv2kHD0e4rYYCt/O4IYecNmch6HRfd2U/WSZPkAoJ+xa7
GKQSo51PL81HSvqURo2CxltObyTYiklnzGtbdWUMpOSCjDe8LpQjUNwhSksWjZjUQypyYXS4hbCR
VJy96ow8zi5m1XMzoLaVMDYoJYLtOVh7eaL7InaIL5gXJIHWkhoKYh9bR/O5HE6YTsgZl+Ofmx/3
0mQ/bL5ZKSY6gBEUD8f5+SoMIjfXrGkjMj1+fEAIv0fO/wKyJQMKnDOgWMvcUw56dOJ7FWkbNvbC
kzquuXhk5LuzZfXWmhyDSyMGBWK1wN7iyMKMUg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
LQ4hjhkD/G9XJd+gVR5WF2vSll/p8/psR+nHjJ5/DHrtiRqVWFVc7B7T9XZuJBmTqrQV4iSBYWDo
zNaVdq26mGk6TTNo11Dcici0hEwC2Bg66k9kr1if+0iZo3VtB/ZuEOj2w7euhFo3ja1OovnDXxf0
8t4WMUK68mfUiMuKgVcbOFhm3Jdnbnz4u7SggH2/rkfOS8jbon9q9n0EXlK23tz2NzDLCS8B7ERx
dYvwqwBiySKoP1/EcfSwFNIWpr6p7kbRo7iM/JbP6UwBbkDHgE8HGS+3lTXIUXsmGmsx6EDSr/gY
i7lHwZTmDuhuIEJaf6gTJgtqMSxVyDVsrnba5umKgV8z5OOWUkM3FjVWIXOG7Ef2iKFCzBPmp2Lk
8XbrXk/bb9H/jr4UR3hgdbizISTysLTJd4n5uyeDhDgkxAc+1FudacmuZyBlA/VTR1f0i9+cOgLI
kdqbo1u5hQwnMphluBKjdTA3nZ8VnpDbdq5R7hIF61tIrUfdjwQw02je

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
JzhYMwmYowESMI19XNb+BEFcZw3IXZpwZO3gzrVg2CdSjbAR3tiIVbPHI5Rgu59SH7H8abU59Atd
+nrPiG37rmU6CD+cMV2mU8SHfCDLYsnrbd9YLZ1GEfqTovR0NZHQTHj+7c5dP7nqm30C/kg1adqd
DOV7F128PbmM5U45xRxOJKUgS/Waz0gvmYKKJejkiyFPOgGbN5f844mtysoOckLrAU/BzRs8SB9G
zzisK/a8hM5af8/opZ64TGhH44Npzy8kcP+gI+k+U0oF0SOqW7CjadKaJhr2oDkTScVVCbBqFEjc
2gH862vcCfZu5Cd0Sp2ALgoqVxA+91lAIHJp3Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ooNS+XjsaWLRgvcrNWVpR3ihKtIJNT1oT4D5ivD5mCfw+4/SAyx9P4cmdvOotLNPE1eqvx1Smd9Q
LDImL/GqS7Cq3KEUtEBbvQAOp+0SjiW74cC6nyOqCA8NQcn5JM+vUzGSsORPnM5qP96axGmyEvSi
p3uL9Gmx+3S3KUJuAzfuqZwJD7gdcA0Zv3hPRl+xhx8qFtkPCfT5uj7wpFVaaJ8tTl1SDd2uRUIx
rgVgV+oERCg71oEVN7PqPK1y7pFVgSW9uhP1wuvO/EsbyrLYZV6HtBn3tJDcxhTsQWrrou3F1kFQ
cFnl9tcL1wXJo/F3wvsbYM1W0UPHv69XAsEUhg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d8YRbu+fllaHlNDedyRNDRtn9CBoVbO9fZCdhKpy0yf9dL6A08sFZuWVtVGljxF/L9volGB0IRjl
KbH2N/JBQA+tZWuh75kK5pjveAAKLVACS8A+Jmt/mrxzlolPWsruJ8o1Owrjq5tGWspdqmeDGS7U
/Ww7cN0C9ExUj4cjRDcKaqDS9MGwRtx4LfcQbQbRDZBk+cyRaWCchvmhjoum4uTizvqMq2u4oSym
t2zyKFjAuMO4zC2LbPbODeumm+FhlOKAHRyEBKA+VQeLB4apkMYparuD5AFWAuVvdWEbGq/L4cJ7
pEGz+6Hqi68CfF/4tMNiyHveP1lxnyAaiW6Kjg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54560)
`pragma protect data_block
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
wJD8n5yrTjr9rJA=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
