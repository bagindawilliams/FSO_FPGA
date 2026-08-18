// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Aug  6 16:38:52 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FPGA
//               Final/sda_codec_clean/sda_codec_clean/sda_codec_clean.gen/sources_1/ip/cross_gth_logic_load/cross_gth_logic_load_sim_netlist.v}
// Design      : cross_gth_logic_load
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_gth_logic_load,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module cross_gth_logic_load
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [63:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [31:0]din;
  wire [63:0]dout;
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
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
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
  (* C_PRIM_FIFO_TYPE = "1kx36" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  cross_gth_logic_load_fifo_generator_v13_2_7 U0
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
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
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
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54832)
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
