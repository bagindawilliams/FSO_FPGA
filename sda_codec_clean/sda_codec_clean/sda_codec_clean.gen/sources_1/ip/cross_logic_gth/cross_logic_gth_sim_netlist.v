// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:39:01 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FPGA
//               Final/sda_codec_clean/sda_codec_clean/sda_codec_clean.gen/sources_1/ip/cross_logic_gth/cross_logic_gth_sim_netlist.v}
// Design      : cross_logic_gth
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module cross_logic_gth
   (srst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  input srst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [127:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [127:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire wr_clk;
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
  wire [10:0]NLW_U0_rd_data_count_UNCONNECTED;
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
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "128" *) 
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
  (* C_RD_DATA_COUNT_WIDTH = "11" *) 
  (* C_RD_DEPTH = "2048" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "11" *) 
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
  cross_logic_gth_fifo_generator_v13_2_7 U0
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
        .clk(1'b0),
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[10:0]),
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
        .wr_clk(wr_clk),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 69472)
`pragma protect data_block
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
lapkhMj3otAWrkobLkfgbvIVJCWTWY72oORJ25ox4lLQyVNZbZG426uHV4+5VmGz6fV2wMuQCMFS
NjCQcVwfat2RKvNOU/7SZzCSnRkb9af5GatrNS0QbJ7pKCF2cBExVm/bXZGyb6A2PUpZ/HBMIzn0
TQnnkH7RxWIksn9CGPnmCbSbO0j6TMK/4DEbkK6Td3BWnVXGdecQT9umNQUoOBDkZMS+g8J0rkUC
LJIA+N/TtlMRwlYHdaqj6edbiVPBGlOWpGAZOiWqzEhgcyYasEoeEVJXErJUIKA5bJW3H6pVi8L0
G2rnSpfI8FMkGozqr5LScdnjNoLVftYh/kJTwkZYlB9zx6EKhHPdtZbfXtNtWWP012iRvQLBDVGE
6NocXVwZr12QhEeWQM9XuV6XUIXOwauN9H1xd7DcEP+1JsRtktCGJ6ZBztDBvq4CA/qVu6CeDHZF
NtQrl2LyhU4tK9XD/qxMEW0RZue60dnvTGgQNRsFdti1FZHJrVAh6swSdIoDPI1G+bTMMRBNPWcH
Hf6S8PqfnOC/12iMk6CgNb9j6h3CVp5t/hVmLCMSeOjYSeK3anL3Yvbto/2WNsJL7B8NP0zesFkF
kROQX7TwY+sKAwdBSTHfkqDCeihMESWZs7W+0iP6KQQwaze7DmhKtgl+ozwR+dJNcHadh4pi7w3K
E5fmYf3gnbvNxXQ7mWQdUYw4TI876Z/tkmWN4EHyZYTZ/54HOXxtOOsTdDsZ2hjX9X/iIT/Rt0XI
uJ1yCDwnSe/KnIwC9V7bJg/SbhsiPNr7oZkyUYK9Xwa96tSYh44KsyD33V2Xqti8M8HhPMz4zaXs
T3xO3pksh0GjTZlGfD1q7uree9VBLYCTV6eonXjk5WnT06dwGqJcN2brUWEai5AP6xrPlQRvYQnV
n4ON9fxMafUuNhaKrKPsMLZZl6N034ALq5nOHv5XyP3oJtQi0vUEXgVCcChOul5SyXT+dIk63GNi
Che6Uo2J3EoWPYbKnc959KJjDt7evU2fnNeamxXpXDpv5HIEWC+edF4iU9s8BUoM3aoKzeWMOhgb
jtCzlhczV8PmHUHnQkZJFb3WhsAqPycIOzDMmGFeWHz+AGBK16m8EwR+RqkcBhBJ2ZlCSIKRCoYR
R+G4n2hgcqLWfnQm6ofCWZLbgpytDQHZJoKDanxgVM/iQ6CGf2SOEVpwuiIN9LYIUnXpaiLNkDM0
kC9/1eH+MsGhlKcNaVRpwbZ89EDHckLeSuoPl9ZvfbZRRCP+zqOKAJeV5EDe816ErsIPRJYSmoj0
dfUjAKWseRbCj2KRi6dkmDMQ6MJEeiyzi8+I+7Pzb3B8R/oMikDKFdAlWBamvX6FA/pBgSXpYBWt
zR/lcnzOyy+ZYVKddEcqDDCinew7lH7k4gcK670/PoWtS6IgRVM4VIiwMISuMg==
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
