// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:17 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top cross_logic_gth_load -prefix
//               cross_logic_gth_load_ cross_logic_gth_load_sim_netlist.v
// Design      : cross_logic_gth_load
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth_load,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [63:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
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
  cross_logic_gth_load_fifo_generator_v13_2_14 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54400)
`pragma protect data_block
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
IXvnp9P02Ka6x4hTmEPURrWaHrgdfA==
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
