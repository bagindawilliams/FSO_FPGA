// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:53 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 312000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
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
  (* C_RD_FREQ = "312" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54416)
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
