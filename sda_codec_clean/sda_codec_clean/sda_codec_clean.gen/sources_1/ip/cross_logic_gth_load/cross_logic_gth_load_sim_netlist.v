// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:52 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FPGA
//               Final/sda_codec_clean/sda_codec_clean/sda_codec_clean.gen/sources_1/ip/cross_logic_gth_load/cross_logic_gth_load_sim_netlist.v}
// Design      : cross_logic_gth_load
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth_load,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module cross_logic_gth_load
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [63:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [63:0]din;
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
  (* C_COMMON_CLOCK = "0" *) 
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
  cross_logic_gth_load_fifo_generator_v13_2_7 U0
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54720)
`pragma protect data_block
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
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
