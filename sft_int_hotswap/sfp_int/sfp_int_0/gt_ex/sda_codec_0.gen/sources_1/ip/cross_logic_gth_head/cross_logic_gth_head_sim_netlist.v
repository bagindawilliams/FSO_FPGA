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
