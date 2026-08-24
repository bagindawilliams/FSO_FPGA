// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:18 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top cross_logic_gth -prefix
//               cross_logic_gth_ cross_logic_gth_sim_netlist.v
// Design      : cross_logic_gth
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [127:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
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
  cross_logic_gth_fifo_generator_v13_2_14 U0
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
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
UU0HctCtrDGjqiFgNj8KUV1CNrtLH1fzvWozH/S7aVj0RSc24esnSs0ybsApJYbLPSCW6MJRxlk8
TZTBIGKXHEs9iSJrHyeb7Q9LsfbX2O77j94jiFzmN8lM/LIVA6RCDBtX2LtKWWw0Ex0IvwdPy+Mg
2z4iCfTMzyceiAZWkhE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GF0Vw/gqBrc9IHG5aASlKQHzVjMUtBIwjnrAUquexOCvx+SSWyZN88WoE2YOio8l2Mng8jmA3ELb
iVwbk5kPsSQid3iLelRIejTGTCNP7ErmhAyw9N/gInxZrkBgF+99fwCp/qSFsRz+GkpjXlmNPLal
1m+CmI2mtQjH/zDmulZq9kFS9URMU7E3TrKSiNtdLMYc1ulwC3kFJ99geu/tuMfIrNOmA9KkJtnb
Zoy9fNs53bR+fUGBL5n7AwoO6cdU62PpktsyWXh1Gp6Ylf2HTT0CPMyzWbJQve0G4+iszllRawxG
r+FcAh4BuFpKqaFogcTloexA8MTZ9ICsGZkzkg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Hzytw/FfXpsPrE5ZowzcEV+nwakl1BirWDR+Iseu9nWPYk6Otw/UyzdfMGdUJQcXxjn8eODJUMPS
SLvHyIbu8M+iaMMz4+lNG/o0csNo8MO67HX9fxa4xkVOaSOTCzBVfRk3cjnK+OAXlJEZO2/F0Im7
evCVwWE8mv0p9yv9NZA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aYTxAf85PVmpAktzX89uf9AJXAUs8FLk2gaAmaPtMQhfYN72ydFe5GcOlR9/W705GnhW+LSDUX2b
XQnSvIzmqRMwIqE2sgix0W4aZDvptNpP2y+gttAzQaOhAd12INExGFaZxKro7f/cey7YiwGKPPah
zcBWMoHI2bIhFDe04i/Jt1MdciCe1haFyhwBCett8eV6Laia/DlHOXxqH2bLukgGZp5p2EYoM0T8
WwuwxJ3X0IIphS/uP6nXSuuuMQcAplYzcG4PLCMpn2Lo3HwmwSo5w+0N1NFI5LYfb6ZrdTXjRH+j
oHZlteBZzQ+4jNx7/nPPCnuUB8IFMROek8y3aQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
e6jDiYnzLTYk/3jC49X3YNnxEmaFBYGO/cl88hMTKYq1FltlAtsDFs47xPVxcrXJmXB6FiDcQKgy
Zcri+H61avSebr0yHZ1uigtfwqLvcivJwyCmMK1zZ+tk95pu+v8wQUekejQwCfm8d4EwcPtFRBCP
VuiAB7kH68VA/rKSNW/L3Ck+PVdkE6HHJnrneJm4Aial7Xm5QOsroJRJU/ObInH0MO+tgwAysCdd
6eCmjEBFQGTjmThY8W79EF9AQGGRTMTJSajCB65vB7j4uMsw7y2m2q5T1cf5FapbNOa5qVGM3ltu
WzPHL8ffpwsn/Um4FxL0m2OELCU3vijgWPxyYg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
W4uYHM01gGeA2MU+ib2L/ExIRZJnY4G/4/BNSFnBkDMClm5bxdPZWGZhCUejE4JXBUBzvBBii0hv
o/qn9snazl844XvvPfn0rjgdMjBDDTUc14EhQ+t9LtnZFAV+z3wAIKGQaUOt5C451j/28rPyPkS0
kBiQMKRYL8V8HYzz8PJCw/2pMZh5nAGYlHVN7x7BRfHg/eGLL9Vxje7mRSIq9oPfHNxp9KvTPnEz
BAbFFeUiH6gtQHgv3loUdp74IXW+8+uJHlh0BbE4crWkB23UetPNvBTz30q+iGUe+Uy9cDako55V
AVXIMgciLrWVPF+qY5b7zySQkB4Xsfj+udkVyA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R0MJeGCQpSjYsGBWKKr56ZJi8ovYpLtniBxpCnrQicvQybY+fnPA8Daj6MXdCf3qwLF8yF5WCJ8s
qgsZvXSLz7hwsKVEId08i3cpwMDSnKdPTNXjuKS2h7UKOlcr6QZ5j31qcO2XbyCffpn/pAXTmv3a
wywj0bLNK61+JY8v+VTzUKzR370hK34Ryuts+hg1InhuHxLuVnu52lVOpk/PYUaA+w7ORS7AIzBm
Ic2Gs+gCO56TT/kHzEdPXDOhyRk/LG0ir7xXNq7VYILxVh4t9QTZ+TIjutFAhElz9ceEjJ95QYy+
i58LiAOmyF9ID0yxSSYM4KQAF2bqt9kvgdWRhg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
piBTg4FhL4gV7WxO2j/dIDXpMS0DVV+BCPbz6qHH74TfGEKWiiBMU6gK+ZbplwJNS8NHNyEzAlya
r4wgVpBFLdWysNz1JTSjKKJCO9JEQN5/H5jfiaYLOSRwE+N3Opc54BvT85yu1V+zTS+2aJj4AQ/f
gjyVCtr2A8YVv2zEjqFuQcYlcSxHTEk5eig4u36hHgzGJsmifFlP0OtE2NeoOMzFbBJe4LR9f1Ac
XQfLq8HilNwnOz4EYZGL9iJymjQ63NwSYfWcRjHVPPJXQFZSrWlI6V5kkz1/IDnPuelueoAKOk5K
OAAeaRjYDKgXhfse4B1Cy+u9f08zryJez9v+yfA14jVDkQQJp6a0qHJYuemefEFrmwJxSLUqG+Xq
QDK6/emEA9ZXoln0PNQyFzaEVDeFDZBn8LZi5SGL6f+TpO0acfI2jxa5+vCQHX/boxpyVjtxPh0W
Xjk7+E7CKFDmE6T/ZNnn7MRpaG1g4A2TEvSqCSRRnPprcg/+bRR6T6Sy

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GlYhuN+XgK/dKipYGy0F51EWCsMzdTtEw7DUl9GCeVeyU6B0qQxd4o+WGLqPzleHUcbSjTY0Zsbn
PYVk3cx1yet4akcLytYAGFXC4n/Xi+1UqMz5TGn6+YQTvRIQ3rDpVCwwETOtxY9exyURa9vrZwN6
wg8aS7eaMRDPPrD9XOy8sQT0WrdKizBToFy2xoVRXceycyYYY7TdZikow1sCVE5Dsq8WQ5SRprGB
6XOvNlQnaIlUCVafx8nFv91VsM31btEViBrUpTqFHJAuoebt0ZL+JlrQ5nOk7XQnw6AQ+0ZlOKba
q3Ttg2CqLMLHVI+1yNiz+OEKhmPV1D5J7vlPQQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
2gbN0jz/o58BxZjM7+eT+qN7Q3qHE0g1JsI7dvdgaVydBYqQVWbzuiZYLMAHv8yrsn9b32oHcBSE
0o5Cui6GiD7neKU4AljBAlKAaN9vmM7TfUunNvBpRwv61T0jxsnbQPWfLrtpbTXbXa9k+COT+cqb
xPXfz1KFKZR+jUVQfqg3k9yE8k42Qekbv3kD1KU/qey8yzrOiZWk3YSqYVf+xtUpOvJY52CMhroS
XNjVVkBPUu8Qp/8HAzxqzWi+9FMbOuRKapPdzyPMn/9u5V3oDa03Jlbl/wNvQRAMkkI4MR0Z6Fef
acPXE4lO4yrbdCI+/JWNiFnMhbPxxOqB2cgi5g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ijvB9ebv8UTsfEBOdwLX29OhkfU+M38mGG3GBCgYR1J/bZmxD6jFCxoFCEm1aKFgD1oURupMHfs1
c3MOeOmJ+miekD3bzrkO2GpRCnMbhKovUm5w9Qm7OnK1B25OU6+Xq1Ykk4tIi1xMOMYX8YKOrSrC
twPgnJ2VHr4FFKQ+p5YO7BYb6KtJrf3+2JKYjVPpp3gkR5SZklV/ugbHgXnKTC8NtjSnys5yM8fs
hXOpMWgzLJxxPm595q7fFP3rHvMyw7H7unYraHK+0uc9zTFZ4LHWuOQvc3TRUEmRmJmaag8nwld1
2cnhyhbuZqsuwb5+2W6amIYGSDb8gPS45qwzBg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 69168)
`pragma protect data_block
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
Egs9eoXADaC4Tn2AQAOVLUsCogM/1au56lf6
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
