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
