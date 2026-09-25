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
