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
8AEBMxW6jxrrWMasr99aJVgJKD3SbWmmmwX4
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
