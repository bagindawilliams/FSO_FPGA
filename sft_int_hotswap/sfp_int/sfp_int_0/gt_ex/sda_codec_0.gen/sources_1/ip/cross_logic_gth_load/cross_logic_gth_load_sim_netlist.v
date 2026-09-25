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
