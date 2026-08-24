// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:24 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top cross_gth_logic -prefix
//               cross_gth_logic_ cross_gth_logic_sim_netlist.v
// Design      : cross_gth_logic
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_gth_logic,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module cross_gth_logic
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [127:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [31:0]din;
  wire [127:0]dout;
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
  wire [10:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [10:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "11" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "128" *) 
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
  (* C_PRIM_FIFO_TYPE = "2kx18" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "2046" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "2045" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "11" *) 
  (* C_WR_DEPTH = "2048" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "11" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  cross_gth_logic_fifo_generator_v13_2_14 U0
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
        .data_count(NLW_U0_data_count_UNCONNECTED[10:0]),
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
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[10:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 69488)
`pragma protect data_block
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
sDgw4ME=
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
