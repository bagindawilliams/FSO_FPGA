// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:55 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top cross_gth_logic_head -prefix
//               cross_gth_logic_head_ cross_gth_logic_head_sim_netlist.v
// Design      : cross_gth_logic_head
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_gth_logic_head,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module cross_gth_logic_head
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
  (* C_RD_FREQ = "200" *) 
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
  cross_gth_logic_head_fifo_generator_v13_2_14 U0
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
