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
