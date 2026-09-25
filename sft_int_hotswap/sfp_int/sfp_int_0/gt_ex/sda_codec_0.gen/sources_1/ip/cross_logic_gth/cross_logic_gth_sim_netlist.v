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
f/sXf1vIt34FGNGZM4VVdoRPtjy7t+2da/he
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
