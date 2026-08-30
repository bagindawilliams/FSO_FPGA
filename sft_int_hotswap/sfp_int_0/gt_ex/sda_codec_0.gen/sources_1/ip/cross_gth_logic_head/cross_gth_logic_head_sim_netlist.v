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
