// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:58 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 312000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
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
  (* C_RD_FREQ = "200" *) 
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
  (* C_WR_FREQ = "312" *) 
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
l0CHF+vNIFhDfLdaYHgEe9wT9BIvOAsDaW79aZsQAds8q3Zi8n8iTgtVUkdGT8QWebZEcyhq3Uy1
w8fYvzA8EHy+ythTQJAnvR9s6YYpM5K+s0v7w01uKk48Fwj9fMY+2FYlHBLYneC9IEO7rf/LLWsO
vUFvSsnBWYPOFpopvigBBtE/9O9eFnFunkgdWAFQIZWfE0aCjfPlRxS+v8IgF3DsMjRgLnngBQ8E
2ij+waJ7zMKN8VacHunu6epwW4rtbWOjIPGc6vuvUjV+1nrh5F4FmAwrarZSMh/JVIQ8l65xh+Hp
2gspq6GbcEjz99loeMUhND2fU0aEUJDeWj1q0QcRWQy/RYhBAczqW3JAjRyZ2Y3xElj26AnzE0An
4zJIbYeAu7U0CBdhvqOZrbLMSrtuiYn9TCF28ZcUYi5eCCcC05lYwUbYwA4792oKlyf260bxcro6
ulBtdMCd1A4q0km9MZX+NcCozysPs7CGK4aL96DbhwJu2TBeNiT8WmQcLfhy1St6+DUHT5UkomHv
4ip64XF/cR8fwGXMfujYRvB0vALSrtcaC6MLWdu/v4oHKrmRUQt+PMkck5e7cBDsXiJKPNV4ML6u
S8C1nTa1q+MX3XbfAvxyOkFCwzl6SW9BRZNChsSU1pGKrzQ9R0F4lT1oSMapmb39QtetsxvKvvcX
eM/PmoVW1L0LIVI0milXHHYGPmoDiaQ4Nc2VzaMV4pZijRHaXpqphQnIcsiGpYgkBb54vYP5KaJi
FIMrfs7BxDY4h6f180BYtL5CkREYIKdCEHkJ463Df1rtctGsnyhst/22OxSLtom1M8vjP8N7hJST
HLCV1APLRRhM1rJsRJTLMqxS2bqPsHNoxqCXgoY8G3Wx8piOsJ3LBiWG60MJ0FHETsSKxjaX3SiW
T8913ldEnybvaNbqckegOWCFaRlhcWY6snEHjLI0yOlAJnUPpNYtOIJKlaXcrz5ClVzvAyJPH9rP
z/TRHG6VCXvrNDE2vhVU5zPbgLyYNCvhs8HD3Ll+kKV8/ZaribmC5w+Y/2scDp2thI4uieKheX4G
8BP0ix5U1EvVPLKE9Ifj3/JKWT+kZN8rvZefsCU6dLWiVQ8SkJXM6k+jPgWzQiQIQ91n3I0dcon0
OrvEIqMDBtmGFlqzxISz2iELfQvSp7VUduB7VbC4E0MC4GaDrNTC3GSXfygaeEIs/0dnEFj96MWg
Odv6tDwzJsLSMWWn7sZepFA/I1TMFPrAP9WXqCrMqvnCxqwZumGj2jh7vtnHXxDffu5XpqY1ljGw
2huIWeBjgpZQsKRFTHnqzh/BZk+9yXmxjHYHgFPuEqgXmR+nlI1+Dnnwb+J2B/hcHRIqIDkPzI6P
YDz+0Gop1MnhglhEU1m9cDuHhSpHeYtaoYz5VjqmxiL7pHjuK6C+8AToi+ykeXY8XjrfbBjU4Sy6
2YTWfpmOmuQSrxXDu1X84z73ZKwSeo6g0rBm2O4I6f4M2TG2caXwSq8c/VHDgc9QKEpI8uujbf7c
Ye/jT+EPb8tD5RReRPY7hppJ7ajgPB4LxJzib8/NnSSURF0R15zDYeYtSFrwofF1/W8Ig6ZnL+El
G4C1L7y6HMrlSzxj85XKKBhyMaBwo5nuKHDCJkcddSvTo/LGFZeBmknyDbisFtfcltvr3AR0ZSHc
DjejtQlZ7ZVuWHSBrhFutPDxFIDWZvs86Y1vN8BSMiarChQEqAhOvH773HbjSDhthWHUY8FHPB/b
4Ts4gsA4MQ+iQ8HY3IzQph6exOqwOtrwkP94OYg7vFKohafvvyZzwlMl9iY+gKNK4yHYaQMdGMU4
eee1UOAk/WP3vp9f9uU5+3wL9JKra7FYYQYXNoTNh5z9E3VKK4u6vtqiMPQg7tlShscscO1peZI5
3zQsEih/SfFF0ifhvNGAntcUj4jRdr6FJl8/2mYr1ze7wmQK4L/RqjCZEUjd9NxuaRdSJtOsqnFi
IMlQi1JYNeQHy99kmZgx4/TMVsPOXaWnUFyzD+GRnruukuySkdP+8E+5veQzRu/hshK0Bp+MhfYP
WxkSDAJ+Mi/6RhBBi/kxTIQLxI/g5pnX7MM3MRVfSD/6xCcdemW9enMojdn7H6rnvKnvPUgEDpUT
fXUgN66M+TSWZ/PjUfeNs4VlJXUDgQqZIXDUQNNGwx4w0gLhR0z1HbUaNvNe67raARA5c9fmqQDR
lQET/L5xAjiG9Z9Se8VknHW+X+iczDLtychRwJbOOypEklYiAw3YJTeCcTBLI68yyaUU2VbQsqP+
ZISrf4twnD0jFxEhaP/XEggZSpEXRsH8ivH7QXBBGIUhPKZiU3OENhZxSXUgMFh+9elnp7/9ZP1T
S0n2K34yglf2eFBGMckkVWA/6PkWUexhn3Uy4zbKs4vykXZ0qImekzV8hRUyU+nrkpD8taiJitCL
dGYcbSIUw3yKPbwpFpA+dpyp/HBlOuqGkWizizeQntmUdEBW4rKT4X29Q2NFqvwF/ZNTL5qULSiE
tMu7f1PDY7/UaEJtblVUQ5sKyz2rU2BENgkrvHBfQGQdON/e/ApPCpj4w0iMdkZUL4UPJ477k7zc
ZG+Qp5Sefi3/DaCmwwZqfWgcR6g7rbYXuqJ9simwJWB8cRyVvtzb9NZVor3kAsq7MquTpGAI81rV
XMl8ezWUL7400OS45+45FbY1eES+3o4Z9XdrX0FliVOdsXsSIaPUcaiFxfJTaeRrZKKEZEG0n30P
Mr1Cquxd3eT1yxtk5HEyxctNI2CQkJrWdpxojSOMhKwhBRKFdSQbLVcDe5cHNoxtqi80CfXh9G8i
xx4ykALMCBGlpKT9hIzA8m3q4HF2KOFL5cekRHAmPkdxOQhEVu0/CdV4F49PvQypA1UgH9+g1wWf
OFenyl8sLkarrnFegssN/T+6j5sSPI/s6Yf1vIc+JbYBrSwQNyOIR0ozqnnjFyaPGMYMtkuGPNmJ
vF/1l26Xrc8HjGW8H8XmRkT7ZNH9BsTpiCRmLndhDReIv445jHIMJ82ohaNbSxSCNG41XQfgFst7
jLvY7wgOmcCp/Afd9udJcu2fGyw/2pp5WGwlkmjoqhSHwB1DOve+v5iENgdYC++4ky6/URr8CP3S
3cDJclx3svZ+Lzijfux3sh5/6nEQEgsIsOQDppVsDpOcf6xZ60GOkOzmJJ/tqQ5o9xYWVfBqAWos
EtFJcbClbMGN+G1/INFzJTm2PsUwRUjdS36kWkjFJlxR9fe3KAw5aFGpHWw5nxRyX71CzVu23k8G
OEQqdwZjqMSaS7Fnb0fxbsHG2DbgEqlrflFKWKylqg8EvGNwkdyBSmztnMP1NuUABrfXnvQpQFKr
jc62MU3CL/VrtpDGpA4H1z5jvRuh+eR49Vo9lCbwA8mVeDoqmiQEL+5qNpsdYHf6TI2wy8Lo3ZI2
loBqJix+enDbDIyiL6gSjiy5RLKClyaSMI5SQDUzP1A+B4N2CBkPQGYWxj1FRIKD0xdjrt+gh9Kl
6Hg7Es8HWbMYXKfwUXyfdLQyC6VR0zVbujzfM7ndrnO62TlRY+lh5b+ey5CtdpFGOs6J5Kprd8R0
a43rrMNrGJHlOYyjX2bDNGxuiGAE/Vrpg/hpd7N6JUfh5VScljugHwTWyND6rDGVQf9M3XM+UOCu
8zbTdB4x+anNvZZVwvnI492RkqTdTKcpzZIUlvoXu83+Ic+u5wvXpeHm8v9T+rGvGs74yZNp76JG
HVqVSTEri69oRnlNvOuIOuTz8vT47bgezSRmXswrB/I3HRY6a4Kpiot/kjKMDaO9rDfBNX5gR9bN
6ZIPBoxbsY0YcDL2ipfNZFQ85QGvyimG20oi65DZeoeotN46SZP4JrwfvLOLm8qQa2vAHLxqIG0A
Gxw0PNuobDrFzz9e2RSagwqxUH7T226vVN/+4YksFDu84Za6KUdSg5LwC90TQGKnBUyg01WvQqiQ
B96qn2ZB2XhGEfNgAHg60SAJrVcYqgivX0LF3rZTSFuMQ4LC0i5V7nbGLXYjMC7XVmUzoYlNA7oV
HlChJv0r3/mn8oZ3RSqEv99MDOtM0DEcO63e66eQkRH6U7MNFUX8nMa2ksVIZ2C4kPRdAUa31TfP
knsYCQ5c23gya5VtrNOqGL7k738jzPhKUR4Pp7jwBpncG6ir+p7AI4BHG9QoYseyMFzZWEHv8TKU
GUGuGKpCvyRbnJVjfN88L7VcI0dR2r7ru+u8q60/tv1K1w01/M+7ImQoKKXkLS0JSKU1NC8SM62Q
/drjNksw3zcP/IfKAIC16MR98NE24nfWijrSO4pzKP1EjeUCFSiWk85wqM4YiQvNnSFLmxghUcZO
YDn5gzR3pdNJkmq6EET003STyBb+3GcqEMF62Y6E07NohYH/VX5xalgHjwb8S9nO7PzOn0tbBWJr
ZDV/o/+zayJr8HwOgssdlMs5RmrDiHDHwVVQibFfVwfC+6nBdiBR6djfsEmEEsySY+f6xxRzrrnQ
OFqzkYvNgLUhTyGBg35/LRTI+HFrj0xIqdg77tJwtILvvN4WiIiW23x4Ka6Qk5hMXB8G4Ijvv40k
1oBFwQe7qYVideOj5wn3H+fUmtUmpM/eCVGcL9Y98/KxSJWd+1aWLRrEihFmJJTTxD3RDreVBN7q
utsdxty2ka29WxQgpjrx/4tkeLknImBchT2kggvOCK9Ywbc5SeEELX+l/y+kkcSnZayot8q+KfTc
bwzRyp+3R0upE1jznp2WeNPIvweoEP6FFgHnS5hbPJH9wUah76gXReYqtwOzICHf4yV0V/rDJLhv
MJK06lv8ZI8ZJobneCFsYZb7Xhc1h8tf3iDG9Sj/vg5CZ2RATnFuAcjHDh/oCdJBuLdaUAT2OyMm
8JF0dcR2GwT41O8P3kXjtcJ3+GDnutj947cJnmatI4AKqbJVzHa00BmhHSgEugGTXPbE8LfOTYkX
x0GQRddujMCRQJ9nSyv0cLvhpntlZqkI74u8zj+ZDJ+npBWI6gCQQGeYJC5Ze3zAkVXDCP7NVvsT
NtIdMPt6VOVVzyCsj30K3ndOOj6mh5FmafhfQWYWvXGPhPfPx1QpGw8jS9ODAEt75jl3/NTWZeeP
EcUfxGd3tN78L+BH09cA5a4E4CEse5WhE8hygvS9sGnkhf1M8Gq6Ld2wpqFSYXqQ4jGw2Y8ZWJOV
sH6mThgPCJKX/a5yx1EEp79Ric9kKGFlPfIbsRBafBPaAvoDPgNzxriFZo2BuJ3WPL7x9XbWggXX
YRdo8eIbTJ1Ble2iFqPEh1AzrqOQJyoNJCT39DUUAYn/oHTv+d9JBhV/Mfbh2p1hMKavVHeWJY91
tMBZpKaFHZOTDNn2yrsEeBEoqFKHVEjdnMocPYFyUaaefO7wkd7j/DThcTxOH6ckplPKQslqgNMT
mguxa6os4m34QztADYrCAK9QBUpN8TNSVUB0qyS3jTKSmpKv0rk2fogJEpSaXnv/q4bWMYDxD6+G
6kKnlpPgTa6CmPwmCHn5cYbtx2mkD6uVFPXnvTDYYqo+4DkMJYSoYJFrBJHSW8YpPU3zYPeZbgaw
bBYxyDizdSKpiLcJfDhNCdRdBFKnWzL07f7F7slsDTHGiQ/YZqsQNz2KNbARJrGvPZi0zphTx+xe
sdsgvhAZX8pBNWjWU8t7lil/4ITDH1nUL1mx8R6eFl9m9ywr3GMrfHZ1r2v+K7T9QDDf6tjMb3mH
HPMj5CtsaSy1470PXRGhQQmsBP+m5FU4OepaqXW7px2LMmOPl6EwpqHxtg/akzsZMAd6FooIse9K
N+ztJM8aILexU46u7Tj1cSV++VCBhBr3ib3VQxqJJQH4Wu84o0lo66V7f25FUTBQ2GJ2T6f0JA1l
t0xdpNF6V36fsDjsSQX19vC1M/HvrBmq853WfftnR5JfOTiz0Y4iQNvbJAlvb/q3EBCRZoX2j+7f
5wZhw8lP/nwjOagoljQ3pW4Wyvp3gGSrnoq6xwnRUvn03rVDQ9DDLu+EwTZS7liNXnFzZaLhhx+e
3tgBVlFQ/VndEc4wj53lSsSyjv+8AnqdWEXwjFu+NocVS/0OhTvBG0dWrk4FycJ/zNraFWhBPpEz
md6jgIpHj3ur7ZVFNE4plrBztfdhL0cw6Od9hARzRIA8Iskf6GNDE9uewcRsR2MI6RArxW8srvXV
3oy1oNrtEq3Pk+e2Yxb/J6BSL0JJfBztqugY0zgyo1Tiv2mtiDr5pqcuaOM6yFIUg+30AXObnTzR
YeuU7WTdE4lL4W9MiJEIrerDtabz5r7BTLadSCWEtUSpJ3Mnus+Jk6Q3zz9Bek2XJLic1MlN3fIM
LfLX5Bc3VVtuMU9x6vtGvV7I25BaVi9v+9hbE3ToOrvqQvCric2q93gfFXdmih4exemqg7v6sRge
m6OTJTWnh3OUO2FOmbSHhcZoQOUXG/m/byunS9i3hiuc1Hlaa+PfH7TBpotz7ZPujYvhdv4K4ALr
V+p9lr81X6wEp4y0krxPTN4Y2SBXpZE7e4a+leb7T39qjGpUcWCirHXnqXubmot1QABQHbn6hDtn
VWk6Y71aAzsS+kjpf9dK4uuGzLGu7yjpKhnSiuvgPTStb8kWhWzckakeBvAsZ3QYe1dzybC/euZ8
1Kb5/4VB/NcZZkVigRaz4wt0yY3iE/Z8LL9Oh7sgIJ/TuQqM/n/YN1zsPtC76SLRjGWsBAgLp3Uy
P+buJaTLyUg3E33nwLGua6Wf/t9oVfVESjD4oEKeXqvqw72ljr3xq7oPdykcwx4v6la0LTDWcKSU
cfCnK9SwsFV4gkv9E8qFbDRJjHEhYEPdWt4CMXUGKqdEDsWcLMXUYU5ip9e+LLaMLXV+vSkwZglr
unYyra+vxtFm4ZBag3Kng++q3Ukr2RmtwN51CP1pRe/vckG0QZXJ/BDCIa1bZdHubSbhB8JN2l82
4/6DBu44vKjohwLfQ2dO4CtIG9mxTIrcw6SgfEzDESBNmXNHRa/K49czq35XgIC+pnhRX0XnxoTB
HIh3eahXu9VrEqH3Qj1rEvWSgObF6ju57jU97yxLdwEWUWf8+qJ+EeVIcbktoh0FV/30koA892rA
47NRJz8hMWe2/zSv6KXLsYaBAJZkzii7LqMl+jDd1GE/jOTdnRt5jOghutqjjJ8ciTKzjFcq7594
jrwcp8GCCVT3ScMZnURJYMv9hzt2ZLBS+KCvSGjcJh2XHg5WGXJ36PKBfuHPd8jgjSGOLn9pUd6R
S22+tEPJjca3MkTjO/Pbrgqpf7dy5S9bvvmrivvy09mpMz1YnWaypvbKNZ+i8aL3hf/SecH7o8sO
thH5AmwgsC6O8M3bhj5ix2Aj/Pnv7mSWf16+x0Fehu9zkvYwfvygBHo9m+6j2fmt9SjaFlMd2rBe
fqCJukV/FGEm9yFXMn2ASlPfsGeHjQsC7bk12XPhgcxnsoNmXSdQIbtSmx+/jGcdE6HyagaKnHA6
F8az7cDfgP5dgONPyQS1GLBSZsXQoXFg0yOt+iQQ0lcHhywDHBETc13oN1w8Va8eN/emrFO13coM
BTjvFyb5+vvsknWHZt5XCwRATlLbGWhCdzKh441GKA6qWLRPVK3Bf308l0t+YAyL0ctMynK6IgpN
dtDH/VnmDDqmFoEls3Dgue5/jOYoIJgT1szIH4mbi9zuGbStY6Kw/cX2hHq+vtqHM4z4h4kNPxZI
PFaWiI48DPO6VhtCwTtjJO6bdhMteLcfIp2SdhJbdTGfs/c/W0PLQ8nbHAj8YW3Pe5KKrZxm9SMc
6aFt22skJ0BSN3/i178SpE3D65ER5vt3GiDQDyoFsz1CURd5gSkPixFRBM+3HlgURtHVQ2jE+ASe
0uZpSalixoMcGUrrAM+eq0M5XAzatqa9GIAJ+6CzNkWpD7XvJbORM0OQKjhkmXg47eKfEEQsh6Vw
Lo+4WJZ+GwGm5G2BcmsD/q0qGx/JDbCsZ1UoHXcsLNNzSYu7KfDPt9VYZ/yDBXD/P94GtMqlmK0c
Kczadb9fGaRvvG0EPOL9mFRDQ97P/ulJKR1rBK5b3B2yHdu3K5QZ+gg8WxX5sU5nHg0NjHWHWk2A
4h7e5XMd4L6+msq4RN9JZFAffT4jmN0eLThFn2AaK59kHYOSVxGZbA1RiuAIomqGq7gUcDO/VsEw
OlFZJff9yoqmbEFWfc7R308jOQc2azaWe6LM47mcOwHTTGaiS23x177zE/shHxGuggRIq8kfCu6X
kcBRriwi8vfstZ6NfEjz5IrPrARboknGx9ysHEt2/FZPTgxlJlI3twNzcxe1zs0pfw0BsnmqIzLS
fqGsNm+hRARrQ3Tq6x+LSYa+D8k0Mo4FfakmIVoaoww+U4nJf9tRG8X9guR3GsuUtksspDQLwGk6
BOl1Ga8sU/j3gZeNPe3dduz9MENhoQI/ksb0uSWqhZSCzB8kDO3jcdlW2u0yKOgcJv5H28V2cgxq
DJqr5TyuSkQJNg5DsT0oN2Iv4FIPcJdhsQ824rvd5R/XKcEl8d86FcMKCwc/apNm2MJIsCayLkvf
AQ4g7tUf7PI+eZxV7A2zhEpVDvW68SizC9tYzz5gZ8PJkPI3TNON3cAoX0iZh0ku0uuC+SR9rcA6
6KS4anCqZ4c/VcBifsVk+c/6rCDl2sIAEI8K02rLOT2v0QOaiDOQvmaQKrl8hXFtm7dqeiUKwZqg
ptjc2xehv+PIvkJuKDsy8TsniRddirEZ2n1lneDGLIgcWJ6zLtGGl51pOCQz888tbiaYi3Md61BY
uSZzuIlMZEiFCt3y7UnD0Jbs3E/dcFFwUimRy4NF9/0KJ2B3qgh4qfWbgbThJZ2JIVudKVvvrjC5
hMF7dIsYM0H5CITEzJi9EWfCDA+HzX8RXnHkECv4sjy1OdlUncnS2/eUVTv0CLEqzaULi8PLFcl1
WNv8eOMSjxP1V1Pd/An9030GvIXU3og2KPijZhT3XJjZ2MO8q1x0C9VtipeC6Dk/uRl+YbAH1mYp
UBQV7AXu3lkFSJ/j2lDb/L62bwstPSq1N4DK3+3jia5Qa+aok1vr/KUfac3ry9Fl+VFu8mBMVsmK
byElygKgukX4UQD3uQYVao9ymjnMzwnThoizZoddhkfz1Ef0lgc6hfzJP9vKyvP1qwIjoQg3cJT9
dGlgR+QOL0JPD9+PpXPjp3KwVF1SEk7/ZGPDiU/Kjs7QtT2NImdHgBKBWnUbrC6siibuPdzNlZUv
kTYRzjuoK+PYsaOL7ReeM0e0/KJhDGGcevAhREoN4sT25uIZqx7lQLg7VXHzleW7L5d/kYJXt8u0
h/PvqslzsidrDgQvOxOWd3Ep5vDkbzLbFUMEOc5MN3hE47GRmUwBeeS3GuWXkWeADUWJlnvKu9tA
BkR9OeXpUCGMm+L+PrPCddyj478ctMqQ/d3Pvx4tux7FX8eDSfqOGLL0MeahYDuL55K0rRGiYNdR
AjaxfSrTXT6dlP7dMizpOlli1PFbqZx+qCrj4+qXrgfiCUC+3V0iJKrzIygj+rd/j+/eXFAbc9vq
cvhk0BPwMJImJfBdqw3EMB78uHRslz1C/YVr8xLcZ6ay4mV0+l8XeA0omXeykmmuIvKQBKiu3RPz
Hjef8R7tjGYmUzYWN6ksqxJ7OfgCwGfL423Kh2B6RV1tQvjOBCYXn8WK7VlfaGGYJgBQLU7JeOod
HzPLvy31YEF4rQQoL0ZTaBXZZk/xsR+2GLtwxjdr2GU7o0SseWUeMSLC6/sKAfl0W0b+ff1IwGo4
VDW7VXGpJSL/fuxVI/vUWgKpH+jvxEXfut1pAxztfOcwh5y9P59tnO0yhYGPzwq1h1Vy65m0W2Ho
hWEfSB9j88d3RSm1rs+mTDk/2dPQxyioaYeZmWgFyGl+5eoiVmxRXL6KXHe9RqgHyDXuvwsXGQsf
uHpGd28/ohlmrBJAFv6D010EUve1cdQKmayMxD9E6gbfX9qk+hF1kYaVE+/a4m7QgI1S99GaqdMU
Kh3p2dHH40WNt8os1x+D2dy1hFmPBmS9iLi22tUMOkeeyiLatbnxIbKtEYINePooeGYgHj6pIEU7
VgtyX5NsRPD3kSVaV0lX6NSYGTrEb3n5NPuK/FAsm5QVafHwhKQOhIV+wc5V9Pw3y+AvBLlNxViY
BZ9gAax0cHfl+1hPHhiYGCkxCHuawVJUVQK0JMsNOPQ1ywD2KxQY2VXDBkOAJ0YII4Mzj5Ry5N9o
a8Dchz3WyP9JwX7db9267EkHfy+XEoEEptXPQT2IsujByD4nkLcwFDQ6GctCjzTdgclYMf84Ctww
+ctK+PDlmWn+hXQDpYgUNDfnZa+YH2YQUZcGx/WRh9b9eRNK1NKVLgkDi+a8aYUjpZYvUFPGGf/b
JQ7PREhl4uEiMhpEZP2TbWsBP27cwhEEDVtY3pjlgAQ1FFgrZIWD7ocCfsKJpRLAAGTAg5BjvjL2
rVhB8TJSzunY3qmJ8WWvntSRa5UPSCpkAaZBuy9DLSBiK6Yqdy3A+vFVpzaaIzYTychqarO46d/H
hCP45x/+uue1j3ZYVFxrKcdcORapIZ9DQk81pfQxv0GZMWMC7NgpBigusH+6p2TeWxd1e985kyr4
kwnqTRk4mqFJwZZNZSSh2r3G31KR3eoWQurA1upvXJnrwAvaUJKi95EJUFy5/p62+ikB+k5O3syq
eI5CcI8pBaq5hTkMovkc+io7wzQyPir4dMzNY5uqwTyOmvR6g9uhe/7BoBPEn5rsEflRsdG4jzQq
30Xufwm7mhasO1hQgOeQrvO+ie2X6DnXdTL+5olNicMU68Dvg6o3eknRi3nuTLbgbt36oA/P2GAu
CUPdiw0AuFydZTSacqVmNLCLE7hntw6Zxlzqs81uxQd7syY/f7nt9PtzolWPscYUxsI8119Nfn8N
cVs+WygdX9uFc0ztKtnEYFaNpM7nvcwyDWcgd+rzE2lVrgA0Vq2vvzNgBWjt7iFIH/hd6bNfYRK4
9o/joeO0rf/kD+upTS670j+a8gjb5RaA4GR1BRmRfaeuVmtDIguWKn6lUO6AmIzH7HGPo9t0gBpD
18n1HJDYJN08M3QozrNwU11by1AyCqg0+rh7+kZpmuatlZ6NwiYqzrAPGx/MPF2LQuczi1uwB6wZ
/LKzFp8gAV1dWRZVap674KwX9OAORtzRntkTbRG60uBkxJ9uAvlcKPpzHrQE+afvFFlvHx3qopmd
TD83m0r5lr1BBdnvP8JoH0u31PbNhKEL5iDun32nz2gJ44yn0m3BHqEfxx43qJE0gvD2S1ma7WsM
Tiu2Dzqnfh/eptEdHZHHznPZ7biZp9wQrKARo1V/eHV6G9bjhegucrcbXwv55J88CZF8eaj/2wrn
7rHnBpK3h0DEUrBP5IzMZ8KpzypXnKhIUaUMIvJh9WdQ2hibEFaRA1STNaNWZzBjwNQgcKRerMyc
hrz0+GKZ/M97tkHl4FmMtYQqbLw4QWM8QSFcDLoKAjhtM22qnpPVuXEob9uAbrMDABfBOkUJpd+0
b4V2huc/ORF5WQ06h4MBU5uNBTcw/f+5L3o4nt44JHXhrNO6DF9ooMFa/CGALRRuVZ9THLexqGjh
zlaAOTKV1v6GG/2YUQeMjIY42zPDX/tGL4KLSM/Q0XaJReEE0wKeJUOUeAJAD5xRJqCFTODRXXPC
TuQdcAaR8FAW2OIy7E6/7QrZnExTmjH7aMip7Ry0HXM7QpgQdMec+Hb8W0+InzG+5vbXipuNLL0v
UzjrYXJQdh82jmXdvWMk7+2ZpLosUoJNyRegKmpQZYAvEyLX8bimu5dDobXBDoLvJDWVwOYnyWqa
isuDokT+8LICUZmWu0yRVWKL8XSp6tDMT4ETval1RO17iMh0XcOJq79mpwWUrMemZL3X1aG/R5H3
aEx50uJamPByRqmTsap9Hp4beBUcTgYL2EzUNRg2wi/S+ddNniVCz8V+QsBOcjbdyTc/jE2eBn3q
uaSTgE/yqcuYR0LP7by5J33s9F0wD0QO/WyQsvDwbcifvXCmDpZ5gVfXn11DS3qZfeBII7r6/QtN
pt40ZvUaAZp0z/R5R9TEGEwjBVEnrOnVWLJd7jCjXC0o2fibn4ngfQ05Vh7ciZy+3tYzltuheRmM
laBy+hUes2g9TkWGIeiGJdWA6SISqDNRw5Jgwn955qaSe5oyDKTihR+VU7AYE5x3XJO+ZSYA99GB
yvVJLGNsPPzoYi+dt4W/f8aDGQFg5Lhy3l3GzgKI6oBzwaWmd0QkUkd/BQEyJ57/b3Lekqg9FQV2
IskSk9IqGNpg9DwliQk2KRzNEwiJw32jvLre8OaWegRpsR6BL4anVVQiuslYigZ+GwziA7OiVdKX
V7/oKcfXhch/4qP25Wu9BE/K8UT3StUmOka/qmALqdNc5TPwgLm7+5rd1ne/8PFeShA7b/FLIV/l
aZ+BrCp91tpJlTAdmZulz7maiI0AsS3K+1/du0NfhBVtjDYZWVNrRbeI95zerS4Rj+eACJq2YXR4
W8QbFqKtWjOBhhaDIsPwv9WVwwkOWnq9UoU00/LlMOJC33Lygsn/rvhlNyci8yhZkf5InkOdt0mV
hBq7ebUFMrOUZR0qaoBMUpqFAUGBj0n0hHJgQm1fPQ4BECo1B3ECVscr3i9a7T+Ual2IkyAGVOoM
JPAvedOV3mQ5L5Cq3qpS9GfH21bWHsso8BGHezojlffNjFosKJYE89RBkOc/IkfePn2hBQx5y7Ve
uDuafddn1jW7fvnYyhxVQFmrD3HvjbfRzuGCCmtaVPsM+y3eZBjn+Yzk1ztgF60wWLeEPjGgl6s5
jqWa+rZ1qZ8t9+5a7FPcPt5vWtWDJBPaPTdJZCBUpiZBpeDwAnlhIzCrxni7elWUThQw/ugFhU7q
zy3xP0jPC654o0Kyw65qe+cbPxMyB7Oiu2puzVcN8TKHG0jNtbjIyscPFeSo5WY70GwDm/QGhD/t
+bSYH9OwbWkB3IGKBNPjUSIbgTG0GNMIUXXDLzTNmVhrM5NdEoMfWUAUtE2cJ5BSHxHYs+dcIgF/
ifuywnBc/FnmOwgYmFjhFrnKtKH/n23zuiLh2U/mHxDrM6P8bKoKWJcu+VmubpRK3vLEreiQPRB7
IscIBEXZzx361ATw5P1sTOVHN8ybHPw8D6y8t1byFjYJ0c6A5A1tBUXzErNeBolcIqRyXP0JBTrO
Vu2xuc2/zYad1toYXTaNCmrfkGWONaD1A2wQLD+Z8uejcXdMVVbYx0LTTINre5Q1WHPXO3bswewQ
uLaS8fVSnTPCqu97UZYZPmnlcWmmlbi9boguF5RsC5btjBj/ofXgPIhhMp908//ytlTDoLAUPDOX
GUhZKoK5w/ZH5jOme340BhYaBe38zS2BWKbzroCnzxHvK6pE2sPgh5K093Bq4XZ3paSxSthMKL2a
5w8lsMrDg5vfywptWtUepvJEEmg/o4Qhpam7w+iYfpnMvTCANdLPSbHb9rn1g5dXi4OHriSEM2CW
ubSNi+h1KK5WyOzAeTwZZOsgM1nESwKxjWF2/s9wV/+aR3ssXYjeiYqyWU/3yWXWpBfWYLdsa8HB
ImHumLqJNRKGcdgL+LIBN8CqzN3NeY/H+TtKmrDZDA7AbxFlKCXXINNNKMLdbtnohzhMlP8R64iM
rcK7SwWZycoGwuegcu7qQs+tcnjzESXFX9t1eBB1tmQ5HnDiqnoclnvg+KzNG+g5GHMsPb+mY2vk
XPdrV+q0RDcdRO96ylQ2i0pRr/cFiLwanctPM+NnqoSZNkWLpbDDFCrT38FOlXMx0pYM/JF3SfBK
RQFUfOJdsjw6b8jQYSGKaBEoE7yjPeUSeeLpRidrpNvZFKShq/5VXa/gWkFNGtV1Vm6eNRAP/6mn
9XHtHFMLISbJb7AGQYT/6CVXtxXSswPpUcv9u7Q5tgYLmkzO0HbDRlBJGGIfY1dsFb0mpl2pjOAb
/+GIj1XCDnAQAZOa+xJDbNUFMTftsUVP3uGTnbamP991H9y0fJZTj4l9nM9LVEquJmy+6/77Ju0x
bucoANRQf3MThYoFVA6TWI/9BMjMH9TpyKieqbNDpQ4rp/gGhIcGq1k2VVnxZwxc9iB1OywsuyZ5
TZM4GwMQus6OznD/KAznQP8QC7IoreYcA1Tkt+64KtwJHFVfNdixCC1JW76HQPzTykfqYswPdSGu
ZLY7ttsKeFX3NVD7mo94ra0YFP7I3dInWkwxQai2kuZyHipuyPxBzbJ1ipymZAdBKshIlQ28Ye8A
uCbXCHDvyORJyg0RKAALvBC9/LmBrd49JuGm779ZtGZXo+MrkdgU6rz6976M5QSL/qm0TWOhLxZv
D7c/pCNVge266iCs2QMUbgbZ6yxIiJvwbvnsHW9jw5epwQyDNyfB9+ga8wScFmKY1pg7qF/qQDnk
QVmCxgc2Lt+YGUzHC+iCwuuqPlA3cy4ZTvpjkI1nxyIMfMeFDjK7PthjrgTW5KEVY+7XlKlDcx1L
U3ExjD5XujDqqMdro2vMv6OizmdaR5byEvgO1w5eFGN9iNgfAzTqVM1mHIQGJKDki3pAwznl63wk
NK+gz6p2Ey9ahsjNGC465O6V/6icuOuGzbgzzqEUEgMBhYGiSfS1F1sEpkt37+95C9VcOgrKb9ih
4UgcS5HygNQL+Eo9eTd3OGJ+j0zwhUWykCLdD7GbTMnKbGImeoIFqYVJTDqILuWtig330oLP45El
sCijRy/JDcNQyd4IM1hFv+LSCmt3hg2BaHkrReKG2+Omv9Tuvx/Y4Q/TXr2S+BbhV52A0gjBz8it
KUGhp2nAVD4jOkK+IesiJ1B1iuSnUAkok/cAkmlcEEPhl9ahl/khPuB6qrNL+npQ7Wa36E3EWYXB
owwC7NdxgvaEpHP3DQztjyqdEZtI5WQe7OWLviAbNGIu06lAYH4Ms+vo1NnfukpxCYG4r2lDlzBu
XsUm7phJGCnFmC9kU60NNjl73rCvVKWmAiEoTrps3joC9CqwKZPyCnoO2IlfJAGL4f43BMVMz1X3
lku/D8ZY4XgEKwaODVhbnMBgt47rCpKfHthScsJuZ9HkeFanm82jkVWGmcSNMm4BpTy6+NgHvzMk
ipCeJOWjPhBOGzRBpNKMxiw0fofWnDYiu8jEl7iTmHy8RQA0YQRakKbCWsoh2w3XzRjDt3rLbyKJ
TodJmEBXjNPWn3FQkBiMq4ZXuY/yXhOxzlslINuh+O8S2OzVR7FzluL6K2Silf9lsPuPcVwoSlXT
STf7PkTVjQrtUEj1q7LtYrO/55PYKiz4aELvQPbRGVVKHnC0Sra7gXNBref71IpZMItZpi80SRv9
i2WnqCV6Z2s9WBa+/yeCbSLe0ylB+ym73sjlXjzKMP/nQ3Cf7cgMr9g+hlKV1ur3PygGElTFsMMT
8vd3Pmoz/bYxiUa9r954JPT9FqLt/0Ou3zOu+6O/btFg5vBGhgWLhFI5Kpjbu4nU9Yai+EA/GHsn
xYSwnqAv12lQsl3m9uElWMnFSoBmuUkncfxo0oH4PPLD0aUEWHG9MYItOlv7F2HVAkkUcoXSrB0/
PNH0tgr7hwIKd7X9J2XfTbjIlDfxL2FhkyygsCTfEQvtpsCo72eh1VwBkQppjBZnRw8zq7FDOn0d
pxZMMoXV9n7co2UYa1tzI5HmlTn2EP8LExyWA3Z+NSkAq2tNQsKp4x0/uZ9VprGw4aEpkjohALaq
WJnM6V/bavc2x41mIv/tAvSUVqxxllbVg97EzM2Ydjq8A4Iwd7bf8iOH+/huCTNGLQ3y6ZrYCzeh
i+peyWdBX2QUuUXLJ0IxNbD6iuVzdTWiDN5aGURLAQ2PF72jn5YYiFc9ynkdA5ad0wgQVdzfDo0o
hDk8SQEEhwhoIvJa+ogh0qFj6WntABGDAqcmjufQnMkMe0g3V0GLvhYVhwuKSOB+1z4qgYy2aEL2
TK5yKX07emcqoirpZEW+opR8KzmqtPUaUTdzDYjz8x5ZaAD7GNjM2I+juTifvMis7buO1fE/Lbkz
TEVzmRERkZT9yrBqCP5/fDjxrnYLyPApKBg5e4tKDb2rd/h2cOSpxkHyz7C2w3sCdM/F/rfGkvOF
V/0RiSZnjW4JMpJm4OwNeopY6KVC4DlSo9FfKJiG9vkoLr+LKCECwujyejOpjK3Gl3aI0LODmrM1
HFg84yDSd7lVKAxcG95kcfmIAasx+waZ7wifgCT4528Wdac89J0N8i2Zi/0LICaDN82jZrnrQL9x
LLn17IsKS2NFUYQ1sf+JapoJeWIbR+loBObh3TL5ebmV5bwQQO7suHYqRry+YT3euH4WGXizBDUA
utvIHedT+9ToavUqPbDeRT156UZsYLVKsh5zmEo/noPdjlyNKjfJYbEaFcA1CtNDPDnCirigjZCF
PwIHoqpdnVK+7+YD+i+bTQfBAuqEJFAxYQS2n+u64mH3mLeUxpN3BYKKgtcQwni36Wk3vt366jW5
9WY/4+CyDY7jGevWrjaSLQhIHUzqGc0uOqUTd8I0I1oMVenJNf5OjJy+UpdL5pTCqT63ybOiYg0M
aLr6EisiiTDuffyY2zCofeVlO3eTG9eXWsjDKBMKXSujDodXU+FGhJjlbp1uCG9BB19XXVh1q1uH
G8k+3WMs6kQOV5K7AGEiL5nhsMSnzuIT/lNYy4MtrytfF4zo3j0t1gGoL2s34VEHC8jIY/0HFruT
5EkEiJ6AYjn15i2niLYuWDS5mCBzRW1tcDDqZGbM/ZDhkInq8vEbeWrxH7kqBxvuqZpAkGl0EucU
C8C03+nROShEYv0ynulxV7B1Xb7gCrOOzA1pdRz9syVzrcZ+Fu5WuqiJCs7XUYgh49PJOhXdbS5n
nDpsMaykSLAr2pk0gY2N0bLdLec5wAaGjYNPcFZVb7+DWAIYaeZSh7mXKKS0n10j+AB4QEqA+MNS
o95pWwx6+leDK5/bGz8XNrw+OXAoY1wZuLlI20We1jbA1S4JkynlhAPrfn3pkc95FfOzB6Nz+COP
Wxm/mC/TKJ1zahcSZZN72uQws+u/UWnsFT3zLcDv6ZXiaSux8yCG4hvB9qf99lXwXpQQoDgFEUlY
SZz+s6BCp/Bp+1tcW/rXQeo7Kplld9yWG+FLojbjlNPGpotmUZGN3r//ofjgmfravLcVefasHBiF
irTwT/pKvBWROOo3bLLtT8MSmvD24vdiOKkMePOOsnyJfX5Pr2gnqgvk4ABp4w2jjeOb3D3/pgo+
j4NoD07/k8x/vVK7rQXr2XghyXQWUwfWUQqjMIz3IZ3F+knkdBIuUiieJpsFe78yLEJKIIXEGnip
nSCPgO1vQdsI+21XbUffOb4sF6T+pPYZP6YnFvATavfLoo9Ij+4BY8nsQP88lvTHNLy9EB77cyUn
grpmcrUf9bgN9ETYYRmly66oWD4xJtTDrxuMrJz9dMosVytqWsIG+WH2k8Tjwk72Ud7CThyj/nRV
BsNH0WHgBgLpHuxo17Dlxt1Hfkmt7w1cbuf6LeRa/Op/WoiLtgNNpuL90e3IehZzAK8c93TlastH
S22cctE2cSo/xC9modIVCFvlylWUtn5HixFFExgeV8/Gt4ycznzQm7fblZa2G1pQttDbl9KAVxnf
W6jxcc0T6jyZDxidmNGCTeKLo5psaOIyxvC2x4FLQI06hz8Z8JONq3Bca6XLgrTqS62qye1o5lVv
/9JHUGIgOJ2aGKEL5/ayRVRd7mpB099uvixYJ0IxL8HB0kOXYiLApnkLDl8Sp4qqbQS/8CrJYifc
P0BiARWf9rtRLOnukYBsOKz5p6i32bglYXus0OPqWdAZAXUFvjTUUM2ZTSyTNfmt9IKuztinSafW
KTEKKWO9GZsMrm6gXfR+m/UQVvaovtejZnS3QnoKYeU6iHP915oXBPd9VuY+rGEyH5ePCVPFAeK2
QOx+jPHJ2K7PqShjpQTOfeevc6JexY/id3SLcFrA6U7mQ/ajfQLLIcT8BcCI3EXl/hlRbfXcQD/9
uvmWqjEpKsQMlpF1RgrH9NOTUI72iHmx8EulHFGyeSYgRUYFQQq/D+cCnmET3jdcyLWUV5iAVQh5
7LJsFB0nkkPo8PFkIEf+vq6HpkwNNQTb8Br5GWMmFKDQZ2dv6/SOzacVmYf3LJtNYta4efHd29G2
UYiQweesEOWInwwc+0P+T/FXAnyg+4vunXQJRHoMsPjh77TbgeG3fLeZ7C2boNkODaCtxtWMu9kS
YDoDh/OCSHaI9N7S53G9nM3D+7e5koq/YTAo7xfVDXrTCxI2CnolYWcA5VPActHGZGxGKrbZMOlu
+sgMiIEVIcblibpx/0IbWE3PRr1pq631H7sIQa05Ia7/CLnvdNmCJAli37paikiSpG6grihrnjhH
WBycj7pxz/PrbJfJNGKOOEwKGNl/AtjSrlXLdLW4lj+c75M/sjR4M/7gaB9zzKApgjY/NnKEe1d2
f1hLV0o2i5q82eD0nWcrM9IsxOGvjyDS91Vu0u42biQhzoC/bEfoy527axCuPuley4WTeZAj4/uW
+fY3/D7rPfXoNnDD0/1DIwS9cQ7c68LKoyfrt9j/FCCKDC48Ot2WMd0gBos67VG7G3dvp2VF16TO
8gc+JN5htiMtT33AoBB9XLnKoWumJzCS1m1WviSuYkzmetbXEk0vjlsRdVukXslG2SHFIWWhl7q0
BY87rh2VTgHcMv5PBr8Xi1PyjCXftQV2PJZB1UyAOXMeBFodqW6L0cgsDKBGlArL9T0ORBgf4zv0
Xy8fXAJ38grHBKytMYOPzD+nZJJRdq6B6++HW4kmDoSAaKVn/JA+TMzdsF/aAE1FU6tU2zk2N/kr
D0tuG2W9/IH6vtKQEuMUTmPBt6Pfv10DjfrI5aHIwHP5bJRKVuQyvTKF4+c7HfhJWjGhrgsHrrT+
/jGUrB8sLb9iwQ73a2IxzW+TjouNuetADHN1mCWoIkZJbJYH5RrfgXujLWRrhHMa/W24OZLXX6Vz
67uTHYNPdHZsGVBLi0R95eBeuXWphmw/3jINcw41I795W3d4YnisPYHtJfStIVPHrqwvQCdIxqdA
seLLDANK7DR319VBKhWuPDwlZsbKSAJdQg46rF4EF4EMgCEo9eTmm7qifyerkaU2S63BrH9Jvq59
9/qY5ZrPaDYnjygjrWgwaFX1BG5jIOw3cpLw1hMz0Cle9U6DPGsaH4IXJUMHw7eqAheTNjqauMN6
yMBk/e1OHpuxnIbPNh97o3I2Yi1H2L+YxxjaXoCWzNc2xL0m+JZGAM9Dxqfghl9V+O0TxDEOUkKI
RK8/iloVAqgwK2I2KcGpAWCn/E/SjlWgK9oCFXmL4KjCt78TsRmTqE231BwzjsFJo1rMmQNX0iBx
B7Irq51CID9cJiwB7C8lxqk3bzVp8qiRyWh0eEgzlMVrzW2/0/MJ9V0WkyIvFZmBo264qrQ58Aqk
cMP/EUsa2gOFJWyUWOOEjyE5XTWEZGc1dm+jdVJw1OGUXejib4H+eDVBRoYn8SYwMEFv+B30TkRE
bmucn8db1v78kaXcynRywNK3GSDUPsZ8E9da54vy9EGgPqYRd/N/xV20MRlqcZEUjWWlsIJv8caO
/HxENkfM4SZebOkwnZL9IrKrv2KfijDspW0uRSAFvrbM6rifJhTGNTltCvz4J5m/jB0lqSojwlS2
XCjMdx8KvQHlPNFkPRfIR3lk3A2NnzBjho2je+UFzZ6mylvpJo8nT8hZcP4NAUpBWBDDRtrML+zJ
xp7fzETYJptajqAj8KUqmRAtJ0TsIkDtYVn68l82lk4MuJRI88Yjd/wFBfyQL22FKnaGI56Xaed2
pyUa3+Tf+vxp9CsvsffNyGapUQ2bVU2pLmpNcin4oL9cUodU3eZFBGqY1vDK2tAHvlzVk1dVs7Hr
NjzGJjsOxkTNjeyuM9z1i5tum2vBGxs9e6k2fbqHgELijDz6IlDLNzsmViqTZvNK6eMnDXd1lqny
VidGZz2EcMfjBdhPn05YorPeUvV955wOWeqOQX8lZUi0v6vih3u6n1lvTXedAUmlT+31soMgswPV
CiASXFHBurpjEI6pHOzu1Gsyn8UUqOt6sJaZysmObagKkOyo1KKVQpzDTsuck7NYDm6zjnZQfiJz
faz7rX2pOtnM1YgcPjNMjfLyidK1GQlFXGdidAbjeGfSZIyQnVNlfKaBd5hxCcRzM47hBCBV5C0t
YaUm5jsML4akP3O0XfEQaxpcJOGb2SMJZPCimgpJN2KC+ChaxEvLOI/nP2lioEid/nFidrhOP3ZR
zsAmK5b8r/OuZKTh3/AH4uYySBkMJVaY8DhOUgd1yJeViktKQolJTWaZqepJAYVL7zN0N9VIasdn
A8rVmpesX81LcT5wXu4mms6cstOGSCveYsSM8+ri1ld9u+CQm8JfU9B0NQXmZbIzap/cfAJMeL+v
EayEQ1pO1rl25UmKZIFI6MTyY9zxiVpxCwYD07+TQCxBElXkD0ms0lkDfu/x+D5eLEqjUEaOWHHX
I0TxAdINT5AwXTBCenkbQupIoJHVWpXtVyltbb0WdGmNt6gTXZwmieafDRWffL+gMwYBL7aTLZIx
vpghfCXaBawgjdcu1eL+Iz2ZfG6I35R8i2PHr3+5+A97pqxtsgNejaTOS8BOk+AQsHdD+q7bl0kU
yTP36GcqGUhuB9azJzz4ok1ZrWWkBKVM5CFZK/8aoaHsVNnBQJW0xawzldy5G1pjjA7Rr1qcUQqd
jCnYOCqvPyziJzhTNzRK1oefcVv4uKZk+7pssn/BVreutf493l15ZarHeqeO6PE+5WIcTxlY+fJj
PAy7my5T/O/FM2P9nPC2oO4O9fUG34RtVNy3VByDRhNlx3RpxUXlXI+ou7vl/uNOeNR663ioDTVZ
qi+Fi29/3mfROzLysgs+/MroBiDLNP8DrS19Ap/ZVX5nVmF9eT/lD75KMzmYU5UaUgXHq42R2UEn
GfsS1rrX4ara0YrrmQZ4vTsHtcJ4lAgrqpuNyDBTP2RIPLgdgainizgqw/JqedBS+MYWGAT5rTtf
Aq4DkGYkGuAM1eLulBG4/LPsPpgGtNyFspMO15c2NYRXGoJ6AKsinHzn8cOmYSiSpDD20SKAsqPg
GUjRROQoxQaoqSvDSSNvt/ykMlOoThHw25VURXp/DCZySEvJlKPgDLkCw+4xPGp+bNdaRcBvryfO
A/YccTC9xJl8ZWbHMQ5IT2if4Jq0YTYOf6aTcy0PzjG9JOM1dQO07ffUfkoj/EjZFCPsNXzSI7cr
UpWr7BazupE8gXSOLv/LodCiO3It+uFRFmPrntE+gVRPKj/ODnSh6aGKM3upJVwyJ3yBUL2VJWBA
40P4Ob73ukq4y+iMpcxxCg2Wgc4NBoeP/HSjerDdmo5uRN9t71iMiCe8Iy6/I/44xGePLwonWb8p
ao59SuN0h1Er1e3g0jPxsiiy8Nn4FcqjBtn2mZUiVZRL7v+K8MdI7Cy1dZ4IjJ4cYB9EtpoKdSBu
fnO4X3u/dDm/v4xfgF8YNiCk7SKe4NgpdOzxiR6eWxG752fvOfDTDWJbDDIy8APPzkUb1h7dMMhh
YuS9u/8GlMRbBgz3BchcUPDhHd7oEBRa6XJCTnED8WBVw9cGFd03U0Fc9NInNWnQVLKBTCqq5uPu
qA65t+cpOwdzRbtIcHH0oda1X2LgOIQ/dWvfInLJyYktN0G3huYFecJ7N10kCMT28ESEjtKJpopO
vypEnVrIwFl7iQk5BzmYouBy9TwkVRdWtb9p9N2nfxTxRBlthWsIWTlFUOEzlQt/a3Kn/dUXnztM
yGJ8g4t92mGkKTsFiEf1+uitAzBM+tvT1n65EylcAS/hoYccdlTb7SplfIlWscIJQ60p89NUC6mW
7eOkdT1/82/pLkv50DOMZbc2N0iA6U00vB5f22cs8c4EUVvt+CB0oOr1HWS5SlaHBWfqPqLEov48
KsKxHgKBKkspzFliPQq3cb/V/tk83p2CDhwrJoOmxwP5wgW9FCj0uqYd/Yrg2XQGuyudi1O2hTYW
Uml3Twrt/rtXuxnlXDMTLJZGRHRFV7CcDjOrpOm9jhF+VWSsqt3bKg4dSteSFtgE0bjuqqtOvLcG
M7zdQkIr0edXTylnEBKxxa3SSsaeDr/5MNgpAMTHbCeN7TW6B/NCrrmHMO+iHlRimql7aovaU3xZ
IHjX/IPdRfkzIpi+jUsoQVPQY8fhoGK3N9j9FP7VoWXdALYPj7BDNTxKPzSE4m+bqY0dVt2qYQ40
msBBQlo8Uqzk7YLmrBZ1yavhjkuFV9FD6pNF1RjLMKULJZuw4mXuwR1vOqZMixiFvNBIdV/bhGWm
Ek6mPmXWZ0CcbRM1q/H1fxudgRO0SKDmlOnH8dcDX5349booUzTvMbf/NpboKz66MF3Kx0iuFHC1
TGl83oaWnGp5C8DIV+CCdhFc5+zFA3nIF7WV8p8w66LMVs9ZDdAu3sdWbXDhcIV9Mfy4BUALfcBm
eSydCf/LcBZz6zdbSWqM/bkiBbxTxTzg143zbq4xVMkSRV3jHFN+Nm9k5WX6Ba9qrQkFmrjYZVVj
n38dkF7+N9+eB3Yo9xeq1Oyj0JcfWR5LwTXHAKME2HaXJBzvLRkBaOQlbxLa/TzWyll2TSkwXxJm
/JD4RGN3eD01t2Uj3Zl6AJVcoFBu1mq0MgapRJjvRKEDUROhDtM3hFdUtRc4P4yrAEow5LVTO75d
7mbi78oIFF7K0EmiumY4K8U7p5t5zeDmvNKRI58CIyQUhGDCHgr2k8xPOyXqsZ960tq6Fhqh3KmV
gwMwbQMILc9kD7NAJuqq4heU8oHkcvE5xY3f5i60RD7rW7Pbl6Ajg0WJFrX69rfgqa3ssYKaZEKw
JJxYjacVVsDe265TgUE1cj/nlL7r7JHsO3f3b6Lf4XTNd5EjhA5rGZs19y1GDNviL7Fa/lyusHa6
modWt4M9e0XrbKh7YXSi5WLNto92DJskmO5Ee5aP395x3x5TxKqnrchWZm8VkNvK2dqmkj2zdOBg
9Zhmf2cg6TR3q8C/qtXgxA80qQ/GyXHREYNjJ1bInsDjZSI5U+uA12lvXG5ep9672ZTdxpSwD3Fv
OCYyDzvnxarPnzNQRjn3AGWEDo+l98jLcvEUneINCQEWaABxkKewkA1x9HlIwUHIkgH+MrFH6+f1
s7vvN/v3W5Yq4KXmYGt3VEa0e955FxO5iUyduco4z0+JsqgOkkDQ5SHoUOpBKT0zwg5qZvA+sVNR
fVJgL3FSXkvsiSzxBaDNo1eFmnoNkdyTxywfr6cyOgBnL2wopMz4HO266+lLZablc8QLRSUBlXVJ
8CEPlkNZk/J3O8slXqkLwe0BhCONN7kl6wYbKDPR9Jnzbzd9bAv5baSCfOeSkXBYIDK8E6dIhoAx
y1OOcs5mFTDUu47yZiVITXi84EPNaaHeqqRcFprQmhe+Rc9PFyc6zkQhbB8FWjB4419QG+hVGvof
rhG2WZgSSMpjXavso0JBaVQNUsFk5LM2RQ7gTKr2PMTdNUnU23NgesGc66UgLpn2X+a0xXRGhx0I
3TuF+t20wI5OpsTo1iFu0gquW2V0aeGyq/rsPP+Qx0rz1THb8dctX5mkigOYCGJ+LdmyqxMCcIGH
8G24gfrFxDGF8uoBFIOwtT4eGUi2a3jPH+LdUzOJ1vB7teamzit7bYsmoSSCKrRTiwr0vepikULC
35jxWErpNtZ1gfr9aAdQ/qcXhFqUZmWGinUyJXaFkT0qkYfVmRt9OUw8DOASY20GZKn5PWdelGD7
vj8Hr/cp3zdxlgFffvNTgCGqtpYKrziYDn4HLRfIa8v1M7YjwOcrxKkPh7XQjgLDeQmdwMecLSay
Qqx12m2osNXBqk+g0uQUTOCXX5gw3iqOvhQbig2W2t43k2U91qJ8Devj2TZ7Hf9mt2DqpuS9ecoV
HF6qyojbGxo6q6sEpNhvuCksrd1THDteTfdRJMkVnev/aCQWMJKaR1LMsfSdwkpkple5pLWgOQo1
KkaRyIPD5L4QkPGfjxHOoHI4QVptxJNim3amHQrjLw3YVGyElfRylEX7PD7u6fL5bDJilaxdHRo/
T6MP8b6mw8SeHH7B2CEiCfosl6M8QSpiVDb3CT10avNlGJc/yjfkFlqJifwRMA8++XrAkaJ9Q0vL
C1MA8h6BnSPrzCmEbha1fvFNidWmFwcvCRyhV4TK5bD6R3px0d120rxqwLzejMcXdvDCyN0XnfNi
x2A0HS0YfWCm/1E5cc/4eOcjNxy33rJlMJMYMhWGs6X8DVzNyKaidJLphInCbWHNq2iyVXWRH31l
ssiax9lWfId+FP/a3IjTv9cRLArHC+UzuUzCLRfuvtFpiqUcFapKCIwlr20pXmxU2UoZIidBn5KC
bgf1JgR1OSDcYPy5yPo6QzfzqYVDCrBXWzdnkhKKJpqFJxZCb0nyzGB6tdu+0feS86QkCDYZSS3a
cBQh4Bq4k2iA2S4RcstJRAO81d7y8TjwBDARJlJXXmg7Eerl5FvEZ5HWoBhbQyRJfhpkkzxlLdES
Ut2Cyg7QSkRJhKbqedCwhZvCZa0EkBA5pkzK4+6ExSyq6b9t4brsOD0/ruHnn9NY1YueherLQu6S
rUIrTfKwtM/iIoI8jqU2vW/tgLvbpXQkefDu6sdDzSUTiPVqJ2+gLk4q3xrO3vqv8uj+Pt3CpVwF
eMJvetNCEcEe/W6/h47D89E3LE2pLghib9otvdKzq0Qh/v1s9xlKK1MF5UMp4gp95rRhrVlVflGD
hcLqD8m4DAjUJSUqMERBEHZFLA9YkQSImWNENPIO3eKl7UQv4iy+Pki6wgJhh8y+mmT+JgWYxYF4
54vJJ9QG38DAx61rXWvmXDArMJbyu2mNEHEyxw38FARTEPwST9Z5MoaWhBT+exQbtwKuqFBGL9f2
ydF8e5feffjyGoH2qZVg5eABdPL/++Qnw4I7XBQLl/xL+f9OmSkABc6U8v8chGXal+xyBBX+aUqD
b22xKpYmX4KT60PmKSrzlfSz822n4sLnv5a2/i4t9llrJMl9Ls8Lr9wwEzMNq0xJq3Pz7VLqKNoc
01MfRLkEa/OUyd+wB4Y+Wxbx51l/GOE08QEprxuCRLZwVRvs5GrA0WGSGWwePNzTaIlpOCqZCQ6/
IeFZ3pIHDzK1lxTH3BKsUHSja4ih8wmcUWPL5gNZvdady/XUNyKC7thj/zcsDKoQNyVr6mBCmRBK
14hXJLBazwwMpw7TgQJNZvzbip2Btix/YfVDu6RKPbw42/h3VzudEVjCwAvyf6dVNT9meVflgapo
AalfqNKPN+MKTdxPjknGmnd2TrEpPx1dCiPeyz9I8cPESTDdSoGf13k/DeRDC53AaN/P8dLf/cjh
qXkGyM+O6t0fLjVtQwfQ6+mlc/eoC25snMwX2kIKx2bColqsyjHj5bybvZ/9rdIHzPzWuBuaBO90
BeSO1HGFM0BegL6R2lx2qYpXhr7vYuIkwMI3rF6VkmSsS99jn5sjtd5MdbfC/qk3IT4bngEWyDFg
V3lRVOcuuijKWdXawDgJQSIqLrBPfiJ4mSj/kjNBQpWMnvnXec4oUxV0klXqw1BZElZn6OaMq72Q
qAmqjCd/h5HQwjm626N7uvt0Xp9cf3VP4xTiXRrw/78+lxa7iBLtNe1SWo+k2prKlFoLtthImyOh
ReeELOhh0QOo+Xc6VCaowwxe2j03eGlmXVHAh25wh7AJ83gp3ub/lk9eg3gCK3U/d7f/ItsJShIJ
GOVCZB8IEwHvUOLCRg6j/LUjDC1GJvbucUyCVwOH9h/TcMFKMapxRwVC/HbXdEH6ye4tylA+N1Jg
c5KxU5fSYo+e5Lnyrkq/UzVfAbtSWEcafGwopURY8Q3HJvAtvRd9Bx02Gt0R2D+hbZwlShqB9Z6R
d+PltO2WQqnzlZDhIeood3a8D32q0/eqOYD3ATkOHdeJOOiNcTgYkTum6nLsRruDTaoknSnZ2PKk
qY3jVzuQsFFJ0sLev72vXmalGKOVtPag1BCjx9ZU5qJ7x6ImoAOG7RMdu2Qhvu9KuX9Me8edFE2F
8ylkDqAj4m43j+aD8+e3l/owsPpErZsMVyI7ClopOIzOcptsKxZhGSwrlswwcywp/MA8OApM9aMO
2Swhy5MstFcJYD38+NsmWPVzrtfnqJTE1bj9iubARZLvIuZk9XJLx5EAt8YdBLpQi15PjVwFj+wP
499KeweusL506YA+zc9k3im5TSc76gjb8iAL9EOE+PKgugw8YtvW+KHc+oGozFfO8sCf22ZuCt46
sHAgGLSp7SXt9NSaIoBGbHkVyPIuw6EnHRIyHmtK+TrrrkfE7gsGT3zWAkOKwQH2hmfakBLYrEdU
sKsv/Ji7a30T5WgzNX+CGe8JAgy35i7tBcNhX+iQglfOHXI6xeAQezxpjol9jzEE56my71TqIac+
HG+yEd3/q3xQbh7ibZ/7wkDwu4UBoIoxODt5kNjsjINe44G2bscsvKiGFg3fv4/uRinDJV08bmcj
x8nEhANKRQAlOY0C2lhnudS6a5o4mK5BLPHXctz77XpSAQU2pohzNrOIRVtIRtzBHl3TGkzplspj
JE+liT4qcl0pXH9mfJza+YT7q2J+mZQ7/VgPFCnov0rbYWtPexCc2aWAEKDvzucvXUVNIVe3DMpF
791nQlohJM4KsOUigepbg2w1h+uvdnO/XoB10ttc0znwbTDiWJld1CbRFuazTTTr0qmWUQ1dmG0H
WDenpx9SV8KX/EKWglPbl1bLVTlX6xSdVnAosZWP4w0eQmtkwFtUiwiSEOaKQ3NpdVK4BW9l+y0e
gyEojySRuLXUHPc6NCexk0ot+SRQbbHQ1Pg/oqlSxM9PbkJHNTuX1p7Jf7LAx+JcO1DOMf5BTwhk
enuri1BNO1PVHUwllmZsqceqUDy4SFLPr9YC/43nwXUh9dr/iXwkagJUq623qZAtHm4AmUtIEHIS
rltZG4YPtAeERLv0PD20cUCN5hQXCyozPxynZ+60wX/fhxNAZckUAA/Xj5oqqPm3+pOVdG4SIraj
DZmtkJUoSvld/yr8g6dKhJmSjzLbKJnVrkgaehI5xa5sNm7BIbYDgUTbGSc6Fw/0StRBYJ5BDxwY
tnTAtUfnl/SQUlvyPjg1pobmR4V0oAJ0Bz+uiiHck4F9MX3UW9JMFgzWLGv2MV4hevmgjb1Hh9RP
kKmamTSSDmNRNseOs0kllEYaHppeRBU0yMHzh3dPsUtHcpxG99KhO5tJiAPtudI1ASxv4Aaj0/UO
J6lzV+GpbYHaaOek003rV92XzzdtXyXdNI3hagDO7OIG4RgVwYrWH3Xyj8lvFscLRvEpPMSIcS7A
gB3RgtHxOudmmuEiRumny8xBc3dgJqCmRz0o+rLR4wP2WrzK1V4fZkdOWPFAmKCAdx77PAvtsjTD
l9lCajdSMvi1+JERFERpKiT47JfHA73FypnNaRJG/s3i4lgy5Qz+h9tq7we+NGeZUoWE08t7kUQu
F7/Je+d4Dxum6jts6AneLMegbh5O3hECSAJqqyYMCizYbhBHXjgO21Vh/AqXH7nEDHd4Crag9pcG
NazgnztT3DBEv2OHKxqumelMxXWq8b2QBjbv6k4CRqlYT2rBq4uCiLenoUvCNCUdNmLPDTm4hkR4
zpU3k77QpdKgSEiDHKjIk6LaeBoc4XC89YCJdyt7M1qnL8lxreCcpHgxdIzPCp6BDRQTYVQLGrVz
3BX+Retm+FMxC49cipOeJiCKVt6WxN7iCP7OaZuEnP91/YiuC/M8ghWiLR9TDeIHzACcbyapEvFT
pdyPlt7Xc5WzIPiEQeN+xbTEv6XPTJhUY0GN+QNawB1Zs13HpkmkIfOEQuYqePZ8IWiGru6hXl4U
uMJ/esXUILkh8ddSPiXRgvbugF9l/KUtGKcz6xw7SGHkn93J7hJ84gNnRUmD15iOmvOgriBsnWj0
V6wC+YFgKATtzefnakb8nlpG9mpNSAtS0D+dAmpFPATh6b/5VowjmmvBJh3UCcbYjDXVVKsmYegP
1+E6xziiOnSbh643rBbtqhX1yTB3EAo2gxazx2+q/Tb3VpHVt6ENFDaH5h7YrSjqYThPAjOMALF+
oNWx3yKzKV25MOK99Oe8uyeUoBl97jhAeZ1BUaDso+optKMpxDyfMq9t5Ys0MY2hF1f6hSffTQnF
P4QBauUmpMs9+fKX9vPTj4seExi5jEJyyk9Ksl6V54YWicRzfLyiviOiH7xBS9jH4DtKjEi9NhPX
8Ak9NB9Yk2wKvxXNRDWID/HhMpR3cIIvssIzfV2aG702ItGbWpVrbcHVu7NDrp28Rwt3cxZq5zly
jEZ0xKW1NRmzM8Zuqz5UZVDCrHCC5+iA7PZVk0WZiw4OSJAMlh0nfC1yHZOzu/uKbYo2YTNVTBRU
1H88mUdqSy+pk30Uz+3gUrtLTywJkLJuyi/38qoxnUafFv2kjIH2riu9ektVKiq8UXUAY+R8UXKQ
qN0T//b9CdJGLoNdjVgW8Tp9AEQ97l9vXcDtUnzNMGVNnhQVogo+3+wyU2yvhB/B5N5JP8c0YtNA
UO9xPh4MeOSaz1iMfTVaPwWKyYxH+xGwcfbwm6FjZ6U2pQzAu7B6/WkIWidCHqCnB2SJQBRwQk41
Xi348h8JnwFhNnhgb3dT4sWOuIeWQ0BXyLPANnDauzommnhgcYB2SgXJnCeNN6Oix7y/lBD8eE6X
4btyG1Es5/BttB5cSTsSFDb0cY5IYzQdWz4/TMtxbw8PTD9RaxEUBzzgg6aGczgh4aqF/lsj23Zm
Qbqfwk1PJ27oNMpFCFFn7FD/1s8Wx8DiUhojn2K1NW+GD1VP7NGF+MilIDgm+jKdQtS5N+pvE9dc
hyEGV7R4+TA9DA2HmNLoWTRRK6mcNfSwztImHjsdvsjlzhvqH7fagDrLKz15ZLaLEvLjdtlvZHWg
mHLBIqk9xKGiV1dULBpg5vqdkdJDPQDPUu8Ynb9PlRtjSBFTVNBukxr/AulzWw5t2mGlGyG3QL7n
fpgELpQCeMt+ya6TEhxewfO8J5I7vkB0s1GsenUkcdnrcuc/r1cXMCO4AcF7m5i62akZwr0NINcc
hapQLqKMAtINJ62bN5uLefVcdJRMAL58OXfIzidED17f8YBoLyqroH4IlKTPRh3SNXcWBG2XSWDx
u2eMao8e0HTm4kbl3L7FyiFO1/QNzjMLjkh7Fdq62VBKu9wp5hl8H/W0XvGM0X0/PdROCQpl1MDO
FIBRt9xHr5kU+O1RwrSdFgA+lkLnqdLKzUDRbYrcti9DmvI0CwHRgMrQox03kZzriq0VTtbPVp2w
pXIM3wxV3IaABQCCBUzT3EOEPMCPj52njOUFcw2dgdz72bpFX3m5LN+W4JyWoFxAx298qjSUMTXE
9qf2ZVUHKs2sp2qmNo7JCG7PFeOE47RvurMVfFRarZdfV8M8B32DyATaZ58X9net1VVmEZUBr2aZ
2u/jcVOEYGrQ/NtNfr10DjqmRQcM6T61aFlhZGQve+4Km36jsZ5fz54pmJvANSHXOfhrX9uDWjw7
WKr4j/EDcVB4oxrvr47+tEwNqErVId4eTjvfV2raKGDQctScTIakl3B+iw8yQW97cT0dIRctjZP/
EHC9RgBor613lZerAMiTV38BmPnct/Ch/tbOJNX/Iy1iEqYdKejphyuHQAApWNuRGnO8zYmhivrX
d+hvBiHzmobHj4q2dIW09cq2/DeKzjvufSwcYBwAlNbcw6L4meohsTWdYuY+cQQF1E7bDmixm1Yx
35in9QaOkycUB5pEClSqmvhhXcfBTgAHq3QSj97yG0VNdUGNB2weteWPF2+Y0D7Ynf90kdv+JW3O
Y3opWAb0irUcZXNl/0W0TyGYLQgHsiBhar6rAdC7xRYcdH1rI+avhNoGzMJINmUvML93162urU6J
DVH8YBEANX3A06/fo8q+Q4W9iiNjwrxfRc4LHi5UqJ+FAZbyxgUr2lyM1v1mnDcWFTiGr3ATQxpP
lsFWrz51C9uIw0YntpBmUyA3LfXAw+ZoGTAAoSZx3+oy6rQuv81I+rLhceaEEYEhkHRTMZPTrLhP
n1NlynHMHQY4AjHlAbhSePXPplbTj0yh8KV4ZUr1cq0jEuquRCFeQVZNxlogWO9QtGKmKLT2RTVm
dFmEc30JjrSIfRJAGk6Hy6RwLjyQzdRfEumJ8amIe41O3t3FFsXUwwjWtI7YWY0T6V8h2AByulHC
QtiZ7yqZkG2qW2COI4rySwdH4IbLYLMhQK3o3GnTG3OiRFQCKq0s6g6vo3qSzy34+rO1CwxrNryG
x10xYy3qm5CD4eF/i8sDjcv9bivP1ydSszpPqxTb/S5LGCm3JgaMuhTfASQLAtm86y5qhkbxQMzw
KQIEaGTmYoniHB9LzXNROJNyZH06ZQzu3xkDbWrCP6F9eTjLyZXTjFF+LYfelOiOzij7gDilnm1X
NQx1Hs9ymN9LIdMqmNyGwgBHbypA3u9drsRr96l1LSn8GvrfpxdQlgDIObnZrK1uPVouiRJxOfl0
ol+oyOI9rOGQ6a/METZ90gYfO+L3mHt18nlYbI3mqfZHNOZQMNtMotBjvX+907KJtfML1Xkv0HZk
OEr+qzml1IgZdgio6w8pxNsbov0+MfLDOruB/3d3jc4QAKJfU7bTIMDwlAXXllQK7Y2CCXZT1sXO
SHbJ/KSyVgix3aDVMCB6Et2rRzhUzzMPHrBiCQEMZg8GPK9jZnmbiEmwS+f+7LXu/WcNb6MK+w3/
5rjTv00JljJzcLw9jt+EXhd0C9TIAHrRq/XiLrP7sxtjeN8Mr3/qsNsXK47QP3JHwOppHCC/3wSQ
pUX+xbOR6NfsadE3eyLAuBYyct6pJtAN+2kkp/4USRYckUCj//jnSDjtFg7gNTfYAW1qvtP23GSC
yEQ8X4Z4ffZbaNH19HP8gY/NAtdhblW7WGveGmtbWzTfQs7RY1MGIr7L9A4b9ciAYEdPhuZOlpI/
KZKdT+1FQephYYP8OddBMQQ8sE+gknsx6xfjPslAFraqpDyqG/GgjcbMMGgK7yEcoch6wgfoRXEM
Q1R6NDNxllARsuJEMfJhJTgSLBDdAKZlf8jn2rrSyAHtEQ0DLWYYv+2MWIKjdwMWESVffZzZ8IyP
0vqjK/nNiaS8flzADlVqb/GILEuSNrRtwf5IHChQ7utUAr/ubSiDmdlGIBkhlwhs/89M/C5B3Bcj
l62HChfjwKKQxhdVic/eiUnuuBo/C4Z9B4AIk8Jn9w1f1Y7UzapwS/7aJbzlm2uqFin+k9WfirCT
Zgc9aYtpV4O3pVeb9rJM46iBrA5ljZPbUUcf0+3C3yX13GO2nMaesK+eocXN1RsDO/8fIQ6ZLxMr
8Ld+mLD8u6Z2FaZogU2nMRiu8SLAOx6x2VWCmcky2/UYj3u9TIz6tjjOOTks4Xa4+tse/zgiH3Re
Ouwx5GdP8Oa8Vd5dz0hsqdzJwjXk3QDR1cnyQsduffUhffffgfKp7WXHZqB7b3rv7qpRp6IIjiEd
hvas7n3ijB+1XgZy4rMfBI5N6ci989YFnGoaqnXpYblo4meZ3JAkFXSAe0bh1sBDifmica4uCshD
orq5WFmegcJmrRPqs4VNMbUw2vANCb/3zf8wZqi4iw9/b0biKcLkcDegw/tgmu7+vDruQMPHXwfd
lorQ91pmB3Xi/ccSOKrBsvsp8EbbjAkgjzCEv7KpjqDAKiJ62vsKLtDDwedW8kjw6GJopqiAJzGc
Www6i7rrd282HBscW1ilL9+HqqQ/Gf7ZkAE0RlJmwiiM1Sktg40fKNbkyhBxoYWuDEN5GsIEBhFO
V+HWd0wxdwWgezTSl6GWT1e465v7/nN5tly9MpgPdBxoKUR7GeT6JyixlgBAHgAUvpisrFUgDshp
f3a4vfVmXmvJGTSMw2yoPJZgvxVCJ9m4ph/jK+jcN0ZiMu8mj78NG+fF98g3PqoTg51Xss8/ZYQu
TGkhyKpv0vRZwsiL/0wwFzRupEARnm+JEJ4PnDeMu+o6y/28UQdkGB412TTzNMu/yGZ3gziA3pyW
S/4S/3yafAonAlB1tm6h24SDZHjX8bcsPKNIyP47duzdPDTQXp3z7uWFZI0xVBHrHmOLPTX5Nz5t
q40seVYWhFWekx1OIJfvAfqX69e4t4NBIB3GOnlANYFaW6kEq8CM9nPBmczQT1Ny12zpqfw4f1aE
9GWxCRL0TjhMuNSoYSonS0y1QL30961o2zxK7ieBi8C6xmUGvPqorxU7eq/T8cZACdauRcp1hAx1
qN1xoRHDwZ5btMt22QIC6D5T1B3YubzZxodqRpaU/bkDBaH/aCiUDDkPu9Sl1NIv7i03iHE+t8kv
aVllJLhl9GG/uuZLafrjlVtTA95elERbp7Bd3QtH2CAT5MsJqgrwHyiJJuSOQuEXf6OP32yunvAO
NVx1kIMUzXlDVz5i38oM0+Uw4W33SjJ4wU+YwNQEdrO1xCGMISwl+9VVINxIVTkAXtiDAG8CQWLD
a/7LLt2ANyacqbr6OhUn1YWiH/LSOzXLHh3W+C1+rSJ3FQEnMdlQq2ODYQ8o40muZUAVy/HkjvLM
4LwGYegVaeqS71w9MIQgZwwVRrdHPWhgGgS2wIoen72ecNyGAVFZAk6cMpD9hZhM6LMyb8dCbMLn
zCS1teBu4ZAd+N+dDInwrQPVaSVgy1wscWpoc4IALydUr3Y6satJ1TTOw10U95m12tfRdWY9ENl9
PrAJpwqFOAvWbUSuaju5DQ9gKGDOv8fIMQrVvdilqhYuFoGe08WmEhVq+JRiO6tuI0y2paxL2WQc
wZkG+uOJrWoKn5SouHD8FbAnjEqkyj5jouvMUaOni6ssqguEyNYZQLqy3k/ze0yi8puy3ShOF9/1
8EGBE3sBQREhUN1bwkRCiFnmgKsFbHJkKSftoGBOqAcMb3BNOV0VxrGKXck6WKFdZl9r8p+BTKB3
J/aFpyVHRoHjI9PUFlJroY1XlHfNib718/mQpQnYi3SxlEJJDaKmPTJyp9nXkmBi7tlJLHIFo7A4
x+Vrj7Vr8PGU4C9xUp/PifnXCEsCES/emEulidXBRXYvPMRRnq3xPsh+yjDgNHGgAmJvqOk3YQVQ
02XriAVT1QavhcrMX2Hy8zCshOkn/YVYNCJk+Ba282fp8sxY+XHfGWRbEB6Pkg+OLbr53JAHAEBw
LvRtu1LZH546mvKRcxqb3Tk6W3IuaZu8rMFaRJQzLU4IHtWAuNmriVPCK+JyQ4PhB41N9LChaVaL
7WVeV9iZs2c2RhIZBRNTC0/zAtmWOwHb5mAOfYDY+FUB7Wt+iPIh8JIEI5oEuJJf5bd7yAnwtv3e
eDJ/mLihs7HC5tZNZ91lB4NgUKO0RwTiN4FiZsiAFMv1/wvYGGUANACwkAzC/2tKqhNlwTFLqZax
hav79PbwjaBI2iQkV+iO69Ip5m4DQk8IeAiIQihCt/fpX5HIA876mV6cSq3FPaTiBKPjA5RGQxpr
+UTcz+QRwrtxUbMjCiqMsNpnVe1PvkPv1xPi4WUczQeaGDsLNme+uX57rEJLXg9SUuo4IJz8aypP
ipD7DxrPtAWTzUFMtnztcYvX/Phbk5CsPfzd7Jbn5z2dwCmbnSw+wE1uLwPc0Hkm10aq/c5IfCx5
uOEnxAUteAlYNQ9rBOUqnBw9MVp5QDCaDbm482yXbDL4MjYkCVPuLfaDNwlFYk/gqGAM4b2fvgrO
mhFz35L5cHD3vssCggXirnH+n3JRidJY4FUhjzwN7ZDCKS/qvwr+9yvGJcU7lkkxpUAvJB1DAozg
2hBuzP9aL2X9RYypT+7rJlSy8K8b2P4F5djjOYxY/L1eVebYXJiL06OdymWng4laDaAyfMV2A7lY
TczCX2F97kqscx5B3jP197K7M5sunydp3B0ThlbLF8VWIKMu26dgradYVGab0vD/pgeSGhcfSx3k
eIGsWIqPO3G/NTDUvj7fkrIfRrxj0Bt0teal6Am0wGcj25yZyQ/j2nG9/kDBZfn0VE+VbERdc0Z0
HsWBiGiqdHPR8g7bW0vlxlZuRZBvXyxN6F+qGpCmI15bZNL6cT3yei8rWbZeHelxf3alexVaXVcS
gfZr5AlJ/z9q6GWGrRpfLU0iotBBd2yIAUCCgypOHnaiE3Bq9ArGdG+Qcf+mrQYVYSotv/CaPMbs
FeY67VbmaHgdVoenH8U+oWUdyBahHmQuE7jJ7K4dxnqyj+WxvXhpvUfXgsipJbxDuf2dfC60fgkh
RlWfV427HFp0jpP+BgU8jZzXPjnDjQKx3Rb2TAaRUYk/oQ7trgoKuyfu6k6l25LSiP05RcyHTQfa
A+trQ7W5Z1k9TUVMabOBDG1XAwYQjbZaL12IugElXxs9xHh2emPVoAC4O6WLGoTxkM9iavlE+sgF
bSr+2hib898cCWTmfLbt2LNnYfQ1a2AFUUOC1mZ6jWnw+WW+0uk60p+SZ47K4D2uEMN3qY8yoQ2y
+UdahqnJEiLSjpEmrondD0TjdwKai85crL1/tqpWO7GUIXEbnpkgGKwd5kc5NO+fmpmHyp0nGhUR
+GEidReCpNT+L3t/pBhdqAgfUmzWGcO4nLz2/kWl4Aq/UQQPbuCZDTIe7vhQK77A6CpNg31H923a
8FSC+9opFmwcnwJFb4u7OtPEoR05XPpGwdN+qmQujIr9OFCjTU3/S1AbjMU5BX1T0jxIRjn6Da83
PdRcqPWqTR+YMuTmOodr14aXdPktaJ2iZoRrU/GXi/ssItnLem/j0DGOkAS1ICFRoXEAk7kvGewZ
bTxHuAbwF/bKi/ZK9yA62+N+qnI0q712alcQlZ3rsbGpZ0ifthVZgzsvwuup1T/0+4sDws1+n8Ct
kB+RrEcNxfeiTQ4ruvsMle6hCXAg3+YaJXNIMAILMm9tDwl1FPdTW0sUolSDdPTVf7vQ4ZU3KYbl
cLu8gu0j6F1MKTY1yXlFz0hPFNTeo7Gh92dR/W5K1AtqHeYBT3L9sAAW2op/uI2LQzfgFJ2NB3bO
b/E8n/zdyQNVvADjFumijjfA2bwSofvcetre+RtEKG0RjNE23aDFsXK8gk8ik5jBLUFhlG6aslM1
BlpnQ/1dhoKokQZm32j2jyPZwy9iCbwn764kh3o67sY+Sc/7bQHVkjMav6Yh06IV00vJylpOA+Ug
MCSHtiRulicevDVU3hHMlUg2IzBluQGJDUm7RnrFh2oCQ7NYqncAZbR+8HQ+f48AXXdT9qjbs2N1
4C/nepClkEPgD9lnyd/rZRNI/z8RaT8s7GTiIGsye7fcFre49kyCY/KLxUpQVlQEk9iuhf3NSmHl
lJ20kOI74SrPoe1vjKBQ2mwWWYC6iG8V2P5P093LNZI7E/ocRPFxLR/jY76kFAd05HlDMyDp2dbJ
RZUkMPd7+azjBkP2V+SzGjhtSGPxo01jLjBy0N+ssg06/+h5U3JMOP0hGHRPKlzGJZ8dQkE5mmH7
fHk7Nz/O/7jSFzfiDDVmdYXf1FB/Qdwz40dG3qn0rIzRYEvUelRwqG4E41h02HLma/L70ezNA5Q6
jumy6VAi8oMixDJpjMmIN0m4J4r/Kd6b0M9b6FheLEWoOO63/9qP5l/5Ep93anSISbRrS66aB4kW
4UnvoUNdjJv5vOHY8Z/iyFCduXkHKXAfj5MSu49N2Gi5+4srDsAceMyB2bF7SBD12rLvkvXdO0Eg
+YLgBBNfnNn1uaqZvgCAp5p18aCNurjGF2WPhu8lXYxLXhI7vxXeRAIfwsHpBuMekR28pb6Bt71B
RQUtfV6Uc3kwzCBUAOrzjPYWMGyIqKBpgVggz587gCB4cOCylfxjCUwjjuTrxzjvlVJIgc7KMvFX
r6kIkdghkSUijOal7pONTnBsWks+9GHimyqVM/dB2xk2RYytLeElGdf/rboF3eF2tJDKMV+80NMh
oj3Ag6/bGynJYsaU/HBCVzV1PclbHxd8j8bL5Ex98u57Ogv0fCR/Ml0ZPOh0gP2dVcvKo5/KL+uU
ipmzTF9OBSgQrXEEHyuK3n4AoujQhr/B/GUHHPTPct47Qds8oVzasjaDEcDIbwZlowpik3Ye1EMW
lJKYvCCbqi4BicqmcdsBBYVfBTR277BUQzFWdSgjwWMR/pqPMoT5dXlOy1+stRb5BLF+Gb4uYJjt
uO+37r8KQJ4aLTVatxLuGF28N6JoN+4D+Wck+1vTYjQV82pJYCk9BvLDM9birmbzCFI4coVCu9T3
vHJJx57xGxUD3uppAvammvvK+bbCn1mQROhZchtkHRqXxcsDKifuaggkAoXmS06D7/bdN/cqP79V
7v035GJU0SuY5L7mDMtOaY6/GujLNDlIj3aLiwVs0BAmzQzmKqMkz/rGgCdRXgs/iKsqoL4kFrpH
M14PXY25Vf9x4Y3k0I657X0SSECMJD3vs29x5GF2qQDXrogZUXWXtJI2NqjTiOqwFF5q3zHVKBJj
4oK0TTDrVoDXE69kzePe5oouBhKiaqJtWCZslSJKQ3WxL/FEe5wV+gYwQ6PQD45DoSAFblY96c5z
HwwQfBF9xcy+f730ehTgzDdRKWQ7egGGeEeJK8+8xTo/lqaVXfLLzHIkcMum09AjMy6mw1PszFHN
CezPpDSiWafAzNQ+v+XCt0CowFnQL0A2O6Y/b6BOLZh0iEfyXLmVg34HicTAwptCI8T32q04PZVD
zI7IhSHA6EatMEFZG8zmNTib5uR3qVvXPSMFKOzo/bWd3WHuw5dL7Abo39H+P6ISXwfIXD7v30iN
1BpmSJTyYr0FHd2NpG1/SxYChzVFKFWadmpyUpoMZqFUM4riihux8HDxXB3HXik3u7DBUGsDFjRY
4lX7f7gcx51HBRfL05ZyNHk30IZPj+DdyctkfoNBo3gMg3AJeEWiGpE8R7T+I4z2voyLhDuRaHY7
XLKfFYjU8JXTTBZHsmDjdePrOTMAa5NujdSQvPKyhoIkXuZBR2cEIyIjJNyLbx/9JqghG7yoFUWK
DvgT8WMFlQ2adI4OkfNw/YVnszr5sZy68tdOq8Jn1UkZf5MA46q/t03CITLlzfTPIg8ef+thY1F5
DicBJDgQZArNho7af/ChntyeI/9eFINnS/3J5i6i4KQMYq3vXB0y51I6vYGGHKwufR03u1Eliz5F
LWcY6UOpkL6+RQaZdVFbAAqyFtI7ZRiZZsa/NgsuGUDCqvF3P7/3RaREqCPF9pEG9uVAz4P2W9uk
rXs7+EBJtyTIvQ09mL/R8R1lyTxexMDSgxdNL0I2ChSMFq3N9K8jzhMo05FTUCVxX3yuCxsZGhUZ
I4hBFzINZaW0xnqyUCm7O93dlJV9MwNLg0G1aKo0zRQcW3SUljfUw/96rZLEo7t8k/SjJjvJ3zl2
XBu1bM4Fl8QeJ5d3561VG9a5bgDgKV2DpDGIOLRkzyQvmdK9qZLAT5G02pOZI1f5oGnsNYNssiPe
5JHDt/BCsEijzDcGcMIy9h5g2BOMiZAcynVieOHgFHAg8rYIb+WLrZR1fg9lej48D+VIe+yRtaqc
N9lST1n6DzhpTNGtRMfNvw5j+HIL4b0oBxDF94rbvnyaFgeR0RRXMqTJxY53+NK4WKHe2NfCZKfk
Y/eQAV47SAf1YvAyxqAKwxQ4D5RQdoe04nBDIraRz1D7E3mZTU/1OOH4EofgYJJIfVIxcu9+fej1
RSvFDF57SAzowA6CWP/WNXIq9BM0YOHybwxd1tGFsbD4Qs6oN0eomxsCQ/8H84ILrIV9K+B0rNwS
8efrd74uC7Iww/X6S5BDdWfLzPBXi4RSEgWyIqGC77Dn3m28vp77sHMFtpbwrzJRSvzh5iptTfkF
zKuS6oivfbafAbnnsWUmTFUKvlvKtvOxfcGniKC/RwZO7kzii4BTnzMyT/PuuYWFoKkX30pgy6nA
8KDT4/gI+GKqZdI9iacM5e2ikEpeYNZvlzhYmPiE02Gy8HUC/LPJzq3kbWWnZmUn8Dv1jf8Z/0p0
vgn+4nyAjX/e2Fg8dX8DKoZgchtF6JnLJnSZDxVwmVDkEehljjsfBJPLvy9L4ACAsbj1wqizNfzA
wf5f4N33tYdmbsQeK1mzy/kK/vc0a4WjZ1JsKDV9jOvcxMlttZ5BATUaHn8JN+3OBgWG2ilrYnPX
s4w/N6NGgeyTcI5HdpohZUS33Ys4LHo8D9fNzXZSmfeMJ/rbq3YTsa37MZliYWR1aULurCl6y0T5
YKkPK6+suQk1ZGwN9mF9gvx0mEtP4Hhf7vnWqG47Ra9QIhMNrHnZWtdsV1vmoduzKsQXcpzKKQqB
i8q8b1ux3pZ9FyrkLGQo7g87U4Q3uaPf8Qr1YAcR2r7muv3xmde11C6ej/Egp3tU22Xdw+2DAB86
IYU/CA5iyDaZJYkAwQZUD7Zbn4fhiMcW0KwsKa208Q0jc1b78kvTMUm10E6P7jT42PUv0kR8pzmb
f1q4onT23kxNWrVTOoYKe8YR1Wyhvt9/IoPBcL8+/H6YQSO6sYcOg9Cj+lp2V7vMSiE5A3Ezt7+R
wiRHKZFa5Crm3/nRq8hmoFi3JbJaRO1jE1pET0eHJTUM2tVsgAFc20BZO553XuUjMQBb6ZW4vE/J
GTfrM/qFlIkvkX8W3FCDP3382/+PTNfOaQY95UzVvtqMfOm6BiKYDOk74CmCwgDVT6LpFMUG+f7v
XN85gcrzCdUcRJ3ZojE7owrqOThRr97BfeRX8BDvBm7YNdY/2F1b8BaK17Gfbh34cSoOjkJixri+
bmD7mr+IFhKJn9iK3IMxxdFTAsSFbIp5a7sINEvUUaV1n4WcqYY/r2h3ufs0luj3yi+DG1s77OMa
g3YITq4jm454RFIMBJR0usdpfvt65mWTA4VCFTK2YEuytSrxsObegyll4iqGWhdfgGYTilgQhX/y
hShtbOTbLwUK6oK6APjmKl+ODmhDX7bJWQ6lAUWdrQ5eYSKLGNk4Uk6XNEm9CuFhcUMzzEHDn63a
Kwzq+1mxmFcQ1foKmH/+8YoZg5yMBBk7PCYSdVACGRHCEssknot9xIa2gaJMJyzj/5SCFAdVc1gY
sCA+XoEG/ZdsgKVDkALAsGRWY9pCgtPo0JsL8yiLXpE1FliMBZQod2O31BGfZvVq80Bp+pCpR88F
nptNfmXuhI2W986//ZcCL2Yz7av+RqwBhzJ3F9L8W1dj9CyCgH8M+JFwrSRNhIr7uYZK3o5JKTxD
WM2LvLxMkJU0JjJlJ2jFVPI0Kwz6TloAtinXcjRE5ZGfwfgcHRqEiy917d24Des8IQLTe6YdmYhb
dtllNKOJSEhfDvMteH7QXOrVUPZCFvh0ZSGQTGwZLb1fJG9pNC/5jH+B79FRlRVVO3w9BZZ4sPZk
tDD0E9m4lQBxGoGFeQoy6+QlvP9dAejurOO7qTU3s+b5RnStlWjSy10TbJUcF1O3u3Gs0NjSDto4
Hw+v41UPcGVPxg/9X5h7ftltY0nrVD7wMIgnCVuaWSFVi1S8kkiBtxjUQVqoEeQTlsEpLESBDoWz
da431y2DH1CPO8BJA2weCaZPegHdp/AwaM92SFBdG4a7OMaRgZbRoNgbp1DPqQtbyuQMKDe1wymD
zx5X+OQqhLgDlefwkt4i0/NFQJwgrdokNV8kR8Dd50fIetu+z8WIL7ewe/k/nHX+FzaUjgyyjNU3
gt0YTJaAzSkEO7jhtteiN5mieG2Ulbhh0Hpse8Mjib2bgBdX8edI2vNUrFzvyh4P30L+sN5boVWF
njP3KVGgQgKo8I2Nruhgw09ep/tvnAb0bz3oDGinhT9M3CWp1g1HsDdkGrthe3mz41xp5rjAf+SP
5Nuj832bT2G5yEyqoLXwBKxBPAg4Hlg2qhRE+Zp3AjC5qqr/dtQtnzUDootMcQ19Q9OHOYYbYZOO
mr2eocYMQgnT7Mx8FSM8HFRGztCW9xi1sFUAZWJ5xKK76hNkDj4I/+adsWa73sDqZxVPMoZGt+NH
qCLHzLyV/3eXo+wKP/8ya+fmnsjGtSramrumKH62m8/+zB//IYz+jYS1+DowVuuV3uorpDM/lOuv
0ZxYrJ2NXsc7SxJ2yU2of0oR6k1PcaPOU/qTRuuxcMxHakWavg0AwArMC1Nj2M2K6aj9QdbjeE8Z
JxIrhy2+/kUlJFElQPDAx2aVAA4zE2zAlsDNuXe7YHJKiFDZB7NIOkElkM0g1HikJfEjdclxP9jv
B41sHyKEIDFSej1GxzwflM/Hsqg8Uzn9cCQzRkzv/PB9ZdwGlSMh7MppYiB+e4rpMCoZ8ubxnZma
6S/aD9LaSd72BYb9GoIHSk0lkyRWkuM6xOcEWiTGBoLRHz/n3i/H5zp6vwtmmpcdCUMoHRa4N94T
MqH7Q/KTMHeCpDCTs54/lKSO2NsllGF8N1Wzdh39jxPLMVvAU5OiOTBTKyK5nuNMDxVrRfjPWgD8
P83+BGE2gNu3hqEY6CMRdFOyEyJSyGI8CoG5yMf5T9BBR7S3dFAqsjzMpy2XscWK7LTKXFncemSh
lb6YUqpiZtz8BGjARKZ3FogjQk3TFN6hA+9p2ovSbxsd56ROypwfkAffgdGLdsLdSEYERdUARkTB
0hyjrcp0mYm2z9DhJ5qX8xQk3DhI70hKFfP0kRf635cCOn800uh9XR/jCjXQet0LkZV1MLFyko0K
IUOtAjRg+0DCRwxKZdUzi5BvZg0+QiBF7lUd3Lsh2ozFpZJ+sUO+oQ4v+wNWp55vUfRULM0MX2jA
IkNmi9uxkFXKlGmI5D3Krl81OxXl1jpizqgh+AbYTC/wVi8p+CP10uUNuSQmkQ1hxWVD2RBCzJS9
TuPTA//dWv+QfxlRXCQ+9wVQRz2EdsSyTAYK5xJeui0i4IV9uLs7AT1EXPgKFp1ey5E6+fvu9O2e
vGC4Imt7KaRW8RtekAWVphTSPstW6P+H50kT4JfiPzWuzAYR7FbqFaOfKNo1XjiddRzHvqH/eSFy
0H7jfXaK9dGWo4KwV66vc9osg8e2psnv6pFLt7x4Fi870B4OjPVYSjP5fOYawKI7rFowZi7eNLiK
KaZH97vI8Lqi8+t4zdnY1JrqdIsAYbfnWhcQbGYaNl97wdAZIhMPmu9Usyv/gJvex1/U+9qGG/mC
Lcg9LeGh6N2o/dOf50RTiQ+twTq3vWg9+UpEmLrmpO6WewOfZq1LlZXwIOzRcHou8p4fdPEzpTCN
rH/UvBW/aTDMsxSnkGlhuNH2QB4eFKG4+IF9ngGodBLEodKZLts85fdcEpfuxcDFETg6X6YuVBBv
NWfq4C29Bg5qzINE+l/s8QaVb+pk9oDeN1AXGDSwmJn6B1WlHC+mrY5IQgJYFqHEnibxG6mIWdEI
6KakLhp2vpzX1n2bHoV/VCUSlcFJbwsjyDWqmK/zXb4xbZQk/9rlG81X0HtSlF/c4VNSR6CEysEm
oayH/mOLO++c3SykCKH+p7WRypw+AuCCyDicrZbPvDPosrju4NKRzOmYZaUb4s9mlB0hGQTZPGFW
qyfuX3/OckxG9UekNutCBgAbrOFXRoyNwzSylXzJQ7tWdb5SKICnOcP5Px9LkQgJpWlzJRT9966F
FyEzy22PkDIFp8WzgSc81JdaXlk4vAoPzSmrQCScK+JapenKwhvG49VV+CtgQytdYdkZzUucW27E
j7OzRNCQCeK4SpDDj6jBTxPMhEW0l9WZHod949D4b+kHWBC5+pjtLh5urqiNAsheQ0y8XGYkSBfY
gkJITuw7ypIcOGGH2w48RvurdgaqY4DFA+gEl7nTvE6ygmEVwsIEW3TulWkntHjPMgQB3TEARMVS
mGLyf3KZvIIS9um9xAu0DPqh2t3006Fqf+78D4wfUxRWTWcxfPmWYirOFHvw/R0/GiN9jbGaTvX6
L7NmNl1x7Nwrli0KAggTdJ6dEXu1vzJGKn3njmU8DVNFhxYfqT9BWindU1jOSZ8Xtoi25hJs1531
1Ni1pYHy/l6K5sO9NzrkZTXL4lns0WwunWa1EZge+iLj2Ee6y6OU9N96jlJ3Bl17yRuXZQRTJawF
GI7IWsQv5X5iloKjlMMGRZofwjfDj2FkXj8o53FLunD5YuleaO1wDf0dTt5HbhlmahxWnHovFdIC
1rc9s02YNBwgK3fCHC62muvb4JPtcxmOKMn7yV3zAK1KpxqTpRO/8pR7uGn2lWXPXsPXf6jWok86
3fmbmd5SE1PF7h5XaFN9fYE/EzTdfbXgKrsrLUAcz9syoaT2HDA63mZbHWdzki6asGCNehE+fiKY
DOvFdh8Da7spEniJtKWTfP5ENTafkeintlEgkbZOnc0wN4jiyRZtXUP/X8sn7e11uP6vLjqFOiZY
3X8ybp70sPVOT8B50jKcZboV9qA1IvKR2nw4eQ7NSmYAnjSvoAKtxe3UOof4U6/X1dijT9FUQLfQ
2iM1bsH6KJcw5CXCrUvNj8w5xkgQi++3wGYROs3JnmTXX//rc5RT9IwtqteniW6bh+WfhSeST0aU
xu1ecVImLxsQ+9g+hRzUB9Ts2yL/9TPk6Wd7buaPiqWZ9N94RpKCvXfhsSkQcyuq1/QdtHHjiUWs
upBHsCG/bQpIc0lUj2sTn/KB8GvSuCK6kk41dDtoko7mybzAehpkkZAkBGsyF/2ry0jdHUB6MMGM
GM1iaGxD+MvsE8kc92cSaekzRgMBh0EMFnYC6M9itrYNyyVv2Rfz+S4YtePAb6bdxqlf3qmXyKyM
G4FPJgn6bITK1csZULZtMDglKUPhOL/L4yWzSLajGrTpFxIwjcyJ4kM+EH0LbfP9kxrWUvIaUiBQ
GKpKm7CtfSYI/KG/vuYGD3tFl0EM/PxcfURK7n9Rd9mxWMPg46ANJ8eUDFtY3NLmJVf10I9hiwMm
azL7r1udA/cMupQ5ZPRxG9ea7XtvDk4wnyZpiBdPA78XMi8e47Klj3RJMps+uMSdD3Z2pHTP0NNQ
StxJIsMOVKfhVpsJD4huwPIpbTHF8JItVE9ODhwWsQwysQTcCjDmF1UTKb5tjbip+shrJ6iyZr0z
59UQW1mfcWHUP5Lf9akvQ4hsgFeKOHKPWDg2+GzWxkwSuVkB+I/RHdbR+H5ZnwC0o/zLfSmnUoEO
IsOBLI4/eBh0IAnIlKUa9PuwSdtVopNCvt+oSP8us4Nz8u1iccQQX/Ver3EbEP8NjYfL1ae1F4nl
8arN7b9r24MxNkMPACixlf2f3QNZRkUHyaNVdsNizEQ121qPSpfOQ6gTcjBbAJchvO4b+OFbxS31
RRC1Lz65LDICsZwycy28NNnIVcrcnMlpylrrYS8iduclU9lMf6aTVi92vuCwOghTzaDbrPbl6aIw
Y7XACNqUA01gYMxizU2T7ZWBEkwE0DUDVYCVwQmF+Ezcy44gqiWttpLZpS7f/oqJ5wpwv0VS9vGY
teq1+2xlMDmRkolPOt5kImasVlDGyxx4FtF+0OM3jSnMUwMtKsJKdPEL7TfVjGqFXeGCAh0pNjLX
8NirpsIojg/Pl49CYfT4G9vZLiGL3PKhGZVOe+8BzTq/NJVZZnwFiz75Bb9kndclo7nZXG8XGdvs
8tY6o2NmPFNXK9jV/oJ6Xo96aQdDKo1if+ye4i0bS/jk9T9ffzoDvwiFGKXuVVYxCtdqaWl6JiUP
asIW0avH7HlNqWh6/ZWShnXem/80g51PSm9g7ABMElhWfSDpD5Hd+H6m4wuZFeRFprLtTE2zy1gx
DS9J01xvKXmzlvFkSuJQGMEeVifjJeCMYF7RidvNPwB1Wq2OsYHjGjWtxtiyskSVstXSp/WoO+F/
1OHsu+VqxRkrdHI3vI1JwNCXNLDoBkOubr43pkDtjbJp6i7Vo2d48blx6K7hNWolHQLXc/ggj+1i
nSAXKZEf2W/0IIDfwbCqQb7lHdbX6r+uioGb6EboJd3gM1REYHi2csN0qMTjx8/oHvNtgamJTd5O
BIAr13RiyB9x1xLMGa7zE2TEXQPut8fhHBsZlQYMFBY16LbOWF27lVZBoQlo1QwzQB85llLRyKEK
Gbgh2n7ibvfHk/czYQ8Ti1btkR43WA0e7IRxoWTxTgVHl9Nvm5duC47YIMiGMmSFN6PfPbjoWGGx
zzOCkinzip3BTec7aNslPYxz8ksmIWFKyGX5FbMzHlTY5TDcF+gk3sfJRaE5jiBfZgewK81EtjPh
J+IQtoui/hizT4h4wK0s6tvZ9zzPgwRgU+tin+3crM5KR6zKJMePtcEUrixFMSDWLpNInLg7xqek
sHBJ0dV0caC/osfhC3XM0vpV2xc/LDA7MYFzl/TNn+GXHtzBhFccwWs2lIrThR8MY0Vh+YPnbIWx
fhnI9x71qoz7Uewl2nQTC4iQf/e6XC82/Cl1Om4Jpk7gHbjGZ8138NpyZSJYDSTRKBAvPBbe1BsD
0dHJoWQBIB3724wf5X2Yz6HbKMiU1xoOuCZgSRRavPKpViTJPM5vfH6vKrnYTzHFnimOJ6wazixj
w+SQPgjF3veyC0YLy0g2RQ0xuYlCwYv71Ryl1KelSZdqK27NPyNVaXriFzIKLbnq/yjX043wHA9/
/3wIIjBTymfnuOBuvovympGre3DipJB9+pdyPqVYmxUJa8v36XWVR6vaiu7TUWrFIKUnROtMwp0n
XOVshaIAR3siRqLObteP0PLiGbSZoPeMUw0hJEZSIegYI1LmBjy0zy14eZHBcEdRzFHcfgpvFnBG
xaYulmA1TDfAPhqSYG58B8zwzNTCwYT3iHeQ3P7sCgXwTA4/WA4hIPKtrYFufOD1RbxjyEQ/tTFo
61myAQrRBaSB9mJRboICnyQ0MIWIeyqV5nix8MUWPgnFz0pA/wpJTQpTYRFhDUYds+y9i0KY2H7d
FdnXbVdAVREf10Cdrr28DomIm2y7EStgDRjec7Vs9NKlTcme0tGma9AyvFO21QqaQD9ByqQaeL0x
wI84cQa8Jq5n4glkF37Roy6TO/t5usJ8k0DhMVIfUG91k2th9ZdqMGGLjANBv5eLZJ97vBJKUsgC
M/oISWNqbyAXiUs33YyLKzUjgMBjkMyvvV/5j9mry6O1ZwL26/GQyEFie4WXpZrQo1HhAGEAbCdA
cng5vdBCvDtxcq9fruP20oahD87CQig7iimZekrbYKdsSwkwVx3+3EbmSomOXzDPlKgoIw4QgaOR
/R3o7FtXP8voki7tLA0MyiuA1nwjGqpy6EXeqTvL8C6+/5CusZogEktJ4SephertdcK7uVb2RN2I
YfW8YoUQJbMwpevHWdAWFzBDHXjLV29cvNnvBktwCrWRWMSP/Z25mfsOmGeJ1q5GpCVhHJDG0YeJ
cUsH8Snnn6gWk5BziJZpkPpXfNJ5ix6rA9JGbJ9c+750eIH1dyXcPB676CIHXIZqBn8e3GmKWxJ4
gjEXmkfsbljX9B4cUaArM5E6S4kBncsj7sgbk/u/YfQzcPz+qw1NS1IhabIEtqO888cAgQ1fKvdX
e0LNnCMSz9NTqK4PeyFmHzt/QGcLKtqkIYovWLI7+2yZF8nbQ9S/PWcEMDrJQe1pTDCQqRJZYNOr
5fLduGYmXEYW+0Ge8fbojJWKY0eCLZz1VEfshfXjfwInnRUZiSM5qJwSm7Ec2Wy2gxfPdFN1l5LI
wzGolE9xsB9xIkgJ1+4qW75FOFPTyWIIVb/w520EQHHBZDPfORCJvu8pa1grlSGbmidCfEZIuF+Y
NHXHPADiGpxFz8jFq63mVqipxecujpgSt2pvXHp9+DT2VsAVavrvlwwZodGvJZPcfKAXRDk1B7bN
GXMLB1If+DLJNs2NPIdjEQJA1aLpFzMrc82hDgw/PU90FCoGKze3kVdK+p2efl7rB3HIoJImIoi4
0rEwGOSoIYQq74Rbgem4RTrWDUax2oNlyn6kLIv9yCa+0UwYwlGm2sED2xQuygyxosPxNC6pY5L9
k/Zf7/VlQ7Mxtnf8L5QZlSA6zIRVJrrEdROedRW62z7lqlp84ypvxTjF/6s3f8nxRrSeCRvL8WEB
/6MPMHPo4e12es0mP14OfiaxKZea5E8h6IybeFbhKLQ1gzlZxwJlm2yR56HEy5ky/3OzCzvzv6kx
RcEHf8ur8UK3q7ikyiKn02Q5rD6Osk6jCaiBeUY43N1dRWh9er1hW1o7tvWJqEMigOpXngb+fJK1
68Xm8/bOVWSUMHeZm4DYWcquZ7Oh9NF8z7ovUvsocECnzMuOOMwiNrG/3wdotHxzBLUhhlEuh3zI
YXJJ0fniug2W7orYsIY7lNHr1Oy5gyq8inefgBh+7ICbaPyVvQ8TsC3r8k5gkhriEoQT9+A+bmL9
kjFsnB7Xt5nEd205g35SHUV9o7ytl0Cn3ZoA9Efb+lWF9h01D8EAXYCgAI+9WtwpJ5kI5dFRXk3Q
bSc2ILIyqi710wKd+3HmyzoMN3rfFsiB8Z4YdzdWn/we4A+2kJ2hu/gy6eyK9h5waWJVIIXHOKTy
TTEFEYgXw3Kfp3TAY82UPSEWIP0YEtYnXMRZmLtmFhG0YIxwn53MsuO5p3VeEn0FowHUSdpfuW+p
WrgTXtwrnRKfV+xmLrwjDVNEda8zZ8MSLl34TvPUREElY45NB+v5XhsadiJAWRTwHZglzYrHj7cH
CTfqwfUprbh8grAA4BwwlY5Moc3ik5PB9T8BBuecv5Ed8FnJacJt3lUq+x/UbNPxHbyEkYc8NTam
JLbd65ESK5SRVqiZLVNsgY/ndraTAerWcHlqznL6WozYiytAITxrLzWYk6IuhCrf8NDEpdGQgXju
gTKnRIYo5zw4oF2baFu7wq2xYjf0yiMo6i3eLZTuJeQ3QSNZZOzSunwHNfb0g7JzD6DNl8NSV2kv
c5GkkMIYyg7xP63IgjwC+Vr4uTGargOYjjDGgIyvkotlYnn1UhZCR8gYYllZwql60/sHeny0/j2Q
PlvaOHFAUAdmfMwcyEbspK/2vNZcoZVwFjANAVJLCE77E+NRQJ8NtNvo4cUoP/hlvpOrpufV65Ir
JivWBSomGN5XGzXcATEEJOFZAbve0PzulVs841mhenjmCpm+TnwPG+yYvdP7J0YuzlSdWrYAjxp+
/zmvtLIbohhB+pdC1yL1JTmDJmNX3X13f+SsYQmNlapq43IuqHNPAuQD23IpDC929bLZJdZbuCwE
GsFNI98mwC3ZAUBMqkuhN/QZphy6AJgtftSgFPke9iefTvYWcaM8dFp6Xd2mu+WvrKexaacThdBx
bXrngjdrjt1ty4//fnKxkcol5gLaPQ+GamIS88w4INO8fKcQngRtZ/kP8+2BUyVxQ+dfyc3gVzsK
KlWZf3ibOtGZyW5vBRZhMW2jgmlNjpDX6F1WVr7NRlZH9j79yenhpMAweWB4zlsXnF0o0FWTXLpV
ImzDE/WZAFSGSSrR+R/fxsHCI9owLd7CoJ7iGd5z6JOhGRivRyqznc0CQFq+5xYYx0ScS0+uE0IK
TMwjH4cf1c9+gXOpt+oI+Gytk4hP2fonSy4FTQ8n1LECqY3mhi/rSuDk2B1naaCWyXDHTlySlSAB
SrJth90O2jfp4/J7l85fxzmsZXJRPJXMOMrE/iie3qtsiJTRKi+BPxx3IqEsQNtTtlOitPY3FrgL
WdqtxCBjADtlL/w+FkrBhxUS6oLmQmR6G0hCOeqTCdrCjZoNkqPbjGXYgieATZ1ol1Mv63W8CsXL
HU5VLYEwt94HTXUaC5xuUVgStVaO+Dzon92k+Gq1YrAUpxzJIJ5qB45GkujK/JyC0QfWS97VPleu
jx6eqEZfQGRIYcll8uchewwYgwF4HaZG9bktQGAmB9wpUkF6Rgol3RBnAaHS9EAgIjzhUl0PF6XQ
Xh0680gV3HEgOA0qeNvYv0RdvjBxFPPpItbtI40JDHnJMHmog3Ue0Bp9iN6xk+DjWsiNBCDxW75D
FIq4BY5EkVIJNgN4u8ExfWck0dDCH8S4hQbYJtUKrCIG7Uu+WdoFnCpKSAgVelYl+AF5mwRiOv0j
fZXW3J5AQol9wew78I5qcscLZ/uULRAcSqRLT6+ifEam0qsN2lj8bhEQ8j5/WzFZBUm1StwnGC/y
tHL83iLLBVuCSA/3RCUUTQqurIqN+TH3+MxB62En/wDEA87twrLvfmaDLKCzhBR+AQAYOmInH/0R
WQnQqezgksD9foMvG1mQXPc7//jr2bnGOZchWTF0SoXg2sRIXN30jncJJHbcpmrfE/6Ksd9XmvSy
Kx0P50UJ6CGIAZJLKmutpX4AV+/qyRc4Y0a4UdyG0GjMQDlYENGLyHOt5NxIo4eOIQSxKZWIbIaS
02D6semhKa7PVxWrMKq7d6iVnU8whDPPUkQtN1B5Mu7fJwX0IiEmluowKEgh4eNpTno8vpPA5xyK
yu6r1eH1YM1oNkgKT5fM4YUJgNSBQ3SjnT2UvLvec+ssADgwkPXjJ/s2C4ghMXJdxKgfz0lr0YK1
lxaKGGFE0ZHrdyFuKtY/hGTfwLOu0aAAcIy7JmjkyPB3i7pKzWDHlrXsXHsnTZ/D+wNXw813nyuJ
qv7a8V621WBYqN3dwIHyc82ml8xY/ib59oLINW2iTryWRpp9kqizBY2jlNj+Yl69zmMi2oAxFZrS
83JJ61DS+11mjyXN7Q9OGkm5F9SVmmN/Ul6k9KLX54tv5hbmlBCLrbwZDMYcZZsG5nUJ2D1Zc/qQ
MsMwuPQpsxuS2dhlRR2j5R+PTZWcxK2ZO1azxUGHYaD/+xbzCH3KzakUhFxw/sW/O6jdtFb+Hgfc
z+rLL7+Z5dV8rvLEm2Lb1AotImHOpzVhiWi12pmTYiJ6/SEU7kKOn7Qwe1/HSgagF14tVy9mryiR
yV0LmjAKbJYeCMxSql1E/kBRbkEGUQC2hCfcrR101Zbxk03yIOjP7knm5gl0UZMN23KoDt6hRrVv
7HTUkY6kRyOM4t5i9u4kYhtKKZG8iIKz4NZUd4/a9uQTJKWCIZIhCBtUazhM5MYYE9DjauMaBPZV
bbtPTxQt16EkQ81siYoi5ffE8+p/B1EyafmNO2X/Lh/Gz6TkIz4uee6ZJ3DSN6YDug9KKJC6Oin4
LuLsTZuFrn24gic+PJYDKnJcCbo16bRZTP85kkv/54iSe9T6wrOZ0bw7W8UB82eTmDUxsJt2UNLy
Ikr/sbQUyYYNQA8Zcw1c1LWcQ6fZ6ZPMIsuj0aDbY/SvecD+Bujozv0Ael0S1vODfs58vSQRkbQ6
KeGyJuvE7z2UFh7gM7AqHcfKQJDKPG7SyWR8eyZU16siJoqF0vCYIf1TMmWKC4l4JW7SUgkjA5nP
MeH06HSTUtf6xrScQV8g02gmanmOwQQMXRcbTPwhoyOYmqcJl+YJ5jNtWxC3W51kwSf/mdJIgz2J
VKRNuqRHdIy/lHwt5KV8PZkXJVjBImPj9iaZTAouqLx7YFNPAmMRs56fkHNw14FA+6UA5oXjSQI9
qSXN3djGJuN505gJ2k7FvbrL7L2wQqqcCOKFrc2Pigc00rtnjU8EXrTr6VkrZj8mw169VR6MsIp/
/JOZ1+J7nkF0KNLO92BVu+BSNAleDBO3WgjcMwjyjXpVOFRyOV8+kST5bydIUNT8Jkj/aqbP+5t+
vSuV/Y5DIzimoG6pjUE661+LHS+V3yCpjrox104zfNl9p0RCRkofTtv9GB6FOrN9gpwNaGI50h3a
/+La6PRK0JdcnDXGwfsutdFxbGCLwWgoJqQRb2AnDeiAlsgBoGf46c2/50JA9VOCXT98Ar8PaKTq
wsY0caXE8nlfU+ceYf/EMNa0y63zaXw98BHIdmdIEfl9XVM4tMZBHEgYbYMeup8aqtrccQk/vARL
EuTQswRKWhLT9tLLBolxuOBbGJqdDOJndy7/PtxOykz45LM4DuXRvw88qEgHRLwo834kcaKdn83s
DX8KRurrniyGxz505UGzSnP7Rtwf/I8N5eUl1O6CS1bTjk7FCsJzv4eIGfWdMBKwH8jSgZWC81Lu
HDQTJ+STZTU+yolNKphRh2X+dyp8l+3krWIjeK4uZXgGQi/0x8wq+g4AjtABPms+474u25/uSn9o
KuqhOCsxv07hRc0g2kx5NqfO7SH2K6yaXc4NsL6+kXKF43LXGXCZ/sIETGoqTX3rVX7lM3D1SxxS
hByppQlAXuChbhh2rAgdisVyPUxZ6PzqZtqS+VyAvnDTOZ68pqR8YQuJL190141vuJ49eExJylCT
wCnvaSN2yi6OCMqPKyKzpAuJWO8yD8BrHN17wVK7HELjybVFwTkZIh5/Z7M+D3sYOdXAHKaVL7t7
BCinRhH/xS4Fs7ZhsNkaplhkAM+UOM5GkBeqWZQtofNE6hpOXs+Km5OtfznM8EOadBSuzebjs4xy
gGXa6HKo2B6tBe/eBMUdJOCTm43e0P46pwSioiTTtOUSgnh4MN/CoXNWe+yJ/EkweQOumLUTL72n
9BtNm18a8/QPywd1Kf/bQ/xzqUCLzgav8o+rlGpi9PKQ0/fBsxQC+bUDBcWqrd7IjOI6PBgWnOG5
cQ1crmOVdc8isffaIE5BzCfxJPpm+vEYWQ8No+HqiKrcYp++IrLVUhWuLEiNYRFLevuVvFiE/kLV
aU0Q4zjZgWQx3mOqt0egYBYAqLbCUmGvYX6WRcJwgw2TJ1lsRHTo3179+mGkYBV+1ANcVWQRyS00
PqyA9NL5AXbLh8iekaBzNDlyxdcqtOBB6944rhrAjmkgCa8MgdM2nUd79EYd4sG1vLuNFckiFK4a
fY2Hy1RI3vuxO1p0srnUklLDB5vGfU7Q4Duh0IL3Cdb01aiF4RC/oIwmZRqzWF7wAze5V+LalA+u
2IDyPtyhuZ7gs8mAg1fwld1xzUR8sz0u46J/dE5AmtgbQHSg4GG0u0+VgbaDt/GT5pd6HzFtyDwp
yGzQWsTnRVIPvKW+k0Mq8cFnbgjUjh1k9LInGcZvg/RCD1AkfZs6Nw6n+lyQ2OUR7V01OIOz6IMW
nwf3wLbwyNbVX47An4TqYYpDRNYM6ZdUq7rJVYbVVXB4aCiiep8y50lJYZuc61E/Kz3x7+QWavb2
SXqKRx2uPsoMjw3nAY9LpkaOsfOrPXeBZuKfrNsURlsA0khAi2tyvk1qcvboQorEFb8lQz/GMEL2
wt3NX6AFMyOkVMi8iTEy7inGk/Khg6X9TlESE33zXEnDxO0X+WFNzcpNaBw+4+j7IziEwrl0SSgZ
ibWGSOU4XEmu4V5jZT0N6Fgk4G3sLRK8jZNLThUgoJz2grqFhjr/VXYpRjGqOObKPgI6OyaPbbtQ
+Sqi4yj7Uxgw8Cm/avpVK9o3enTdx8jEwpY13G8QWPEF/951GIZW0/fJnP9reAZqUwyRfCMgETaK
IG2YOPRn/UX21+j4SwQj6PoN4xFaKlDOn+xhCvnzKib3U0GCNa8QaCgmywLfKY52Udl2WV7aiv2V
Fic1JAd+5LbpC/X55EF3uNuxWXVwwK/urckVeVv66i8jsOg1X2oXeN67SgwRCzwkJ3gWCmbgnPWy
FRjSMkxAztomsIwknJGG8L12SBBXKcTIE7SQkIaAQkP10sBkezerLfJiouLfb3a7acmqPRR4SW8b
usERu98IARR4GoIVwk7z9UezyG43DmFajOPLkoeGZ8R7yhT6KgFUu3G63UjvlwQFWv7c1vnf5Cz9
k+7hPETBePgtSawgXdBdgham6a3BHC2Ah4g2QZSqjn7Xs7iDlYRC2qSBzAnUW8K3jHQ/mRw+OTOK
5+5y9LeDf/lbd6BrpwfvMBI7UkBmkEplabrRwasKv/VCX/4FUZ9/Wao/AzpEPQuNCVii9WFc+IJq
quARzd1dcIcZ9d3hPbuxTo9JEokkSZo9At8zy/Z6sc/YKE1VS3vsrLeIM30arwf+AVSqvazaDRGL
ZSI/jHjjD5vKCxvUtaqbCl32bMIEGcP+dbd2O5eKCUD5VClch+v/KyxjEJMIMW3BOYflpVwfcg0S
QXViUA5nqy3ynOyQ5eXevVl0XqN5sP4VIogndOalmcbzBUhaPzO7/Xib24xG/2gC8Ev5yEzMM6MS
pKHoFS5gitEGdcYXyWhymeq6sPOgfPq0teAWvmwA5rJiLoeQj+t7TgQy+BTAp2Sbivh4MsGiOERG
9ucEKRLP15j900nZFws3kwjEPfrr6oatwhoZgLW/y4MZHcSbiBc9hGXDgiEpr6TJ5Hinrc+EQfHp
lrVqUuVaEmBxOk4YC73QO+di3dRQUmPrnDPKCojBKoEIkCWgU75rtLYZtxXDF/zD6onGiTBxvsK3
CV1H9DaQiAz0KdKFD38Ty6yPzXE4zNeUJ0YyD9Vo4hqirfFGAKOZFb/wa0hAMkA2i7IiMx9F1l57
qBVgNfB/8grzSCdYhUUdxJMjhKypbzaRzXywPeTOVxbH+mJYLUYOALtp5qaX2FfHF568lwVUyGga
JKlJmIf4mL2cZaWDa9qfVkoP5vmgznYOgWxMMlcO7ALdG/iHztnZs4HnlHpUkIllmYGWvCUax07C
EZxuXRr08S2Yte3qskz3S1vaQp0yfFEeLIbdnHqSXGvL1yzRZ32aSEk33f8YKTq3FHyEVUpNt/Ia
GNDHaOegFCWzmTHwohjkXfbsehLxO29irtSwycZVHjvAAQwJ8C57mOQ915FPtOZ92tbs9ugjozwq
YMdtmCqwBLpZkFZV72t80+qQosepTP54F5d55lqIDe8T48Ill4q4hFJMVP8wylD62tpoi+T8oQOi
1S7UnsALTvcMIw0aa+XeqU5paxPxDkF8PIr2Lue/WBsySMTYgCDL/qptFG/6NpMpsztu3qVddlEG
OJuQSdZi/7MZ9x35j3QSv/u4w6fu5pl2wO7oiiUGbPrsnghYD/0Wd2Ctg2vz4HFYwzhzoCYASdEa
hVlw05y/HdpD48bGrj1oli6TmB9p5of93OfGby7zShcGiVwh/TrQhmCPj7H5fjxyXepFKs1TzpiE
ae095VteZADSFYRYjzjG0OoIV0vkw0pJEIk8cTJeT/keLhA+TS2uotwRTtV3ratyaQ3IHBFjzRW/
FasaWaMbbMdzwgv/bE7xOwH5sCzl5IVIB2U5m5vq39i2r15i8cAFi5jAmQlGZ65Lehycfk5J1NqC
xkOPxBL78IxQC09QyeoF3Vu9+m+Eu6WB3kCg5ZRM2pcFJPoLKCVX133v/AIAqiMtMg1hVpbeNQLd
gg/VginkiGDRoxnAE25qS4AmNjGWp0cwRcXaEES2+sUXk4zp7w5gfb+cblZ0RExfeaYSM9LUeBH1
7yJ/USD/z3+xjvyeAukpKBDiZWmtwx4SZYXzBhc97760L4cG+YKOmW1+fxIey59WBEuE4WwV6qnD
Z7zG5rj16I6vPsYMrh0OQfwgQ42tb5XzQK962NloMnXDbsY/SWpbZxzxXjmwH6RbBOn8StQVBShv
ci9o+bAni6C3Stnifsm6p1JyocS+aMv4hHNgonfHwng+V+SCGINSR/1wJncdK5XGKWtV4JaXmoCo
HvXNc0Hv3ok0N5RfxB9PkVS0GdrnS8CpBCV9Vv+xjYrSyyvEoQf9zsPIe/qKswQAcR93NoKB4uyy
u4mcBfq0kQQ515vjlIfapwFGzEJlhehDVfL1M+v8JCFtGaqNHfvbkgJDRRArppVdUhqKDyYRiU9J
8rauewZXtDZerXAa960ziuafez2p5LmAyrgsLZCYBOqos3JPm83Bt6BCv+yTDSW4+jZuMVmt2/RI
HH7VxcB4TDZKJQXCzROpMaRi7ARsEM5NQungvqyru9KSRKX2d/uGwAJ2R47SXfOSWoYt0hA+Q/NX
6ir0OuV4iCiD6rC564acpnOiTaJRD2b0XGNOmcez5c0VkkUTxriEumI566AkB5+cGUYw2SXjpVSE
m4ssWyFSjWvqEv2v/S5hFoA+Uz3pAl1R64hXAH6hKMnGSNnyzlNN7Q+wZOVED6Viszy0Q76OJSB5
LUcfjw7XT2fM1GfKvYYmDWnl3JX1UI7kGqzSY+n0zIggmEoGN3cpwFtGbQ81BlnQoN/Zq8O2tUqe
Iy/67/xG2NN2hQ3+FHLBO3CGyGiROSLEdED5FCGIc/n6Dxj6kaaTE6I2Na0QpI126RqkbuqyneQW
efE1XD4G6/PmK6zJl88+kS3XdfNWL41C48251GrX8xbjcZxyDlioqfov5ytNdTnMyfmqdHMxp3V/
QAKNM1/BUWVyQ6fuYYyGao6mJfV9WgprQ3MoBjx/JYyk8vlWISOry+886VTgqmqXXVV7CUsaaevj
eMiwLXPHplmF2fv5G94swqcgOOEBf3IzGhbynQoO/YKOp9MMLa90hRNMnlU8iKy2AW17a1CzJynf
DuJ2TMcOYaFwtsjSXpWkmpOSSX7ytIwV/BKwCeZVWdwygKfN+V3HW8u9oWuR+ltL9f+eqN1C2fri
6zXSNqIptLiwB+dlsWYeGFiKSyMpw6XclSX/F6QMC1FA4GvItCyR7yxCAawHtsVUzL4ldSDc1Pfs
mT3m0qQ0l72VacsdWBHEtCbcGJKR8RZ+XIU7fv6GkloWu/ghimMZxrSyUshXlDttDnNlfHZpgh4+
966MVa7CP1DYPTlUE27TS8feGbqxRjdELxpgKnoWg8JQOzi/al49dp4DHveTuAXdx8LcpDNXR09j
XoJiR5WFQyAXp3o4zl6BFxZLrfW5NeGLVevQWFXmtPp6YPfltJAuLb2uBew8GSZUT3pFBCYpl7Y+
08+XI7dJkFv9abdwZo5DBeenjMADxi8D+SeKtj6XMrRCLoGXXfeFhsvKLTTEMuyj7jznpSzShkZy
3wpobGr+MGL/z4kUGwO0tB9u28sAMCKtnmkwiXhAo5wnoIglUrQ+X4dWqPc1pn53Loj5sBDazvoF
xyWyYnoVm6jO/IEO55NOR++SRJQFkIHQg5DgshGyqpGZjuevRmEpVsSoIeJBSlS7E/bkTTd3sN+w
VFuhx3HIh87UyLC+40hw4hBRPqb2AkseakqBmv/OYw+0Jsv4T4xA+Gl8Lgsxs8bxnBvUMBjNOBrP
L9xzlzWcnNJpSgSfOK41N8gX0rzDE+vJtkAFwrK0f1nUxz35QLVzT8GfSafzotS141R9lE8Yltoo
tpf+BrqhWPPpxGIQ7QJQumpjHo4XksNCg/JSpKClOg9SNkynudh44oRmAPX77KaIQO635Lb1Wggq
lh9N+j4gcCgCcAouK14VcPxUI1ZdZcd1psknYAN/Dey5DBFe9gTCH+QJzyZmc2FWX5FBsZExjlgR
wOef+smGZneqE6ry7Yz603RqRlfYUnO4PYIv8mh90KcSAcQl7VEy60Hvhkfp+ZLXq/E1WWIN29i0
307mqccPhypzpOldfmxnoShCqH83zDfGG4qNPy5JhnR+J6kZC/Z1ZbaFfyADDEITk/owV7hMhLdG
cAOLbq9bO1UKa1kRYkxHr9g7j4AlhB/TfWmcSr7bhPb3OfQ+3h+gSaPrrcnnNm0KCxMq4zxz/9HT
yaPbsUapdxlGXxfOY3UlKljzkP2WK8bkSA9w3Ji+9KY3c7h6EkAIWQW5eaOpY5Z1fhATd3zkw3Ww
F77/TgWSKI5yJ2TrWxrgbyk1XZ8AvHrtBmoOccNmmF3tu5Vo6GFmfkcmLjdWzZzGkOu4bSsRA/sy
uEbFLhypHN0br1nAbDCsIRRpfdsP3NIYRHWsgAY3xMAirx59Ql5J06PcH8HIgekyeutX7RJuCf46
KRw9kxJ4OZ2wIaL/yC/DcH8NzFMH6Mw7RPwzEYgVV96Uzn0/hA68MptF2cvAU7t9Ij35tR51vpI2
kuKHUb9ktaq7Ql9fMwOazUWdDQ6ZjHJCSEANSXweG/FC3yoQHsdPYCmo8rQTLkdDOqcjziQHANfA
RN3GrtFe59NHFojQDt1CybpwJDZLz2O8CypPGM+1gq8tvtBlLX1dgo5Da3uMhn/o6w/8SnQ9FEPi
IecQNzIepe+bOOvKW+4AcbKpq6BU6Cm5CX1EN7jCjwMvpsxJC63e60/lQ1ntdISC6xyhos8faRCZ
VkdZza1NMH9VVK0kSrCwFVfCdEgxZ4KXoVXXfVIvZxIKPYMGC2e0ESEo3/dqcZdtbXYVI+EQVrc/
VYfizfclF9mL0ZqOUYAuyoMZ5qLSBm2dETdcubw/evVzBswFFtUNf72buR6+DawH3O0oYDOPB7jY
iXfOGQFCetj50SLpFnmDJgD6Ws40QZLQtVwti8+FO/u/V5r/eX9E7GKeH/aS0l36JDMxta+88tvQ
uty7YY1fnwZKBAk2rgujyxalxXbHH8a0AS2dMwJ4jfAska5JomTV+wW4Ksnsn0/Mte+a1xrUWSbt
83wdily3H+UCOv5w8crRX3eZqqTj70r8jxEibkceNOINXfk+Mqf3hyyle8rSWVY3sXlsDVqYKCAz
WPerjS+7aMQC7r00ZeJ1G4Mi1yRgt3drGdSjFPOwH0foe2mn/VO54iCtPUI8O9XyZ8ziXjnUzK9W
7V1WeByA/xLpxNEUm6lgYN/bucF4CcWLSq289b6D0ziFVsl7+D3bT4yhGx1eoPlYg2bhX+zeQlbO
0H/0YtXb7ispF03P3x8RKZmzU8rU6gwscsW8l1f3NE5QoZuabZIlQLCNKjRwInLZgbBEa9aD0+Ii
OqW+DspbnWeKffMme+047oNTuwNzCLCzhiwFzSUk1UsM2Gn68CM1gJWS12UAno8y3N4uGCvSuE9O
Xr/jbuKRvri1l+l2m6xQL0E14/ZjLlJk5B57MohPntdLhDesZm1dqUaW0SgJRMbWDYmKKJ+nSkuv
7pYu374RkOCv+DzHHTe9gX383gx3Ys7G0OR15AR5md5Xyl9IviZZfjaD00cYyJHahxTucBJWNk5I
j3psf38n2X1OQLe+/yH5/uf6LlBYf8qrPiCckIYTh7XrWQg5e0Hh5Ou2+TnAYJKTUI+iZE+YlIPL
ZnNDdKzkyylzUcGojfZ+pmZKJQLOUVBIEQXw2GQM8uezPrCjyIBH17g8ASAQJI0GgccpgqAdNjze
GhNGF+1e1VYLFQmhZ/1sVOSqcZqpLqlbjeLVLdMCggFlMawInOTE9bp70oszmpkG74fOICVI9Qrp
QtGoVZ5e2m/kHnUwXdaelN15CuW1PPJin0pca9lTl3fij0Q1rDK7zL7YQH3ts7pt8HKDXWvIt8N1
S/hgE7ttmWFHmZAkvxFOunMli+KSK0xiFfdJAbGxyGkRV/Qqd/U0pmu2HH583CwvFyj0TJLmSSQQ
eCArGsAi7HEGNDZftUf4Sf6xkMQKtagxFZchOOKBKKT5b1JlCNwyVTpRM8zTBAQHaarkseYJI7in
fW33i0d0ysk+A67VePZmroP8udJdTctvod7vqFcj/QWMh0mXPzmTI4WGZzrp2eVVl69MMMWlQ4UI
dwdywbRBT+wegjOHd1sRwzZ9oz3rN34NTlmSf9MS2XaWBTKyu2snlDybXG0RiPUkS3BLcQFttESc
tja3dUxmQudsr2V2A4kUhyeloWiKVKlPVGp9qFrlWY/P6ZwgZY0yY48bCetVPkL8oula+gbEbs1K
fIz9hYcBVhhco/Ib36OsqToUhuCPtzluhGqip8LDIeMmyU+K76i2YXtDKSq/TeDVmODuOf1Uxo72
HyijxU0ybfx3K0QQTCLocbL56J0MRqGkJvSBMaSzrzHr3AeXtJzo1fqB7zESs7D65BwNtea9N2iV
ueN6c3c/GSh49HvIj1bD4jVVxE0hN/wqDaR13FtoDL+YW8tsDKNxaBYKyR8zhuzNHFXYYhCwlUK4
0dP6Gc/U47WaefepNUh/y7PippJqSFw4HcQPDnQwoTsY+gthfgKY0L0liDYe6zcvzNu9UiP0h+TT
ilB2JpB91hp7n9czdN87qcB9otmNoQ1H6A7BQ8T9i2IJf6tdyWbwTfd/rrwjF6NslqS//Cf3L2rY
doXO78oHhATXUno5jWXkRCypHlQkT7BLYuW07AR1kxwGXiXqikB8bAdFHMjJd9NjkCcXr5EZkeeY
HzX+H5pq14+hlSK0D0sIyrNm+Vs43f2WA7bMDoDJwxuQISHVdDE+iAqiDX2OtO33Y/+qvhYKD/US
4wHsZBKxcpZCtjAARMma5zTYJHoquzTtpetZAuP8GtDJtCifL+UyFaFHZwDXBvDQzKUbupL/Y7cv
Lt2vPDorR8SFLMrgSb3NqcJ/0y7WJLOdas2V0KOtdUdZJXvIfhCvVJEO8JXjfn2N2KEEY9e68jyu
pByq6r1+y7LEC5D3L8OhlMIKZn8L0UCNIjm9+Cp8pTaY3CWN0X2hsAR1fBY+zxG2V0o9K3e9ktiJ
fM7YXTc/M8jX/yCRr36Kh1UBYwPgAGMT44ZH6g8pDlhVhTZULJyvIOtOfCqmlvRfkS+9v982Jidk
60QjQTM4q5VW8glDtwYgNnWISTWIMyDcW2SNUg8+rcZPlR0ObMC2uDvlflywf3rFOEQxEg3nVxMk
KkMK5oMzog/75xJpU8HcbvJ7Mhzvv9yBvesWHNVM+zpGKYj0DK8wPywQBIkDiRhDLY1yqn1rb6wE
gfJra0mbHK8n4K1qCFIWiAu1ucfZQfbYuDL9onvUm4MLq7wkyN+ZTno8+OGga5bUhmqtIk0RDuvM
5PqksWdtQe9l/vraILsLJvyPWBcoKdxEnN8BKDipnI0bVIkIZTBoYhFHXCK7ttXIFHf1pnC5U0SZ
v3LRI2PyZgqP77b8vxpu3cpA0hpA9XcOWR6EsqXUtl+7lsiULMigpnzJfRkaqsCRwoPZs1TRZNd4
/GdCSHGYN374xNjTW6tow9cg0Cqfcfl5E6f823EeqZ8/w/j3y4VesN/wYambky9BhMzaQbZxaigD
DjkYorFhkjB2/QZMDDX2EFJx02GRWSjdJnKFZur36imumdnBngrd6XF1Wm5Pn6+FAWP74L9HXINc
eVWj/9WfGg2soDabmA2CV56QigS2QAw5XrcOcDCjjmKtNtAR5o7Eo3AmoSnpdkDrtQfHzStp2HDv
zZy63eGohXcQhsuTxGVX/8L8trapaO276zoZC+MRBtxQTI/J/k7lI1oq2iWbvbP3cOBTiI86ORDX
YZKEpCJZs7Q5jWOsyalx+kovQy+mT8xPbSNvC09GRZ8JJGENFBkLe576KE5hkfwBKHpWr+iYjlJ1
AbChRVLSXrH/R4xdfw74OmoOp7TaTAbCl/fo5WvQJnFWusFrpGJ/kVHPLRzTQFcYwXaRB0TShnny
YH4UFFAzi3Upzoha/OCe59dxalKh6oh1SWBPWhYMIAR5zes/tbhZuYvvusJCZ/U74YccGMNrTW2o
SRBxYhhVVU11Qfa16AzIFVnkgDr3RTZdI1tOfdgfAaQ0X8uq9eBUXfDZrysWp5HzP0yunbmii3Rc
3tiiSY9Ho5t2DJckSjQyNenzpaA+wF81cuxajWrC60XZBdPBudCnT+v4t9Cli40kvTD8BvMKad+G
cIWG+d0Z3o6vGnL6rSFQ+pyIJO2J8dhnNYnAWF1B2qb8j39blWc2tNViLQVPLS6lhmApicwVpXin
d8I6OCDwRHuyM+PleoPJAsOwpWbN+T+a5Fyfs8uRLkgEy4UdbtWfCVz/p8DGtQ+3+Ck8z1DUUkHD
wM5rpKRmethTEokj+lz2sXNMTNlq2pMphJ0N1IF45Sb/cuUkw3Bf/rDFIANKLNK18G3vYXb4SH0I
PhdKX0YTq5H3DEd6c0s1kzSEuDaxiJh6FMK9okC1ZfJqi7Rr8TLHnB0xS6VEJYhhPfUDqIrUjhkx
k9G6yv+NcMX80tFpjU4EI/xkl1/hFGEgG0V4/zk3rxKabXkN+Lw6VvJAPR3tIc/RCMQDMB6hoMfu
9RBVhUdGGYU2nq437yS4qNMkcYykjbj1EsXVwMzvxnBSl2SPwRlhFkDDE8suhMJd5nNCBZVzAIWi
7Mpt1QKIdt7XleSKE1dMi1CTpMXj9KcTZjSJaDM/BbxReQeJ1UWZjgEeBgaW0pDgZcsOdc5gcb5J
jitFDFf6tVEwq/17lgdUhs+qQnFCWJ2SNlJ9KL+E5lftr1iHJ0/hrX7Dd2fTFj+plxZpVxNQbvBL
fulmnHdMaFaauGNGs7bYIZbVWugzjLH465Ps2maGrXNTwMDY//4Sk22grG9iARJy1CEVMMrezP/F
I5AOhL3gwLrN1dJ+RJUWUGOquNlcBdSY2K9nBsj3/jU6Lpe3Key7eQrMV5eenJNAs5gNN2/Nw3H5
E3U39QEmgWhkbHTojf5WMhTc+4nWyohI55uxOfAlJA07KgWhIAlkXGg2qMxs0q9k5zQarcc16yMk
K8N6Ad/0ZhhszJ2rnM7eqS7X4Bc7uvHtcV7H/NpFjGIf9hjqa284H59OTzpESEmKeC0M8G1mzUfT
CWntS4k74EnWGKwV7Io3tNipqLvhHd5ZLTN69Ed5vn3wzk5vGWw6iuEl2SFQE4pYEzFi5OpyOoNE
WqqHMiQVedRo5Ee+P+pkogDkuOGatb07ZCM3DWoEEuWmQ8xRwJSf0UBeS6ovGNiWM11JQOSQLxlz
OMaTJzACeFWY/uTKmdsnjhWndvHlY3TJ2v65R6ZXHqYGOWe+DauRX7bEm6j+TQN/DCNQcrVyY15o
/vses6idcthf7G9VfJk5URHydtD9pbJc7HBakwfRiXsn9ByA88jebpMmxRJBptGKApNbKp7HaMvB
1VWm9KRq7Z2eKKdwZYC5UpAD8x50MllYkPCm7KzV1YyQjqqBod5NaWqq/9BLuH+MJX7lROdMIhTF
+v3leM6B7Ylu4T3XC6/6AVxIJvayVOhKYZHY0rJboNpQVNdH4wbRdp58XxFbYP5y/Kn23PtiDv7T
vNqCfYSZFt9Xp43lMuKJ9TRXx9IAWtvKNKPLu9j4sRNJ9JGY0ThpCtVykiDmwjV1ms6Tl3m45QOK
jwmFH3TWP7F0uVK41CqzBsy7hf49LKi6JIOFPPsEcovgpA/CEuw2oSM2wT6nJWprJcuu1pbtfTpZ
lofSGQszO1DZesnlz5DwmQSLMFAJDzAj/504F4Rtj1CodvHLR22ZulSoomf8/i+/cIt4a6dL4ORI
0L04poa6iY6/Bkur9UfESKa5hQFniXklOi9BrjLpNx59W3wyVko0wW6bgWOHLITh0YwZg96pS48j
FICu5OZ8ihM7zK3QYTdpag2RdEmhCgRBoK2+a6ZHdOOAKaWztO7t8k5lci1FHw2+h0b8E8fVnlde
KKwlCho76VA1VXQQ6eythLDA6WCptqeV6obidc1HTX+D7JJqNxRL15xb1cZtFm+1eJISvjwNbzau
EEh4r1eNWKX9RW8jN77H7aJdSA8DxRQU/uaAhG4DE12zGn1uwL27HbuLFdfJ3ibQtfGMO7OJ57+N
1g8V31WnBk34yfyC9qqbVmXRR8RKBx8m+0QQq2rgs5NsDYQzDM66+RcIeu1CjT2WkudbU8LGdJoL
aBzPbjVo+eIkMYlxelkig4Cp+4qHuKN9VlYYZSTlACvBj4ELl5pFYLVeZ2Ln7YvufyyLawCwwzyH
F30Hu3JIA9vr/oVlu/wWOFd53RyJ9AMLYU+L7sDALx0b1P3MLGX7R/9AUbPjhdrwGoXL9337ooO8
u+0WWIpRaZQNKqc8ma8tQ9Lkxcb40FlkJMlEqwu+vQzmToo7xb9AYvrrF6fACOPlj1rQ0fT1bIa6
zAwOrX4l+eTRt6dTomKiEgW6jr8KrFkdwtBY7o5fB4mSK9RzlP4ESFTrFr79ucDnusCA84s5aowP
gJzSy2FWphqPN+uXz9NgWRuPMsI1ESKW3nOHoV74WYXyJUguYs1MYk3eNGubn+a+hdPb87efMiOy
SUDpfg1Ng4R3nHkq2VUrrZYdNjCVCC5drSwrIryxRx16UmChPOhMP7MPeckMCMde8t+EgYbra4nT
C7iewJVtHMV20WMcvcjCWjEPJWSdvOfun6GqvK9La1hyMTqKgNV6SUDKWM2yz/vnmObGbs3WEEMl
pugFyphz/bCSCYR6WUEaNQJBeVy4ni6uQ0f0CoBVE0arsCLJDHQ9hTq+Heu+JkJdkXA7Cp9fBaBr
U0LMeW4AUvdrVbv2+nGPzUlBsU9JpVcPLjjUPCzzVLg4y2w35b03mGuAgcUBdE5PCdhUwluygf0r
GswPpcGrtpK7Rs/6Ykw581P8H/CP5Wt9+GciEFKMDLEd+B0foQdIL18OZ3afO5lYoQgo/zaGso9K
/U4Lhr6NSpXBNBVrfFUufXnFQHENHB1WOmDQ+lLm3ltYpAX095M0+N3gfeVllbXCsp6XYLrU2Fjr
i+kaSm9XsIdHQCfMd5Zkef5EDgHBaKhS7T3A7WJXB5oLnQ+dYF7tpHdiWGzJfDbK5TqUj49WOojl
+5AowocJYrcE7p81oG75pIoeenDz8WvXCx0Vx8dVe57aShzZ8/Z81JdpeTt7ifsV9yMcUHeWjlgf
2jcdPBV2D7FNcAQqaPOc/gzgB7IsNudPpzeZ+kY1KW1im7B2dSs0uMrf+EArLvR14ifqwwTDPYVY
CzrngDkIpf518UzX5aLPrgJphPwF4/C4jrwyX0SPyE1bftq0PG9tsJQrUmaPJa0sgSagg4zCHr7T
MYOFAWU8QMcJgq3MqCPYbhza/OFQSWJSWNLit3Zr/yKoEMm20E/zsxuYfdCU3s3BcJmdgO0EvKjD
XATNBU8G1d7y7QSAsjSBYgSpTYOivNAr3zmApZFl9BDQoE3pungIhTleRHC53ngbGHy2+xQab/Fn
mLkKPJc+9G5cE2njTiabe1mq4YkKglTAHeIFfGhb2y5mZ7fjt3hzAJNh9ghN+dUhxsetj1c4BmFO
tzvda9QNRLUhbQLfsVgPIR5JvlbwB8zXndHLG9An+6JDbD46F/MuXuw7G7+NlorlCA6Bqr0sQoVN
WuSkhFEX/XZ57Vt7npbAcSStnVgU4KQyQ8IEzgEbiu76mcHgOA4vgr6CttiitVKrpUcZlapRZdp1
u7QjUhOvM4H8ohN9lwJcR/TMh+n4MpqKv7k47PR25pohfC8NOrFPqeBNvfzRbBn0YFKleV6lrhPw
elLU6qWz8+dBODWAmLtpxiH561SU2Av+o5hkJNq43vBijq/NEFh9CDrcnGGQ7wD9rHIaqVXXhbI7
2jRi1eAhTWxDoFvLFVdbbqp2wDPVQzJtRPzoMBt5OA3b54s7NuxX57WqYzvDfTeHxUQ7ROQ8NMGJ
QSCw5PitaURamlVRZssmB5wuhfCPhy7rzSHNtNChXyhj1YtYNSycaONKJ07NGYM13QWJ7GHbieE9
IoyLcUhcoF1x+y5s1951DG1LIv7cni74Mmpq0cpvox6xFlsr/VXvwBLYSiZwWE99LBbcYZFEsR1x
K8nT8KXVl9RV7GiS6LNH+74Yv0nRVJ3kxj3YYi2yDESgxbDy80EorMrROv/g6/GSrkgWiP+a/hZs
vN+Gs46pQI/3NciRTiAj+IVCeCsolhm4ssJER3XKrI9N5qGFrm9IEOMiHjUxVsWeAR+hL6jlJgt+
YAL/4TWRLPH97IB47+E4q9DRs6+ouVz3GNaSbJUFknXJe6h1+YVAf6vP8lN/6b2QUv+mFLTnj/Tz
VFAWAK9nw4+0Gb5IOfZdMFLlMvM0NMFCy58hzjA1/BuYKmaGPv2cAW3lTG29GHwd5NSGH7zA+Hr/
L2ahMzfSGqRJDgycvy4CdF4+8xyad9PcK3DdLj3+PX7CPG1EL8aYluplDPUjXYla3Y/Ruz3/T+8a
yzGuUhZUnn5sCqyR0phQcwyY7SmgvHa6Zq9OCdCZ+bLYAVXYqcn8aUJnV9TgcRgGVg1TuMAJqyQY
yfsk1idGyKP84OtKUATHznEqbQGUBbFwjpeq8e7FRAuDF7an3cPUH5e2IrgXNCRF2kldbShR+iYj
alG8jo2oU5pujikKE3ojYGJceK/gGXUgyeZcIN7XIkk6HMdwHm2cRNnyOzwKdfFYrM3KaUlwzl+u
/v+i3urv2bK46Ow5xvgNch4eGwf9cLA0H5gJhLRxETrBcQEF+6lBVQxsS25XoWH9bhqzrM6k5GRS
KdPj3FKES75WA52Dy45PesGBpoOfHd2moX9/HjNdJ+R6croBnokQ8VI2wca0DuKRHhA7T/ta/ejD
eofcLzgO+i89aFkFaHVnIFe7x2lgZaawCWwVKWMjaVNzLqLBFI3E3lEQM6Fq5lH2RIilNPbYcmN2
ZDls2z4L8y/azOn0QWiDGay/YoTEd7e/5s+L20h9dsc/3HaaySMLhUKd8s3tUDgEVSUG8h7I9+dB
WFFgLN6u5n1bRBI16QE/oFnSemr+tTik2jo8cBUnzLvqo1Y7VaY74Y27r0vI1Z9TZPedbqUOGfnU
fDIEQNmPJDKeakjE3FUeMA6UaDmpCm615HaBF5Xlfbz8zt/6M7RWkAZF8Xr+izgE17wQZ2lQUNPY
bWElenK0KH56quyiGr+McgzS8ZY0GdvWm7HMtlB7Ixz3UYwqKBr9c8D1+J/gPC5VzqqhmTmxpT+k
DMNtP9NpimSvaVkGcM3Za2PjUJCDCIyYDdoMFcsb44KIWxNMQIskRufPfFnBGevDbbQ2xiC+xc3L
nHz1XT7O3CrwMx/lhE2KCYzUs+Ht+U/wgKiBKLBluvuxij4aEmRSP2iSyWSv1qW+viwlO50tDt8O
dgfphWqi7Kdw8CH1JlBGOASfZdMEJn89+Fbsas6L63CcSs1s8yW9RLxUw11IBym3cbhUajVIgvq1
5m4oJcVohABCqD4qmFRhSB2nJx7apf66v1AAhvEVGJLln+8vvZFGf6JGXHrBoLYgQvlgjti1sutr
s2VS8BikT/Y7TqmHlHwfwp52QsZ3mXSEMA9ExoWXF8og6WSP9vVxHN3nZ25ZovGLbCM28AJFZ1+6
LW0zL8X5FvHrPugJiba0CCOswwhao2qAWEjjHrioAfbBJsWBnbUjMT9tWhYTnJTs3SpbFIGAgNTu
gX35DPBgXxkWxWfaumbSiiBYqS7HAup6znEzDyOKPTQdJcWu/zwBbeIa4jcXPgpmoDIgWdL1cOfY
jb+NQIDeL60lQMkJGEWIm5r+YLTF7e1tQBaPXTMZHnWl/FYhp7PD/1CnNMPjoEJ7ejeeq0qJopqK
2IDV4u3ob7fFL9Wv5wkhAn8GWO63/5k5BmBjWZkE7RD/iBFZYxaMqRv4RdXBrJOVOsqdxKUAJhnZ
bX0KYBBZafSP8it5+DKysIK/QMROdafhmInMfwzpkAZ94bjjbj2spztobL0Zp8wACxUXe6uDMMAC
Osi7snRcAYoQDcN2UACACe/L4SHcptacbSkkLCl5TUbIc1U8VMSOtgdXxT3+kzYy0ZGxt12RiUFa
FIw7G9F7Vni+XZb3K5Je029vi4GPSBf6KDHnLNRmwOOJEhYetBWnWSpa6CjubYIYfGWRUJ2FDrbu
6BZrkVhcmPRfVvM+wG/twa94penOWNMW0UruPJUjI9kXN+8xREQ9AFUqWgWmLkFX4j2yEBzk2w6J
afPl6yje54tmuaPlUK/HwRU4Eu2leCpBib2n3xciBp6UK7dNXr6LTeIc7lyJBc9fuvIc0uGXVU8Y
aQ4rnptT97m14CcyJi/cAgAHLe10ZJf//6RH8qPys1fzzenGFX5OFVUrs2oD1YF77UZYd2u8AZdn
P8QIMU3Ur7S2QDbQ3YZC+4wrFxcpLlWKLBK0mYDU78BmDPdqiv+MKrqU1OzSTAVJkS9T+Ac/DSl3
8w0nvDQHU+US/QGnr6BZypw0JqupiI20U5vNwrDZbPzOme90I5il8Mv8DpixPJAgO1DeyYU8DFcu
hCNITqXc6dYiCGJAsJub++37o5mzE1fV3cax7LgncGfjLusSaLp7Iiy0fUII0qymxZO/UwmGgfuU
v9mtDT1v61o0t4g6pxWNVAMYa7w2LyZSTS1pA15LhsY8oec8veLkNHLHVmr5Zlxhs85RMz+cJHtq
2e0UDUzcz//kAuCYHxXtzgQu+nL0m4Z6jY8May0or3IMYAf0uL8qsB4BZoYTCEggWOMFP9PHjPqK
a7uzU5PESdYjtK23mFezHyG+rZUws5T0prNqmg3DvLZUgPfiWCBDrIE5nEE5gkMH3KsgPg2cIiqT
lSLKn9w7TeZ8afXAEk0K1b9oq6pMZ9cbFfYWJbEspsayOxE7oZFY/K/0mVEzfnc4WdV9/AwlboT2
YWvE8+uUyoJsPk4ADkBzq876ux+6nV4AJftf6jIpG/5tpnPacQZUcqWIuZxnjNieNJ56ketbfsHf
WnY/RJ5uNrlxdCTUffjIYTrNlfZ74H2TTbBn/H4wE7I7KRYcVbMbLdXStINYUdh9Q2Xr6zD9Idd+
qZk35zBo36xYJniUWmh5vPylBbjwWQraZEol+ltEVjxQnbmn5DiPpiWkhnPzRhLpSXIhQrcAnLkQ
COpjzFoAz84v38JVrUbeyvlOrtTZ3CfHgMA9Fx2xKDxydbsK2K7ag6KlRRvZJL+TVlkPgsyxjDdg
RKQBoGn3jSv96VZ/0c3LwXPxSBWWC02BhgtfpWmZhGgEf0GkYsbxGNRE9KDs3nDIHzvq+KvOMSDc
pFREO+HSFJArHmfcl9eka5W0vl4JygrJbkORMqxR0SEbOzi6dvDF4sZ8GNoswYHjABRW/W62sk1G
WCv6IECvrPf9VScWdQVEQKPbA2GKEsLDkHV0KCX4tuNGDJHI1XyORyRMrqXsZwJlAjOIBCHBp6Z5
nBxVTXLqoKJoi67wfDrrWk1+8VS5P4MZ8EaU1AXwmlzlmlUaOLkuvpgsH/rxo+QMlasyBXx+msHV
sT6cJX9HRCup8bQ34v6HxSqxLtEBly9QWXBsjAN+KfPc8i3/WJkCENrSH5g75CFwaX2eOmjHNV1K
93OGTMBovyGpkaNij4uvxMzpQGRQxEJhsNjKEHY5Y5Qd4yN+9lhMLbTdGRm8Yh3DK5qfgNLKI5p1
Oa2FHKNdgOv98mUq+os/dX1+LHIKbXVZEi5ZfjgF0ssVAePxRpZUrJ7zMBuDZc4H5llQCNnu+jY+
9KNGqIoD87qeWGikrDODEXhIE1yQSg13X9lH/s0ECXg2ZeEcjzF2zOFrjVhhP0xxyaSsbifbmbcF
dWS4EzSj7Vv3JYGMSxrY9R7pQ/sPnIUU4P+7FC6w7/cX7bRuF7yi+PlHCu8CixbtwBJOwkRRCWY3
pfOhm5opErmrEUf0LXfGIZWWWFM/cVTahkBSbRuWjDcr9ljnWVIOdKP9MG4duV0qYm0d50IYpPGe
aqcVJFWWXanUUhYQZkM1jr+CLESzzINyqc/qKfFpTL8ypf0GZULeXE1MJxjbEntxydMCfhjln+h9
Oo52anWbq6J569/glOasIyYTq51sMjbGejO5hhbZY1k+wvYrLz7E6YImnjUozMyenefgK56Ftdx0
9xdypoxVqZX9/2XOktDLPvwdAB6tsqdl83/KUQQ6WFyNQcID5JKW9Lt8MdslqKzsvmp5kjROZYiR
YNkNqZ58HuK6zWNvYIGzNTUlZgfOGKTVUvqhsMsBMS6iKkJdg7ZMKe+1JrO0aHK5tNfli/xKGtTV
FMT6xELWelI6LRXutwGYtIibWzZCg0Ghcwzzt6PaFGC8qM8dAg/uMmf45wx9bBSQN5MZbz5Xkkev
IYREo1VsFZihfL7EjgB3/gr1m8xXVir5OEMVP3CH+GchHY20Kt/BrSYb1CCuRvGsjvF5Oba22/qp
cVJGUvLb3Rt0hZnhV0Ir0ZkIg0Hn+KCm/9Ynu96lMx4HRQT7B4mhqaYhoy2c1aeLTyDvy/lH+AdN
Km39DKVYn6LMXBaWgXcjBVG/iye/La7LPPMaGoZGS/CEy0y9URAVH/miq8O2JE44i45AJtzcgF4f
pOPl66wemtCGSMItLLdrpBv2kaqMNWZK1imQBhPrRBBYG651gd9EIWyiMkjUnfqDtIcbLXHui1mr
sWI4bnn/HlC3J+LC6VwoxU69plgz61/wg4rkQPqIxc/pG/5hB9hdjkrdxdy2WrguWy+uN4kRrx5R
ba1e3Ur5x3tGzD8AR+wkMD66G5L5XEn/JJ6n5oRi3UJULJTixkhul5Lv+91PKYJrBFvajjfZD7Cy
bPkcxz8lq1qiYHi7XX4YJmsNfkVUVxpGrQ49J8UzDGpclPHAsaqYJpaDk4VckINKHdSCvXwFYb7z
c8wi45XbKXQWzdKkGMYrQyFoagaebA4MN/g/+ZdD4LlS6Kmu2XOhTVRYbnMAD1EZCk9dQ3BXdBpu
92SXhrQuyURUlA5DxjDUddJEToIqU+e1X4Kjc1J2V2R+4SmW4GYlUUn7gIruRsJlTgSNMZOKPdee
No3jYacMJskMKe8AAdvv97jeIqMD2RC2UzIaTJ6FXFiInYMm+nsSoXmhTXPo7Lmk2UmCrYQhNXCN
dwmH7gbt3O2/3itHEEfpNzJs6pN8K+J4CkRLyQ6FTyLSGkqj/Kqkvf7R8x0NAtbya+zaKw1lPKXu
ILFfAzitkuXuFaPtxmmNNuyRF2psqDM4h7YGXU9PzneyB7+TbJkEtUCJZFsbuFG8f2jM8QW1h18S
+340LAklZH550yREiwFv2GPrQ4QeuXR3T9Bf/I2yamvogcSSyJhyheBl74ufEmYCaE90J+aZKJQm
FQbaDbn2zZFK6fPp6E2nANK7VK4hkcxp3vCpwsPTONrUvSXHdEPaovhamTrJyrtET5OtlzH2cNC6
nm40rpjxYTdd/nBEkebNaznZufwwVqNOxAUJteiB6LyDYS+rBOdzHtz7uirbDslUi6ZC2u1sg58j
srw4d/8bj9kmAOfUcrYxhH97zAkRu9VjzdNuIG5+eQDAogELLIcoXvEAr60CA7ZNgZ5dSSFGbnpD
qHVRsNB3SkRrFYnyaYihFYBL724AfbJmhjaxm8zxb8i+iuAIVlCIVQ7nJKxPQZSYy8gJav8VUnle
B8l1pYxT6IsLS+RnUMQlvkJ5YNwJ2s1Av6nqBYtc/5Q83+KU5blzaufsszmziG728vbSQOEawd/o
YCs6TRSlUVe1Mxsfom88BF0yQvzIH/5fceuTAojW/N9dKbigKeh2dfMUTx86OkL1favfl2+KufJT
MoqydR9QmJ/lWCLtbEyRPWt0R2pKBFQ4CsbckkdQOzWJyqDRqoWCklCjgKfR206qpckv8gzJ16a7
00GPfPYmAQoTzWaE3r7e50SQPJTaGMMhK7jlY23ZOiHRELhwnLGF/l/te3QfMQxvMdZk/ylORX13
qctiGV1nWBtGvZQOwV78MXIwjVK5f5v8+ugiMcD8CoXR7HAHYU5bp9o9iwCHDny/p7WTKL6EDtRG
gO4FH/KogHyITpB/ZVZkww1pd4bgZPfhiZPd0Kklq43oG9A+Whco2H0qCGNGdLzSE0iG9EX3ts+G
XHbjUV+1R/Onp0/F05VQ51rtYrOwq7uJRD1bmNU4G6UslEx7XkNWMijn1A19vyRSDV+zEg6JGbGS
2PBOBAqvupGhukcxovu6I9z0sE16AAHp9zitoiv0kLe7/u2bKN2tkE3Ff+8ZnX9Cq7IILnetDRU9
JNlqEenFjBEadfv/74TBYeB7ZQBgc/Tc4KRJ6o/vVPx5jPy/8woB+fr1uuTIhb86cfFiQ+TRUvoX
l2JApSucov3843WvOJGWX5nAFVaJr/5xx3pPStyaqspPMLbAQj8PHzI/Dm7QSuG3Updtoe7SWLJy
XVSirVXMm3gJj7KnUP/rFBsPSkSrJZaULA9H7I89hrPrjxNUQZYLpcdlMy0CldylHA3qsoFElts4
Bpqs+kfj2QkS1i/nr0b0UsX6q3Z888P7AUsr5RuuwK/QzQcTEdnYzRwWaUYB36gZCiWhnBEDZvYx
bBRF3JX9Bguc3YRNI3mPiHSjFv6k954QHWh9dXaHRAy4WJsCvHUgxqG78VodwtZ3ONSFCG4BI7Oj
hYWHSsEiezxxHJyJVVDHw4R59CyvPnDXclK1Z4RXKRyXKlsKfWxogiXbtXbB6KGaQN6dWF6flDZN
tcrNUZGn8TAhzVjKXOdhhZ3cnAWMZal1LChyJ30GkiTd8laZy58BdFZxk07sGyK5f/PxDGBoeH+6
6YTbByqFqvVu/sMhC4a9pVZZjFjR7fy8Lra7J8sODE1OjvOqUvV1FN8/CwVUBK8a527J2PRlgqUY
3oB+mUAESSdl0kWvMq9tDTm3lXSwtLxOVeHYa6RtHSZOJ1sTMJRsAJUl1LLt0QGkXlUxKP9gCGNj
4a0VFFI1QgmWrAc82ZYZSU4STATS81PDRMaQdpQjThCM2nYlgQ2THXVEFVWMdB5hC2E0Cb7oSS/e
BZwpcqzMfjgp0m27xy3U51rNVWJr1AHNs4f6G0D1pSoiJm6CRz4GK+6Q4rh+2iLV29B7ckgHJrll
1YQPw7PIQ1lMfvOgJ+Gz70wEjbnUnJeIREzf16VvaDKYE/Tw5dda4hVdoWsj06vEYZEDNg66hG5L
82aq9imFOrV/tyiMwS3NRFDJZL6PpKNBrq2ZU1K2EZtn3KcJynqGu3Xbi5cZGGzzc6pB+LLuemuD
HW/6gUM+uxnqplsjYVVOX8q/vKIMVEehVd2iOQjfCwutF0NJW+ImK3dmX2FclGF6NnisiZezGOXB
EPge5xZ468QYQdtYA3ISuy3ea9w6nMeRLRK9/VS0B/g+gRiLiGZMn/4+hNztRGBOgfkwQjH6ZUUv
s3PoQANJrXC4TqVZ6p1XFT+ApP6WfRqEOlqOhs3Q6KfPC9SZv3cbaUBggnKseKQMIGDuPGJkc7a6
CtIZCsytSWMe/3Oha0EocOG+KX3lRWWQHRT4Nwy9vgx4XX0aP7SL28SikDaYRzmV3Ef/dtFyLYVl
+C87hatOIbZEn0Jdj0tGlUcFE0a/NUJwHMkv5ylupEZCIwg0kMNJUsxSenPmbpTvW/wftRp3HdsN
6jhoWpd/15FEZSXOKvqpENm1o0JQW1JmsLJ1qqgXyp8KBmNR5jcnLCBKD8DUNrbLih784FYCvJ51
rNiwhYc8Wai81a8Rq6Bez9BrmXJtDtuXHM/bGdpHHutZ54KzPxcDL2dd+eoxltWjH90wm2advBw4
FWMkbScFZWhAxg6AdDPvy44FIk+N5pHNfwMV7SwEMi/Cvyg3K6UKXC3MVsMFxuv+jXTxNLBNMWQk
5XwfmqjoSjtR0vXQQ/noBEmqEy1KjQ+vL8/4KWtY1jW774EnmPUq9quNjk3HRt1y7tqr5qRGfM93
NTeehWDxWNFYjgjyxTtYlbEqsoA8pT+OuC9UqPQwwd7bFpAjNXlJnqyPqGxG4VcE/0GhXXeseZJM
zskj6uqlUv5waoqQXhWkJ0VITgyCd1kX9+LCFX8xArmMtq+d2ObTHOOD2MRN3p3B/EzahH5TMIgm
1WXe0TDrCmnASDTiZa7A3CBrUyetlSNA+b1L61hB4bslBTs4pxrjH7NMnrfvSyLrfaPj67txWx82
Tx5cyrbXoa33eLwXDhqxuYT7KHb9SJCbDVHLMFPjXOypvmU9BuUwlG51MXS1z5vd0HoZjVZoxt03
MekJht0jjWpjktr82e3/cwohFBGXOw1lDQFJZ9pZ/RPirt+uQS/KZC4DmSW+FWbqbQJxbCT/t+rY
9y3gEvx7qSxtit0qfSDvNutsyPuDb5je/FmkmjYn8zEGEVt+15Bv1kS9qT97QGEjsqJygA0pS3gY
y+8IpeBEdaG+vkCcu+8fC5Rejr3oC35cUQ6dTB0cFbka8AHavyvSX0XP3YH2OlGPthroj7T95zsb
LzCrtRLXpJ84lYzW8ou1+UdoQ6H7WEDKHX68QWt++a15hww30OtMbFF8z0Aw/ZF9qQD2NCu+BgBQ
JsTr8eXEXMveWUWVNYS3swEUNYSRRpVtpHQCS2c02ViyXroSQ+14K6kptwxEyvx/e6AobflNPj18
5ROhW/lzcGgvDdWO5j7mvgbheFLYeQEEGlhI8KNFrjODSwcTJPevnRr8OG9uiFmBlImBeS7QcrYr
jzVu4yIyV2OwptcTPtedDgeZLgVwT98VVyFWKnVdVvoOZtQNDQWp7wl0erVubrv3D5Aiik6C5rRc
uJXnMT3lBYpN61Ya0ssEIc2xugVdijXUe+J4FPzchoyrM37e6SwKzf6rSnGJenHDP/dWCGys0cZW
a0zgtaWR+N7MMh3P4fyuXFS46QPI/3Z5oIvo2H9KJlW66TjrwhQGIqKyRHHrVSQSg4B2y8vGjSwQ
KjKQWASm0RacaVd/yYbZgyztQp5GF2PGRImvQEK1XcRXkO8Fg87dabkqtR3ANjNC5XlHuYRHBv/h
DWKyqFLPN5dNH7Zkd2M++ZiHgCjpX55HuT7nO2s95ZAu5D87hu4GLSF0i+dNdD4SnwHc1i8ZP70M
VT5KIrqG4gp04/tEsAZ4+8ekRT+hboIVdlj47CwWdcdfkf0Dj3RYPuJeWICCKdslQxFwyTnjtqsJ
5CnUftYeo72tsVgsSJWMaQrhrbDCTLRuNOIp7Sa+ujUddI4ks61CsDn+9tD8DIAE6P/q7UAHZtIo
UHTw6D8TYuTb6241oscZ+N2MFoSqeqzx+AYqMUxZ9j20XHetM70TdxIj1iu+dJcovTAsaaCOckMk
8VOrD1c2mfr/EqPlwJ+wM6g74rUpmRe79bpCBjqg9CUqlkQ39PEVSb4gnIQ3g51tmF0nSssWZpHr
7LgTgh3AwHzOWlEs07M04x1b48OeHiDS7RnIfoQbUpXxPTpxou/AePJAvfQA4Iicogy8AX+AusT7
fXhagPtxXW/IV/1miFAvMVmw+AvfDcpYLoodVTmaBo9v3kZOw7PrJoRYg+eNQeUdGLeOdumZJJVP
+ZhgSED5ywm2Mhbx8KlV29DUeTQd/5OsPyME50P7xke+0rEguj7/gJmeJAu0u1PmX9OuMyEoda7L
Nc5/0jSS+bvIILf0B0DwqcEQS6872BeQ279JHEUTupf7x8xTrAf6aFtMnRjgAulF9x3yVTpiJT2J
JJxIB6Vv8M7ChPFplEKml4x+moDUIp20AFWdDbNpuJPEV90GoiwKPNNWgVph0XercODtkOJnwEC4
vgMzG35CANhp4qoUcfVwwZaAhc0d3Q7dKNkbA8RMt2a2iU6k3Fc593rP2FwUCNj3b0UDtGyXNB2U
SUW2NdsQEPEIbmfQyv9p7WYB5paeo0wFQ2EoBvTdcx8sQgz2O3wLuph5LSa/r+H1NzemPmQ551wW
xxiKWWkemQHk+Y82BLj5b9eJ/RtNicqBaJtSbnRMfCvG1vtWKZe3jOzC48jM7tfqos20+GmpUj5A
b8XOj23ORejPJys3wwwU2SH8wbgJcl/+dQL0IZU+9qQyRXM1imB4QVtUgsB5qImIK19YHh4IMmSK
s+M9xEMowKmD9ZSzTNnC5LeGkpHYAOyAjtxzSXxfBO3FeT7/QV9/S7Pz799MaXkrNGe2otFP8uzT
CeMP5mSZSiOBWJO6IBEvt8S3kcevXGmfa+uMwbN3HZaMX4pn/fkkxQ9LrgzpEzNESbYUMy7jPeSw
VfXaiXoi7fKbzrdu1Bh33Bt5lVontbsOZA/uy3sI8sb2CMWA8Q18BqEbNynOMsAjCktINDXdMl+L
0/jl0hjPfbIY8b4kNKr9OJGmHqhZPEYlDed/3vUTLiJMxep7s+ul3X9/RGy6G+gGxLcnRt6EVjIu
D1t/ceXpvwuPKNqRvLPYoeueqDJwd1htQ3/NbkVM7KkO4cCCehklhO7eYyJ5TdIwxoTh3kPIJ+Ii
U2t4BtHxbQPn27IHaWsHgq8vDVKqHemufPHTcDYwN2i6mMdnp1e0d2dAI8kdI9NTTin+cw6SishU
vo4jJg2YqCcriGKGBiWfOxFvSscfLXXp9tojIfscPKufEilLGrfL+HOHE86OPF1sma4jpdSGNLpE
r1wBcqwAVb4xMqCeWkZ5BWcRj+sYZ9h6d3f7DjBecvgmw2Sx3O+z3TzclRdi6hd22bic45Q7oW5L
6VGkz8LRfsm+WEeORXUKLjZ5RTh2GHbsCHUql4CgmTWtan4VemqyHhkcU3QWkAN6myQLLd5m0Uen
UlfHIcF/KvsB146m0/0w25rbuUvzqMC85CBRElBxxtEDeZVAxe6IlMfU0FvQ1rBnB4wa5Di4egnI
R3zvp3EP3EXl/iI6Ommmh/4mNfnksb1PLfGmyNr7G3KBHF5eJf2k5Ha1egCh/JlhKu01LWN0dG85
u1IKW9C/Sk8Q84ztl757LL1bgFM2UXNcQ9uGIU+ThZwK0h7F0KMXnhFsKzWE1r/nEeBN269ZtYrC
B+tGFm/0VflUG6TzgiUbsswKbq1fqKFEoSCRns6KSvvYIz6p6/S9JqrxLaN2j4jWsGYLHM199qA0
1gG0yQazrOLw0ErFCEogbAOBv2xCDxy+wnWp2yzespSlQgK5eFQfGWZw1F4irQBl/T8gjmIMSwGe
kM15l7fQb6D531OrKVUIWvLXLCdw13H6p4kkwALeXipfn4BymbjJ3ZnDXKd8GA48tq98iPargYZ2
ObhOgoZxQKthVFY/VZBqBO6nNzwl0eaOWda6Fcu3I8fMJCNL+X9vBvDj/SdbMxJZoc5Jgje6ecPv
G5cKgI7bKjBp+Bt3+C4u5Xem8ZTCUcgUo5k8RyHEgQ14g7/YNF1dqMFVGH1N365o4nSNi7YSf48W
T8tuEmmGLxT3Dc8ua4sQaWIwZbSOsfVWthrXag7eTGsmhyup4pbsU+AbTwFweWipuJ8WZlxLHgNG
NMOJyoQWBffprnVvLHnd025ZxunmMut4BorvYNA2ZFwhWhtw17Yw/wkZExtRkr4pF3dJbGS86Sy0
AKT3XiSeAS7p04AIxQLNdCKhoT4HZ5XfXOHn0ANJN8fPEDZsxB9K1QC834VRXhB18vtxjqcpbspB
8S1hTDJUZPQNFfS8pc/FTKEGbDmWo5OU5b32qKSUFP5JJRtEQhn4FDn1qrOXUXqt6V7eUUENB+py
QusAVO5kZGCVY1Fu4iXZ/2Knv5iD3Vexs0FrAMQigKJO7BQGwVMtt8adKLiI3vEFYHZF29V7/LOe
nI1CNWCd9ONhv2R/3xCzEOh8cz+GWi+tmOyLm8RZiJcCe6gIFv/qwhUf5tq9TN6Ckd6fx8OEsm4x
XRV4g3Q9poDAeCxCFOY3L05HyXXbSviasseBfb8Mnaxb08Ad8wgDXhZRUyKtaPW+3EvZOtP74mAD
4Hn07RvKNLmjVy1CDR0EIbTdwZ+mwUxpTwwFAfUBmtxInMonoeV7GzeYXQ5vDqCGlWJFCUN7CLif
5OJ+ZmXUYWNf7UhOf8bH3INDA9atEhAiBu0vOJNRudGgdRb8+DFJ+CDAieyH8PuNBX/hF7JU7WgM
zK/nc59CpnL9+jp493Wh/MQGW28UhyFD4TCWRH6NIKUUQj1cgedKtebUK+CwHMgLI6do0RuNX0nW
AX7A1UBaZdER99PJl8LVB1JjgoI1nU7qbL+qGN3kmegf5o/Cc8C9MzMFTfWWGZxVrNy9hV1+8y7C
fuuHAsTVKA2pl2Iqeb5P5YB3oLrKNJR9l7F45QX0+VYncdaEBVngHBYeYsrbK3DQiFGLD8mdiGJQ
+HS399oUwi8604xsDzHT2GtJmE26bEe7x6AnevqV3pQROeGCMS9DLsdWtvBfGed+Q9MbJrg8tv1e
IhV3mBWxHjeOY4UtRBOiziO/w7H0ju+wfP0Rb4QN/KgzCgUCH7RrrRqBTPO3UY3FQjRljJ62Gjn5
iOwuHqMmGgilGgfiIorTjPsQOl3UVoedfTUX359l0uE1nniXdyYAuAkXPJqAitYlBHFrRj73h/fz
YbErbFlyuCFo54OOS7ltI6R/QotpkQCD4gxq+96PvcCPOnMt/xrwTopOAu96YFNRfNQy7lH9+krw
fM7yjIH+gDQiA+Msg0SX1XGipcT/jRaNw4tu0B1wxIbTLGa4GmK857Y1JCFdKeA2LX9fQabyCDcJ
7YzEIN9hfEbuzeNeyUQJ06TEy3ua2uL/UJ7SUCB4DZ2G1yBxXbAlFV9994rQLdfCa+Nr0LWhQAMt
Zxt300KQivqDDf7wfK5kqqM0XnBzAXi8bMQT1eJlDN9BIFn5TFwEpWRMNViUfWx4Dv25HrOa8AIE
6yKk8tZvi8mypQuiHF533j2RHyj6QKeDSFc/I19QwA8uXXZG1YOZBK5YT8xOVz0RP1RbNrYsdJc7
JwXTzW4U6pv0zZUYRCinmDYfgsWcO3E/Oma3rJEfyKoy3pcN7CNtVRe07C58o03XZR6Ewe3hBOi+
hzBKssRsXhRhF4/dR7ekVKP2eo2ZxbQctCAhtBLWfaoP4yeT81hTbj1RBvuVkJUrQ4G7WCMtEn7e
C18X4ZUHmlRO4KrniaTv3h5LZ+y0lYmSlYjlQga8ePnCSDmCfBQQzbl1Z8MEznVLUREJH7ptnMHG
Sl+sfu9HImB51n+uWr/0FV5rvyV78DcV+Uo9Z5J2g61JbxzJT5hFzK6RvFZaa6t3jykmJxZ5ldSx
WDpqEFH0BZ+WroQclH/HuP199XcKfIg2UDdEMj5Ma4ADGaBLY15gdOddpcL7RPzgqFTrVrd812GI
b0nXfNApeTAy0GyiO4GlqQu3fH+8C6Vzx/JEfJ0dLBWRXdicR4kh37Lt3oqhYPWKi2L23uMtaxkT
x5RYTQk97Pu31T5jYFSAWufmP/MGhy4DQN7kP3l5Ga1XqrsdBqCpoJQ5De9VXDoCDDKHlj2hqUA2
npUlDCmeWCXbfLKY4DCht7SK/NKxsptQ2g1uBRyY56mwjhY1nOv0B5spfkeWOvbG88slTPb8DRei
lB+CWETCPAg38gfB2wLIyHXGft5bL5XTewxH+TqP5s2a2p1j8DwyoltU2yICs56ntD5405QxgGyR
mZFwyeujXdIHDyeGAT+WiwBoRu1PVItdOB53/FrPo1Ea6YVchK2h9Cp0a+F1wRc2C/wooXjsGbU5
3b23CmfKsXArUencRFjgxLmMkkRx9Gdol+dn62sUbaKQcqAt+97P+VAaSr+cfMUIk9ReP97WFbTQ
UUJAmSlW0G0IvIjvWUxDZ/6Pu64aM+SxclyNSCLWTiu3OK3hrhVqewt9o65Th2VXCC4so/m1h6rk
vXaDogu2hx3N1ML3+FBcZvmhDjnKWT8v613HXH2+hegXvT/N2MkLWczbYdf78iSZBRmRSSNXrFS/
iJwnbT+XGI8LaFNUTJ+E23Y59g5qT5inf1ijq8ppbp7Ukqt1OhWqAJYBLG6mwoXicd09XlHQ61MP
CxSM/4Y074VS9vAk5EHZH5a3M7UC1YMsCpUIXB37QvyiB3gFTH/DZXE01thl3HVmIu6CH1PirDc+
ZDl6qz/Es3AVISilcfCknBStPdi3ykve1yZcTRH6i7CBuBAc6k2+coHaQlgOM/Hu7euCZM81jPWs
HyjdvoEUXiK4SH6tEl53Pe3qBxshUxWizlSUIBI9O7hhnu6hyPLE43wMpuxjljs2oR3xaCGDovAM
6kw+MkME6P8EE43UZ+R9HZBAk/Xh/hxeEvmHbI4zLErnnLIsOM7M+ScQAJgQ6DzXEhzI8DJINaAO
/IdI4VHtAT1eD5cZ1wcingfIvcaWW/G2E3QflCiJHgmoToN6KKnDIEmlN13u3s6yzlo4V/tYwiRS
U+NvsLT5jBVJTb19mnC0nOWw65fGMQ47jJKxyUu9GhPoXhIThOw/e4h5wj5BqiFWfZdbNwP9jC60
/DIlmRYpCCH2tumnyhtS6Dv9IPq2NMSWWjnD5q0Nj+bvn68IzNFIdnByuOWIH7lm5VqrZO96XBfW
aToDPlXD5GIfJCVOn7tNKKAQ3xemhUi1uvTPsHBrSQThlYFCpBMHmqh4Du+gU7mqza5iwCivs6y1
yWgImImqApdEh/MJyXxXUhHWR+qlI16f6gYyPrWpKQlnQ0XoRQ/8LR4k4nxe+el4SpNTxrw2Syv9
npSYMgHHMDuRakJuar/k7RYaX2tgnTrImY5lxR8p0YPr5d7BMV3toHEvfTDwYq7INJ97XEw/FT6b
QX0DXNmzjBIgbuGKoYP14sqowG+YBt9UxdLPJXxR+oIKC8L7pI93VscEJQzBTF7G68Mnpit7vuIl
HuTVGj0qRZOT/Z4qcRDCCqooHbYCCOKV8Zlghxa9MT9Tb09lNzLIJKGY7WOtXM2jYx+IsuVcRjJT
iGjIoNxlKwGVF+ej54vm++BWxy8gXe8PybDe3lW4lYVfFP8OC11WzPNl4XVYJL8yYuz46ZJVPRuJ
3Dm7AwKGPgDCRoX4xipLrNyclO2UUDN0OngJf5temja1VwoewwvMc6PKtiExu5fBdoNYtuubU4sO
D8gssasezuXoyNsrbVyTCHp6f58+UKprXdf4ZyNfBNAHxCnqJtqOy8M33aytDU7cp+opRiL2K/ZT
lzr4myif9uTcjgbdYQwq7CRqtrwGwgmdw5m7ZO+a7XUVoUR/xSJe5yNYxxb3n1+n519ePjiw0DVP
lVplP3bMO33+7G/KmUjVzt4IVE4yY3DUY/ElOrInH4eiPrQb9tfdVsH0E8wy+kOfpyjPall09N+B
5JUb1gWHR3RDZPyG9JAfzcrGdOlOkAX51CeZuRWyngOkIERrEv/v7ClH8TothhOX4/8LWy2JNFr4
WN+hnCACN3hoVtAYf0gtbcRBzHCK8RZJnS39dusZ0SNcXzebOKx2TKeNTK94Ds6/JyAQFArp1+Re
qp0dEM1o4BGbG3/c7VzHGsoPwSqGzACFEXLGWE+nGRFCzKzhWYfReYf9ZQMyrEVoQklxnHxWd+WX
ahMT28SFhCwsrRlKMDB7zE/dnfU15KX0YgLDrI0q7Vk25UzMBdXz9d8VBMbiuiVOepZAoDrUjsz+
m0LIRGNjo3FAL3e4dhSEjFbfmfxtYZvkjaRNQsOuc0yV84iaj04lM/Qjitmr35IYhX0ImFLsCTbW
ostbrzNAlC28PeCq4LDtI3Ch68iikQ7dXedI1u3xmzek1h9VCO77TuJ8woccASXog1plO0jU56kO
QeYjHpLm+TGZOCQ+Q7nUI9NrdPtLEgZpXVPSwJIe9VPNBr57V1sLkyOJH9nqjebp9IxjkQQ4kO0T
oIlFgOGnOnMdNpc1xlhtlY8Dr7UfA4F7wnRZpjNehSACz4z6ruFCk0E8WIzsj51x/mAy+6zbZFEB
1dbqkyeNcwNil3A5zaaJ727kn4zMNP/zdhUA9BS62MZp8TG2QWNNSOVf0w89844pAUKDQ0WQORB7
pDICeJhc/YqeSDCOXkueR9H2faSwMZ1470T1IF7o8Enah9s5oNjdRQkkU1kiweor4tkJa5KyRPpd
/im+wL+5jN+UjyRgXQiFIVPX3uZn7Ybab4K5B2Xl/a4YCf8GIAlHaBqpEeV5B4RwIX2PM/HnYhZV
qLj+5ujb2HRPoSaGg2UyMVtqF4P6GuTdSqTOCDJ0vJATurt8Kkb52tN2bwn+ELIf+RzUuk4bUMQm
J1qVyl6WTaoEk3xkE0RRY5+DZmQ1nGCOldDjCTr1BHjHbNWTG9iN9g8l7tV4mTKQJIyMjidfM+lt
6cle9NI/1Sa7WzVENDmXUH0AlrCSf4kg6mdMFfS6xRXDiNUegEePjzrmEhyUmwqqMiQGCrc95F26
0eMM/uc/bjVtfHQuZh3hhPXW2KB399JqLHKGYVUZp4jXNtE9moGrx6p+IiecanYQffLWRXsiBM38
zB4VJMMDA1SpUv80Svw5CVAS7RFiJS+yrL8zdYxfE8xzcV/MMlIP4FMkGvFcPdQQXi/7hxXt6RyM
2XXM1O7IDBokmth/Lqc/LDzL/04HPn3RHKgVMpXe2VXnyDzWIXFI9qTBn/NqEyQCa6aCHzxWK51b
MUeKp8v+uegX+/QJutabD/0t9/VrjiC/5/bCiruf9OyK372Tu+tKV+/1S4sECX3E/N8Ct2b0WArv
7SKx/pRMKK/L/j0qddh4qpIyTu1GixTI0L2iA1j/xxloJEkafVWAaRBfOrPohxSMxYAk7hTr1/DG
SX4HJdnQvMvP91/mhQd7Qu6iO7d7O3HBqd3+damDNfd5yEO4OMFDpVGsm+qm7WQVT1H+bZamOpFI
DpTSoEcGVWUWURIDuf61jxVtsTWjTw4FBhD8lAMMxWX4ibZXG1zU1Yf27jRsuyPXuRTwKy5dtdGX
SW8woomVNW9hWVGpKNs7/spdigW11Cdtde8vtRgYrmSJX/0cD45X0+UNmcoUCuFYhDN2z2aaOo2Y
zPT6VTH/okZFXRwReh0yiAYzol3KImJrFKPjB1lyQj67y3GSI3Ql3wbAmw0T+0xLE94kNbFlFiW8
kJqSkhTRUEsmXOjAkq1dKKkqKiEqM0bVfwuA2WjuwUd9+06fDqX39gObnZpqpiee3FKlFyLbG+eO
irNVAp14Hi5JZEfsIzUICLT6rYKBty8tEwP1Aj+BBu3JL4dlyFkEiaoyaMk/EizZpvYFdmklAvvX
zAktvuFGlqZahqwcEe1866d/LIKNPDZ2rcgiA+qg1ACWedOTTn2QVf04PBeVp5ZcdyT+FJurULvW
mocc988A2cRS3u98gMW/fYwqmAamPqR5cThy2Uc0pvhWk9Bj7NfxREnyahljRZ0B6algUVoIwQH6
odxtQpUKSgFt9qxvjK50lAfvRUHb6vU6kieiTf+8ptdPSLpex08bwbOQQ2y0IyeK1TrI2y/Pei/b
EK4dUKE408gfGCaHK3JB6BJ8XyBMzJzPO2P2gLSNQzugXPVCTsM12QUE6OHGCf9+Mx1k2wfp27eH
VRanpK97nMTbs6Jahm53b+YRYXV6wSc+AxmzKAnswBoKEX2InsaEGx02rAcKmgHkaT5W1KCWFgtF
+9DelnuWVk02DDO1Zk1M0Fc2uAcij5DNcTCfMzbDdGRE//Coplti5Z5+CPsaUGSY+X4d/rUttoM+
aHehGPehvUHzFTUPse3SPFFAxAt+ZDLarpk0UfsoqNZ7JWHJXnF8uyYM1ezPJ970eMDVCvi+EdcQ
kj7xnpyVAqybk/cYLLxutwDaGyDRTkJjp6Xu1vy2TgPJoKKqdYFoH+ngDiEunz+6mSsW9zybAoq7
IxUBPL+jqyR2jxn7BWTWzT4o2R/JL0Lcp+zSnv+KEgHTp8YmLdMhLDlnNRhCoJUi1HVNKkheMdir
gu3rtvDOmpgYwhvaIEmo3X/UGH9DdvZrmsoGJl86eDW9gzdWwy08vzjklrcykEpRxcVYfk/OSv+O
d4IIQ2Ga2yD6Hg8vo2CD/3MV4G8QKBb7UYI5gfoK9JGI+vK4sYcsJ5jCb3/34n4ncy1XfYooavPS
Cf/+0RTTda8aZ9U4emyVo5a5E6bFZDbwJ3VkYP3opnUFDpqq6pXSWHmUpJs3fRmUrGMT42eR14jv
AYwqbAzwZCjpuqDDot6wKNoehCD/tFoVMnwAHNJXkkDroCURWtxhK6thDhqsSljzumJshVKWZOrY
IRuLZaQyVD5DoMZMfTk256Afu9xKdagbdAPsSWRnkwLGycGQ/fMJBOItAcKeBrXGsSX683RB5BZ7
IG9sSkF/eKIZlk0Z4E6kbA1cjvTbqSiuGS0wd63iYErVcBeZwBEL+tEJF+9VeucnPvUKyusnE5DO
QUu8HfZO3PXzrJxfeFbUIBRbF/h3CuW9zY8OdwfV2LXLnHQjiWdqCM0o6ZkVy+ej/cTps0bibCAw
GIayDGW6Jk8wRW4zXTMeIywNjSPIGTpuFA1BNova8tBgv5C6yjEFP1OwgT/VFAFOxAh3nfnCwPCk
/g3OxjUU97YxRCOUIyUY3aGy4w/MAtJCz/7Eul6++OfvQDdpTBv2myqxGlQWelJvuY9aV4eldcow
6X/Szt5KCkUs10ohUZP7duw4BVAve2aj/Hftz+lryc8H+reQLTvVZau+uZluAGLxIxvXiDVoRrhh
537b04FJyS38sLTtSReBSXzcv5zEzgqmDU5zwL+IOIWeS9pSqerccsyoToDidr7Li+XzSH8w2AAC
boIpm8uBczBfTgnbaZf4ZRVf4d8jdD4LEIEiMk7dWejkQXOF0rCojEeHbTpLWBsfuUfW+I9WPilP
mGlP+vZwR9pGhM/5gHoq7g7GHLA2vklvHBFOLgLSUc/katN22g0ZGjiYrMRdybEQ2w9Uu+fdy9tl
BXe7/iIdtMAfSowfyctdrPlpjFGdf45j380SH6SDb9z1Uns+eHWvZ0QJdIJ7LcFTjmbXhyOuxeYY
f4rPqcGVvGtzsX6kTqRCDV30dh9239CYe4itt9HyLKz6dbXr+1Gc62fT9NwPWLF0GoyBWOcvaVXw
XNumYBVz6m9pZGain9oL5LM1gV5DP5k8bgia2EPoymh1v3QMnKCCVmX4Uhjyt8b1XITRwjeowDAb
iOlKMPIAl2VhjqrxGQlRbdO1R5Gu8l3G2ZW5qjILKdkZPPr9gdCgPd2hR/PYX+Q7PXZZoaIzlCK1
BawCgdHBDUeMpiB0p5p6lKaW3q6oLwJQpgttQEyDp1KDrAO+05cqgC5iTc9aQ0EGnjQaLWnZbM5Z
2CVfqycgkmE62cvH4oW7YPJ6fc0sREiwGGv4BeNDITs8GMmLZZPC43eJF5D1ikLKvAExEO9ktj8p
dCK7wssaeTfxKZge+/O8Oarb9LzYZbSlowGjitmG388+rlafXiXmsra8o5aXZR2d0xCmH+g1ZrFa
pEoEsXzcyXf1vLtImp4ryiJkUATNS38e57wd+a47u7he3jWhL6KhR0B+3PWpTCA/XMffVuryIePY
XGe2S04z2K+DfpD3nfkuXbnfGt0jLm4HYFdcx0MOcem2X+aIruk5bYYXltN+lO2vkF7vNWlh3SU0
ws5Xw1cnU3qPTbKkwZl7RJIllVVsJHUro4TkrZPxAwvdWfvgxvr2a+OPOJHc7pG0DXApqlDDcvoC
FVOMbNejTnsmyuhwM//vOawHe4B2qFiZDeb4sqMRh9SZXlKiZ9tf4D3yZXC1OyM0qjkOY8q4QD7m
8EGLeDk39ZzJIls1WDR0nEKQPn5cI6wI56OlF2nWc3gl7qNJzaIPal80HTScZbdx+qM0vXZOlEnz
kujspYqJZI0jSRdtL24AmC+WkJfh5XC48hC6Tw5FmTtJIXPmIcQgrQXmszHDGiYTCPEh14RRItak
d2LJ6An9p3nNdXI86vi8j8Z5tg+L4khwnNqzfct/tIGtjCRWly3YctXTagu992iKDcZ6bRM7kuRs
Vnrn3Cj9JK+8RajAle6WbhNc7Ewn/yO6DRKGXdhFAsexveGVzv6kMR0+KNYI5wVz36S4aMk4eaO8
ssXCE8hp59xc4eYSDAtBlAf3AZ1k1z/uzDjwxEAoH7JkJZoOHrdaifrvEsEz1Xgc6ybnatPf2mv9
rPvoEAv38KmNDzaJuCzjdNoaAVMBcD5pKSYSDECSGN9HfphgQOSfYPupbkrLklusCg3FPjWVxZf5
Z28IqLFpXKrt2u201e5/b/pXGTpSLH30V4DIbGW8AwBcva0VvmhBv3rinPrZxN+BQhtaWzBmmciW
4n3SGpOnXE+t4eHrltk80Y6P4HGMqxdP1VrPJVHOxXd2u9MmbO1R8Za30LEoxGwQoQf7fl71lHDa
5UcOlb0xYC4ry0TwLT+8ESJU5FzRc07t2o+vEZdQZge6cgV38F4HkOdkH+ivs+dF2TMpjudG2qqK
21N+R9HmYpK88u+7UVTeudaFBAR8trB9AREwmK6r6t2yCHTY3Dz98zXt25UjbCQjGNNFb7RBfZTN
X8GmsxoKL5bcLdhbhMVhPtgExB/QB1Nd2IhsolSlL7DFcHDdWmowLgqFo/yUV0SJm2P+Xr9aR4GU
a02bYd0SVFsO+X9+bZK+xXdmvsccxSCp6bFJTJq+VBRXHn6ldAzSUOWvbn3MyBjdOQ2ziMWngJPr
1j/kNd2ioKz2b/hcUxrD/PuF/99U9UkhO+FP08cSeiQcOsgbYJjTB2osRaF+JlwbeVF8R76nXTno
t0RBCCnNNt+VI2MDcc7hZBTMvL/TedAcNGbfG+U9noJ4yYUQ9ZgGVaH+HBlk8PQbHMHKitwhSX/8
R5SYeYFLPbr50LxOmePCOq3KQOErDLT83aXfY/exddJxC/TGWvbBilVZWUw1h4qH2qcreSbLMX4f
htgITeurxKgW4tAWO1GIA50rMiiDV5DttqOB5YoxJCq6An77DuozwwODGtnOXtP7gXxat3xPd5/C
9m/Qywh77mj7zOH1SbmVe3T+qfvaW9qzx6jWN4IydNolo4OR34k9MX6gayjSaAq8JxO4h45NPkO4
gERY2oHtGEUH6WS7bgE77XfJfrQr2BoeVlp/Xp7b6aNHEOJ2FHIcgtmttebPheNlf6JAHZOk7690
PqqdtJObw/hKCa2nnoQrl1ZagOsCeqy0ZpeAu/lnyra8uAApWdvv01EEEkRDnQEEenk0KUpQBYrR
yf/cB+TrE1MRBDIJ9Wc1EW+8fTaAlre2bgCj7CLg/1CAgU0Nfs+YpFZMQM5297ldE/22P4/92gT3
mx2MTjZN4FDjq8AbyGmE0DsJFFFYMaDGsrVQmN7A3rRR3KFzyCmwP8HNQsXCbaENnV7ig+7GEKiZ
HFBNVAgZQLaT3bTl1S8tUQQSzRM70dTISdWaeb32SO5NLWwWRkf6J7+onKXma6TRcyug6Be30WhA
30o9pVYgxEI0TShmrG2uqELtte051as0bvBltRFKtFDvSWkOUro40fhcAeVM12SqqaDpozxZYL0M
WnkiHoKoB7+mx3rldrrZ5IYQI1uEuBBI5R1um9igTzqde7pbJvhzTd+7aRe3q1cFNzN1gMT/ud99
UjKMU4fa/eihHF7zcE16oHIPmBll+X32OJ+lp+y8dhX/23qMSYvBe6VKlF6BsOLoPFfw0IKuZo4V
oBAE+znYCnvM1KA9RNxBjdQ+A0Jg9gpGhHSvaVGCytwWKZc8FgFJMbuK+s6eD5Oqn0Rm6ZAvKBU9
WeacFbAkua83ly0LOveCNkeajfB35IG2ah2Wj6P70p5EXLLR2aPvoedlRcNePEpV/RXmuhvMI1zy
xvz7jBWQuph+JxM0d3y24FTWPLHrYiJuul6dUNaC1/8aut5iQZvwhk+bBKOcmcS6wsu3vPgcctkw
kCUhLVJMg/U2DydVKdyltWCBRXdwcucyb3yBOlzTbKH7ugrveoHe/Eh6xn8QhhNNHmCF6nDnSRBh
X9fZm/DndtCq743PkcGUjRgyRM8xSa+W8hX8MEwwX1isDtCKZprMA+30fovYeSWJqS+qmlml32XA
HGvfprKYhO4AmHmS6vbL4CdhAvaqTEV5vYIlLgC3yFqDHgx/EtZbYI77F+SEtc+AjypbQjiXAYEe
r+8KuJ9wMsAKTn1HFb2gL8583wrgmbAXCYc6NlqgbwY/cGA6cS+W4d/2H6DS3khruLS68zDaTuv9
3e5XRflxGDOWQ4igXP1CZdhDJ05nqbtj33CviDnPstoiX3+08kufJ7+Cd2guPihe+dwyKJvu58vA
bl/NZ9RaenSsuCL88k7HkLzBLJOv+GhOs8zI05etpPXufwq0rprFue16AUoj1W9E/YADzwUx5uPE
UF8PfysFFXzQnIfQQ3j7M8JCnRMk0FJ66yecS/RvTyeyuTid8wL+Z5rSY/FxCU5nwKLp+R+P2WP3
CFntqd/0vAZr4PwBfAoYfUd/OeZdpuLs6vyC+xjH9Mq1zyDeBFPYwdFTwqxL3DTeKnHICIu+ZWA1
GN1g6YcBo5GFTK1+8IVXvAVJfvZ5u9qqAgbY546cV/1JKGdhnxX+qWGi+DHIEY+vuWkXMimwOtFP
taGhI03Livo6BBQnIEk15WKuL9LrOEkA4tEWmsCqUGvVbfrrbO17poMPKSl+T2McCSz5tnM5ngHc
mSL+tBBr1OxKYm6WC2OyrJrFHYYhLu4GpuW222Ac7qMAF7FZN2u0lDT6vtFZRSHJRKwzPN/nzXn9
y28P/kcHK6FCE4zwLRPgLs3dUCmPq/KrnDyTvDn5owaeVVtzGVtl+mb3v3yK0QwpG9wm5v4QO+eA
DUN/hLh6VPZtn7uLWiy5GcUIogO79zZo9UjXCNYVD3lWwhEVC6XyWQaPetBMQNpChKqf9rUBa0md
bRHgyXNQLgEA3tkQz5ra4WG2k1Db/BlslbtaKrQBnNgkLdfwbPjUtBvx/PLJbRBhcUl3KRbfhawk
zmPfHtnOc9Ag/JRg/FNmYPeUbxCm75yUqYDF6PzeeXh4FEmHFBXcsUy4mNccadr9e2Omulnr0p7t
ygF1TD7+M3O6GahYF38bVWDXMa07bl+5RvAsG8pY34EA/ss4kY46D1HfNBlavOxTeLv3oKY7NZEs
aiVubhbQ0A5vCG+LpsnPKV0obYcid/5kYYHdtJ68CPDe220MPA3X9jD8MB9uop2v/O8kl+D8tjpF
Qd1WDxoauJhZusctZxYunigYL+gN3Zi+gB7aHcOUjERrRkX9UEa5a15BC8YF84pR1myK20r8V3vT
3VOLS7VIfwOrYr+/na81khm81zIfenXmBMzlCiS/jF1FWPWpxYCHoy3R+HZZdE0ibRDChkVC+Sei
xdSQkQVr/RId6hWUuQhW1MqcHYwC+Vg6Km9uXIDGzou+T138gc7G60hBR8ulnC3gKLTLgXW5kW6D
YE0eaoqZY2cmaUajTJO5P0imrYPve4fxdzH5sOig2oe1NhVdsKVXgYVQvLgovAJViNWMtDY0di0C
a5VSYrwoayaE1Uh0RIHSIkvNFFdgbPwmPhg/HnJEsHRpF/+/IsQVuBxolhTqaRaybhyzV09WsNRt
bWOVOSesCHRxGPUvwdvZVPFXAOxhlHfdgcie0c7KUsSWcxVqH8ypbClE2+Fy1StaJULKdZAui2GF
AtvrVXo3QQbLQ+yVzx5ePOVHjAVduJDA+uYDYZVmJzCCo6XeoK33O1ZcmwvodpkhflsMs0eX0+Na
Tse/BLdhsfGSlrNRIXuGgWqEv8rT/pbewqQkHw6lwGsTG4qLbTxgIU4Q0KmtVJUk4z7g5SNAV5WV
CMxUQwQCKtMuRqFKlrFv1S3SFvGC1B1vRAhg+f7vCg6XtfJqDHbnhKy+l8IpK3U9r1UKSPQO2NsN
sw5qMIqwq/yBmPgnZ1FPXatHPTUWc+kqiw0ewCflSS2F5MqzYAVu97BCkHqNl64s/v3I/Jr7dlPm
cf6BmpSs8eB5rkstRA5i11OFA3fG0JtxnIqbhkNTj7lkUNuJkfpylJu4w30w+t8VCWveIG1wW2cR
7uYUTYgw0yMqFUlmRqJAOKKop2Kp1sreNKYcE1efIQeFraZUiE9ubmAKZJ4MkRQvc17HoRicgyyt
aSvMbyA1BIdIJCNnHd3VnrrQ2fbRFjs+sDmd04lztZCskRUlam3XD1Jg12FB8vhYLfLAYefMbpSQ
twDFi5nI2HO/ffHLTmCJ4MVpzLtfYrj/jY09fSQVUdfORDU1P55eZI2V0WxLIxMewyNptDBGvmEU
cUvUDACb2FaiyvIDS6L+4c7yTgn88NziO8E2XvYYcXlNgwYFRfcQ9K2OxM8xz8wFYl1CGijJA7As
UUuQkXQ4CXuUS+h58UGQ00iU2vOVtI2k+LIPKRSR1aZfPdRNpC44DdvzOq8QeIl0TUV5G0lw6Nzb
yvTTrupZoFqZzXG4T9O8ZrrNw19eRz1YulC2w1gifj2SW/wud34ddbveNHdPHromVLq/UHKc4KFQ
neMrxiwF6fAuLOIY0iMpQDpi0zffRVWGhcvhKWSRpIV5WmamTfcevkFhCfVyIVITtnv1siANOEaH
y7SBHEvYDbN4CDyHt+wkJgUDJn13swhfUHxw0kx/YIGaatpNComcpl6kGYHT+Ruyqot2mzGZljou
Ha2Z39ofzqmcH8dQCpQA8RIVnIs1/RI7BPfw+E2u6PozSpG/njlFmOO8JZ+75Kkrvp9SQfsptrfP
RTiPWMXFrdL38uauU72HqRMQ/IiSZzHVfzBI+bncSy0N5qRldJ5te3/5NqAkaGILI09HfG4rugEx
emDTKgJ1ea61U3KhpClTqUOA/sWH3Dx5jiOrN5TV+PgySpQKGeRuYt7XA8kXD3OJJCK2lsSFI7+4
k2WPIGhu2K8Lpo6OANJVQ/JOs6yxvXQElpIGbEONUcaZNq7FdmGF0fd6Guqs+r/U7dsIk3FXB8xm
xoxbtFLjFZoVyxcifP1fklRQEcRd2rmxISFcA4YYWexVOtF3zVGVwVNv+KSnAiYJbihu80uYUVTX
/5WzXmRJOlCAOzFJlPYr8pJmV6YldYFXCUl5VAixFVtbYU2wYgJU6uMzHYLWpNcsZ9CAqhSDe8iL
YhA6TLcnwxCgq/J28MJbYq38Pxm4RvAkyH/KYqFXww+yyLQldgnZuDuiRYhXV+XP4PxfBxiEf27B
/aLGq1OqOF36r/AsBzpsqqbQH9qKbR1iIOI1r5urcgzEBYhM+02tqdWffusw9nKaMWyMQhE77POI
czmS0xEeX7UfXfsfh4Tdl9g1j2aLF3S6kJ0fog+kneSYPuP2gZyc2xaawy5r0uv+WxO29dJpm8FA
RZhIWUpw9ezEamtZjbOeXuxQYxvbcyfYNmvThZ8OW1odG86+Q8vYTzduLBh4bp47t5bBqF1SLXD9
yLQzCud7Dn2HNXajLukHt/yHD8RtyfKm3CrnZK/P6vk31OTMNeymZvu/XhnAjU2sKhQldtSvJ6Qu
OldeMPM+0QP/0YZRq8Ae6KcIIEtpIyP1l7F1AF1aM2beYnTQBvzVDxBkatnw0yl1+iHNn0eGNl0g
zTj1SfgwZ7JY1Qr1LIauM9YfrZ3cY+ReNH4mNTlPwg3jQ2YZ2TMwzheGYRWcHGGOJpwCcr60U0gx
0IRdjI8z18MhUnVUVVYhmpv2TvVnJfwaSvCD52PfIYag/i/Fe7iIOH03M7OOCHi+kWATYVM4yJpL
yAF6a7xPnF7lpP8dguNoXu7Db41d3egTxSr71vNbOXKWVFxgm2fS++CA+yzxVXsJw9KUQjX7gL3k
HRgk6Nb1azDYAVb4ubxnvFckebqFgfmsynOAfmZQLNZbfNSu9ByLxeWNCRKyuHZdLSs8/ylS9vsd
GZRf/UM7Iz/psU32cqlkZXQry9oBlnRbDb+WClNV9MMpd+YRwDDzVhNy45nNXgflnVSpgMw8sVwP
y7FlJmupoof4Kdaw5tThxmrsSqynuA7/zLdc+mjeHvGx3hYXnbyWCXWXwp+tXc/azV4+DiJ3kT4B
CInPJ6Hfb1IBWitFP8lxJvs4mpVhzBs8y/Vu78PkRKix0I07Hbx1pouNicKXUe5+LRLmf2cACC4N
pEmTGr3biyShH3WrcZMTL9wA0Ag8YYoH2MX8PeA1FDqBi89qLXjREJzupTTQt35u+nQCFmHmL2GK
3iRk87tX03hJ9Ij42Lr7suM7ZRXwm5md0E9KR+IehijybipRJA5MZX45s02rrhwaRkb7QIrvazAi
KrAL460xRXygxPA5I5wWJHnMboy9qTTO9HWGkDSLKcCqgt6CzFKHvZ9AXgUEMdh5MLIzsXxEt8lA
kWPIxoa17CmjZjxH4sT32zrFWvTGbRhH+sdC8p0yK5TMDWLWAVVP6cvwuBRX/4ZqyS4BmWTPApjl
pwUQwN/KejXHot+VVIgbcKGTTcheBosHKfXdLLDd68BKQxt62u4p9iNT94Avg9gDU7NrDCEQ1rVr
KkWNtOkb/wsCoRdYbE0CnPvPW3fHdCKeUgB7dfn/PDgqZUpOIH22LfzkYbgOGcBLPvGdQ55Iby58
GJz7nI4qIlfwtaCcD/Wvceha+4Le+6WsIIiVr16mLT9itM71g9kS/dtkvb42xHQ+9SAxumATLGQH
8YzGefD+WwmU0pFM/yRR+3FE/lNPEuaol0xdrhgzua88KLpnPvys556Gtdy7CdazWR2O1dcI1Vdy
Jm8LJsi7x6ZhCX3Hudtmy+vW/P3VvzHwblSfYGka3tspOl+XXUtAxCLI6YUfd10JIda3scMFqCOQ
E6vVYzdCVfD3xGe/T3uD7/DprDZRYuNP6aiPlfBRdKhOvMiPEjxtYjSdEh0AsYmSeKjkbSb3dArp
P1/UjLfFOrVe3LCnUnF1u10t54GK2VmGFu250wk1+Cuhb60d/9bUcfFGxRf7YaCMcWKVa0QmtMR6
l19I9Fcoj4EweVWaM5RtvV0utruMz+VY+0VtBVIX9URsC1fM6rqPXNpL+MUmya2UkTySfHv/40X0
R8O8nu76dq4r+R396tGfi2wuPIHsJXLFuKpm7chdxC6cNJ2YakGROd/1DNmHR6HmJUhFTrTFlaSc
BYtnYmRhKfwkOOc9KIYc9pEZB5F8wrFURXUno8pZnVzcobyHpHQYOQXImKbr2vITfHGLuX7z74bX
CNEDrb7Ej0jgsbS8vQCacPlkqMAEhZifM2p3RcFmEYTXAaaVOkOsRGAacKt6dbYjLx7tV9e7PCEA
xtaEf3M5psPQbkYt2IRInoqK4Uuour9uzyNvS29pwJTllRGf9FEpAXWDW3MZJ5NNq7zWVgzquyNY
speShz03oaKmGotOvbcwg00rReEnQIKHdJ+y7+O4jKOE71NUp/XnYRQZVeHVSWr97zlRBRFZFv0N
5gvpwVV+4ytFsKqLOAeeSLQ3XRyOdSM9fCYt4BuHxl3vY6znmTusbLIdAJU1GRzAr+qJJfnxPzBR
8ZfUUuPMbWAw4eYjf0siUEm1vg6okBOxbStNQOyTUjd+EDduXeCn3Ialgr0rQWLf8rE+G+WD44aU
QcuKoUkpO+37sgTGBY2yCXtAILAajiu7ly1x9ovdgxiBQ/lL20V7YEq9Skndcy9isY11jzplSf2i
lFHGrUFdm9g5OnLSNCsHI9h+ja/es5eqalo4L9Ab5ufmbCsr2frUHx78ZoyKtNsrpFsPUw5mRLw9
/GNDSgWtBUZgSVoZbRdc3qpZUHbuw0UO/gHgkCwxvxiFElQXQ4EygA6JN5lBrkdpvepMBsovCapr
LwRvfC+4CP486cxL0b9GO7r7IDIaZl88g2Jt2qsVQWKju53RpcKJPbdsfzck905k3dSTrh0tBqTq
TlCe24rFLMTuIbRw/1L3T2xIoIv0HaYA1BVroWdvrc5guLN3lEVh1ztJvdBzzpLgDb6A++fJ2LgL
8LstvyDdLE7t7itDGXJ3KXRlZldOBfNivAbKuAh21OYBhsd9uHv90+BZleGfrrpU2Pwyqym2I9ZY
1WzhAX1op1fjif2P5FD5a4s3v6CuPfr4s9B0/BElRi2z6xil9TxmVtSnTSiHMABUockorBQFNBQ1
n7kfhXHdU7BUws0SCjSO5pCyTZE7PIf+V5prQh+GQIsPgV+i9OCLrCMo7FX0ECbFKQm4RzspM1iX
hHFhrlVo6cnz5tFbucewpvcCdpyMx9Fh7HpsMhot+wGY3DLxxPeKCr46idsib8YkEyzIDiN5jTp8
e1vTAi1gQCEGnBhj5CIebeFRkDBKwxK04+T6X+EykqaHMCpA7ftDdYgqz8NLCkJ4YBklrVXP2WV/
eunDgsvRSFtb+hkQexAZw21Vd5YEuYkb2us4AuB7TuJLMzvzH3Lyr5WlyOo3kRBUFgDX423+ZJLj
3mEcBeDOVbfH+N3LnR/GoYxxYQ6dh69sq6fgmmmRGNOw6t0QXOl0WaNlVJnD4IKaTwZ9n4Bwb1qY
gI93rAvsC626r5IeTEbzD2sSORScOXPMs+Admu8CFH/wi6S3X7b4uwNbk90I5/HALySeNcktLzqq
ZP2kkwnpI0HCAoOH6zdOZyjSp+1nBc/07T1mXyh4R5c3XEaza9saR6f0xKD6Ce5CRnu8UA5Ax2V8
rQvoOxPf0Y+0dlD+p2iBSbR7+SAB+Dr0fxKL3ciXdwP6dicJt+BSwL5TzoEaUTgE3WwmVdV7k8TZ
PPjxi14OLCgPtBk1ngKetCzYJQ7BPMkGflswkBtp/jipKGQh9BLK1vQ/UTv35LQ2GluBL6YQim53
CGC7lUneOJP2bn6oH5jaBfKGRfTrwf0rwFahTkA7MTGX0eo0xEbrkDMUcdv4tC2P7ZUvsqNh4GyD
7FyOLAGURZREkJm59cOKWkqW6pWEWOszIX4mKt8QV6qJ198IogTV1uVk7yO34DC4xEvGBoTi5xSR
N5yYnLfr6yOd4wlUgC1uvGZOUHk5dYNJCprJGPqPVfoxfITQpjbco2URJ3slbnl4X08NxFGFXGgO
3Ar7KAW2+0VteweXW/ZRo2mzhM4Lkjqx2rD56UT9eWF5MPFddJYjTiFFXXfy2oFQzoVCAldGozas
yPH2pRASlDGCkuYfJMZvJeKktuetuz3FEVcXXnlJGZONofPmOeG8u0FM61t5z6X86NIhFKbatUAm
qw3vY6Vh65DyazWq7XUzd1ih5FkqjC/Bugf9TNHE6GmWHXEWh5tkOIgTLufMy2i7jmvovjJcpuCb
EerV8V6uxRRx1M9K3zHF/SSEwocsNMjVUiOREAsbyvIXZbmX95kAN0yixA21yASCZRWJ+8oFX0ry
HbgN+Qfhb+aqmcQhvQYsNuxtd57eXGCEhQZf
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
