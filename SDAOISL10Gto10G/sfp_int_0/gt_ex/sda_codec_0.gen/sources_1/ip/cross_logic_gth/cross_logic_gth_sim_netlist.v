// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Aug 25 18:54:53 2026
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 312000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
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
  (* C_RD_FREQ = "312" *) 
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
  (* C_WR_FREQ = "200" *) 
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
11tCF4gqklJkfsFK9s2fCIUYkHoR+OW6GAU/
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
