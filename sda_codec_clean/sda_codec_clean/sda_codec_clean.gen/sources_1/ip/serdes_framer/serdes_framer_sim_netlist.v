// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:52 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FPGA
//               Final/sda_codec_clean/sda_codec_clean/sda_codec_clean.gen/sources_1/ip/serdes_framer/serdes_framer_sim_netlist.v}
// Design      : serdes_framer
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "serdes_framer,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module serdes_framer
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [63:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [63:0]din;
  wire [31:0]dout;
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
  wire [8:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [8:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "64" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
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
  (* C_PRIM_FIFO_TYPE = "512x72" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "510" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "509" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  serdes_framer_fifo_generator_v13_2_7 U0
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
        .data_count(NLW_U0_data_count_UNCONNECTED[8:0]),
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[8:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54096)
`pragma protect data_block
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
fZRb
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
