// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:39:01 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FPGA
//               Final/sda_codec_clean/sda_codec_clean/sda_codec_clean.gen/sources_1/ip/cross_gth_logic_head/cross_gth_logic_head_sim_netlist.v}
// Design      : cross_gth_logic_head
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_gth_logic_head,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module cross_gth_logic_head
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [7:0]din;
  wire [7:0]dout;
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
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
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
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
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
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
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
  cross_gth_logic_head_fifo_generator_v13_2_7 U0
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 53232)
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
