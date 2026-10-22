// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:51 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top cross_logic_gth_head -prefix
//               cross_logic_gth_head_ cross_logic_gth_head_sim_netlist.v
// Design      : cross_logic_gth_head
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth_head,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module cross_logic_gth_head
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
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [7:0]din;
  wire [7:0]dout;
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
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
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
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
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
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
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
  (* C_RD_FREQ = "312" *) 
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
  cross_logic_gth_head_fifo_generator_v13_2_14 U0
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52928)
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
