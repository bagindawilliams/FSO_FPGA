// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:53 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FPGA
//               Final/sda_codec_clean/sda_codec_clean/sda_codec_clean.gen/sources_1/ip/cross_logic_gth_head/cross_logic_gth_head_sim_netlist.v}
// Design      : cross_logic_gth_head
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth_head,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module cross_logic_gth_head
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
  cross_logic_gth_head_fifo_generator_v13_2_7 U0
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
