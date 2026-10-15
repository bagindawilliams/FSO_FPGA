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
