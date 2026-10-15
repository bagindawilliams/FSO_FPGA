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
FfY90KeMGyz0wtPhxiFBo7CVx/E5mOoLvY5i
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
