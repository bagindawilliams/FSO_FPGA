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
