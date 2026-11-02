// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:53 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 312000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
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
  (* C_WR_DATA_COUNT_WIDTH = "11" *) 
  (* C_WR_DEPTH = "2048" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "312" *) 
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
Zo2bK1DOmD/EWgHN7/pzxJ9p7oDfbF0skf1n4GxxjLfU3Y9Om8/NLeLa1M98rJOC0y681lgllwCw
nj3MytFEYNBHPn173X3hf4CkFVWlMsCzVQnMOoGNbMnwClxnm6t5uG94hRBLNBuJNqcFyxPWsOT5
3zdBhIRSaxVs8SAAIFfWpI+19LbPQJm/RjbOvrWfJvwUBcrfWcMHUc6orp+w4UzKK82JHE2sXYxq
0aaIWTj4p4jb/w4sCHXu58VhGKeX63OHuTDVgBiDbXK+6Wy9XeGc2OVyc3qYPoRi6e56SOUu/RKo
RbgK1Gx8ATRT+VLNcVLCxcbpldAlHwueL0DOL+Q76VB5wb7G4rLJUskdZOtbkz4icGH9O83uM9dp
6y584pzhLcSxCAq5EI9ZinGj1JeoCUDwdsArZSmsNe2Qt9zUiFSjeVV4ixrb1SuO1DtBU7OvGAOs
rWITURz6YWIRGfevhZWPAelk6NNL6nHSaUrjbCUWpsoxYfpbwaAEWkprLQ/SoDtuy35o5L7V19KV
E1IDY3cxuu4gahd/RBhvKHVtULVZziaqiHM6mBKjEYXpNJGsdCzj0/g1Ichib92KIIFHnXjDKmFs
NabcrjHoQac7gBa301KtpuUMuRdlUTiO5XjqRaFXUizaAYC7jWDHed4FKqXHLNQmYN8f+/sbvTNZ
G+9zOLhyAUfb1z6TkxdZiZX81pwBGxIxnGpTbWKb84jZkwCLtanoOg9heB0JWB6g1wuStOLTauik
4mFBSTsOxI4+jxGQJevMKvVcH3UzqXtdM1vyIcsQIdOYnjajLpOHFGDuPPrzxCNfD59qeCPKJBcW
/ymgOz2Q+Z8bh+YSPaSRXkT1dgGgWydAZcaz2LS+VREkNL2It3iPdIBKGrZDc0Wv2vNMGmS68gf8
zetc+O5nOJMsdiMq9CBREqHdmdOvpkhDmxNjAOZf6NwhtKf9SR9V3QPQlC0MGE+SGbX42eyYD/DW
/Rn50WUxm/oxpmJ+ZDEudiRr52uCGHgEf7yIBD78Zh+Yxp1zX5g5ThevTENjYOG2Xl+ilNoFg8Av
7hAIhKjMww0JmqytxoTnz1clzVb9Vggf+BDHdvwFp6lU2PVUKDNgGd+SAdBAKF+U/7rHczxCOJPq
99OcK748nMcToHbB9VSdikx22bAmu8TGA2rLOZ7ehJ7H2cPQWMbhsQtX7+U3cKC8C0LmnreKqGcF
gUczaUMAWG+z3LcKsBeS3rGxzqHAj+qYO//3Lv+vCXHlGPv/fwwQS4uwPi2fLAsSCXtxNOoiB+Sf
rihI5+92MGK5JN66miqm1CtzkzHYQwldRBhkh2c7RSfu1t0zI6caZU/fDLrYIXjkjz7HsDZRYYVd
otWBXYj9JKPBZkj+lSeRWD6TwqfbEBHLacb367xpB1vyaqOwWqr3FFbw9N6/P3ew9GlLP2EjRtPT
jS9K1niqD1gtpV4lLiNXnMwZjHWWumhQ7Li/dYaO9IZeuI+jjHFddZOgE5cRaXT0r5AptMsXUdRx
M9OR2rRhiNTlodtgouX4fzZALuDttI6IgJRGZ8zW/E17OPfkDEtB/lBgpZcMFqtwzfbu+zxDvihF
QdtmEK1Vp/+w8MxMMl2vCTniEXkuFhtU+DMKTU2y22oy/xYaLTDD/dVC5RROwnE9pSzVJq84ls5q
7r28/EIQcBIiUe+RWnvTiS67eZiNUy4zVZIRskDnmHnf2gzYx6H6RN3OnPzUQONQl/KtW4qkM9ZZ
SeP8M9PvMicFZ1ORl+Ew7e5yVMoWkVMEZwFzd6XMHDiVnOIDhxKRgF91npgqDZEMAFokN39AKJ/w
y61a5rYKedIpBP6SwTP2A15IRo1oZLfVH/dH47s10pWY3acIhzl0zcRMWFh1JJZgRey1X0IVKAYb
WW1+mf1TswmUmO5Z50oGQ2398ux4MBFdoRNsYwBJkDd9+f0ofSzPoFfnc/bY1E0pJSp2iglbT1vg
o8d0umgfkFjIw83JTCXs++ipjWYFJMnoDVYF++rhN5FdcZbrlbksiXki9dU7DCkI/7bjj6ElNXH4
hwG4sgu9w3LMOqnTIieNILUh0ckruQTjGAdd0g1fO83lk9ElN5jlAJ9VIb4/OXerD0XjBeYpE4Dp
gJimESihJLk64HxyEMgu408uuNbbI3Ih41NwsJ3ebEWqDEiEdq2aD6Jnaj5Kx/WdIatGrscFbyac
mXTqDQdaiHD1K4PGuYXbCWBN+LxuhgO3Jgt2g8x+kuzWLuzdf3E7qhhsAcFsvpiXzF/TxNSll+aZ
zgC95YmHeSntzU4We6q53IhuvJ6LIjozy8m1oCL+P8gBSvAYrGmxyUM0oUUvHclBn5+2POTVgPQe
NjWr/es+p5YxomTsExAveC2HMwK9P1Ky5Zc6z0Wz6dcOdKYhpE4CDZaVJ0sWKbNNb3QvnVMRfDf/
KophCWC78H8jfFQQwjjpEZRP7WJXXIRnd3UEeWXDjBe3M3a1qw/KaaTg9XrC8yfuJhesxQX96FpF
qjE78fIi34MbAABcl9VmAGCQTIrkQ8fYla3LME5yLEs+CMEBDllNEBo25RU+ty7I7fp8J173SkLi
DZxeVsQsqFveNzXM6jZvuMj8puFBqgwTr3ZJQ3O5DebA8/1ap9LHFchW+j4LPwiY0a3g4QiCU8Ng
D9Ge66lOrowpT0Nkndils8i9XjriGJgta+A9XSX02SDvbYMRFCi/ZgVaPD0vqZaZ0Ryac2VF/9O3
l1P/5iU+tINNdMBo+FBeJdzYvQpArgMKVmFZMHwiyGomiDLWmnewsADfbbTamGZfcMDkeA+bd3dH
eDTdiVIIZ4a6ZJY1vVd9JSB1z+6y5BM+xXSeIPbKOlHXZmGd8vz+6LTXNwogeaSyxb9h3KCySikO
Phg6n+8qTWDHUDDroe+1L75dkREzob5QOgtQAHJo1hx5hiIpQl+y3heaEAwmi1FcXi5ymP6zPTSh
39EvtKjwVlPAisT8pdl2m47DedoCe1srzjimxR6JcjoKSNta0olTm1OIDQqYPC0nmMw6LnTrS654
26oJz6BbaRRu9P7pZa7pMdt2X7Xil2ohgXYsp4iIABlmSM3Sio2PQL6tDcWiFkc01v/CF0HFHG8i
cLkYPWtGS2+kvYHY/qRzEKQYQjzacr8aO+daeYAhyq24DFGNJoo65w745Y7U4utQWcwdBcsmO+4W
sVKGKll7Bu8rsnpSdfB5CaBP7L0+GwnvJLeQWnKZNQIOSGWPmXRI0EumvspJSywcPDSIybyrzG1h
vBFgADIQE3FPZwBn1hjqETuHT325A2i9s0Ne4pCb/W0F1Wl8nVHqy3b1mpcVGjgjjaD3zbOkI0Lf
BzNzg0781ZSLlIYVEuWsmx7ry3VK6QwMHA8bwJCy484anNJ3bRJE/FIYV0mK8hdxmV2fT1nHBCFz
2Mpjkkv0xTgpxcVOojaMMv4mret5Oz02tVisB/iL5Qdf5O8LOFoU79RyohLQrz/D3HiJz3Efjdx/
vBF0QWDik4QsEh5s9/SMLKZ9H0KPb2yxOT3gVg0nxDLd6n8eWnLXqv8TgQ/AxLDuVztkkx1r32BS
aszTi5Ex2oU8zdeO+GjlFJJtFL698IUUsCeAmw4FoUEMSgxAMrmcDTy/IjN09nyfpwunqvab3ADV
Kp4iue6FOT9hoHXL92JPXphZfmTC3hqsb5PQ9g6Cnep7E0dKDbUq1+9p8ZyKB8+1unJVaHfBLmcR
lMNJqDI1gnyMr/wf4/ZO9CfKqrFwnwKlgVpU/oflvqSYGxZU6bOqELwKt1ZqomuHS3rgG+JtVD96
xSuhU/h824u9SFrVXtq8/0OwiQBBFjEn1fsCmu5DHMXjXJvFNAcgfcuC6q2txd3xO9wB+sXpwksz
FIiAu3IdlRTkkDUWv6G9SlncPI59AgcpCpPt9MUx2H2Wgi3seDtMZ/6mvKWV6zDdG6Dhcyr+TBJi
EsGv1oG0QQf0+0kvuOzihWbjKSlO50HhMB+jVxbkmILzaCEDEmwJMYvbWlo3Yi88JqpVZPsMsxCD
j5izvarvZtbwz+6Uh5gdGuvB0x67bBNjXtu7T/ylB3UWtLFd7hkVsBBQOo7GWkOlUwUSZndxko02
JM5qYm+MOuPicilKT+bG+cy78I90mCoznCM6E6YoSopo25AgCDeXC/Zd1q1bP1eQ2jXIXbvyfoJb
X+mxg1Q0X4+RQ8m+C68JSkk/xtQIrL9OjElhjUfQz/+OCWb5QdDlN+/+zgQz/mBhzGT4oWbO+wJ2
nF0QthSmZ4JYEQyO0C6+KeO+oqmp5GoRa/whlGJh5hpR9tZGMbnxvigU5YkkEHtaiFCWDJFOxdjV
wafGjJrY5tEFe/6FanMowvk6gmSa0xIhnmM8e9B9BL1FFvjxV/GNznI7gQ55/7amgqKkyyHYsliV
ZJUs3l3/GT+OgI3rFlNHJCJbcb5r+D0ZhGCxUFfPU459Gd80cI12A+UahLWvZEnb1V86Pa5rLvuq
k7PjJV2hGFL7OT25/7snnBQbvjOyaCPpL1WAIwOlnFouMteHp2e/zLhODi3mXT0QyqbQ1l2opDp4
5SBifg16XfGj38GKFE7FwJm/ip3brsSJA8fKiyt3bQK78NoW5HUZ1g5mP2JpTCIcysIS3j8xg4Fo
oW+lN5ukZlZa8aYrjMWm2mZ3zpxvM3dSXiHCPoVYiVVMfnVUiHKpcfcaxtJhqGBaFXkqq8YAG628
1NAqSuqqfpwO/VVcGB28SwPGFTB5ZPuytFd5t0ZJiL09rLRBRtlHbsIaQQ1ea3xpI8DjWmY1dXur
YzaLqHAsMu5cQZZFBes0IG931KoESLWL8Lnzlljbn69S81YcWARMdfMbvJAWm+yN8SE665w94lEn
AsA+QEkyzPA7pcZMmGxLNRiaeaiwlpmp13vv8c9etneer7FQcrXxN++E2BJ+savRP44cfgjXDV+5
GFHO9wXEidWlr9iaPoO3PEaU9sxXOSC3iS1fAnUgUyLAvOQzW/edv8MrOIPB2qBH8tUtMV5cyp6y
JCiWHgU6qbddeHtEbp6hJ40+r6Hhr/zGOxUIxTIBXdjDc0cjIrjcvEb2x0iZ/7RmCGRwMD8q3Ql/
kZIndaqzih2ERcA/hHaolMbDbWw9QbA8xtzuFi2olu/9l7VIDy3W8YmLK27FoXyCmciWfkIJRzW2
KYeWJSX7OPYZbs+0I0D/XZYMhzT+ocfzJdd8e/xKuUO32ljPuyhVu1ntB4Ycp/fb7+ecbwuER6B5
RGPCtDpHJa52mHLRf6JFK3u3Q8X2HxyrRiesEW5cediPhaOuVUd8qJR0+KBLGsdWEt47+4LuANpb
HKld6dzdJFRLXAJqC0MKme6nliAw+xQEKgpBnXJKj7CWr1oGRU9dlf+WAK7Wm7z59hoeruht28XU
uwIg1m9uP9DjPwmdaRk1BCZi/Cltg4TKw7yVYrCIQqRD0Oglp6+jcv4jTgOqTHUYswaODPNr7SN0
T4VQNPK9DlC2InlGvYBS7uLiPMtyTAQj1kPh3D5Q6kIe/EubDpJFcxgDQoWk/pSTXew4PfiTr63l
C8o+lP9DEHZ+JHhl8vwfksvUcg8dSNba0Z3u1quYyxAvkbhQEPIwBBqkcxIjSdRiWGwUniCJUCC5
B8xJXrPjVzcJyQo+zQuCJRZq+qI5dARLqySmOOlVBGNYcxLpv/KwH98Z67mSu6jsmBN4XnaW2Ht5
GFBahgLX8AjPC/vyd+50SRyE32dpZ1ut4fBSDueDoVIFRRYxf4BcfpNRVdEPvTwdffkYx6mQjEyx
z+wuuG6tjgslLOdvA5MMIMoybZfxLv6025Ws202HcKpvIjM7iJOiBI/l1ubwA6xWqUpZX7jtiXU+
6wqkrRoX25Jgck7CI9A0S5hCrRXYpKCZ+iTryY89hwCwLd29y1R0U6S13Ub+80/Mf36rR6v6Cj/4
GXBwrxiEogd1UQ2rL/m0qSV0fMlRawy9fv3QqXmAuODsOGFT2td+MqnFk5OfPKRlW3PATYebbz6x
99QJOanw7dOJwwPAbRgzdK001XC9L4F9M6SqP/GZex8ZwX8pJLmIDaqIQAe5+0ZI8gM7FuFmDV+0
dIDIK25o48/zShPsYhKRtCqp0OQl65BbZFGnPVP0gPPRSRLI3J+L2u6XJaCWr6hEcQXCg1SONno9
M7UV96XUBW0H3bkRW8IQIVArE3v1Qbbxviwt1pilKxepTST0BBlXakBTG12oxX1c2DPAflEh0FbU
Sfks4AdmhLolegELSjlJcN/PJNI2sf4c4I/UTcuiHyIteP3e5waAqeqTGj/zxJNUXM4T3W0r6AVB
cFJxKEhUen0HPDNKh1OkEe1OURQbX60B7ktUuPLoVgSbWkvjh4lJYeE/kk1Z0kTGVZtVWjGc10RL
6L+u/qpzCJ/R8fs2vbF+iCykrOrwiIV7Lhfj24ulb5+L+Q8ykE4CfJgov6mA2FXV3FoTUgcD0ruh
zW5IhB1pYCFdvuQ/EDPM5XrFZPriOWfOEsEe8aMZoswdWOuTsKBGD8bBQZbP1H693sazDlltiDIT
tUj9UXp/HWoRiS/UsIEHN23vtX5F9jm2L8IeDWzwcgMESN8OQ1d1mwDiXWmRluZGXmNPMMuQ2JLG
G4+8AHtctIZ7SUO4o84UXmgFKYtYmnU9bc+YgdBPSlgJ74G66Yb5qf2ExfTEvFZ+Dhcf9Fvr2It4
OA8X6CyN+EGWtOI/rdMeZfLYXG1spRjV1C2IktpOK187WZ/sxAFmh60h0OmXxsGlTkjg/OGGe6un
XQQnMjRgiWgXiyyxcWqBqwZ0xjaxvNx4jL1ihIugcNRNH0JbY3m+itxeR3NbuMaJDBNciSWBG9Kj
kL6aRdPYP8egp0J82dUHtbng37ICUkC0xM0tGCp+k2fKSpdT7UvEOgWX4Ju8Gw/onCLfa0WJD7bn
poZcd404XcUEuTfC6YutI7GpQi04kxTd+fRQMnlWPQIRO/OuMc8HeV1SF/1tAbwBD2ssv65SNKvJ
PGdsb1/ASfbQfNxSOYsfS+YkxuP1ZFn2248DRk+SaR8PxJvwgYuFx6QDTBDTbcjpTBkndQxB8auN
VpO5td+JteZm8thh8N/SJL6hIultrOjG9Ds0l+Ivvv5yjwsm+pDh+CoU9vrzcxejlWXNxwyjICag
iQCGSzytxzyGHiKJcOoWeVPLWtsOHJDWtcFNze53WSbPUjiYG0f7kKhJ5lKU2Alrja5whtJgvoM5
s/ECQ8WsERvf/qGgeQS+e9o9tFr4piLmuJBn2QFobSD4cWkTU/LEDIc06Ov9027HZEGaU85xqmYh
jOUFPffVYmHZtKwwGV3FWzmLq1YnUGRIVMry02pol3v4D3RqOu6xIV2m2/1YSVPmmgBb/IvN95OU
RDgWdGr4G/N3j6yWa1zNCNO8n3nfsj70HX5ZyzdaSM5iQ1dgMTA9EQhsnQgtbZ+OxYBavcFmDePY
MeF74L+GNo2F4iB6GBqG4I3vRH1SjtjIPX52frse4NRP2rercvqA9XOSljbEKRPMeyWcBQlFfSTG
EvufLINjJOqgWyXj4RYvijOjU0/pkS5tCqNLYqMeRf1ZYZSEZD6VRuVKttKI35z0qj+WRSiCooui
jJx+EEYB4o9x+IzLEtw+SWxb9kyLfnjl3AQkE+K120XeoEfZRPe1hFCgsoPKDG9Ln+Wd2FPjG06Z
IzdVKqL7IQoBecBwbCFETq6fcfC6paGg8I8mGyxCVgiG10PL/diyZAMJksHuuptlO84XOu39vNNF
xyv4s1G/pDl7/zRWB1C9rsoEqmoVqBfi128ujXGjm0UNU79UjzA3KhXsbAzmTAYzTUpFhMzxeR1Y
xYfqckANskmEuhxGScQ2VNrdEnrp5/fqV49grin+0i2O1cfm4pdNW27NrHbk1mhqEGen5DnIQ4Yb
flipqGil+f/l/jQUgRy2IBJ6igE1V7GdHq7Px1+NIvdgysbAze1PYbAkxy2Y0bxtVnMVYSdcsVl7
SVAmPXQWrZZ0A4OMbsDhQY0Swc6+ld5bDffDtJ5PCHmTl7XUIW1tFTi/3F8m6EQ9DRR+modW7uSG
xZOVKzgElsgQg7o2XFg+hT9y+a8eGqfSnVYgpSheAex526zA/QAU6tUecfCXOJhLgb5Vuroqfepf
elCNJBddpbHQwc/htwVcdA7pJIvWXjI5kYSlZyEmRdS+rdwsbpdrTCUs7xm2zvgzo9oYHr4aBSX0
iJtzbQDFQOFtmMbsRDsFRERGszsqs+1T9nUkeIuqI4SKrLkYs+g0eROY3BLwogoAZTsnLP+6dado
jr+L4CoQxX9kCSMDAqqzCeZ6oT8jsgJOgAUXJXedWJyvrNnUysSa/tJuOpauq70n1r5Plt8qJqEa
qeOResN9GOh7kTSLzBTo1QfQiiR4oR6u55inNfRwg5FhkeBRusF2mHzZ8aVt1D7COz+3YVlbKkuQ
ijao6gNBzYHKnhhRwKsC1cZYm6ulBkNHo5Kk3cxayKk3fhciOR2zYWaxeyNJYF0bEykVw+ojKk+J
72nANXhzKE79YtFWziU8LRs15n01t45/1AmoD8sBZRF7gcKn7s4ZdtwXxY/n8+qwrNarWLYhdjH9
17zv+T4Fb7+VlHb1/qesxpaEecq1FTwxPLAo9XaK3KzGvMPAYoc5X079N0nVZyHJBgNZLXcq+RvG
g/EzWRlhAPvcgJL0WJ4nmVwSc1sg0e8JBseXau0X2AjcTOav2rCEL4oTxaYP+nIDhfAxwFXyYCX1
E0Q31ywou4aKo7j1FUC4cmwZmCCNsTAXH3+agTFbHu03iG4IrangkyEI0EH8Z0Bbr3xkNDQdKezt
+PpQdl3PZTUfbaFMNXi3+BmgMuuHs2KaxeggYoePJ/IebOQG35/mgmXC1kWsVOpGEI338oYzIoiU
hTvlsgWMjiBbiYYHk/jOS9q2RW04NzeovTeftX2w0lxB0FKC9Co8Zj1SzSHTYgdM2Q/V1RyBTd6U
OQF7TYqjvnFOUcGNPZggpDaeDShXbHukvwwSrKs428EkND60KSqiLck2OhNeYbmsA8c9B16R61A1
0EONGCd/k0rSWB8c3ISyPFMnnYn1UYYPlTv2kR6oACaa9yzy25B7wrkOYImsYyMVvi6KZ3jFTHsl
FvWfCqvb3vuZXelCtQu3WUKQKYyiKsPUX8RK0+/6eKwab+sp4QrBwYAMzeN18nc/oNYNJlaGdx0w
B+L1iDbuACrm0uhRAfByci9cbSnJc6zrCLaSzbLP05gKqJWf2SpwFsI+n/iCwM8HMBa1zXmRG+UE
hmKfnfnwfJ94sNBmGzLFMrVcaNhMR96Gfu1rvow559K0CVf6z0Ss4omLe/qmUyxuSCkBDvcMYDBv
71St/HawaXAent8U4hnvBYf/ponAxjRkFWiCtK1BYPyKO0MqxT6/5Iv0sYScl1W6j7Ejtspi9OEN
+503+Q7nelnL35jPer45g9Q9hDwgWmN2MXPV1LzggCE7ODNgVL2DFm4gLyrtmlRmevcNEqTtcOUK
F67WMsN78xLeJQkn1dhKZtp1ryztHVgMTwMQrR7IoUADS3o+Kp+e3GTL/2Q0KaIrA5WAdnjznr9s
7uow72LOa7ZgnO+LnH4kjjRhMxGZRKDzUBHcciAK7veF14eLsrE0WYGsIwY/vqONRB0cxEQIGSmr
EI8ezfYpd8g26QjUKWyw6kqKrgGieR0PnGnmp0QM4tftJ79B83d4VXNe7eSKUG/lLX6lOEaFPVbL
VC4C8QCpB74uSMWK54pHRT5AeW0kB4nozMDoOITBz8rEqVzP0P5Rc12aGtZ+ZKFojgWBNPi5SdDI
XGJjJSURgaCoRRwVbS7Hl/XomHlWfzrccTYH0Ja6bFDdk6YDRPdHKtpLUAJEyDq0KGcX/VffiiPa
WHWqw32fReNFGL3KiA0Y5NyfJL3TaCvywyLzV4roK1is8ATbkNJz+iuWo/gWsGEMVVDi4r5pohBC
0BIR4WSOpEpn0lz0rDRgC/M6jygmKAfYocB+ph8+U/Kpuay+iOVWaUra8Xf1LM9Zo+tMJPnh1oIS
d+1CcdCJVN6wLa+QJOOG+Q1xj9Fwuynriz4bg39am0Ov1LYLK6yFP/H5IJbEjfEwsjVmGHp4eIHS
qCos3jfC70N6ZK6Lllmk2kuHlZISFzVAfTsEIKoqzupIgauUGRa9DV6wHZvHbR45AGYdTwPkSVH9
vTr1JlBQbeU2ZszncuaubMk25LZGFYP1+KgvVXcClIMp9rIqf3W2hY/H77I5piA4qQfcPehMS97D
7K+4JFkHd3IJJvHO2lo7z6fsIVrXoITtLH3cMU1ry/3gS0unUm64XiVsg5bOoX+WIwuxPgX9zbwi
odxa91tFbb41YM2k0euSfdJIvAgnKzF2yL82AJDwxlzgOxH8HU3SR6cN2Tx3JkAwSTVCNtpuFSNP
PAk4scKt/xtHd1Ey69XfgB6swJBtk36ZBKhfuAESXRutBPbmsER21hASJUgLx6f7NVMfBeXDKMre
tEVBISTrTqaPAUVyP7XMuIX7P7U6b2Dp3QYE3nNggyuPU8NG6xlZrp3sPS5UJ2yKMHeG4O7k5RjB
B7CaYkOKiOmrLtIoI9/bE1H9lxCyIln9i02vGKVorvm6ZC+xoCZRCqBp8nI1EI56wkYFsQNyWiCB
GbiRioZK7OOjPJnfQPR67aGF4rwpswveqeqfi28u/l5SPi152A/0J3xgqm1kyOc/vz4ozBqbfs+Y
PeDGck8EIReyEf19R801zuKfTFVtpNkeXveiEHLKCOCuki5V1KMRX8XUPSARM+dXqs8f7aAqtUx2
Y+2GSbnrwY4dovir2DGsB+uV6/2oaOYNGrrtEe4WTQkVciJl35q7sFNzgYA2Wfdmnj6LWMY4ykZU
uRAAQFr8yQOydaVf/S2rQZUHGKuTlYDnKfyDuOm9xYHmbfBFnThUxNEQTERp12SIz51mKpGFobHz
2FgZjVeWRa+3h+seog1Vc58AZ0Ovp/XLouQV9XT2FAKzYVcbPQYEIyzrZMjnNx1qrVBfuAGSIIWr
7pcMN10DPss1Z1LyzBpYmJpLl9zj7lU6VdMqCO+2W/HVgjBB9CZY+Si3j+ZPclgmLYkU+/fbkUTd
kHHE8DZlA4vRLXQOHxGcbl0MJbPaiLfZIUi6ZRqHCvKz3Xze1Avt/sTa+uKdc5NoEfU5Dlb84s2U
yYDrqdh7peH07ilZe4iuklmF40TmcQbK/PLMBb9Sqe0ry7gp939yTo1IjMHJoR2vWrsL1Q7WSpZs
g+Ey29AA7S8yS0XEoaaDRMxhQfQZIkiJzlQFvDpI2GshAOuaUKqhtGMwRJYy9BQPs4bBIlGe6p+c
0h/mthmlfL25AyAkqbVFW0stT4CeZw8VmUb+0Ne4e8yT2p8MIXARiGKYFKvLI4K7jRsh38fAD+mI
U6Vb5+g6IZdhwCQS58tiKw99LjIuSOcfC3YzfATpB7MerCo4S1ORVa2ZpH1cwXfWEIlyrUoKdKP+
teulvGspikDFhzpC/FKuLuLfh2+S/c2vC/fHaJyGAEqTcsGuBHy2tp5Fs/d9xbYq5aVfArzEvb9P
l0YjaZKh3HpHqHm7pcyaXMm47w8DytL0P/HqHFsoyfGOP5ufl+ogzCDT14DmdKTQR3VzoZN7AI+E
w8qurguqu/wwsx3NrLYGyakCKZJwQfP3UXKm9hptj9bhAxwe56ogCdIpzKzqO/IR9XAgRZa2CEpu
VjRAZfUsWvZEtD2b+1g/7QqjKDnmTK82LtkZXG8GX9WlQNDw6MLXv6cGdH0hKFOwZfEyd7PX3syL
oEbmgx1ZWF3qMUan5m6BK9FT7wV+QIRemDc4BczHhlEBpGKNXJIvv2wzY1fdZlEAWCZ1amtQo2s4
D6ewu4pK5eNp+J4YPRgHbvGRekiVYL2uqpVGwYqrwl0MlMv+RI5HskUomb9oMVJCMqEOYeX5jY5F
yBq7p6MktMPNkr+wqci/ZqcCORW9i10HiOR0yXc7trBqC81d677gT5Es+l0cRSkoS/7TyZ04MXWQ
DyH3TmrvQLw4XBsvFZDVTy97wR90/LnlndksWc77SrOJy5r5dta8JVlPlAlpCWg9N/511Bo3QuLV
1cNHTjZ4zlHkOWMT2JhURj1vh0of3eMdrDV4FqjksKZCDApOfyK0Vq9+7vefxy9CkNLca1vgw1QQ
LdhhxpqwMVE5VcqtqyEgUgCwGlif3BdGNGZdroWsMEEnJBTzB5S1sssKKylUphgcyDrlkp0F+S4O
IkWQNQevJuY6XgY5IhuiWhE7tAUb6KqJlw+rg0cepMVdZmophNdH4+dbYxF8XfX2qEQabuUNXAXD
bM9maTGM/7no03qN1KTPm54th4hTnENdCy0ZJB6tlWPyD0huKb4Ed4LAjshHv/3vI+zhbsci1af6
vj9dwJkBqT5JkW6S4J6QKtTQvJxJJZ76lqUkv42gmWT1zQTt9cbw6wwBEjOIVhVI21casiQZAXC2
QBF7hXFNlG+03R96CnXmqR8yIq3FcFHi82J3rlxS1L3VpZbtOv2vb8f0Pt2uvPGZECR9F7o70SHE
Iizj/zeZncltNzfuDJsh6K5cSbhOeC7BMDnv5UMN7as3+lyLtlnX14TP6L7VSDtI2aV6NczVZCTJ
2J35glPCvVc2MJPi3WFELOoYKmfxeyOZ0w+UpHjf8hxG/w4Tnbe2cocqgT6/PSzEBRRxYaanm/h4
/8cNHrFrSiQ1KBv/lMnKNWSySF2rG3tGKDXNRAjFO2TWV6/vYDo0BGN/ZiBpKI9g2AmDkUIbaGA1
PzEEj3455t3+hofBobkDElJvyibMeIsMfZFVEM+O/mhc8joT+QGnjeblJ7JMI9NzX6SrhUxyGqoy
V7EOxYVrjJAqhwu1j/S0lXid7GiKCbROtUJ+RKjZy0iWSqgg8btoFQw1bAyAp0mIlGU/57afddEO
g9PUxDYP/TO9zCDqL+l6ZsWtJt2weJxjV6MCWKnphjD9xp7ZMB6IAZ8NHqnZh7EGAzX/K+eR8Uxa
dBuLujkacNDvk4R8Onw6NsA7PqUj0nfXLbk/8AvcomGml1mLhlmFKFcQyJYiHhzxUQriASAK6XzW
VRjnVEArOH1zWmugNMmi6mS5DyfeOKOclyJXU9ixqZG54ZB4CB3xxFmqKB+A/ttj+BMtxfhnPs20
VQdd20PEb2fA4hztAVFoKjmBkdRx5eWPAr8xbV1ywweLpzFxOYUZoCcPKZaLE9fIX3CnTjdYQpOV
4wPx2bc/yL7BmA2NcjUvNiwM0qX+U9Cky65N80gpC2knN+nS3EkpC+tvTz6OX4OBzpGUiEY0kCPd
Lws64iQACIRm1vijt9GsXDH972zwMn+SgRsjyt3ctjP6tWEwSXGyec8lV45YoazEmymTM+FnwabW
7XtQLXdXYGLQ1USVGsJggoEtQOJj3DJmXtu3acCT3nNPB2LJHPoiIAPp/V583K/xS+Vj3BapxQ1D
lngVRVwHxPHuGrjNrg3iB0dLLEwK3LJIMHBDFegFuNo47JrZVujr6WgKHNqOS0GIMfsEbXbxdLgt
VblK2bqj/P90DWrEdbNjuDKls943pHLchOps1lavG0Uu5E/qrskesoXd3sCnF3axjnY0uMZonIxD
P1ttmMMDQG/XvVUu5/xPjDlPe8P9FdNit8NBJDv/ocUZR8Eu4zxRCILgd2CXCtqQNvcUHjOPQ8Iv
Hl5gjAq7S3Gen8Sb/SgpYUeP4onceil5QNbsEITsq4gZxAkCoSJss/eepqixtOKF0ycVcKUyVeF9
2JWaRS3RwRfO/GsKzue0S8vbDpW89cqOtf9lJ+OnDO8yplXUuu++jeaclBMcXMqGoVzYrvkvN26m
pIuHsvsjz9qgM8HR7F96i51t0gzKHmIFG/HEfcmP5MXQnXBaZaGFAEkBR5cLbohUgzFuPxABat9a
fMrfovM2Fp1WDuJI68dc1gB2NDQkDkjJN7vGqGLL2iWe7fmqrdkMuroCqR79EcqR5M/IK58E5taV
XyGQqZ+9gMhwv3vl1NTVLcy4G1mNg3oFi0Tt6HNo59VHaQuHuc9MKvgJr9D7QJPpHFbkaM9Px2cM
wUa35mzgA0anYJoCa+VIA+0wof53gBGIrGKwtM/scu3R6ckERjsrE+P2KPEI04lgWl09zDUA/e/h
hbAO99IUq8cdzgrbAvnw4RBPupds8IXy+ZoS+XBM2sX6MQV0Ab8eYJimPd/2l6I3aiVhdboZGfho
MgDaHqqj0wLd5C1rfuwM5m2dQO25dhwsBQoWzcWAbGThwpWNa3bDa/czhVv5DHdJYpjRecgUMK18
JV6WU1NrRW0W4sORTeE1wN2Vog0OzcfIBJVRHnWOkRLDfK1OsFQymn9YOgwn5AZa2zGfhCQeKht+
hyejbA72+aomWAMG7ISG8S6EneoH5apG+JK44kHM102avyTCQZkxK9GVPykvFsX5zA0A12LUwtks
Tk27/hc2uQJbZbA0J2IBLgckJAiR8DESJsHhjHxCOysjioYiloXUtGpS18+wcPYbrYSXmS2++ApK
GknhvBBy77ySe8RKGwATS1YuYn9mmduc5upS17jV93LAueVkB3Lnaf5KYtEI70MT80L/u3Av4P2V
DkpKwknHPs0gUv+DmssL/POhrVvEHDeZDJp4xw8StY8DZeKopcJasaasde8w8KKkXXAmjXzqn5VN
wDZGgODYkHFxeXDnmTrN387tO12cuZjWZvK3EGQ+TrPiAjDUkyWlBJ0tRlnAIx5EYwde8oug5c5t
s9IXlTRL3eeuYaWOPssa0Pa71BlVyYapT67HgxOge9WPvnLs0m1sdt7f+PQvPMiJGDe8+aBujsMF
Eq/NHJjtruWmBnMQpkhSJXZHxWd3ROUJVa/auJ15W1Px1hR+b0r5uDreMstmADmbk5OLCIwLbKJ6
e2KlAYPdkP0CBJkROabI78dUkSNkFqAcbwtqBJh/6FyGp61pARRUeZ9rf8caLdP/aIohxEWXg5Nw
pL/b//g9sUvN3SFT/iPIwLxsoyhJfYLSsydFu1AOHWUXxKcix3ys9u/hothttcxqU7gvPoDeee4m
vrBRVtE7CmKt7FiynymVRVOO41dQtOtIn8ShR/8yKYXdvV5yet4lLMycqD0LLmNJazsHIIuBEn8m
21h6YkCZRec+HGa1q8XRMrmPsxFMs/2RLveo4YpqzDvE0WY1EWmbebzyrAMgv22mh+NWiC9BEWDr
PEWoq679sG7MDmjM6TCe5HYp0M+UIGZOxnp7T2+WoYcNu2eHVmmKIvjHsY3XZZe+KLqMpjJ8TJEa
TgetjdnjELCqtUGafKQM1rXxy5cGlfhxsTz8NKtzMuI+oq2+Vc6J+fojPtBQH9zjSS6rA42kTM7q
N0Y+DD1WUqeaBlIZozPjTJJjH9UEF5eMAJx7F6LHbS1JWQBvMbongFOYRdQFKJ+zjh1+73hh0aFG
eJY/FqQA3P4D5qnRP0Eeu07qxon+dZ+IQBfD+Xpsxar2LpHJ2Avpgqu7/5Tu3Ev2i+JW/4WO5Wz5
ARoJ8vKPsvnPcZhU75TgHd17GB8xifmGjMF3ljeUr0r65WcKPu5jEL3/CPsccGERQ9YY+R4YEoOx
75IiPA4mhCRnknMlJEfvrQmbCCGZ+Lm1YYwS+mEexpS9uBqEQqEB5CTfAkwiTHuU9nd67oIt042F
M9hNjKNyHvNFczCudQ6c4PPMc4KeeWzocXV3jegCx3cfiQsgVPI296qrPsA1TxMYIIzsenKyPZSe
hUvz0CyyYaoKrSfFcyHUYfa8wwg3KPNxkhLageu+PZ7C2AppkOp8GHx+oz0SsprLE94oD6+X1Ts9
QS6HO29W57WUtcETF8b+YsSYYeubzlh/zlIIH0uJ3Ybo0xI/ZMej9jtoGYHKjQyDcVdvaKCA2Lry
UACHoTDu7693hL/Lt1XS7j+nxMTBPhIe0oz3QcwZ4QPpV3Xte4u14d/128aGHrQQNGxbQBAoBrRG
NGNoBE8P2UBEbKtV7pPsUdaFh55WD96f7fiiSEri4bLpdy2MJ5zyB0vCFzmaMTHZ8XngieJcx7l8
OtezZNg0eyYyi9f51V6eTJxFN0EmP3HuS862atF9rxCzdQ0cGP3wY5vrqqq8SjtTgOhfY3gMgnfy
xEiOB/BnwcHLRPJ+BrNz4ee4cDQkHnjkanGctwhkpeujcp3Hz5TmvzJ9T9knMHHK90PFs1tKLy62
NcZlsAC4PKgljAjC+BuqJpbfEqCoSwTE8p0L4R/IbrsYCpbw9WtfCMoskUE+munRurjAJQS4Swqp
5rQ5Kv2XLQovD0dyCpNZ+fXn3rxQQ6bXd99qjV9QMEL0Jsrc1dxesdwWr32qDfrK9Az611flg+9N
+61abRCLFGuiDStVH9KpzNxN0yJmqvBefbTb6QYqQ/zzxUi99hSG1e/yc1PDsqWpO3wvJD8dlTN7
7gBoj+2OeZMahW7HHWex2Nc8zh0g0sdwxGFcRIlYJqlFzjIx1xY8PrYvyws0rVifc2iM4VX/ItoL
qtwvW36EWurjUE8DpTF1/hmxxZZAY2e3qlMluGcjUrZVLq2HCzaN2O0nj6sM/HzJFBrWEdL3vFUE
A4Kop+DPAhylxLjNSqYkHV3Tbb/dzb9XbBijyDnbHR03c0cnpR5dA/COVBnEA8CbBetEtU6vco73
T+yGuIh8IvwHVAJwZsxA62A2SCEOQwpxwRDGXiJ5Ef+P94nO7MiQWDGHG2jynz9rLi14OmxF+Oi9
CwGBhedK6d7P3E+lWIB4dTvivGUba06hT0eGe/nG3Er367oOKmab00f6qYYf/MGgDy6aJ5y+gLr1
8K8kZb0pjjdlYaacOs1Wt2oi9JeFD8wQcJqIFekl097rpLW8G/OmefXNQvgvMmOmFopujj1trT0w
WWdsu6bRsKIBPYzKJGmibwmW71Bd/NM5pIOFrf/e80yP5Jvd0TM+P9PqPqd8ieP4JW/nrHTJFB57
tDulIU5ujeYz40au/2UMf3E5oEdPfzEob1VM5HsLbcjVhaqE9Fy5LASxVurBy5+y7mNv/uRSytIV
tmDYzgHU4SbjVHEyw5br8PKKzTDcyWenlAEeQdNNbpKlp+3wNb48mgs+0wzBv0UqEKwytEwV9tul
r6z1R5iXGOztZ/zSztVe/y9g+6R7i/0xIfNjFHqkb5maxgANJwK7+WqGtzhiJSmk8ipaRUcAe4Tv
qTE2o97MxCybaijugTv1HEF7IQd5040df/GMWTE2FbL9hMHbbwwdNHc20xc+EbJXhRQrYCQj8Xq2
qQpF20mMV1M9R/fdpq3jF7LmYNxD8aE25DM1Z0QFEtqTIaKR0VW0GzuR103/bBWCMjq+L+PkgIZ2
ocARhnCjcj35EGbwBRzwVkK2efyNXg54GvrffSQgeSc3B++5MhOYSfpGv9VJ+oTGX4Z2Whcw0Q1u
XlmmWUQdyod3+aCt4532AijEx7lVQ5BTqkZ4Bg+gShegJPBeNrvp5dEFd22tu1BgMkGffQCY3/EO
QCGF2zvGGcOxwTUsFFDzHDsS5WmPrUVGv3auKL48uLOnxltql6NrtOkmtSgLIOm/RUsc7x+dmzNe
Sua6BJmgElPyB4E+0HRWGd3m05MHJVTnkTkcdhj2aOz7wmeYocTsktEsoWOqzvhkGr1bubWZLZZP
mUv5aVUgjF2/H6657uLgrelVKnv+qnkfsdc40jryz7kCWMkKyXiFKOLRmfYia2ed6pkz5IOOT23m
KW58ksHTj1TosNIBOVJjzRwgaBERB/kBUPdV90MCsu9CXnCnO8c9Qq5Vo2lmhKg85H9p2soeePIn
IoljKnDhf73yGDYl1zRitCDlRy1Mup8ZPUPHexBbIHASsvxwLJBTUJ/exBsT7Xk1VcOsKb6Kphkr
1snkwoMFZFwCisBddFnYjEf6tLgzGKzN/omAKF8+T78PUHgF8LFYBgDV8GBbcUJomLbWlzHYIESj
Hu+nQ3WQsd6JuRltj85Uad17hHwAxnZ80dA8jFor+mFItTaoobse3PU7m1qHJAiQP9YuD+tYSfaR
oxstOTPLlXJPcp7JoPqdOxiChHyCX1kckfp28KXD/xoTQnhbdXAnhKlBgKbgeDPhvLD+sVih++HL
sYWeo9grUTKiPc3L5/yDIn29jwpEgKjRGvL+xjk3bvnO6URvifzSv3o7f7G24gtBt34FiRPFW6JN
Am8JaDrWuVnEr7w1hpzMWh7njk7Hmg7kpBjxMKuH+2AzRwu9R0LEgsmjGy417LsiC3KPlUkF/4wc
sqQnxH+wE3yL2NKEST+CENvmTg3B1h8kRaDKQHZejYFsM3DduaSt55MrOAhEKjzhqwLfZ5wkLf1O
WLYRAsro2L2BCSGWznrESt5AP2QlRkjHgpmByYwtthhO2rl8ca61f6hbhEyNFb1YVfn2lj6I2Hmx
5LVdKMKe7NT8wM7fFcviT5UQZ2AQwSjeTGariOpWLuMyqFTtt+4mxfFRDFxcL+P5vaTvwHkWbG2P
aGTOfAvTb+TT6XwrT49ntBS/Lrb1hXRhLmsCCGjfKbru9CybgazyP33EG/DZMRi/6/B6+/mLGTZH
T7T+XWKxltqx9MV9Q1Q83ll0axztyJ7lZeMvPcI87DDr344uemdhAAW9Sl5TQK0C6M9EQMkTlkFW
iHl2ySBXkd949QxJR6DRskiPoktN/K3gLImpDjteNzYNJN8me5t9W/1HwrrSD5VZJl0yEnqy2gyV
ApGoJxFTmmPupXkhMC3kiCPE9QGcLmWiyVuSsQnZXz6BiyHkAfw7Mqqjal5rxKsggbh/93Lq6zJ6
A5htAc6Iwg49HMHvHz27H3jC1yYaJgJGLOuD5YXmXmRKougluIgdK5gwRiGj/uZKcdNs6GiiDRsZ
NAKuBPFVZdpLEjDPUVNoL/A5uzGIHeL9AIIdZoHNTqaMXnWum5rEvWmsWCj3UyVnuZYm1NdiubA2
LR0Qi6QvKJQD6IIHaKV+Dp0LztLhXGW54gu2oQte46TwLuwlDEPlocKOcf5+TGvzbUp6dza9eHLf
GWXHNTBJwlmha0hhWA5afmqR5io9vlQAk+xgFpdOIj+LVltdJyYOPSmK6cLGRAe5zKv3zfgbPwmu
oK9rBrWOBdTn9iMRXAO4VE2FFLDpx5tz/FhRQHIva6xoo2TdWMOkFx1O/8JwKQMhWlHzgVOEXsyo
wZw7gl3o2WacUZ5kAxCyBdOQfLb5E7hmLT02JlkLLgehMpXpZVf1al25A3MQEPqri4MOXRdKJuQ7
mrOaulLR5b7My6MmgKDGdMeoPQfzoFSkT9N88g/tpEPFIp5SQqRFtqn/nJ368bEfuMZLbCwQV4bd
qQqYYL3GoHbLXNXiYMOPKjWjkx9oqmVzcfx6ANbHknw1GEyassFZd4PF3JQPJt90/AltaA2xIe9A
EuO33SnPGEsWVwmZmND5KVofw5ykC6RLMs0h8qjYME6BTJJGG6I3Rlaghh7S3oW4zQ7yyAZnC1a+
X1mo/uOr3NGSLN2oniTW0eocS9VZ+7r0+N2FiK3rExfW1QBOP/Md4YqxUMWdkdCDSQN2saX8zbOT
yjAQ/mM9W/2On8g9B/skwnjssqLdq2Et9oFbmPL7edbJuKaBITxm0kLumZ37+bUEMz6vcsqggahs
1EbzDsJM3MibyfQR+HjE+SibAuEpkYT5u9s9+fZDWuXNOtcrZBQvWfSflPpQsEWJeOQMoQSB0gU4
bgk/n0S3rWoCLk370IEpT+fl+Ik2UleWsvkNflFtl6SRMMPOoddmlaYEZO72OjAs+FhjCBa80ZUq
OMSZmclUQSdt13hIC9bJxJeyF2+c58FJ46sEnqqVOSiwrowuQfQONnoc/Z3t83svgiEHEmhBbsXR
vf4xGAYHpGYLmNIx4sky/r1XW3Zz/TTu74ShPX0WGjax1rEu3EQQB/+smn0xj7a4GUM3WaqJLFB2
47p7f6EdopKaA8pEmEJyTxvkHv6IIH7kJefK6Pra/EAsnkpVS1cJGwQohzyRHPxw3vEjuxQvsgh5
Zzr/V1Xo4o6yF8cal0chg0Zo4CYPP7ABOUHTMg7V2+WVDmoPaOHFhzy8EE8Ln6X5f8jzRSy1mG1m
gNcS+ex/gpmJkuYS5JHEzmJQkmBgrKqkan0fVQWN9ndtYgJV8f3s1KzSayMxUj9JTlIpvddOK0m2
K9GX8IFWMBWDBxgwsgOCCsjhMedXu5UiGkTB+Yz2yPU0M1GD+lchzFpnAsivNEylqUxULWDdySiT
zm5HxSpb1FwONO2gmW3/CFqSxxgcyrdzk5NuNgwEo5FU6kpO9Mkqig0BZumMrnCI0/x85jOepUpE
2Gu2QZH2+yHQ5tFf3+6bNqJ6+TD7LWI8OunK9fbVxckobPu/Qudx0JL+bXFaPSjDT88EMLja0BWx
IVrnQYLY01899CwdIZqH8MuSNabHq/pKgNVBoFQmPIqb+aNwQzvI6er3QHnK5ti/WDyzRwt48ECp
Wyuucej3LFR5/9rdIoEOLtOfRg5lnxiluAh5Rsvh57c65EQw8S9ZcBj3iQ758YaI73Kcsg6WLnJu
Ctn4fmQna5PbKHnhSYitgHoG6/d8dcmMMrqcnrUVuUDULI8So/DLJU3axVK3d6Aoc+MVVLRR+EXJ
0vMzfKRNuHnegshQ+jf8u6aPpxz+8Z0obh8i6NPG4Kaz9fTAlz8KhWsXtLMQWUtdEdeb5gfhfMw6
03ngmRw/+VMFE4RhY6kPvF7J4pw+d6jQyqE5cKE56M3gU09esmWkbT80futbBQun3lUhact9mdbu
UpRxB3Z2VRpS9Tf9wUj+3JiX5wJEW3G7pou5YUm2i8KyAuyct5JaWsQqhUaWnmLv/+t4OEpR+22/
yflRHGEJk9OI3QbMSCpDfm8CwInjd5gLjA+XpeMAZEBD41WeolP4KPpzLZdsSnjRepyuW48e8Unu
gqlhlu5zkRx8hKJUd7btqgscP1HKG+L/axRBHSkMBBT1+ZHzcLttiRumiNoH7iXRPxT7hbPVHKaY
9HQ+ojy29Wg/fNlxMJW6RasPlRnuaCRc/e8wUnIH7R+vYcV1thlqPAIn3wuAPWl0lqQ6APlVEJ4Z
qiliTJV+PzbPQTRs7sgyfTALyAulzGDo6TGLsROqPB3gocFii0PNh6EUvtyNSoY7Riudi6VJLFt/
h0+eqRti6ZAUlL5AcB0OTPPwxXdhw8SEM9/RenAv2L65DXuwxam1ZB8SB4vaAGHcDSW2XJZIr20E
YuKtYOZnCEunZD7vcqF9Pb3qBDADlHLJB1esLiD3Ei9SjYPgSOVp96S6TO4Fu6QaYxvyJT5ZebtJ
KtmCIKninOpaaXMyCUVTG0oXKqnTA9Df9kj1RuzQbBG9FBHmSHp/xd5F+gR/tBZU3/BYk/37K8Eg
q+lVPqAVgGhmDKnBSBAMV8ZbDF343G1A04U9IXXIQ5OB/OmafXjguLMhgi/Ycj5aru6E+MbzHZ/V
I8cPiPz5y9dTrRCim38hin6csq8+T1ZDu4odMnv3h3w5WEtwfA8Qpyc1VlGHJh0Q6zxoO8m/Xwdt
7F8c+iTbWdzl6XAolW8U7eSQNOj1SI3WBp8XnY1vvBwc4C9tavAr6c2JPCTgIQe3NLGegaUP7vCl
JhrluGQnw29SWeixB6bgvGEZgT/ib1D8BnVACZxY9UUuZS0Y4/xpUI+vUZLiohRZp0loNqsUE1yq
co6sycvPoPDd85ak/kOnGM9pVhfDWoR73pnFI13dVAWVqeBVlFoM6i79I5tYSq1H6SqZ18sdu0KR
3wmh9VzUbfWIpEkiQiSPgb6CTKn4s1wGxgVPl+iIpEQp9s6GeiibPllT6eK1Y56TjA0KhnwstQNG
L/i4qborWNqOYtxWyThPIOZkiKSQyj2yfSs+AteJFcVsReZPwrkL5z5kwEc6jIi+HSDC6oxeykOW
V/J3BPf3vn9DkcSA/s58OW43klgSHams5qHmnGM2NzAAuGN9H4ERM3+tWVjx9MjJhxMOUK/ZogAb
pZQhuu6KadHlfmLYXNyl/hMJs7SDvyEsCv9YxUVYUI5nu9vGemyur5JQairMQhyS1aA2BydhWC/m
wVFooIT+O8nwLvEAQifQJ/zwxrsU8ZlcjbJ/9Af1bvl7A94zO9cu8oHUUzf6SLborouYpXMtnDsx
BhDocaslE551FRm0QDn5jY4EQHDu90tEiSodE5gC4M3v477vi47P/Ol74RSZPyYkpwL19YHKFowq
u1nFPHKSHNPvsV1VBC1ANSn8NYH1bmsFh9EQUJS+XHwUx2Ht6SpWMFS5CZKMDtByyd0DzA3ZbrcT
SAQ372Jbt6R0jFzCdkcvD81icD9LOvIxARwuO3/1SJi+9tFLZoU9ExXaiUoo7qvKIlWRgbp9KLxH
l/lQtXpTm0oqL3eWD8b5oceMtczkJR7cdcLGQiBrq0V36aXVftVALH/tw7+0EbIbzwaNWQBg6x+N
sKyyhnVs/xB4B350BaNPKnvd38Q0LeX097wRjGPofmXv7jRaiWDOFAtE8m3Yv/Yc351EN4x1InOb
tlae6Cg1BVYjxOyxnutknCNlVcksOrdrEtFirK2hhJsJ872LeOwnsZmONosasGDV2WBgzcagRd+v
WtDMBe81moKqXmmhPLXA71simgaakmp3QFyEFUHURAmxxVw300+kq369nZuz2TFiX3/8qPsDbZ5g
9s6eHLSYM5WALk05iBXuA2GHE22A2MQ6KsQwmSSqeGDz2VOuQYU8ZVAWqbfrlxiY5e0PGDFgxHit
8UWkAb35yYr+8rVAmWnZ7o5pna0gR42TKr3I7fBSAV+ZWygi4AuEXesg0rX+SUQmXbGAgJ2k4LZi
pw2dYBs6TwyeOWz7mpnnyvrWpo5aZbL2zDZrPDDPVDGQG7gvTxLi5krgw1Ph2ishikXjXokDTVmd
RhXgzn6rybhALhErgbQ/3k7B1Evzz9cQn8KZFaw4aj1pNtWB4yEy0EoMEu6UtqFO6ADDGIZkwFvZ
SOmtvjY3OtMM2XLaIahBEm1u2Kb50TKHT3omxN8qQt0p0d0jCpXqwPpl7UmxO8SOCwecVC9SYa9q
dIv0/OOFNDJ2ES4LyA45YUyyjTtozC3lIS9IHi0/rZn8GaB7nI+SFHUWAbooll2RJ9LjLXVjCZhp
JoeQwCoiSTCNWecQryRVAT8+/oVuT9Q8BhummjtWP2U7C8VNT63lkEhzirqjJJ28gCI9o+CHQn9e
53BecPEQ+UuoqWC9cN7i9lmjeOgcxYhxLxgQb5g6pf+FhW5IyWV2YzCopnV8urgTcZb23nV9Jpao
yQNn8z8I/oxIif/I02q7jHD09WE0Efxw6mUf0m8KyeHInFBcg3Btc7fBMYC1InzQs1jqapNMv46b
TBIFEy58lUnlLWxLqjUrGkBb0t9hxWPiK3oc2GaEj6NeyPhbLwoNovYFb4SpRxEbkoQ2sVDIRrQB
qLCFiNZDxPNSwb/Salxit+0Nn+5+xS2HX5ck6JQ0jNhiYucySIbfRhbRJ34Mrinv8/eCiLYYBYW4
OoLcaZCsqw7ep0w8hPG6moHvBzadA8hG0b+wZSw/vU/JvXSEpXGjrco6+gLBhyEOXf82awK+mnAn
pAzgmmEmApvKl5ja+7cM6W+7EC04agDcCeUdYurm8hpZKOu9XcevvxaTC7Hb91BkGZpZasfI/7nO
SaDFll9kqgWbN0/ZPFrgFbW7a/4D12xvvEX0xBL+OXcp1x2MigWJMozjga2xkuzp3t1iKrGWvegj
2gZ73T8+08rifvQo/87pUWJSq5YJ5Ap2+jWV4Z9pYsdzED8Hwxl3eej7SyanSpCCDAyvG6b64ILv
YC+DXhjsmzonYrnS97PlWf/zSZ8SCLtdvUwhLZ94QHrYiXdNDeDBHs2QEv4LqV59z0d1kcxQJJCy
6JWf9SHA3zpj/6ZLrQPfjWOhV6XexlNMaZGQqFiACUZcMJgfC1Jhh1j2B+8LN74AOm5IzAw3xUzB
Oi99E9+BTbxaXVyheIBwIAA4Iyl/W7d/vZG4OTY0ahW19Droycz0fnfN+ouAMKtFvq8gbZm501rK
UbqbP65M5rCbXJYXiSTvLSvtDAmQpPocJDGw28uhb518CjkQzhdGau5kbp2DQP/dH4RrFdVntdbD
g0R9XQvu4H7lbzGXnkhObgZKltv7K1Ug1kq34tPJJ+lMnsw1Y3pMeYjluXu4gHAL0k4lRWtz2xNX
+Bt2NxDAOTlnSA7XOmPbmFoavvU2I/7s9slZK4uKvAigDOrNmsDi3Qr5gd68aLkeRSK8q3aisKw2
pEk1HTmq2PIeH39Fj0OEPFp9/vzekFsC8Xylq4OqG+k2U4vQpADoR3YJNGudzKI3DY7lR2jj5tsa
p+SGU0hWN+YRAphyUzMG3jULGrqdsyVQm79FYehKAbxv73kQiFmCIu5KIHHwr1zHNb5ejfNNSyzM
FhsMmeMvh+w+42GdRFaRWt5m4niYLrOZPVbO4v0fC5cYNCuyA0O+JMS6V/pVTwbD1v0BZDBOj4F+
PJd3SbR80j7QutcewGiEpUE6h4w7RGBHYyGLD5IkTrwghUL94OWkmG1kEyOBUdsz6E6HDRGkjyF+
tX9hr6c+qVgMBJqLsGZGU3S6VsFeJNPzi75n2SldW8RO7nLuvuum+f/8176XM4ZhqW8r5VWpbnwz
4GT+jOWl6kbEXVXH1LkF7WJF42fU65gtrYBhtZ/9OeFZvbWaB9IzLhFp8Dg2PZAfNdSTwByIaZYp
1wzxywmNjzYPipkVbErAoydQGImOX4cW8VeHj12Ewlz+CyU+O+jOunxD58mb782imoIRcmZCrdqU
QQ8KaFeOO4Cdj3GFD3z3c/abd9j84gIjBBgdNHHk7Xn7wW2HZCWam0YRXboHsAcqTTU9IdTGeFwp
3vxEeQUv3mbxos3U6p0iG4VqNedBLWAQzLWQen0kPJ98S6/ViHS+6EP6yJ3AIkUfOORct7LK0oiS
NThjQyZjbkR6JiOVAYFtonTa45FDaEho9cEy1TndTke42iwa8awumu7VSFcOInpWFXcJbmthEpIl
fEj4BiufJtBEmQb87ShQqpQ8kuzUdux1kzrema1zdqCtERN0bIRsrqfq9HTelyWdwVRYkXdoD1Io
Yj3barZQ1PCKPWeE4FFoKmjK3J2R9STXWJzPa0hN7sDzrFbvQ3w7MasHwm946g8abdqRwO7opo+5
kyuL7+hm7hffvLii30lPqQ8qazl4glaGmkFpRcYROZhsR7QLfHP7SuCtSrLMHT8uPPkRLUC004w7
rU57N09IjyjFCokGVXg8Fv+0DQTJtEwfNIeibt53HUQaE2WyQ70v6TZQX5P7Gffj+PyXl9h5LUrf
GzWa5AXxOztO/GluTAF7gF6LjsWnjgeswGT9PxNzC3HwCdTq1ASYZO/DXlwyGiGZFuXMrIJWvSCa
7OU8pvJQvJT5Z/zu6scyyYyQiq4+TlJJ9B2U+30A6Pf8jiLfiIfrbPbo/qu9XmjddWwGw6DVpqhd
Gyj6FYAgGMfzioV1wiLF7FNZp5VGsNZF4Ze1i/d5ospq/E9VtBK9VnQH8Ru4dWu/eVCz4T3WXxMb
yCHr1rX/QSm5aM6dk/C4R5PpuMn9Rxqv/v/SbdhsnulW0Tl5KnW3+F+PU4yr1PWgp8SN7h2jB4AT
lBCJR5WhB4NGhd13AGLmwRv5tR3uDv+BAm92N47SzCzg7XKOvwNhY1KiMR4+aF7oc2WBLEwCbALt
5Q/39ihJbvOnpxVcgONLFbEo0cflH2rMCRnderab6J5nXYQAi/y+2Ruco689Qc9j5HF58N3XfjBu
g9alm6mpCfXQl09ELls5si5RcTgg5t03XnWhb42krDv6eeVbHDfRDzFLDL7bpDnDm9BtOdYVGW4j
OWY860l+vRATPphOYghiVCuCC5Jy36oKM9r9w5VfoGFPnfsMeJak/lwsQ642opQUUbQXOkpFTdbg
mdu/8mUm0FQ6stoanjTYs6qmhFYnAM6Tnw8jG8mdUseUwpeOMTiFylW1hB+W1W2gCm61Hog9JCPP
4wloI3UL6n9XRGRoPoO6ztzEmLYwWFzu1Bv1K7E8rDPLB5+Bbb4KCOEs//CWS6t1yji1yo5FQ59c
SOdjrA9tUxEunEvuAR+Kwt/WOsMTPTWOjfu+fXU6QyXlElqF2uSMwmbiIGCG3ZBeD7YKMTq+HrIT
1OCr6kmHR+Hz0xuva16KstmdKNVqUj/a16mpxB3cZ7o/SM+xk4Wng4ykPkz5Z7+z06d1IJHOCJPY
rsFQ3uUf4YkrmPMyFsWEsnZR0nxzSxDmGV6ECGh2FUCCaGNgbvfSGeUIWMQCJCEDakary29zWITx
QAG3szIR1Np2p5PPiVmTghIBApgeJxWCYTDgQEAXZldQHkHX2nYGMTI8SE4g9OX5nhFMe1ZqmYGe
sjUhoNnTo8dNZqU17tzFJvkw/DlwEoRJ2Rut5V7eJvZiL0JVnMRI0Ljn5aEsEqZQW4NGI5Za4ydB
aOPTRL3KnwHdRLA0cpVEhHGR6AF6nyfz0fkPEXo12utvEJrhFTd/UL5E8qwovGY+/yUvyS56tI0i
bsTvDnm/rMcC9/mZZyQ8rsqGEtDqNsibQmNz/GEwPOxiY053AOZaPC7CkUa32i7r/sG4i6ernB5A
lNvu0MnI1CmHeEZkek+/fdNMK7AQTohuX8ROOYyPRrZkOWyZNZHVTchVTRwVtFHDkMFUEj8taVK9
9T84922OYVaY0Tfurp6wq4nS+S1ViSduuuhClHpVEv80p8148DHk0H6rf4nwr+Hf15oZl+bo8cxD
Ec5y6LX3jEA2flsC2e/r7sHNrFOmy9ptNoyk6JJJdSU2cmvHiicV1ootT+ox+9fcmSHdxh/uouAB
fZW5wu8RTt/GoSdoT66qH1GuAib1R/KOP7F+MFOpFpYmAOAi19RvtZd1Rjnu+ohvxDCRkqpdpK0L
e8PVpqifQ5qXduBGIXgM8EKRjyFzj+MlSy+jFEOITBfYHaDczKiP+r99f/wUf6Qnc2TSCq4nxTZv
LLuRh/jIMnXbR89b7PlikFb9Pa6J0IPjKGMl7E4bOJfdg50j8n5sdYvjnKB21EZQp1jQMIu23eSe
HiKutJ7oPDoxnwRfZGgMNKWQais+KrpsthPqpYIwB780kSzLIQe4cX+2ysuf1OmDXri2CgBokHp4
MyXu9xYNIUpPXCrz6IE39LN+WNNlTZ9cB5t2nijan7NhlmlKWmQIFXEyPFTayL+Kpqv52g/DmHIz
GaZPnVjdMPUCMAQxeBdVFdQGyuTicCN6ufKUAILpyfDEZGQ2j/gMVugI6uh0mzaoh9RnUKL9833K
u1f9mQiCVQ9zkD9Tq1JUiEwMK9r7AvNqUfyx2V6KjqsQiao3Mfen36jMhtVBOAzoHoRvM2cJiHw1
niIDHUWQxNWH5z6i6kEXM/iMgQ8mDMNipXykhDCOosChuf23vAa2W9aZk/BhGy/OjTLWDFiAZzm1
2FJtLBafMD+77VxthyGv7cV+xwzxkpXpwkurk8DsfGG2E41YzMzMsMv0xUd7OWm+06PS5CBZJz93
wlK8ftgFWRWloTH18sLvM4RNGkk4YDcH5db0TpZlOQ9wP0kpmKLM4+XXXfrKccvMM12nDZAWbMpg
ExzoS8/nVEbCjIJetOE2Ar0tCOjn5cBZkmIV77daqR/wZLfTObr5VHPnu8HMBdHBl2ZRJ/DdX7Xm
8Gl/+u3l26Fz+iOK2qyeC0ferimK+SXI+WKSI+bl/IJHVOg8RoYnctLNq9OpxLYmlYJZGR08nC3l
3JoghW2YRv5O51o9nKVud42Mn6UPCKEloiCskdvPq9yJO2WxJazrLjKwlMR6MN59Q9PHPWzvTQ9x
7zKHKBxZJOoRO5DeeliQ/xmZnjWNxqhRh8oXr1iSgAEadCgaqyAAjyeCz83n1bBadv4NBpYRsUy3
8E3TgP6wMR/u2QMYkOWFEQSKQDZ6T3XN9DpWqL/4OQVz4jdVxciafRn60YA5ey5JvKQVPzUH0PXw
ht+D5urfObNRpzorTWerLhyABFwSsXn+hXrgUPUYvWIFejO5JLRrvJTwQeMQSx3rABX7rQeBebsq
tcyoC7tk9o1ylbaVxZNay0P2WVY8GbNXQaSCUEo1TUzQ9uP49B7z+SnkGDs9MPFA0MSN7pyEsTjf
7hVr6zwR8nPQQvkzaYilEMIeJ8b+Msh9+XU5htkvYi9eCQb9By3vnJkK3ebq9giuet4BKOhLqCSI
N3xVT76n3EPYC8FYg7s5fKroBiwfdjpFORUUYQqnDCG7MlfeLUeFgzkmjNpwjlQwL0GPwKj9Voht
T+GfnAuluzVyeik4WVJ0P1HOlJr1pHf0WGQCGUQpl5xis4YOeih2PxnRxT6hyJvvkxJOIU3vKPfi
BLoiSvj6EvOYYjZcM+DeioQ3qAvjZdamB+ljh0nJp/M3XHr1fH9MLzBE9olh6n4rnXDj1z35j3Me
nx4gkstcP44fkQAEbgOPSGqdbIEzUFGTwTu49yYrjHJ/8/sKAusecuA3s3YxpQcoDbGuxNYPhsJp
WmQLv70xoebaY6nA9SUoTdMQNjFRobGivQQdPOVZASUX/K8OUyu1s+jKKMFZrcxwRNUWL8YafpNT
Y7B5asLXrugGFn8W7uHaiPUBynRgw/xwfsOngW9MC+j6KZWbs3CkiJxIxJZl80xyVxN/1j/kh11O
tYmKEeHN9q0eOl8poz7Hkakf6oNb5W5Xk9ZK4K6aGTchB9rIA7Ly0K5OGJWytBYh6+zhuaYiJFdK
oZvhFXtat/hnFj2eXRzxWNs6ANl6AnwPkszVQV/N0nEj8TRlMNj2hNPF3MDZQ7c3ch1rFNelbts1
dESXjjO4MfFMcfbpsM45RU1oO98LsU8s13K11qE+hMnnnNwKrPfbBIzr8uqDV9FRuWYL9b8vpdPH
FFphUaDTtrxBEmXWidA+e40mXnjqOYU3wdMgFVQQNE8gDLU4oubnaPn2XTDI9zFV6yXoKHmOvk1B
Hp210HDUQiX+E/hoGd+DeTcVVBlVotebq1s4flk1bQ/TmzI1MoyjuHzB5YzEpJro0QlgZWccavl3
J50J/OU1PmbPIyvMwTx3LNL5Or0GyQrMpaXzuebtJWW3gLYSDa/hzuAZkVTIl5FwU0FrwGULbaHL
sodB9yOLAkqsFT4+hpxahUBHydN8CMUsf3shzQ2Bc+JbRIG0rMjNOwEDyyqUf/NT52h0SGVN65mz
CzRIF4/lVEDdoT8ZPHSHhATpVwOIY4NeRfZ7EMNlC1bmW/UQ0tM+NlKH2bRsbv3JYK6ygLoLliQK
xWWliWBIMleBA/tknwxGmNAmiil/3QTE/FIHMSM1MUKpMWUK56D+W1FkfLku+U0T/ubeh5VOxjQq
BqNXBwdc0Rt9X6Fob4imSU/8wDRdqkO2T3Flq7ls5QL1UBaCWhb7OEL9N5++Rs/kFHL68WV0CvVS
CNq5ohjDx31Hb421g6EiJpE2GFJNKf6kXWE1kgo46e412kySZdQkjLxJDQhHFdz4Nraoq0JOIDdE
YmsGsbip9kx2fv6PEEO5oD3xuLqk5WkCBKcNU7H9mrCV1NW30TkyfUOsvmVaSvCgWNKjZAgfA5ID
RnCHSncKqfXamRwFTicNQ5bh1IWcuNpJ9r5vNs/FKIY7OlV4Mr02RbufoX683/5CiFTCOe8tuW/V
bWuud+ROJBVlt5Sqvrxb/RQrbhd7bl0yf/Lw3sbooNLdtn3ZoQVOt2DV5wdBs4gfZ/e7fBxs8/Xd
2EvwqmDW5y10xZ2ZcJFN9pDJYFlnsYdRjEv5yqaPBxI5yZ+3rfBxs1BHMkcSKnvzNo+WCD5vGgGZ
rSU2bYyQJg82zblocn9AzE/FZkYZuzuVTqcuDXOfiB/Ux70zdHHHJhgoFgZMoiEdkoetFJimyZdB
UhUt6Few8cDGfAogNSfcXBD0PqnGLmlc0RcnDkeX8MZp9J0L/opTi+9HRPeUxNUmaoqIv+waOs6e
UeTecjNfNq8r5cD3qNLBA6F1DIxcNZXMpBdZGUJzca1hAz5Xll0yYn/V0wI/00QzqzEAoTX1jdmH
evV0ijs54p2y1XjLbZPdsnYt6m6OXm/VflviQw45qv1TqSYtCV77mU0Lws0vz6Cu9APRBz69sYE5
2zCv+wILO9YAF80vGtUBGZ5V6XOUb3SudHOu0rzGcfujGMaxpNXvMt+z3UlxQ7V+2hn9bsOx5MtW
2zqlHg6qjxrdWNwDj4zoF5qmCN7w0+OhdNvCLzuogoypImf21o2BW8sgcgkGhx8BqhUK2dZjHr9r
3iJyG8d6Hx4yFP/36voR1uVX2nQQezPgyT7LzHU2XrRR4x5OVbIRO9Sazhr9M2W6DHINfvQHsDDm
D+oMclg84Gcrttk4P74KWNREcM8jLDiFjvas+89Kj+86txFCfDoQm7DmeY14ciwVX4WpgzgNk7Ow
+l9xlgFYYuVdf1Hm9+ryM9piG2iRWsgaCKN3d2caH/coUMSdHMXSejmFB9Bd7qCQoACk+R/jDU33
8bPkRRbi5yj4stZyqYEiHlV5xQYnHcPcG4mf2Mg+7qMde2do8x2KhWICQNzk0is8Uf200JrO69uw
BEtR6XR83GY1N6HJWWzqzbD5VAu89ATLmIcFQRn788V6AnWlyo85o0Rc2j4UfL8NT1+OxZJMRcwf
5lxFnvjwWHzQ88iLlzbM7ueTWglb89qLbmp+P5qX16kaL4Lykj7BvAAlnSZgNhPDPKNMYIl/ODtJ
PWchz/xCHiQj3YgycYvu68kfd+RlO4d1OI3fogIedMIlnxBqnMOKXL3wDUvv4bqryJRPLVsE0YdT
xd/1z8CfZLvq0ac16JlhIYcrERR72mWRK/6LlWko/OcKLxzDJYrdguapLjx7qdMxNbhwOLBHApzF
Q/yOqGlNG6/oGzjGkAtV1qGSQE3NEzQkZtPgu1MyI9w+yK4f50ax7KrPpxWznNaYhRzSAe4vo7wz
XQ7HxtrG7tIaQYY2mGPRdq8xplWJCmBAhCh+YsapsNK+4BIL4HgZsXylD/KIp1LzvigDIeRqsBXD
zMXtbStp3qOjcqaJYL4GVLKxKflWORU9tzozsrcscQW0fGC8QJy1yqlF6Q1s+tOuUDMlBGR3XYVD
5TSBUwWMnNImmp0wb9oEjlPM2JVwMaO8t3xYl9PJYkDPIvHPgEpGuDDfjAxURyidyccY4XugWZSn
mNK7RfNmkKkIGfS17+3gE+uTReFc/KMBySCZyV9kojYQyrWgdrKm35kCinvXcJa5VB9+ATizgliT
R4/D1SwEikFKv/AmU0ciuABH7ysADcBdRjT3fJvTXY4YXt8u3TRP91+MzFuE16oWnt5k9Wq3HOR2
H8EssbwgnG0Oxj6s/ewDKT4DdB2mzPQpH4mJjD3x5cWUpbPwNqHDCF4eafXblXPUR+IOQVsM7dy7
t4J2PXqyYQpqWGOHyvTXnckrA8kAWy8dNUHoWfjHd3tkvX13m6JWaUvE1SE4tSEj8grxTDbcjXsH
TibC7Xb0dpSg/YlTFnPWAJ0t3lYzpGC17Bom0DTwXlAOV3CJOYyzlbHFNHTFbbzIqr3pKa1kQrfJ
c7mKfsDHkdXzCSfn76KnfUDQnRfz5ER4L0jQ7hAg3hutBxSoV/xTM/yekcLvIrHrakZdDkNZnXOK
+a+gBNQ53Hrai0B8ZtSNIbcdWrvsK0BjZ6dspkT8E7Sln/r4+mpEesh34PRvW2HPyIAWeDkNU5I5
a/AzZ+HAd52kpWaoeOYntP82HLRQarahslFtdwxs6jsyHbC9Fx6Nf+iEdpa2nqAKh6ks+ntDEFJx
W7h58rosol9ggyAUt4IiArH1yOtnCx1Q+0i78UHuB8jFcfSZqzEUlbtjcbnJ3M3DtLoQy1fOZM/8
wYf6gNQqvatUvcbsf7waFolsaD8ch6D0ltmL0qwLA5PNyGKPjt2+useQUYwgu3ORzKcV54L3mpZQ
sf8QQciRMsIqBqdhdB88c0qIQJ9kNtxZYBm+uSAIbzGiWWZZNghgDSLx1UQ/1K+vveJHYWcNlgXe
RxutPL6xmv5ft7fwAbHa7M9uywlnbyVZ+4sqlGnm6fNQKFdXfpPi/XfQ6vRsckPIFOW2b6r+W9qm
DcRbXUbt3AVReEVRkTpAirWd5yo9IgfZc6evLiIKrPL2ZuORnu7T9xmEXtDoNy9Vb+EM7q0zN1pY
WXfU8doz21gfa0TZgeimWg783cZk1xq/IjD10S3z/UW29oKmPNQT4SePmqtNYr+9zNiU0/CNnK9j
ZsHI4Ndl47RZDSkm5NVXsm+1WKzT9i/oWEH+8BXMEz76O8KtkJ+Ok2oT72GhnZLeVmjJMxjNeCbo
havfC2lAip3tB+RFkH31/+8hnmx/78OCud0C+G/Zp4dLuXXMv1xfXteWLWgPnNj3rXpxV50Lqpho
nqvp96VboX1qPMBlbl6pdyy31AASiT4o+HiSdstfqS/dO5aCwjxWnQvdnCJAty0OKqVUxSxgacug
U3nIEotiuwfP08AoUu4BQs+pOmmhB+/Utq5Znxy1fnw5HHGrqkLSTLo0EkcKFUI3pNzhDWuiSnhU
Er6f6ADYseaRoHUUzi/NlNFQbH4vIcFi0/3irEHv6aNPgc6tlNVxydTYkj9sjkVKPuf5slPehE+T
04+/T2tzEUCNn/lzr7wpwcOgjYMkRFwSeSHeflIspadZwO6I2WICcYMdTGdFcTXASs4aUfnvUOe6
kWCY9jS5pB0diSyDgY7LZyTdtrPUNjulx7oVA7zz9ZYoo63o60NIW5f9OU+5MB8ED21CMOw19CQh
qMCgwkFSl+4fUDDEYGRPhsOhuL21GgrgEIkZoLud/mV2nUnDnofWezhvb8ONUUKfh7sYF1acIF64
KKGIyUh8yOGDvgEQZMAl3UBPtyq6mFM1EbDqzgTGMCITDH5fbTsd1fB+6Qqr4XqypEBPizyqKRWM
5InA02YGaBfH2FHOZrqS2caYM09mh46Lgf3SzNiAbTpRmQbRJKRnultrm4xbO6P75vvgEVGLAdFP
LqM8ScI/NrEJi386ULBGWSFDwyccI0rkUHgdlCQUImrrki2ZEaKe9qeVIn5ReLKBVKKhIu1fqP1d
JqA8WDNh/gJjMtlEivOchpCEXbXa+0cIwClT86ZYf3FJATnn+k826ZAlcHTcne3R8AguBqQgAQZh
qhLO3PSO1N1MprIZBcKoH8IFTbq7Sr83sqrYubePlb8ztvHUX1tlU8r6TEYd6VDHyeXLXyWG8m4O
U5ycldOKrgoHgu4mR1fexF2/UA7r9Y2r67PG/G2VRqpLSmO92BcidWRPBOt51wp3Zyyp2GS5C11m
ULfloJ9HORESXkMbTQxvullEP+cs/MDwr0DIdRnjOdEAO1SWSYEDmO9lh6YG2d/lpwcEft26sIgg
UAVT5LfSiHD5YlVt+qyHlseExnhLfDKnHUmIYkvC9qJ15jznIdo0Mhg2FQa00iiVZIMexW62JB8q
naO+8EhxFItK0gNum7r8fsE7sMwywAzjClRDUm9hAhzgS4DXhXsvF0xVrXvl0tE62jeNpy8PH+pk
IYKC3y0VR62GlxFiOvHl/sbVMQup6+nW+hcBCL9h0XWPaq5wMK9MxVCPry4NzvKs9WawPp4I6IOs
EyxbpfDcYJZnd2asiVJkebbAmufCpv8K/DPkVMvOnvEFAYZDRs/2NoZFpi0bnciWRvYbkk+DicpX
BY7GtMn2/Bq7W2VAfS6xx/u+5MBIBW9Wnbkr6bazBim3hImtFXEM75dIQ9+64ZCWhp4d3C+NzCdQ
KSNDOvSSSyFbBmccq1HPpx0gNQt5QEW0D1B7Nsiq3f8I6W7m4NMsVvdJ3fsfP+lYEkOqcJNuFy9y
oc1UrmECCVAJ5BgkESehHv0KQvvrtLHFCytt3ToukN8YTEyLPFjjs2p1CXQcURMgPpDUMrNhCIsF
Hmxt9aDLIgpTjAMmBl1CtItPVP8+d3niZ294E5cGRQ8djyOS31An1/uHeZkLVO9Xh0+7I011UHff
ihz1BgURxCVTxIFOE2xaTJU3HUKGdogZSSZtYxaTEoasiIEkcid4z3ye2Fe7eMj+WjU9Q0DNNyLK
j/MidBxYhVkIaAgmrKvBwxeHjTRJEh5ohWK7T7ebGFjs6np0TjOGinROT6bN4sz0o50eULBoZxYO
5DB8TXMgVp4voKlrOzRNEBOAnAlCZtZadoqRt2PIZHZKU9d4gIc+iC+LCqoKONZ4KEljiWWVo2F3
wJAgplZQWTlk0mNPyopIfcpKUApeuVIL5Gc/iotW9lBwaxLsPM8Tb4zYmmu/mXw07UZdsZsx4R81
oCHrTZwodJCWseqiFdvjGtFQArbT/FVlfl7P6Iou/Vs6WzNuNt+YV4k4jZ1o/0PDE97rJI+YC2jP
kNsQEgPxhUNsMVYgAKmlc1Ms65FE7aRs12omboA0G5l3TwwZFFm6Srp5Myly2rOzKrEAhiBxje1o
eLc7STia0Wxxk44gzNqptKbwt8q3cItGeOl7fLP/H+FX71jlObIFUIFr849AtXjdWW6XHQVBbGy0
A54pg6qF84w1LgbWaJ8eKJAcAlrQVXBZI2Layo9LHUXZPviaP2CYNpUvJ2VCUxRzc4KyJv8t6urP
uShSVlY3FyuuCqIhdF5gwsX5DukBKBPqBUVZ6KNlvmAPchN39isfeEvi7Gjg2xmYXdmsD0/r6Q19
Dp+bSG7hv/DPni2adUnoorsjJeon4/HxfwqGtP17xRS6MHbKJHFUsjFqyDfTn9N30OrxNpcUoHPI
cO/WZVrTtohtp9RE11KwamfzfVKIKuntOq5xuJXJRw5sc8YgDOAOUYJVxN3mRTn4WQ4UFVcJDJvw
dh5SzvZ0JdXiD40mQQc+tNhzfkOOM6kLIgYMsQIAjkcmI4SLdgFE1h+LFTfeSdGAzZf+qonbXWGh
O//5z6UAI62oMAmBKw5sbXcEeFn2S/td6ePQYWuNpze35mKYQ4jP7O+hGMQ/n4/SgMEuO4ncGclK
BtfAH3wE5mphDRsg8jlXZEqReNr2raFt5LbLo+xozFvOLNJrqMH6uFuVHiPwAmfGysATXOgYGoq2
SQd5S2F7P3gPqWAb/DE+rOPenpDJqsICpWO6q0LAMpqDd41V0lRgnTq1e1psB3tX3geFqIDRFZyP
YeHgJFroZ5ZlUcl4B4k5btIUMbYTJhyq6CjNBTzGsLuNXqpErhIPUyM+jC2v3W0H91WSo7C5mSWD
ILH+rH0v8ecEvM6AHLulwpCIBL6GIOllsORw2MtCQlwShPtGutneZPKD2sJDRhRruogg4zRfT84A
BXDWElXCeUq3pZr2XsNk+ZtV4xJN0o49dUlWXAB/v1bEgrbHwZICBC+5c7kbuCweVM9mR5kU6W1M
aGHCMQJ4UZ/1Fr4X/a9PVYM6nOmqvy9zTVdoepoHpPtbCmOMUP9M6jDanvKK9e/Sl61S7uAZeXw1
3ZqYlXRUl9hUq+hx0eiaTk155j2lFdMmkerH5D+YEgfYOMUQaNIcnzfI+oA5QpAxj3QbTXIs7kZ5
Ung9FJqY7htnIfd3s5TnmM0bQeiUiCMwcEkzKBPvO755Sen475PkBG6eIXxOVwlR4cFeHtJ/DXGY
cns8ZyC3V0tob8LaShyCCk9i+uJ+BTes8In/2cWy0KUbOqp1R261lzhTJepf7GRFuHHODp5B0jlm
iCuuY1xyAQiwXBhiThvX91uRWbD7IbAqpCJ4m5p33RVPiy8sSQoNjeSB5Ck5XEq2oJeYw36b2Shz
gHF3a/wK9rHA+m8abQN9058jbtjp8jaVP8gEar50C56oStJ6RxUEAlkRz1jGyjxwX5kUKYQoNh/C
y/0zCwMtEbLWjWNoHkkkZQpfqBN+T4jrH9r7y8gwj+Pw5aWjiOPSjaveWCe2w3Ghynx06Drq4JDb
vAf7ycY4pkByBXnFjoDQWvme3tK+Cq8YcMWA1ZBSPAk0AOFN7ztChP5EfjgxhjV/kEHo61ifi6K6
n9Drx+maCAUJadae5qxe5harmMxVq5UPhcRrMSOhRdKZ7rXQxOchqoby7DEI2P+uzcuDO1oySKRB
evt/GDxL1+eppCeKcSA37xg3CT1KMClBXgv2DJxxvXRjcyp3oqMUYh12yJN90TrruSeLL8jcpagO
hq2RWUh5ZkMuVCqNcG975qH1ibcBJ+shQEkVeMQCwaQY8VF68ogJCkKNwMDVPWpdmqlV6XwE55Bk
MW6Hh9fPZkM4Ix7rmMBpmiLVnBtlQBkv4GIeY6+8wLd2GUHeNd6FgvuLOZtnNVSSqrVwudB+WJXM
nq/Tg6Nb4IF7COATBzy9xiFiZTN1o2ngRoJZ2z7L06g2jYlLT3zqavRgxJ8T4rTWqWAuHJ6ctS9T
SaUSrA0CM1H9j92M1PoPXpr/ilS96dITJbhAq5mI0tJm6wwMAHuomFl7bK/e9C5w4YJB2/+alZVp
rIP01PWB7dI8ycGv/jLAXYP+Cl+XxjwAmhMb1azOw4IR5ycYKJDQSy/fRftD24ZqUkj/oEwYaXl7
pybT88+ryqcwvDaiJR6KrAYgmNvvOHjtnn7b+/pVIH83jH2kCNoVG64qNlvWxY6tHyObbkfDWWuI
L05Z3prtLMRxxE1OABUWUFLwFa+YgqISRtk0JFbFTOx0BLnkPwuEYjzgYRyvd4pXDVMX7uWjKaql
fQ3vQTFWbjK+aUpCXaECLmRCuC4sK2ezxuFD+AIYJnesRXv396zAY2rDQgSooH89ii5FcEDznsVp
M0Dr08ZeTgofAiM5696COw6Puzj1/cQzdvz16JQDsP/Y/kP+28iT4DnCO1NIPuq074XtiG2NO/wt
qsuu/V15U1XXs9YuPh15pyD5VxgxBRawUsMKi29t8q6tGzHAk0c5RQx1kFzwWvih8IPNEgerm4iB
HJb0VdcQYFR/rmmb1Pxqssa6Vboe9cV6uSFvvosoEWdNlJiAY9q6B7kQA2UG4nTC5S/n7mHd64Fu
JH8EFw/9Ri/r5nzXBaqX5SkAUJEUrqlGqMmKvd+nvklr/BhvS8zJPX+69jCem+UHgk3+EvuElRDq
LphDKTa3ZJpyXZCLO0MzjjJE8XptbLDwv8fw9n6VuWif3diNMz+dngGBQwhXPJW9TKJF14WahOpD
OAgGOJYQ+E0r0/k4txavcq6O03fmazfbf8emKULL6Q9SG2f6qCuGwZFJX/k7CHe1nsKXOdrNJ7H6
YAH3AfQo5ZpxcS2FbRy9D7jms7PfwjdQoODPgcmIpRza/NMn4ecuK6W2Be3k8BpZLm3W/oUFLSDw
hY0z1nOqP1AGtYIJ1p4/y5fTNhKO+D+fEmR8vC4SeOTHD6Q7fZ9+/zfdhNMKQa8kuFQdxPGa8f4F
1ot8MRlxqad0W44J3Ve+KTCH/XADinUmm8GmouNBKAPmUwhnIxFjQ15gaV3SliLaUxexf+CCRxLC
9FhNZoFabu0yieGhsR83oGEKEBKAi6rtI9YKlGDrB6vWQjl0wLpmng9jGomwFhcHgbrvzpNLAdng
bakvdrApmkQFsMJx//xICQktDCHJ1l83mJx2QVgm7bBdiN9bSMg7d78T7cVb9MM3WrLIyetzNaoo
DkjeMHvGwTHX0rnIUtEUA5Uz2WDZ2V44nQS9Sc2n93PqUHU3TLB9lL8km4eF3nlcmmDBMQaWehO8
BBDDjiYxZ5rQc9WD/fUWRPGjmsA4TcXCo4gtc2KJbSSEiOibWpooigW61w+GnUNHBACNbbIe4kpe
CF/ZAcopAzOX6kJtqDNg6nPCyAJlNplSLHbRnovtav/PMu/EPxPEMxDk0oV1i2ViVE1lpKf7SjzV
PcGIw5MXrwZGFp7CCL46t6uuRRG5qDh8euxuozJEKD4voQqCdFj6vRq0mqYo90KIAe/TWF2Xqm4F
H9cqWgL2Q0N7pXwk1pntI3ThR91i/b+mvSsHFlbLWmGdFNtZtidF2XxDqGpYvHKP/U1S6nJroH70
FJ1sGcoCy1b7r0e+bTzrAIgX0v3ykxpUj9H1tv2wVgpvx6lDGeGNQF+t7qoLtLbu4TEp2ffZWpwA
pdDP7aPJCEKTtL3xGIwLwZOyRpT2XXn3zTCBgDgYQiMdwD7Cd3JIGSqI2mLba0yBmEn3M9GbQGIe
Hre7ipOs2+nVj7Pnd5fqq+moD3ejvhM/HxEtdUA9Ksc+GxwuUT8wK/KLCWca348FkSmZHKQPK9An
RXuW39H79RZfpiGHKVFe1bZiL0Z0bT+4n+lTOcwnecBPVICvxfjwPO9i8jDFEz+kbLae8oS1qyq5
GhCPTy4dg2GEQTlqnGcMlfpXQE9TlZJiJpDLhoQogAqbjdgdA/T07EYvJJTyRd+ptm4S9K7YuZwc
LSk4vrfubWAKYpJ/aYBkdjH/Ey0/cDLnjoAhz5+C8bjnA0Y95IjNQkzOcNBGILp7f82dB2/ZKs8M
xjeYPhpD+Utxj32xFtWzQImg0KDlqpY5Twt9QWhuBZg+8UB0tsGAiRtZqjz4nkkRk3hx9NQrlnwD
1ET+NFBBR+9NEEubavNMt75Ke1OzDNvy80rUeW12aA62ATUCV6Wa66AH2msVOVyNxw9fX4N0O6Ss
FJ8InZE81atYNqTZSDzmN84aJQEiDyHYRVWTDZafmgqLpHR78c7+c6sLaAjWMc7cf8PwRFd3vi9m
0gspJmLPeKCkfbckFhj4fNa4bfEzOlNPmbjwBMtgNBdcrCGPFXklvN0tM8rtJ2fDENU29z2UmTBb
ElFXqRVjV5Jy7IT31Vd8Q+7oKDRE572zIjGNs/RkotzNxq4a21RzrYU63GZ5EGu1lIkakrFJsu3j
39mAV3Hf5Krhg05yEYdVOeqoO+2W1nQpKgsj316YVJkz+pe+sl3pL2f/gzBaBW3sv9jhGEmM6vYG
DeToDQWoTQgMd6zH0vfc+LEj0gKYGF7q+j/x5J54wtXvakBE1IZvAAnL1aXk7YffIaD9Az4yqfnA
6DrPWZ4eRVHDcIpYgydDMOvKvYuQXC1zsUYKQLcx/H+jwaYbGCkMTJry159srQZa/sLnocz/gOY4
DL/V8HsWHKpE9hdvVqubEaXKIFfiIYekcz/20qloTQqhsRuF+fgqq6xaptJXgNsSAwEhG8VA12pq
1Yn6m/gfZJOK1r4gPwA4cm/HwtFvjtyWLbC9w0dEjuVO1innza813WeI/b00mOa96MTqIqFESP0h
fCwM1iSCBe6uD1tSETEMlZxQpgoHwQK/KdsPapnpajd4e9P+3GiIzSnYQ/SsnzsSj0QNHOEHqawm
tK2g0FSV/Fc5d6Qh4YhmrS5vK3Zv9ySGnOKgSAOAnUZAPWb1rdyybAAFSlQk6ChOTzqMiFViWoEr
TWccrnvbwCTtVvu9/m4LsXJLCjrfOzUU0bGwmGW84g3cAPVhPfBile8f7gSR2tV53ZdAdt6kHhwF
W6GGuS/0CHGLYsxFeYXGtapGKsV/mZ7Ui4wSz369x7CRr05UKzzhHkQjSfdr6j3SSSkXw9Yn5Dcm
IsKwuUqJNoZLBUplbQWlrr+t8/wTm/v4SqJwox+I4WgCUiunSbkcXQgsO4b4Vcprm8//2oyT9jw+
j5htDMgEZX3yxQPEE487fnXyV2TE92fOBynJ9u+mALv37yvXgDjcvFKwAaWeEN58Vz6p9okWqxVU
cWTVpqndb8ukPSX+NTi6E5f3QLYuRq2ZQyvinlCmktR/b3OR3TBUHsk+sPPsH12Hmplz+VFO1qTe
J3vTV/9mAiCqOmnnGTX6kBN2UsQta6D+Nj67hoNWqbo+0Wmonbyd0DFB6wi4gSN3L50rgruPix+i
c8l581gURr7SpMrQmp3JSdIGgr+Swjz+hbDPGGuFvsbwcIQONv551zwhavhAoYD8WEJM2jZE0crl
PZHq0M/0waZusO/V+2SGqS1V3q/WFniPRZM0hnJ5EsyZeO3EpyTpAcVmX2mYuJj750wPE0ALMDs0
M42jMzFZ9yeYdecpJ/rtNqxhZ9kP7YRIoijrIKq8yt2XqUjIkghIELWuVF8waaTz5w7XRky+cAL3
lazwYztFBoCs7Chq2rnZIa/gQmTpk8bkY7AadWSifo1TDd1QgFMfkfLTp06YTAJjT7yvbmus8h00
yo3fKMavfPUeRDbDQgijT0VtFI/88QERo6g+x2yaDO3IuhMvLq7FCC6o396fRs9XGIiS+iagtSOI
LUFaleklAQfWZRSYQRrRHAJvC8opisZyCRLrX9FAbKEBKp/3M9Jt82zyo8nAG4RSQxQcFWWemPZD
2FGuHfCCCkd/4Jc1ErK6HiYwbS1U4aJQM+0vNdD2RZ0+Wp/cY2YH7jtpiuODKdXYRR+kaKZIaJA3
CEkBay5w1NsJ40CafE1SvfNQts61e3xKj25MR8f43kl3m0NDCyZnfkcwuxRLaf0nXvMZFMOzT1o1
x5ZRMXKeS+yw6LdTAaJ62EXcgoXy8bqJGUkLcH5Gdnu1Lb/z5gOLpM5UW5A3OHF2JBFXWPXPVIsk
PVhog6NZ+0Y4b8f2nJC0Vw6NB5J/uhMRmyQF+2vEiqZecJy3QROXKo5ce1RGMpF+s0D7QJ1/Eba7
RLhWULS9SSVRtXbW1LOWHhxttfriQs9+u6Jw9RtO4ysiUEofOzvu3dHYhHSuW6coVtGC0A4D1UD0
PpRPHVpLhWcqP8T1yXTaWDbYvXK9GUi/3unuaM1DBNCh0W7+73y7hLjg2R4z1JW1ILJqLNz7IMvs
WpPSxn3Pfs/NnU8lrOPcVF76dlTfl75iV2dxfQnOqwJHWrjvufoTIA8iHvL3SzpyjYru/y/nPtZ8
du3iO7XxlGq7Ht+RoSenC0c1atcA7A2uV/NheknZvOtufQeObFcfxLs7PXscaYvbUz7xyh7heuxs
K6/I6y7eCyQHjy/bdyA54V706648qMPX9eEEOFCgFBoSkHd5JEjUjIBGDPflMIrp6sCt2w2czQ/u
ORaHR4MWi/fGEf/qSaTQie7pqxQW4JZpZprRsS2UTnL2+NH0ZujiHliz13C/KZj8H673W2/RJm7G
6Egjr4ZifZGc1siucqi5EnQpPZnOUGRu9RozYerPGAM/zup9K1+GO2YuQ4eBPVJmTPj+dTCvcV/p
mFf1tY1TE80mC7mw0fdUHrOcMa4NSvpcMswFK3qn0im3D0HrFih6njrd6dV1dISZ8WvRc+T4/MU/
SnFxi8C1D1BzsBmBh2NeFuB0O8PePRYrDWKKIkCChCXbeTwxtHVpCHHvzQSSiUbIW/y0BG1JlFjJ
8eczwMYeLaUbL3NAZzJwhWw6Y1HK109X9nSoentTpniWn/rMRrknIIzZUUWmABIiCpYwKkJGmIR4
qwlC34D2d9lYiT8SkmnY6XS9utfoqbjIGmk/LBrCeJRI576nkQN/x81tN7WZmZOnj5Hl8biawfCW
GovfNFw95NA9LZkO5Bwi71lX3j9UzZXc2YBaitj4AEaHTT0k+AhLrSURWMBP4+sFNjq6jBqBi71p
7bZx0x6OXlo25mnVYBFpcgbJ/xkQqRdlmgBvrY19JxmhXZuV9XJ+ByGoh1zCXtfKzAc8UMSAnxOl
eYeDYQwRfVk+vkIVg3oj2xhjRqK5wSbKEiyYzj1+11jCvHFuz6MsyFfxvPFdK2pgzTNgVimSD/4U
82HFrVYyzkyKhmTBI3+M33oIUEQU20ZYS/sJY3Zhpus98/WAYhKTKc14M26srGN4/pwFxC9oD1S3
nu8FNcDkRwlbDvrJlZH9L4B+Z1E1UjzMvEWx9R9gqoGamAwJrNblgKN9nL5W6hb/k/tVWmHHkUL1
MTtU+4iudgUplJmUDGDtqrZ8WnNlysOjvCVssGr0uA+kAzlVo/0IJMosfsb/OZF/dMaeUnLjRyfV
HT5lJU+ZtqEhSexoovU7S01yJDbITzJ6HsLBNFE4zC9gHNuNaQ/6WWF/E9LJlZJnrDQ4jITSMAzH
bbkJMd7YAm+PEUAv8RvoYHH3BXrcCg5NaHfnLc8gAgYyB6ilQUzFjP4uosMv+cdSDnu5EUq5XXhC
OY0bZgw+1BvOvzm7soMSqj2zl3Bajc4oRwSzrIadcgztMu4YpCaIarorPG17FU7OHln0Na1l0CbQ
qLR17nF1koR/FJWlhwHEHyQnJk8ebnxadunA9TzXBbr+72Byj72tfFKPTgCtvD2c1WBkguY9U/cN
apy2XmPMZPZGxbh4cGvFqJjQT3+cM31KKzQo4INssXHtw/W1PiESM6Saf58W75Et86pYJOVlWZRo
VeFi2LfpSM7osAUnQl7d4H7nhd7O6FngEhg6ZMHt6qSPIFA0bRZ7PQyj81VMZEdVieUh2ZiDfQ8r
nvCYtyTymZ0qqugq4t03WnjINfugIHpKVElb+TZq9A+caXK77a2W3ntk2WzOxGwq/AnI3WEzpVIH
ZCRKFnWMp2IkwPAfB6omTeKgp671jam987Qv44dj484QGBRZUdlnU6fabFmhVxsHJ7+kE9qjz2DS
uSONhDNklEdDikCJoO0qph+taneXIYxilRqO8EZTt5Hcu93mXhQ1vXDvSeD/vqXxAlGzZqKSVS09
DN3GDMpX79chIt3VWHTbI6RCgYn8qGCQ1nowMFIgpPP4d9/RtP+CUYvqUDBcA4yns6jZEs75x6jc
LZQ2MZVyprAN44T4s1Dkcbx6n163ajXwUaYMdqfC+aciiGdHGrQvFPbSxyWQNZNJrK1knxFWJ0f7
F0ZYG/v+wpE09CzJhKuTpm8FKP5vP0UEcqsnzujEfT4Unz+boRfY6cqL3p0kqETraQmOr2uoWz9v
cdW/02XWpj30TKSPITdhm7Z/HZcMUsjMnpOObqXNJ+AKy+3cTLtDCRq2ZHSzixVcDxPF2421O/Fa
X/xtIdUEY5465Mv6NkrrLC6P2UKJq8w43xmB0xuDHSIgn9IIg8o0EAIza097aiXo5FyJypNtRABS
cVVUq6x5fFL+BfcbHx2DLpdBgxkRXE72oZnWWI6sP6MVjZXT/2SlHDqI6QXgWFHeoaRrKdHZ3h93
opZk1VcLT8ALPgqOBioVUaLdVTrvMG61lNBEjvP6vkQE0FzjJLKxMtPyL6tsoperoyHwREm9WXv8
Y48OqcrwMDaVoeFDXKDAiy1/Rukl0uLIWKuzA94CsYiKqU1fqSBmU35QUQBfOUNBLEmuOQevHVeW
4R98PEgYl9zYV/OP09XRjUjilBTM+moPm9DcNl8A8+FSEMgakP2zq24LbkI9rqIBI0N23IfZZKsU
yirFESqq/UzqaUYOjALKJ6IvZlOS6/h5Mx5ZxGqP7geB2XbHbfy3uwtbQMukolrEJYaVKji1Ko32
PHJu0m6sWO91o0rVBkukdibTZU4os+cws5Aoag84y5DMygQbTA+ZqI8TjomGdj8214ynVUu97T/f
9w/94dp4Adwj77JkBFinEv17lNPOubLpDhMQZIOgq2VME/tylQfkq7eYuAVPLQ0mmu7LkQ+o1EpW
mw8A3FPKF5ZlgtsIIcxUi3IxWTHiOgDuQqu4xa4vK2mh/EQ0kyCXQUNCyz6sWna1NxnndxTNsnik
r6ebK6FpyKeRZZdVYRQ8PuuGTlXqAqC+RkJwG5AF/sNqprOzJdb6+NhYCMSiKVTC589fsBMX+6LF
W7URbleHTH1YKasIExkevQ9a8MMjK1oxa6XC125mU149PAnphKwkMGDdFNT9Kt2OyNQT/+rc9UjK
SrHS5dCddrrA0FQICbyLMPeToTZjmkKiZPXTOo5CFLEGGLd8VpLt6/NIspKyQBkkSI/tp54SHKlZ
zWryBkwrGRj+rwQL7y95hGwfCQLMWAunOQy0rxYejdR+8+oYh5GTg3Exw0cZx3dX+fLCseggAd1x
7xnI0gBRQQYJZMx0jj/2gbPcg6tygu+0/ORXztojpjZivZs+pxo7Li8ixtHscxFH1rFX3N3mrxvf
bIbmV8png22g8tI7c6afe2f9HAqIHUSd/ZJSq1d8Qa/F1dLaQq11Ir8YgYsUy8B2KdYCvAVjseIL
09nuzMggP2MA+7Oilo8rM0p6ZTk+xs8zv5y2QpwK6Bc25+dagXYL8CK0oaNfBhV4VMp7JmVjdCgX
ozsebvnItO7zf/YdMHP49c6UrPhWiJPFBsicQgSVmIoH7h3rnP22NqcG8cm80qEtgfuSwIR3uQAT
68LJD1jD8HYcGfNRcVrnbI0ZrL02lmitA8rdzcuTozixUjvFarnCRSstJOOwkyew+BjJvqEH8/0S
3BdOecjLPVNbJQonXYe1ypUBJBQH+8m+dHdCezvjzWpbPf0zxEVDtKXoUuh/6/IZS9uBSyISF/5v
6QXTDUMn98gI8uAWQXB3RCShv+lgq6ck85S/K4FEOZqiA4Vf1pjdecpgUn1DjuGwmVoRxCaNjYiq
ANqwiFt9h235Rz/svFdaXF1teKxM0Bt7rIPFy/CXivRt96496Nbw+77sMUgq0INBo2dtsuJzNYRn
3/L2+NbB7myNE4OPxp3cg9dX1FLMiC4cmjDKL9Q8n1EbEm9h+HW7FNyWfDnQb0SmMC1xfkfvBVO0
TvQTDIjMJgIAZvKCqSDmOkUtvtSEySww2GWteXnVWOINyNzQ+EkcugWNpXnZgqzKe6dF/8hDeB8H
1nYnUu98OvLJncXv89Lojfz2WYK5pF0LLjEMLvim8qbp+SPZhW0mDIVehoQg3Fw5+l42r4aUyqbe
Dqnd+6jvQceyYyc0l7EmuvkEttNx3XC/JJs77Wt5H1W2qZJm8JrRt7FedgRQdmfaR0Io51ZPOsqa
3w0TsxujJqTon0ehcdWZuNF16AS+hFxyvJR7aM4EvdG+J8gLdWceIvHRn90ONhs2jxBgoALM/rPM
1Zb2W81kDvUAtcnjZjnNQSfTjCHn05i5vstPDsADtXLayNewwbaezv2kI34hfedeQGFIqC51pE2u
JW771WdSg+9iqgzy5vN1/1bEfvurDBIo+pPh/LXG4Y5O8uue9goRu3ZXHzR+xOPVl8pitZz1UQz5
UPaGAF/Qgr5vgDWbH/tx5qT/urmxNRUSqm7MgUeq47bbSrM43ifx+jkiIJVjPbXDycVOkjcuk+1J
cfVtwXoe/OR5blhDT/J1zWcNhfNlLIH4XFBzScC2xJEB2w6KnsTGe19STMLAbrkCLBqqO2cPzrkh
A95Hk8rzkVqFFQwWmlKzlwh9jywxBxXDwfCgBLLrEEV3hS8yf/FFtQH1l8JWEpSce+Yi7j5iiTAb
3SZP22XP8UdGlvVa2yZHOJT+mRkEkXAa1LV2kcU1ayJZXoKPzemI3JeQR+GVwYikhOnJYoeijBFm
OADljV9dioM1fdNDBrvHJlNxxkr9yYQ2zgCAMpKzm7MHF3pvTXJgWLrISU5fowGJzR3eySf1I7bY
ev6Ybl7hBXfS2AkE6znzuXePqev6rN8sFdyTnFxozvx2qACIFP7S6JhJeRu8MpKHBw072xZkuFRl
JBjoGFp1TXUlTW/WZmmpuxzAH2j17lBqfZ8+rKIPf/fC26OEpQ3+z1AX9lhdlW2+yAKFV3kW7aCj
+7/c1nB7HPOLBvb6PItv8gl3EbRN0orLB9d/Kl7nYxHT7HbsoHkNo4TwniHp2DeSGdoOdpDZ01/L
QIkRveojmfipWAJ6pvMClHAXp5quTJsSDUSMnL/SG6MXSVM4XXmJ0UKiFoFlTEjskyNdpHPc1Pdc
bEO9B2gqVwDASbfcBLninTdvxssG9RbWOnMEyqVzr4vYQgTpQXsWr3iUmUepSXnF3gI2C//aXeMy
ATxEuod9TVr1DsdgMonrWntmkE9pbsq/8yZHrxdTxA8tN31SJxh/Ej7zQ52Fbsei70LgdvDw9kau
76vW5tWOy2lYbUTKKmQ5tPlfdnd5DjT3OprEsko4qQfwU6yLPd3QdmvaUwRdepKRL571w7uOMmFx
4ys9NzzBWuMcnp9mHZbgx8qfNefmlJw86umHZT+nwQ4Vh3AQXDAi6r2U2pawRw/dxUaIN/O38ioX
J0dzqGF5BuPk8CHao5bRyuFO/eCxDfLUUGM46glu86rnxa0LPGe6Fa8A+eHmOWdBYSFVSR9MvulB
ZIJ8zdls8YYK3GMi6ep0DSm4JlNON72dDY02fI/OuTmlCl09Bgag4Y+2KcjjC3kNnekJUKAoup3H
0VDeRvF550mWpb802yfXIAg/9JIh/oJBdyfYhqpJMYQ1uBkmSAoBd9YtVL/gSqU2DNtrlzO/wrva
BsjYsmco9/dBPpt6Hz8u5WiTcIitWCcJfBDcrHbliM6Es6iZFJ9OCpucqMkzn0EMJN4Fjm/jXMxD
3yzEHCn/WEZLAOgdhl1Cc7V0LP4XGkPTqn7Ebx/1uvjlCqmiUVPFM9kcOh+pjRdsLaKyxJhj8cms
o/JWSIDJJo4w/q3kka8QIY22b+vY8IzTSofD/m+ZHX0uISBQWcQOf9PKfXsfjr5za6dWmy3NQjPi
WdtqC2pompDpMhnUDFQ1eaIRstbRhJMmjlUS9R4j8A0RyCF1Q6DjLylgJGbY/Xe+MtHbbpxsl/4G
XLNE+5n7B3Q40givkfRbCOiiS6g+tbYXWL0Th/LBCJ516HZe1N6yuYYccPcJzmo4NGZCRZJH9fHI
wF2kT//nSrmNPO+/OA0Mr+XdYO99uvm8QY/3Bmc1Nx95GsnfHtUcMHG2ldwX/OR3CqtXPzAnHzKp
W9UMX2BG9XrTi8L13hSez4O6Pc5UEp7Nz+yJrHannjxNElM6umYMh/CUOPeYfSkDjDOU7JfRJCvh
L78eH6OmXCllk5xKbuPkq8hkHeckm1bGa51xGcP3ZyE9J+JxeLhAwwLNv2LiBTMoqSevyMZEG8Yc
NN88W0jefwpiwZDiJUjqpP1jouw3+jGjzMyVBkdEp1m9RSWl/2IKnR6WooBMU5x52R4vHzgy3mpR
HtPSmGajnKzp/KOVZ9wcvOs/ktvdoBqezvGe8NoZ707y6GjBa2Tay3bbybwXTL5Is5JNIQ8U+YYv
h5hqxGjWm6ISTmkRLXPKNQEU1wc4T1wgMi/m0zCN5G2XszJ8H694HMaaOaxb0i2UEi/qAgxdWIC0
J5boJ75mY25BZgIP4BP4Wy1pwkLqr+KVC/p1X97qAQjQoWRXbw8F7UuxvsD6TYl9JCNqfIHkjRyD
wG0i1awrZJCcKHkiJFCAPMhPnXdq0DEYwFRUkyo851+f6Q2no5KcW3m2Q783UgAtqqgKutHx9z9m
DSELtROY8IAnrydmwq8pZ21uik5E2KyesXX1weDdz22/V6PQ2e+kF7amGiwAZ8Pf/41GhtGRTt15
j4KmnkGIMNytiutBXyV5PFD2jlqtqgiI8UEq6o2wnNmUf6lJ+uGSdlzftshVBAs5VhuY/K43IF0F
pTdrpd7Od0/I2UBGO5Npek48dOGAqo4ZTv+oumTZMSEktd7Qg2iZZwLCDfUJaDsL7M5obnK9sC1X
G08y33kGJ2glwnvI98BkdbBQdNqxR1GWr+48OGUoRW68mN+9nXDV82coEZVOWxyE7qRmljHxM7Xq
0BwssBvJkUXopcu30zZl+H2l0RvJUdD0MD/uVd4yNtLxWBt0kOcELsaqFukxSGRxfwxMtDZ8Zqvh
Hs6BshxV5tcgEq53I7SgR04WL8cWjrBnMRxsm0EpJH730SkPnsj/y4xAQ9dDhwn8hd0OP7JE/yr9
nVeia8Py4GgZlHjkdxXUhB8oCEmKnypaXdW9bYAIswkCeDEZtbvBlaP8oocoDCpmYDb23jiRV5Sa
TcY3swTqjG4kYqjQ7JXXDYWHjFSR3ghZEsU+tSESnxlBMj4IGTwmF9SzfbA/NCvKXPQAItyT1vlR
K80sSkbWBuVC4Gh/s+i0CFIa9aL9PIf1WYQF8FYsjbHVXFkLguKIecVN+79D8NgUgBmC3G0V10my
aJ/CcOXW12uGOjG9uL3N704KH2nDgZKXtYNM/TmuIIG5oQn3nCsl5O6KZOYHsijQLLpBldA9Rai+
4850pulbjfR9LRv1lQOSzO1cPtZLEJVyg0L2sE6dfIP2JMGNeWpCmkqgI7LbnSkq2PqRCqEWfq1s
ACRIkblymHV49fXAB1gMKiLBQJq7iE/09WmDryejUxbafcNkYgfrhne1gT+ZiakrDNX82+UmooFW
/Kb3+PMI8jp17j3hjPAct4uJpIOUh5jvuGznAMZqqqXCAPq2i6C6gA+4nvbdZ+Y5rza9FSDxz/ez
V2VJ5kH10xVCR+kX7d1HivzeT7IGjCvZd4Qkk1L+IUHOzhVrgoM2g4YMZ8xi7RZizZq5gPzl+d36
nWuPLg69czX9JswQeB85QFQ0Ii5G6uBOe0na6X3806GIHsRVU4dqidPbMHh+CVgvtsoNCdc1vUUT
t8+lybdBfqAa+VIeXdJQbhl25ukxCVI+J0nEVoTD5PtJd3cjPrUdhQ890n6GE8xsYjwWxUgorifU
vjR9i33YAKd2LuiXrYdlq/aZS4otRyRz4ZUvFePapXQeiF8ZzT4W06xreiX9pppMJMB4ZCKQVvhj
zwHl88q9wpnJAuwC8O5DhuPw01ma+SDW3Op2nGr813qJM3eALfWB2kUqwrh0KN9TgCuEyqpMV/61
xdU10SFG0xA5tCf0lWGfbRZu/Bjs0TdD5ETmzaSrTRLBGrpfuYG2JGmX0K3XthSrounP2vCYBYwk
MI5LiJ8ZGLwVOAdgRWEb8o1KN1bqH5V7F4SoRV83G+fRs5xAF2PupCVa7hzrn2L2yAS0YtLDRXp5
aeWviNC0oWMMZR4WmTGbG8fNbfWoPBiGvxv10yqrkIJ8o1bTTjxzvA1GHU/J0Q51xeX5dUBCocUt
hEmoGqWaJpnofQRxGqkOvywhwTKpJuenRWaiSVYT7tPQTkML7jgrUuhoNsQEvumv8EmwjGoel5Md
OCE2rpkTyeq4RoV5jFnGQOnXFMTxt+WtBrA4u5SFelYuMmMhaZCLN/5H/CH2N07XgNqqsl04Vj3O
8bfp/G92/0rY3fH/ExO8kxzDLNG/GL7LvxoP/o0tgjcQHrLgc3DTWQBwizDjFInNrhXvrK0uRpA8
pJJ/CHdKqinp+8kPjnSHXuhzu5WGYeP7Ppdb+1xs0jJwzNutfdHv8AyRdcaoebz/IaAMU/JWZEiL
E3Z0IousDWV6a9wm9ax7pCZAC3H16Lt0moxHP5EIPHMgPbk5F/xpkoo6jZHpO6LFsVKUcNkPZ+2p
fbVhgAWfoiZ+eDVyUJLbSPFtd9fyXHhfMFjgCubi8IOcKLzbEylsT17+cOTZ1PM7vYmf/hmUcnju
Y2wVrPNrcB9TJX7pN8s3fLIE7xLt4qi2V09Hrva2K/KjJ847q9xa91hbsts1ZOnmLFxmOVEOYkFo
voxSW2auhd0rmr/Nuazn3Ul4bHPUiG+JfakwYNeEnE5V/CkeXAYeukZ6yOfgvb1xLLBpFOW03qno
JaxjEiIeC3JxFD6kYcvSl5AN/E4XqJIq4fNiMD8TUqS/4DIh/3+I+fUNC6jg1E6yGtA2nInqnq+X
DGoDk0ttQxyDxPGylpTn212Ud0RrxptEzwwiH0tLNJM6G0GX+blh/znYjRA2g0Qw/b+7a2OAu0RU
fYFEzTy5plwWXje0DbOvU2rWmNQWgOKOkhSBAp45WBVZ+M6Km2ulwz5KkhnpcJ7fFPKGOt6j4AOn
NLCa4XwIwd4C4C7DaAFkounKG28EL9Jr9cpZc81xr9eulLTiGhuRzJfIQhHgJ2nM8OzR5kwOAcbP
0Z+1IhdxFgh1Upzu3Rd2JJa7job3PBJsFBSW4V6bDgd6kBRDhgEmDY5hpkBlQODa/Bupp60TWRoN
U9GaM7MdGMTq0zpfKzjF2en7ciWOflya/ZEucVa1UKZCcaCUV63bW8CiwoTPSp6uv8pSk+irEnmr
0v0QAmZBNv6nEs3hUGeHVHL+xbH60fATX4EfEG4PaTsHnkQekvjJ5idHM+t4vfHM69j46fB9nTod
4Dq6knyQ2VDkR6TUCYH8osSV4T9lXk9T3/psDCpyYIGwSCjxFyqOahOb0gFqRC1u+YVsEYbfev9z
8Xyusw5CXV4LDPC6lQ7Mm1zQTYdTJ+F29HKryDJMtJIY52rnzcMklxF4v3/UJgieV3mH94wl7jof
8r0k3i0DjfCShk+cDrzA4YQ/zA6rG7Jedxeo780TEz9XfL208/BBuagMd0jRW1CIDZa8D0Z5oqm7
8QROa3hZhZ3XCs7IZMAjavOeHauGLnrHn1KecYfMAjR3T+qLTa82G/CyWZoDt6hQs4qhaEHzNM/A
kXVlyJnGXVIM0K1xDMmKaTMG0NYGGJIFCdoWObUsRTaYNlHp4wtoUbxJzV1BoHM7Y3Be6mai40vS
RDWmCt7meHukk/RoVZbYfOhjsy06+nN+NCWGC9JfQUUrt05mcl3oWyQj4anTdraErpKdsk9trh3P
rtMGuuPUjk1WS49hajVrytOKD48bCe/Ib2CKnrf/q9JIiMY64Fzy9aaLJgPUuOBFRmbTm4qBfk8h
kIdPJy+mLF8nnKhKbyPXUUY8fgsNe8JR+X6MbK8Vblgkb4+RQ6YxitEgvjEOiWRH2zgRXzMr8E8T
4AsrTVSK3y0MTk87vkfAUrIrz4WIAw0SqIYEOROdy1qk1eVH/lbdSYgyuhQ7z97eFvaMta3mRx6p
CMeQz80m8Q9IBJl1y6xwEtnulVBe6/c7WzSQGUcJ8BfECLkfnUW6CIXdl0e/wY2+MEpHXfNm4bH6
VuM8kqz02j+OGaYm4PqGvEA/1fw1Lu7afITBVWGb7Riyg2KMWopjLOKWfJkv1I29zIkuoDVYjW5G
C7io/q7v55Gxw7rCjDYIB+mNiGKffSOB+9IAFnQFY4Xe7NIq5zwB5l8rSGC4S0kx+M4rM+1UJXqL
+S+IzY0JPfPdo3bb+POHwjvzMNciw9SVrhRBS1+IceuVUAnOUB7WiCqtZaBfzMm+/RdJFmKnzNXk
5tdEpvEu8tfw2hVANHeXuBvWsXrHejPYGrxlkWF1SKpBABjifwaGlOVjk1GcleH+cSIo66oQ+nZ8
JDEGL9SrpBlyHI+KDifECOcOOg41arnQUHZD7dQkgM3oWO28Q1uVjJTYx4C9oQ67KWTqa0NPGxLC
mAKvYRiXr3AkNcLJN+/+jpA2qa9cyxNoA+HKBUuS1BlPotMcGxIilPg64yUWE46aK6PhsBn3FnkE
dk80dR9yctgCWxbvbBsILXeJuhImroyMhOaXLegA8lwz8/G6wIx0y8OpgTSqdUx54ghT1oLA05L7
rSZerJgEpwRd48+RMcQaGH1SsOH41+U7t4nVc3P3e3tCpsSbPQO/OLYNeSrhq/oBoJH4B4uV7Us0
CeAYp3isYBKvkCcNlMlaD5qKsSjJrpFWT7UzL6eCeX3shmQrmpCCR+YWM36pqcvbIRFua4O0WluU
Z6VpLfvI9hIoK+njZHaoXz7UC0XDbE9E8S5+mPL8fN6OMV8aWAAVPWBHntgqPe2Xk6kDFd74Qu2B
pHjTUBw6bbsRbPSNRouix2OIGHWZyuFfD3pzhjGScyKA7MJyuiohUCQ3dRYqfWypGKgn+9SVQ/F9
3dlT7Dr548K/3i8uGMUkiIW/4HugllHU05U0vcXCgPrVh5JRd0I6T9mF6ST14D93PhDJIuEv9viv
Hs81weyaXCjDXI5+zS5Uf1MW6do7l9UhPB5cLOMAewf3/dp7ZQzQDUptbhfPAma+3XDjOclQx3pB
KUYGUMFKJlKI0GQrXYyVE9m2Cc6FKj9KBi6w919efOfRe8bKfr9L7dZXmE3ibU1+wrAgz29aP9J/
WhUKTU01BR/Vg+BGpEBpWF6/ZciV+4Y0EaQ+DExN9Q4fGoMbOj54lqDrDVXI4PegAsH/7q3V4Yuh
XY8zqxAMgeV9RFeW1f/MLZ6Ls+mgpAy99lRZcCp6/kqKgueRf8X8wv7zsJHrODLNAD8NONjtRWPn
YXnP+EGF7BdKwmUOLPmNsHqEQpt2mCR+cfyU35Xf8cIhVvAwLRoBfe7FUyaZIDaJjEP8MsfLegZr
f8xDl6fPF1UUpozAJHuh8AxVjMoBO6pVEP7P2fnMUglPyKJuqIWDG+X1xxGl6Oe7ROAyODL/9b+8
2WjjNVyoJqh5F4rvydZ1y4CFc3g60/Y9WKxoBGsYv9fD4SnFDdMtBsjGTIcedscm6CbYL3s1LGHw
lT+UQP7eaypiqQHx66UzZzh9hMhvHPkokuAs4ya/p5F8W/nJyl6Dal5qYnQLiOU/B7aIukT0yDgk
kD6SORSZUjPfIqu6xjJ22rzC4eO/vKvulrFiIThAG9VDBRccX++l+QuZZlgDFLt9nUKbAZLQp14Q
cK7ioxmcZcC3LZ6Tcjzc7+mqf+fFoRJdjQ2MVZR82anPPznV3oJcCYFmj2M5O4QvjlymGAMv1xUP
twktnoaVvB9EBE3MAaRHD5cX4j9aa8UeUM9hiRRBmFd/Za1meLswTq8sNwwqN1VW4hPRgexAvQ6f
tvaMCJ9YH6K567jUanynAV5g8yaBPvI13/lUF2xQJD8tgMNgk/iV5Mq1miP6vTDuPzDJWdihNcgS
JnokZqhFsdGEHY26Frb85FdFqAMVt2Q8udNWzde1OFeU9E8nQLYep4kozt5O+AccnAw16TSWYV3E
vm7TJXph82SoOfnpn3bliTUZ54yHr1ZaH7G43hD0Qj7jbhrGp3TKaVjxMckJM9dxxLnOj70ogvfd
T5XuPrc1oOeGPairZewOa/E2Ducbug9XdNat3GWjJarkgy6/CPG6B/t+qv7dvnwE9P9KFsKSZHOr
tiCsayqHBROa5g+xNKVp5TXhvSTG6bKqCPVJbxjgbmcGIROb8DSL/VfXAY8xQFhE2avg1GA2GfY7
VJ4/GupkCMyEAxQ/ATjkHsCb9/ukp30keBdpCR/1R8KTDFBnY3F1W7JrIC5uJ78nZvq+4t69BnEZ
kRAkUECmkECzJKSLu3B/ToYjtbB4oljmgWwq5RFtnJr3mVqCKFOJFxMoTjNYBCgUtVr/5YqLJLLO
Se4J4nSWbN6bvbvYvKsO26iEOpJWpw7kWteGceNcmmyjYOnhbKf953zDrnkGkAOKhtBTQEYOzOwJ
iC/sBOZFeM3e/buameRNxLLp+iTCtkXk9I/beY+miiTjQLmBpwNhIqQ64kugGQNHUDwrO2RIj4j5
CO+wBAvpSXXoK+23BV1nrdAp+j3LpPVH8FE2g7x4Q/N+SwSdXvG28Rwbin0DIj4jiJlQ+6r2pS94
R3aKFze+Cgjg16xtVz0s6uwy//zZn1DX6r6Lf2/Ev2eYRvgs3bWhBPJ2iU7JM7eKrzpIKHE5wwF4
MRMt00hFr2pRNXkMCK0VfK9CKg0g1207hFdizDruhGcas0vE21y+OHe6AN7Nd3JBYD3NNSGVwVdW
LJKLAW2BuNaTa87ozlfMUCFGgV/s7twBv0h73YZoH3qBIPR7rVydrbpwIcMd2s3evSrAByU6ECic
eLHsmD+XITH7C6/OwVF9UCDIrmPveDPDJfe7g6ruG97iOkV1P0lXU6OQfg3pSgDudHS2yUywEvh/
53unsoogAxQ1NaKMkijp5rbcbvWjSfJujFJiZOrDRn3zbdx5pLh2SpBiEoo8KpwZ6JW9Vz106llk
BS41P35PnUbPYIAaaOTeZfGj7qwnjPbC2RvXVB/Q6zOSMi+YnzgaMa+xk8AnXGxvji/39IuB6Fjm
mtIDDvjRR0sj4A97yFVW7NOauSMkacV6G7qgUloPCcUTrvSKsavJ54oiOACTFMNQQEK4XPNlNPd4
eDzf78yNQaHhavm5bNZrJNx/wk6mw/ToukRrv6mMiGDQRhb21cOI3DR6T6GnS3iaHdtBGbb0vKSm
wAGSbGf3108QVWmltR03YTfwItnZja5ULXo0atpeRSX5QEEC6sz6o5J8YTk1pu52PYD79BXyru0t
sbFqNqrMC8t4C0e3FDodTTWISg1yeFnZs1cTJ/70DORP5PLnacpNcLSHAknkYmTlzrlYy6cVn5mo
6Cs3+pVt0ypowjuxuZ9GEH4pwKeMnZcSqFwdmYFAYjptwaZShRV1l31hHONBxZ3Q1FQklhQjFybp
pAQykJGhnVPZTuNpbPwRmmuTDhfoZlc30ySEMTWb/tX04n0mXwracyDWOppd/JY/G5T6x+VRA4d2
61cd+QRaRt7YyWB/ZTd/sp6QaAMLD+wAUzU28KAJpGTZVgPvz5Tchnube9wDdYzWlzWIigfNpfAG
Og+dGnH06PWBXXUcCa1srZ7yZ66LQIVXgeDXr6EKie8FfD0hvHXXvgJ7pXF58XDSfpVl66hizkXU
L4g5SrHtI+eTh/PlmV7cuEC4Ko533loiLSZsZmieuavJFQw4UAF6K1Tfe5bwWmN7YE3ZSx3Nzzn1
k4V6rMFuMVF+wR9JG3X+Mxc8novlTEOabuVJzhgue0A4+dMkr+Za3XKvVM0L1W1DY1uJWEZIA2fx
awbGwMK5YTm5Dh2sCDbMIkGhZCCz1js9l01+83KsNFtn/rifXa8NJ/GNXPFORQMWs8atblaZjEhX
A0/c0jExzsTSiVRIvEymJO/cST3ZhqnGwkwPBWDXdB0xJAbcLUZFQdIASTzXgS+al7KJAbD95dwA
SXYgttGlISO18/QCIR6eEGmBPzogSoFwGBe53eGjoQJGdgeCnREXpFGkdu+a09EZDDgCTRwaOHpw
0Y9R5/17ZrjLaUNW8UODrzE11qKpnUX4jwnUkO8COX7fODc3gxKXgevhiv2kUkb0vZPQoD3ETpm9
IeBjYH8WjB+uCz7ZqlxrCi1ywUljWiCSNcl8mxbvR22TNm2z48I54mDmkHuvn+8nRJff6N0kO5wf
C+3ozTYDOQjWUVnIOeDAPVgoGYmMSODJBkdShD8/gL17qTn0us/KFKBO5rP3lsqclIpmF72HaUU5
dZsjzyCztdzzpCwVw5u3OL6NqiUiMRlraLqvC+1ZzSQJb8tpYREbl/aKYyF4NRytbF7qlM7Zs+wC
jEh0d3PM9qmGXZc6qOxtcbsot9CkDRPSgmPn8iP2xTjBzxiwlCYNfvWbBPvoGhH50HceJRPInCHg
v7TkzVJjw6gEtyunsJRFCBhygfsSNOmvi+0jd0/8k4uKwKNY/uKmD82pK60hg5RTFH+fZf0Sql9B
/rplaNYB6sKLU/BeQV6bL4pCmQOck30Rm8969Tn5+bcPIvFbOjdymxspLBLoxpuY23+GiPXtVe3E
2imkWLKyEaj2E1gjkQscAcawwHFl1ebNgxPIrSOgHwRp6Z+oWVIwDw1VM1YDPw7Ujo5Rq4V0x4fg
KODwcspr/iUFIP5pvwEbrzmbBy65Pj13KICKQoh9dH8YZbcZeVSk4yqB1RaRH4oySyEh1AJRivOT
g/1TIJzYwbTt1zIumwUBhFa/mSGV99GQqHth/Q0HWGto+pemeO+duLlwLngQQbv4xC81c+rKZmVb
YaCuVNatkGlZixExYXNNT7fXleGobgcwdc/0lbCbgGcIc1c2SBxh8gz4AviluzYC3nMk1PMw86T+
y9kAhjUGpFr00JA2cS2X3WKronsfAK2d8KOWJcedZGFqGZ7VvcArrcJAY5u78rlucEre3QC7YZzr
Xh6ekEtdAfcsZRluCj6Xux2b9C3E2IzMIbDyy05VZw3eNjvbpAGPOaaw/uyHWZDN9MkywPT6Yndv
VCdDAnTENnPzs7emKVY0cHI5Wra9MhRUgmrBtOohn8sYrFyB2TtWv5LrgJPXNX4WOGVbNtHad9+B
pLUxUMFL5qBdKKid4xCeaXRhIBVjRtxqYIWMJTHT1jfPkUvdh0A82ZuIB45dXHFsIZ6B0SlDHprM
PDTLkc+9j8wrgxxsyPJ3/I5A8QphSQQQTlTIlaujUw4+HhIPm6fe5xDzNluiGOzq8IaLBlPW6s/1
u6pUbeBcyHPGQIzqpILcS2jWmeeQoEEvPI3EMW7RMZhJ4KBTAxA3EQPw7xhQTKUOwCeGNSctw3t8
BnxjUkTeXebRza1EnmetzS2Z0qO/cOi7vLTeaEkAdFhWLyPqv5AprZ/pUY3Bjam9YKeJ5w+bBv7T
r+4nz43jGRDMYKGfi3Nfgu7cbnpS0qf9oVwvcuB2og81OyN8GVHbYMcS87lArp56I4bmFHlTcQRS
oYir2auRh1nc4etOMpbDKouQu4awF9D4gnwWa1iT3GYSamGfwvudbA/iNnk1bsuBqLNowXhqnenS
lqhYgFVH6h9K7S6W+FdPK4A8Tl/cDg1/anyveRfGRn93zrABSwK4eMs4FH86APD0XC4LwpM3mpBV
v5LiAV2OAMmSSHwCJxShY/VN7Wdbl3Qv0GklnAgkW+heNzbThXMZlP52JHVuZRtJ1Yaejfykc1h7
YobEIoqvgDHxGXxZNAwNccCXrMfxmcYLLJBX2tX64zOtPrsNqJigpWycZwrUI88aa2SA8ARB75tV
P0bKYZs2JD9X8xkvXlfEsZIsptDmBCCNgVzznR+c3mWN85ehp95OzfxnRbZpZheLKustMmKf1kdQ
sA6/G/i/CyvW2IoLLjG+MPhL9lhvlnATeW2wbfZrAw2YuJ/NjNRuEa0cNQ2IFrNlulB5uBoLt8sJ
DuGzzWJi32+h/OB21vMeEFY6ikfCroppo1y7q4KTndMfFDSNHiSeC12wJLH/R9mLBot488Af1OPQ
QJ/r3EcJZyQQ2jrpnWTdBOhgGogawxqrggI2kXN6gvOuQmKKcLtSvozjrHyePKBolJg3/JD4/tb/
LKEOFq/o1wD3e+07JeBnoYYsVt+39YbXozcgA2CfRWnpbnRcYQimtJBnW4h8C7PEkVvKYHqHDFy+
RbesuDjEv9/3blvcuIyQ1soRdmhmob1r6wsbxR7Ws5cMmFBOHb+vZOh5wV9M9SfNSyRQKulQx8rc
1pMSmOHfRXE0fnYPpkn3HqnpidcK9h/iIO7sLQzt8Y40KgV+2tAlQR85UZsC/o0GuemTo4jPnyPE
LQS9v0SfEzqBzOYUmpMYottUflKgbRRuWOAVErBSCzDZnB6wNo9Wde5R3VRj2ZGXRgHAPDnA1ZvL
5+xfy5p0PJ2dTF5qGBhdZgvJxYZaE913k55VGp3O0O6HWXm9GzQ14jW9UABRjyQj60BBtd/QZDeP
ADpv4Rtw36HPYvQ3wFzxzB/05rX1PuE/zhtvJPlcmRsBW4SCqQ4q/NuP8fEDI5zk/nFo3dJvTbNk
kMLL37VGhMHK9X2OYSc97PrCTmo685wVGAq1vk5DhnP01dQYrrLTSDGTul6L3ueMn8GeVFmMc/EK
6bOZPyRS3QFzNPlCl3RdzmOvoPeg+oxdhcVu5FSxfb1JtmqhpWJseAYNLwT3nNIURlQX3RPxRYjD
Ip/wi7I2Xy+1NxOf+APW3QtHysJ9ZyYd1ETuC/VGzmygxw7GAnN1HGRwutUqn6CD9oQS/1RieOBN
QT8qo62QiQX8AyJpqj4yNF2RIFAi3QTjxd/nVh6yYugKLTjVyzmSu9fb9zv+ws1ss1Qnghz/pyYw
Pmp5Ol86ng8//rmxNfSqLjvZcZx35yRaX5mQqNs/VXRGN2NU3LyLzqX2iO3rOudTxE1Jw5aqw8tg
mj1ND+Yj3WKeSdz+lafYcCYMRwy90PccQN0lkvMluO7s+SYBD5TnedsBkADh5/QX9FgF9oqhXrBJ
R0sUDXVrwG9vxrTCpXA6GG55uqUfc4UA7GKSSBR6BCJ/P8TuttoK3e6YY/y7DSKuGP+xUMKaEze2
frp5tKJvn7UH2etcM+hj972M7KLdgcQ+C2EdAwTJiRjj/8Q/GaQOg4s+8GRZjBnfZ64eyRbgMGor
LFt+hzl7dle3sXKZyq8aqUdJu6i5mTDsKf4RkxkKqX9uts4BV6jNsGFukqC1Eu4z9KcVEisGy7sJ
XDU6wMXxFz5bE4TjrgbnWhxLSOUmZEqlEvMk2KW2vExMZQla6fwPHf9vMWAw+SELQ6GAkbAOo8vb
KVnRAZjohMTBu21I2Jw1YGDjGstEKdNyyETWZFA9Za5Y+RBBk1mAXcEvUsenFP++YP72oSNU0EFG
z++Jq4TNq1Vt6a4i4x6ClWfOCePw61b/TF4Nw2PEaW3SW93Mt/NDdNrkuTJMkDNylZjv5DxrWAKY
niTG6zdGI36oZ8KrO/Wiagus4WaxpUFtevQxOsEc1bmY9zU1PBHPoChWV2Q+l2T19UraMKw3tUnJ
N/zbBLj7IUcFJARgJDoitV2bvjNUOnOj6TOf6OpoYeI82gdySZJD7K4VydaQ3rmRaKw1xVinfYUN
iysdKhWliwXaO5KLwXBvydgPp7JhQQ+gTSHY9vcYzuLmk1YlgTTcbZK1eWbXosuuN3QUnyT0M/CN
lgDScWB6qdAq5fN2i+Nlirou6lzQHZQcnndzOKFlsE4fSn2EzKY07H/rIyHjapgu2tuxx5ZV4lMr
1mcXmt1F/IexzoxMHI97PoUh1dsS4VP11FBR/cQ3+kaBOsrAwzI2LcSe9JfS9FsW4wihR0hPWjSn
+pE3ifHwP1sgsby/7CMIJ5ZGMtbtdwE7W/iYziD/SiIbW9y2FSaK4fHePKoGQbEYnAZAx4bwlw8M
XxTO6/oj3PfxvLSMpbFapEpFDgaRyWccUAYaD4aI79jKBH8mySInq+da7s93Ml3xf8lbkDZf2as8
4VNkFVYRBg0KlYo9IRVpyRp2v6bTILb615UPf8mnRB4OKScrDJAwuPLVUQKmjuSt7UBh7w9oaKLc
Q6vJY5I/9lkBGvGa9gKzLkYfp4iqbfT4RbMid6Ee8qOCdEHOchEOdU4RhYoqAtykTxPcwKpUZfla
n0Hzlxjr5EIIScTi+wOvDai+BozdJoNZ2R2UAWzGuYULYta6voFXJ0gMkY3MSYWSSop8CoK6e3mn
KBvaebg/PivFkgvG2Zou6Lx2qwZ30HvlYSR6hOy2hVY/vN8NzMuR2sYJhcNhrDnCcjHpCerTecDy
Vo85U0v4MhZWxl4x5UiiXJwEMlZNlHtFW60YRNErFXi+CuRky2rviHfD0qcPYkcPUSrlv+Gh+vIj
d3CYxYey5CMOdhfAGNdAHGrWZzyFtmHDm+8cR7mh1kKe3Zv1M/9kh/uAVChaDJPz+O77DedTE+s0
hMG45POA9s1X2fR7uaaakyquInBXgbucmtRE5QRPPUjpXlxwq4tQD6arPle8qNy6/Oywx8U1S8ag
fD4knB8v2f9WmUm4J2wE5BY59yUpNZsO1D6XSW1aNxqrLnriRScwjohvZMQTUTm5xy9FqLkHxcRP
idNq2rsA0kdBtrSj1eFRjbQjNI95hzA8VSKWCU2+aqaT1FJkAMDzB7EKUzoqvj8gPF5nvP+S7oTv
a450vWe0XhdSmNTFZGqDlcUPOHnas3GvZJAEmRFogKSxwTGw4/b1tTlOqMpLyx5XJooRPBJHZWVd
h6KF1lkxO7g56/srzAe6nOc/rsA0A0pW7Zh873K6er6pax29BXkdzqoLliXIrFOhKFul4EXN99yT
u9iTKTozPkblLaAjzYRmWWzV3Ep3+jCke7XNFZ5zpnz1jGxiP+vPrhkzafHBWz7KJxnHKlp007yY
oqAsMJnXKiC6gtny0HpXNfLpjpZiptQBWBC36dsvDS1THvjozHrMdGH0RwDBe0OxnjhO926djTop
955Ln+ch9zFCvPmMP1KPQRjkWASLvjxX5YCy1e6yeoVdS3VewcU9vHH0LegUPfCyf0hIVy1yXn9n
5ohQkeG2fXQljTpJZiHRjT2ZMzxTSzuyQ6P80R6X4MR6kh90p0E/D+G5444WcXkasHIRH2CZhMuK
3hxKPKJxxh/A6sBnNixYED76HxCRLBEgdfZ18Uwg22uyDHzr1kBLFvekyUQ9jUeauXBhAwLqXqXU
FNpzUQ2BEitonOIkNgxQnX3rIkEVswchKSBvx2dW6HvAPanXnTfvIPsam0vxG7x+xj7A4SK17a8r
B8Fym2V8Hmve5Rc+LJBXuPKaF9OFH6b3guVH8HKG3eogagcjaA28YEfuYOA0LqyUr3blsaU1Ma8L
L9s+aL/ioBCj8pBdo9m7d/RulNiQyqWMzKmEXS7KWwAjKgvnJN7ZbGaqH+4PuJEA0SKgx0NH5I7k
0YQO1VgBTSPVvw5CtNQEhwz3Htw9491O0zyIQqEvDSsBJjUT8MsfxGj9Z7Ar2VuGDmwh2/4TD+57
Vu4WEzARsF3nCf9C4CoUoLFTVcqXPGPA9BVHIe644RhdpPWSJNLEC4hGo2M0YADlbUfWAg5dvBqA
SJ+b70MUtaPvEvYTEyba6JcKH35gz4QUNYtqdgl8eAtEBiHVwN2TDjGvnjvSHQQ7dyPl3KynoVwz
iDSpdlO1xhGKeIN1hsRXayQvaS84QH2Dk4xZcyQqTdshLHwBOwkSDAUUVdeNtW3sBo7jbzksnCsy
Qy6i3WkeNN9J7isAtK4TquHnHgTRJQdME3TbuaVzhCLULoRAhrMSwdFlJxINM5sfn+5qcjbGYDV4
g4DGQOovN0rjBzPj1479yFrVVfq0Dw2HaILOZlw3SnLR3LkqEn9CJ3gRAQbFz5Xhjrsx7uyKjkNN
jsq1UpPgrqNePD3Xob9LEY+gZ4+RskXwIntUPbhh56sQLzFD4oi3Nc3X9B6w2yqGL2NbmLnfcRH3
xPcMBo47faA1jYDhPvt5JuvzItCSDCLEgZfS5t6NpNiaO0rq5Q/M7p/yW6MhfRwaiuol3Xfnc9R9
tWvxy6y6YeC20w+ygT6npT69JUnSSEfakZhUtQQB4N59pE59xHsPvjqq4XhsC8sSdKIp1C7zphLI
eX9RKU82pAUqS8JlPjoTAdy+pMVkYcQNyNFbUoqzaExpJE0KzoNhuOxSvBCR2U31jtoLRMv1jaCi
k4MiagsZnhcTjC3Jre/qsUQuCnYuBxW3saLoH1mA6NhG+jCnfBYqZgAbCi27Lzd2KlQAuHoVwvMc
S9Fp23JqzQrxythMM1XPU3a/334KiNHvwtNusNeLuBGRphohzMFxuwPMGQBL0qOZ5fjdggxlUQfw
Ji0wA7OTXJAC5AM7CHBf8o2UOp4CxSQ7zIcUjA92M8ko61lXnD0H54axgBpt1lUQOw01/p6qp+W4
GT/o//SHUdkEpx4lE1oxswL+73g1qMWSnCjX98WkZ31XFWBelAM0Osw9tficC+9xLow41ODSn8y8
VPMjdFB+ERBfjtjQ1gLmQdCE+yKu9TT2LTzqz38sLZv4wU7RhZyK+DN+aL6WIEScEIuQk4sThKjw
eg9mOgr4839YTVhnRJNw7klVBAi7rwbDw0P8OHcjiTyJyP8kzcZXTNqSR97y1Eh+iuwaULZkHWhq
I4zW/1HS2IC+MFaUYemfNw5ZZBvZHPx2fgEZwnJzESuaeKGPLrhFOQGwNkCK4LLyhmfg93UXGCBE
1aVUN2gQD+MXG+SBCan3LOufMdhzQUvTAHaUUAeyS+56Tb5mfdswC53qDe6SZ4LHWlKkexzio30L
BvZRNtkNc1bu3mExmCZ/Q+5nb4OU6nzR0NJ3Vxsrsuvl9Kn9+gQXH1yKM8z8hQ7fz8MauGu1oe8S
Ph56faruNho1W0UUksTmV7160U5oModqgc7K5Hpik5F0NcQSJsnmXSdc8mJeT6FwnxeyhfElhJnS
hc9pkCJulb78Ebugko3sHAGgGS4WgjFJmxeiWZndfZc95X+TtevnADZJGlxZGaVARDqhB/KGyf04
9nKENJiEmkMv5GJOtIcCRvnXnRP/EzSoXyocgSXUFxZ0Y0r431XXUToQVMhfrbYsJDGi8AOXfKQS
BNrM2VycxGM+fIuOjQqqL8b223w9yOz9I+iB1QuO7PECSMoO6bDv3x08rwxNoHniIso0GM/mVykn
OGZCuH5a7+5Np3tP9MRLJI74885KKgjy8xAkYdIhoxhPHtJ834gPpji99j4cdZeRtcWsvMxcLtzY
mnseMC9+N9zBl00XATVuYw2g6ruNsGs1V4ZBk0fYl9Sb/kAPVdjTeMj12DaG5VLwfq7z2TcZnWlH
Wirxh725uPOayWScymJwEI9+Zc5BPsoPJRDJeCntFLHpU/2cSGFLjL8OepRzdWlyG9b2JOALMF/w
ylqBIWmw9cQPmky6KU8Iu5NYrQHCI7Hlwhbg/dSWr1vP9EyJaf3slsBd+SruWkmn/NaCiSe+jPhq
8+wipE1o9N0dyznMoFTKJGrzSlOVNoc5SicT5aFlT7NVG2mBRA4WxqnCoz6s7RsbJXvloOExKnTE
HdtJBZu7Jc0gJHh831LZxhgHhIJU6SDgbQJKdIwzdCK0uVh9fKgO4oRgStvzmDlHA1chgk+cf759
kpsx2TvKYTjAMhTrMt0dFXPrG3qH4y9DdJ7DrqfyncYPKVGyt76z7R+PbGgOBk7vKVYiJA0iA+yl
kegB7BWhGT2Yy8ZNiEvMC5tK9w2lMtxh3ZEgp7hVwMwnQNGVxGT5lc244fQBLztlS6co/FPNywwF
slWVNMV28XplM95WtDnwEZBWfiUE+nfZNRRX1AUZpfmC4TqgNRwOcDS0ClvsApObfDz6E9o3L1rf
n3sJzbqmuzi2rWUmHQp5ZZjtDvWSes2STEiYjv9/7HRqqBQluy5d/sZJsveUI5hUaXN1xRyU72wr
66FbsiL/7kB+8GceV4o8u9E98cUKTjdKwg0mPR2oldSIBq0/9fSxYb+fcF5v2TOlEqoBSjJj0CcH
0jAFn/gM8J8OLpR+S05Q8I4y3brKxTDJnjilp+VRq4SaF2Y4mlwbTL1hPTFujP/x8Jy//sLniAFS
p/U0fBAwZjazdVGeb1OouMx9Lvyd4SpNC7O9PbVE8TBwP8uUZv7Ljt37AmBPBexRQ4mb6GqQf6Uv
PrM3qyIyIygZ7uoEHzH4vEKTIjCb0jlx+FwET2bHIfY8dULbGli/T4npvcl2bN7YT/uyuCjT1edv
Mhy1F5fOOkg3uktjrZGec9R5ZDdqcZeieI+0otH0jfAf5l0f2wt7nxyBIv+ukf6jPeQEL7ytDUit
WcKAr5mQb8gLfoq931bQWvPULFKoNnDn1abChY46cJFRf9EH+89uMe0f2ECCiMbGMoUykGdTRG5p
8UXDt9HpFbe6XlVBO+GvxjHGfwQ5aha1egQWa0Hi2jAdozhAuWclvNn+1UQvyK19cLootYTL9CGy
wr5acuMrBiRa16SfeDOeT93p4q7N6ABhMtmZK3oZrXqPhfH1fVhG85wCN5fULjTIpClHc5Y9hMxL
cyKmwSuZ1rPqXsN9mAbAEG5bUnDkIXdh+Em7hMoUYCjJ0ubV7w/pAwIRdDrl8Q+fIV43RJqjJnD6
Bl3isWiKTezgqqSfoARqtOYBCvyo1QI8r5MTS6n1+7ndE8df7ThFSvXDO9L1Ih2MIj/2HJOuwe1A
vRlhfNRmEOCCDijMB4mjgiMYDAYFmXF0yB4gvxGAuyZowmYCYCBh063mXBLXMCDRrxSGTagFNOEp
DSk6b3WYyleb5hMPt6WE3yQFUIs5cehWh8a0IY0P4zXruDTPODun0U0PblxERnxGeB00tMgyI6gb
ccGabj+9TxSta+2aDVo/FgoBGSB8BwFva1+MbBl0LsU6Zd9BaUzgjagRmgP9YZaTvTPYhgNSHohl
TSOiF7VaGiRa+D9e6ir1zbnM1oHlQJLAW5QxC7gmJzIWwLtzTWBFWhp9EI1YF5JsYKyMyY529HM9
Scq6PS/8CxlLwuTcI9+nr3o5yqkQcyxuLQobEOcGUT7JCM7ltb+P1asUgzQ+RMK1OhEOI0dx1XIv
rfUq6gryFx4HpBTCtzv+vxekDkPBbRHyhz3i6UTnJheqxfkk9/YpY6bO95DhBuY+/Iv/h8Ox+P0J
bcfHZNMabUrIPvnq3Y9ttkPIkwDYWaeRsg+Y7Af3BBQL0mhd206JZXeSI6b2dj5AThZ3T6opldSW
TJSGK5jeF8aZBXNPCo8w6iz25ZJHq+t+imuB274Jm5Jp1Uu3ys4/QXGVv17kbE6GPBPyw3Nej3WV
tXsS3cmHOysLSzN8Tk3VFI9iehfPXM9DbECtGWh4afilci7POLqoANHjhyCHZj331cHSdlWEZXB8
iQw8l4PnR1DA9QmfRcw7X6gcSpzElHwWiAaarnrjOF8AGiTyEZCxHFcLmNoPzdHct8a7xJAvp0bm
1Bu21NzomDW+nzmHzwi/8k8ak5bThyS+hBMXfZIgluTpxuyMSzk4+XgfKGIfRIcQ5lWRyYqR502H
1xMh3/haFrVeJfpHc2EJCb/hP/Omc+qTl5mRo7mC8E26jv3NYBO9O0lD8RwAbBRHrRbCVLdFdJms
L9Z3oUDEOZnTq3Z3GytjuBcIHpEmB7/wjbUOIiJTL7D9NMVBHCC8uV1VNIlHEGFePwyyBS06qSmx
ysruOIDzQhPcAy5iaOFXtirbXJh2wjx7ryvv5M3PfacdtnGAU89c3EdJ9zpW6g/+DrSHY4KUDZau
0eW9z2XS7uzFgZG7MM/i4v1Kmz7NVKzY91bIbf4vk9vi3M1fUjogC8anHFeRKZ2tcW0DCrbA4XOZ
25u8D33ofk5Ee2mk6extnh++D/vIMZtGz5l3OECcUsq7m8XbASUgL33YKC19LMumat2WvHR2tGl+
PZUaSNu+F8KBbjeh0l2z9OcX6kHr5eKiQll+Nt1sNyhT5WqECxf1dJpjSLpMMf8RlZ9jvz85HuZI
EqymBYYZq3CyUtuhRqkN6FEuxvsIWignjMlXyjjONw6PXIA9Le7tnUA7bnNm/n0PaU4GmuObDwJy
A6er+mkdyqyTRtQnKA9yL0rFp+PtnX1jkpeMavlEcf2xrX/dQv2RQUcmH1Hm5FCwkZua8bRbhVep
mOeovne4CEJwxDY6/sNKNHeMPm0f3vBpdqSMU2ThdIX5xKUQTweufuw5LkP5rkJlMc9Dlgs4A3IK
aRYwDNa3l6OOt71LBY3gE2XACMQZWdTSOeGdb5nEJvex5NoumlJgJDyDcXTuDRdxTq2pA9zg6xIx
D20V7O24wi6DQDYIng4VC9WlvSKNJ4tI/5hTyO23CZ3xJZarK2I+6QF+xZEGX93zrWPlSvG1Nm/s
XPq766rs4Cx/fgxhHc0XCMJ/0nfTKdynoaYNdtklQTC6nJNbJgnNn8U2XRxzD76HUNnFrHyMm1VA
wNdi9Z4BJjlR9FNcZnCUrmuaLlyr4lwQ07TNrf4vHHPJ7ZSP5ypnh5g2YGxT4xjvoMaxVg2GxEN+
RIAaIo48oajkKOZI0tJ1r5huezYYw93ZHyGlb2/zDAYDqfjjM8PrpHtqxUjPLJAWlfTQwKJMuHJ/
A+8AeZgG/m+6iRh7NQVMP281nzfPn+q9brascKUe+6Q9Oxvbmbtb2r54ElXSulfHEIMqiuK++Flm
LW7Wf53IotpKNVfC+fSwJ+1JwhVj7al+M+p6Ai3nGpA+laCHnov0yKgh2NFVc0vm+fTWqutMiSE0
nQqyl0x8l2P8ihFn5ioWbEyMMgJL1tTuR+HCflX33KDpGn1a42VC4m1hzYhslYl2ydylNuqosI01
4l9flrgM+ZMQl8oQ14djJmS6JnMuIO8G3ygzaEy02Ev1n7TsTgztcnmwkHf5zyht5NvRl9bfPXv4
WzRPya0XOz23DW1McDLn8NQJjHT1M3ls1+b9OU6MtWujD4vwbDhCgkLyRegbdxqusB5Cqq3WdCMW
LJLwDbKlHbKi+WrKK6N6M2bWANhiqKnIVUSPLrA30ROz+JNc9wZNrvfEp0RIwv+wNWyu9wPfHCyZ
aIeKTDY6D1yMd1yZl+xDCkrMVjv9BF4n0VjRgWlVeKNeb5IUzNiwd683Z/uC0NdC550gfLPvPaMv
9vWiQY7m6FKCXPXOM+y7h5FC/+IQxN+kYmNYSzuqpdg9roFqcAV5FBrsc8dQZzRm+DDFmgGzZ6qV
mveExvPIml65jYHT8lpO3mog92dhJqNkRNymjC90Jz5XJqp4KBLltaSqfnCX71NRLy1RbCoEDg3f
rhVj8EahiNrNA455a5/KFQMuuy7Kf6Z1/RXmM6uPGygUrESOAnPkKcgJzafqyLNDnPh0hvM1/5oN
ZK7ZSOcy3mGl51w2EE7m3caX1Q8fX0qrm0NruzDZp/DIff5QPJHNBKcGXbbTWQDn/vXCeJtGyiF9
FN4tB2QjUG14HpCS7IJvMvJnkOcTXVtQVGk0KDmUtfnolg4iijClZFJveLgjGgIIXre0+HppMHhK
2AUvCdgoeJpP5ejzcKRsN0tgCRTZT4UDAzLIrhrU9hQGD/mlxXkSpFhqq3uSEPXwy2lXnbPDBI1J
4+TvFs7ChHXuEK8LBmiX/uTmdP9vx8C15dn6RJweBp7/Bbbk1LKXXlIYmGP8YIA9DpP9+7aWvwjJ
cL0HJCaH0Z6jAM+Wlg8Y+r/TVCW/hISLjNVEoNYDTpCHombLN7yWtqXMYHeVUsFge5/bI68aOh83
gf/YIszjLMvBRnztqwJ/muHNF7Vri3xeO1CewC+KWiJaMyzA/8AK4Ynyzi7b9gRF4GOAn8F5LVai
R1QSgOf98Ah51BnaZekElaQrYavisEtFpW1BusUemXZ2Fx+G2PJyF4KMv2EnoKBf3xfgZqzDyFOb
cgSSSD4w+Yf8gskzPRKV7bhqqiVvDj9xuhfMGHGfkbrHe389tPaG66Hjq57JIrHw6FzEUFllB3dG
dfKZyaH6VvsVRKuGT525w2+f1rGs0oy24zjsWe7EdOagTrSXH+dXrM8QaDsD6xhz7nVu3HOHeOwJ
wutrXxC9NGm4w36bCkZST1dbXr0nu9OeazBlb2QGBgWW8eVYSg9R0Dmkvt/W1Uwj6Rwyj27hi6t1
42GvX4Q0DR9ys8gWeGi4/DhXJ2Aw3dN6wcmH0KidKqqafOYVFzjYd7lOPPYJ80SCZTgICO+ez4NN
i0RWWPhFXyOBA2fnHK0nbkg/u/GX8dwB1sKV20pn9uHQA1Hx05TsNJ/NLCrgfj3EG8lBMb2qEMNi
LupfVg8SvzfXVo3gBDpOTDEXBmkVRO4WRriOeBxwirah5UItmmbANYvf9NxN6YuprVo2Lhumj9Fa
y8En1VCas0u5fqk55oECuVFV+o1KAhMw5NGiTzWDg3sPMtZUK/FVOjSKBKjxzZBPBMyu6z92DWph
CR0xay8//z8Nz3CkMkSAS/DaQ73LkRJz6j07Dqj2thK7bUHBnTSLbqPmDUa1YCG8tT5DtoYN041R
pk4Wh9c/9gqt6pypiMnCMFhsl72nANTUsoumMYQzX1mO9qkqyq4JP4cJqCsjkM64JL0wy3sSzTOk
hZV155swMrOkFz/7Yki6uWuc29F6NW2nZJx/XzAqclVFqxXQ+yB+zif6sqXjsJUI+8JiaCviKcCw
w/QUjPqLFNgBIrEY/fj81wqSH66atX5YGylbjKm6gv91CL6l5UlB4/kY8ERtmZ2D3MUZeGH54ffr
Kn8XxbI8v+uD7PASHVFAFIeq4pUblw1/QrePtZsFbFIhwuWtELSKd53V6Kqs92F3XhKuhDvUE9gc
VXKsaP0EXj89n889kqt39HeJWIM1JmcKAT+SnQFp/JdQkuJza3rvtzC3pE1XtYseaTmiSKwvSmVb
YkkFJqerLCFmF5atZSGQQRVJgHFUm6Yq8PnsGjdm2xCFJOFpAEjZ9U/yJzMgTb7JEnxgI0jaV2HK
WmZ51mHCUKk7+0PGgJ++KuuFcpvX8iPJRIEhjFpG5WF6JdgFYsnfIKvNvPJx36flmmQmq5yPmGGS
xat7sAgp6z0aCgwPcYNfrgIzJwFJ0BFY8wuNdIQ6G2AZPdbVsfCWCOUj1W+ej12bPCyikPauFDPQ
6vc5fUcaOvkjkz7QK5xXY/0eb94JZt+g+rA9dGkUi9ML8AA+8i3x6ra1NPIQBO/JN67jIvQRNZZV
Pqe0UAiS2+BAcXgU0/xVYoTAwrWkP16hekeKdTpIB+npdh+VYmzOexFyuom+Kb0fGuy72hTWurrT
jB0U1paECmbYyhZgap8/kpo5qTAEF0kgcvxVsMezv+gf/7rqRtlFLnZ/ORbrz3EqFrW2fbIGvf6P
taJbSPM9w0DVORFN5r+3yu8CZMNsumIndmBxIszYfIX63A4K+Mo75/Biy9ii34ruB1Z5y/coNoiu
lvM0tFnJPomDhgl0pvWbu0uKdQnnOdDLxawPPE6VQV/SYbi1udW6qkZCXYySjd1cjmmR0ZjvX22A
66hCOikEFw0WQCdG1JLhtp3kaBnHdwb9zl3qS19ej++F/IPaDur7TzFsp2oh1OBlgdKNxw1pxEGK
Ko1yjvt2RJGp8Rns+NQmY0IDEg8PDaqlmvBMLbgDCH0pA71PqRWs5N3LS8f5ybWfuCNh1uczzVuc
LqoWWCx3+8Ovub26eYkIMXeC8jea4mmOTI43zRTKsmdpka0ePif4jj0BFAYWcljdpZNYRxqYbtno
Tb5NRgHgLSBj8McsIZ1b2cHjBLT4/fvdJ4IToGg9f2uGgXbCnnWgfO50Q3vT4irYeWr0kl3fnQde
Ao1m5s4axrJQ749tb2YAaIEjTzSdJSH42C5277Iqem7oMOYeuvGGGSoI4pRg3mwRQR3Zy5B93nlz
WQouSZqTGojy+2FdXk4rz+l05jU3CrCc3p3kayGb1QWCL0LfquA1bQ2JXWmbdcDHHBwpTEsUBxO1
B2HGk/r79zdDnRGv5k+/+cbAmDlEbwm9HsBm/PgRKbsZ9ejP+bYLNq1TjcdLf5B5jv43b9Zfcniy
2lsFZUsetVgQ0lUkpRli5Wh00ITpqt049wk0nON3IDOAvQ9CvsUV3Q89rsFmCZZEYWkmuevRnvxm
PPvcX7aRvZxm4BtnIlOmWf1vfA2dU8WhgjiRLx09Ppk9g8byk6DDHzyisZndaPWqEsmFbcUBneVf
4H5cNWAMq+FuoUZaVEnbXHObqc+tvAU7INCXmx9YYyJnYg9+LqLzMQMtxx2nnH3kBXa3Q1jJ9Xdv
ImaibnQSa9bsxUCjmNqrfJHEbRDyldkXjs6AgG0kt+wutaTYLlFRlE5oiX65IFPiLRlEEh4FymjC
C84bd2x+AdtSV70rq+hM81CBMuQ+5IUM1tt75EochqA1D+RTwEtvVNPnCt7K8EM9d8LhMt8R1Jrk
tcu69logqpZXkokUFyuemFpzMxg6gmmEucu1vjY+XrVwV1FgmRB15xj5V55+XUQlsLLHWKWYDKBc
dFxLq7i1JXh64opdJNt+DHcaPbPqaFcsNf1Q+LwWEuNyEx7eqs9xDkQoXdW5zTlx5ZD6BEshSm5J
B42fcKOeCC7RU6y6m1D3ly0JLlgw3PwH/d3ijgD1ozFzVfDWepb24DlW3Q6NDk7hiWw69WOKd57B
k4xmkW05nQieg0ULtNAdMTxxVW31qcct+whby9Jymg2NIHULeJTPp/V0hw1Akv4DVHnjmnsrmuQn
BLiYaO8u/khLcNNHnvt9RuLLmojxjJKYbb+YDNzSE6frQb9qwv7u15odMDcxrCriabQGQHr64PK3
zuAqZtfNofx9HCkI/50lW5OXV24GLfFXOmd91w1KClO2Ryb/6Sj89pnwMz/E8nXN5VqKySVU84lj
I4NMPfsa9SsDtrA6qOzUX4ocBBxBqHFCPkEUpOKh8NwlhKQY1yFP0R7t72uLcHZvhzknER7AteWf
Wy1KpZPh1rGpa8OkcdWVz4mYgX1gszTKILVQTa2PgT+4AdC8SlLJEOxJF1SyZOHPe7uVsbxIfrWP
Xb7LL8Vl+CDezzBwcJU4v06Hyfaj0K9VtEw7NHAEdPMxikCu7ewl6xCRXyHUVKJU8ZGDYj0UE7xp
VF0nhsZtk94QbXJzLpEJQHKBUb9bPSfoA3cXPQmM0iYfDp4gaZtRN0zvbBR/RpA0qvKuJGQoDKYS
+XZij1kTH3TttjgbnJMTqb17epPx1dBoyjg1u1onWmB212tI/FV3GpCf5fEaQwbuR5huTDka91Y6
mwv5zVv4Cb+VHYSiVsD8woR7ByVbA6nZiHXRFvVxejO9B9lb34bi+AcZA7EZ2W+9m6eh8Tvn873L
18z7y62woiL6qeowtD2x5PF7RWwm0lMB0qYPJdtGN1ewf5NZel1SpzeaDQVSzSlfgY5j7H+yuLvO
wIOKIFQyTirVC0sdRKes2JjylfHXZFwSNqWvaYdSZLmXmXPguxgIA4FjQknRPDJc4zmtZPk83fma
AWYwToRhUUqxeII0UCv0i3U1hd5g87ffUVMvlbOuMPbTs3uEDdysrWEaUBGE8vkilwbfwf9v6UvB
R3R3uuB+jqFNMrBrTlezazIsF8HDEdpdbyyfg9eXOcC8fnVWPjgW7Mr49ERbk/cC6hPcUx1vJDZc
QArmQpj35ZJiTzTJVmmKvw3MNf1NUrQBCKtAunGvi3dZA0mbDpsmcnAe3C08DIF5R0LywAhStViO
+d9AKyaSy/Mbccc6s60MR1Y+U9SCNepK99Oritgp6df9gKa4WNKejCaYcpcbQdAPJNTFFXJ86b1P
QAsb2u6anWSfNR84AgOCZYSbUd4MxkZzPl8JqrhJ4xiefcfE8PM5dmw95Y8jguvbFD9Lc252XEv6
7HcJ5sOfEez0HV90dra5Bfm57b1NgPqDdmwfKRoqKYzqF07ctG+Jkigs2+EKpqmGUqvYIzDxLjs7
UaCNw2uuTcbpzwFdGlego8QzhYHCXEGO7zrQgHZauEEYOf1gf0/QU9ejuBWYGD7LrPnCGS0TzPFZ
nY4e0hUwKxViwC4kYi0WtlFLX/JyrMzxq+CfpIGZYahrLxASh4j9RaT89j3QqDSfcZXbxo65skeY
X1WGomfPD1g8aLaV/yg2yUYmxplhcSjzSOhrzrFXzOi+mh6pgQJWBbcY2Zt+cJqrZy8U21S+ACMg
ZJc0ROC6QPuw24B5CdKeBnAB/Loe8s4tC8+gCzlXWtWnq9eyUalZA9IPzCaia4jYrRi3Av6MGR0I
v+YKDiDZLAaTCWzeDonP8lbsxk7wcEYDFBxOx+gn/6ufNYZYW/3R8NT6+TQamLUqo12ExSyan77F
n0+B5UUv5wWhPzg2aGF0mIsx2azYnwIHjlmfMWQ0oyXFPFcKkbH+G147RHCACsIYlrHwYn7U/mjZ
gWBV+rcThv5uZGq7paq0rb3ncaHBLuURiudEYxNDpAxoW6dTYCi69dX3CbG/Pmj0PdkQ1faU6N2z
RIySVy7UJrgUBD+DIS16qeCOCDDM9GzC2RTa9ITKP3GuaUD9+i+6vqXgfjHNoxGL6Tgq+TIFpl4L
v7hdVGwQ1n70J8B2GzDD6vMBHXqOV4m6fhjR5veKK+zDs+dDh3xBy1hggDBddnxyteWdUwsaG7TP
SHArJyiT/jk9QyRxvq4Y+QF2UjsUCNC4laCpT2E6XeeBzDHEtQvtik3QxhStuFekzJMWuMeMLXL+
j3A0KwlP1n1/bF4OV90l15L3hILdk0sBiYQhGkjF3hOmHDZXTqV+ufIEwaWNAINFvYC1Znm8NS5G
RB94gk5y7UqraUzpIaxiC3IOZ0i8bsX6bcQSDXfyNYBG7B5PBhKhQSnn7rpJJiLh7DcSVjo2crI9
1j8thPAKgXxrz63y43UbrkAVR4MGNO/OXFxRNWFWr0+q37eM7fxpEjmpeUT6QIRf3zMloSNvkZqz
+4hTJMjexmHA1rLKsimGn73wjzoEfKwvzzRCPOQkApgg93WSCx0G42XvKWja6uNQYu2GbtupwIZJ
HpgyEZ8A59F2YSlqaG7TJPCdHUABTiNU8ICvm6IPbK0lv6opUUYdui+iWYNdDAtmmesE1zKTUj0J
wIM0vLG4bZWs5SymGLr7RQdQLZ5SwbILXbB8WlBzfYmVY3RbK/1MGR5I5mljIutp6GbaGksBgPoR
jRtrfseJ3qPaM6vADpNtDZClJ0bAahnWQmyiKOSv06C92qPYvaz2TUBX8dFS74fMMz9w8wextyK5
jzVc7wCb5X/L75su+OPKtZ1sj6Y8Bx9illbOPGH8gQQeUZWkPmtolCYdxu4o1M+ADw1VSGVoq861
Vpk2WqWOoLyNB4s5y1JMnGTsm+d6tPj5+FvxjXtsyzYnHpXszLoG+tDDH/4eGhjkrwHKezQ90Zff
rYDolIJBPHU1kNllcqXQdVfwEVzVBhttNAOABXdU8nGVSp5LDKTVtJVuf0qTacmYDdDkxPPMz2S7
x1egMsO0Kkodm7/uq6oQQuNXRYyHSg9rTcMRvLawbLhMnNAjDmg/0EmpmPswdHaCn8T81/T+qFEp
sUHzB1eHROhRF5dADfpN3KlW1qJKYovUj1FL6ISKApye/FpVjtoTL+X+dUNKIv0l7H5drfMcumEG
8WCi5dd4+lTcOklk45FX+lpDE8NOGpLH8AK1dGyw6Kd7WdOu5BfTZWB+nJTVtcRuxpxhOh8zjTbI
j4eOccRULxZRVCYJ/DJv5vwvmKamlMoA/Epsgv4W3AhbQI4aKalTqZQQcNZu7x7JGkIA+1vOD2gy
t64SH/friHmDtNdCbkBCXodLkETM8l29sHDEaX5OyTvck1GpAp8CdcCS/jxbYWqDmX9VHzqbcmrE
Lvi5Zw6icJcrVB2jXY/OCBsXnkEGz5ixxPIOawP5DdjkHdW3I2zkCqGOGJY5e61s+EZdXNKEV6CC
l1J7kfWJRHek7SsDl3Y4z/M2NxF2bgpbLD5vPf0X+7OgPno8DQ5BHBQOQP7xghR6sToBJI3OlxNz
7BYFpunGg+zHURYhPkNWOl7LpJX9l1LdMKPsHzXY82pXNwly7Dz2tl8QJO6NDMLn66o9zO24SHYr
A2nBmgQX9vDiqR0rg37ETtAc1Mu/mDqEGi2v47q99OXFFFPoEeTIAO+4QE/ZHK0kuPkXmeeMekMi
5jroP88XSnMTG9xINs5Vs886CSppUN4ttOVkCPrVgscDjCZDxMOvX5Y/s9BpHRJpCoo1J5xmKdaD
6tAuQcQdoXEGIzb/IlO3Xjwbbk2WyYeYF1NzIHUTKDn93QECQ/eV21GRJGoyXZphZVZwBpnqloG3
FkKx8Mz2avUKsKT8mAadNGIrZrqUMa3zLxZyL0lz3DIy5h0u4euFP4zscvhubUX5rAX9BRSe2ua1
sl1usCBHnFVr+lv/iZAHXUwh2fOM9YDnPLzkoL21oeZc33S6Fuw8+Mfhk1wwYj6HkChYgzMi5oNp
H/j0by32ASz8FfSnjo+lLwDCHRY/zg41WbY4jBiHX4L2rHw7EWeyQPUyhliq3hdv2oO0a/aY++Hn
2ABx/lfeuIt3kJS8/ri2N8Hd+PuY0zsNE+UbYBI3mTbpsQ9OkTX1htrtv6/5DrOE+m9FQZMEfrz8
6M0tJn6WstisUNPN/WL2fVK4jihhQYdkCJfT7chdiPOy2pYYhqXWpIJbZ5ZlQQiUmmVmrn5Ix1qp
nCj3Ypxe2UlAobkep09eOEHkLfkPwow022hWVkIPjfUGMri/fa7bUuW3GLfSAZNk3heFoSZEd4HN
5EYs4XKIqErprtSD2OhQM6Zf3LQZ2m89lgPLbw3fCq5XbDNSp2+ZeiCg5xKFNO2oHvirarFjF1nN
qho0oAqUCORb78eI3v94OoW26Pe8t3OwFVDtlnak6v0lGJKRGbSrI3VV9gphMhF/P8xt2hkp2+92
+l8FmXqM4VaDLVfgPBOR7kvn/akmGUBSqk/+z8Fzw5BvPdM9S7Extollp5Fq+9HmInZdYxt39oUY
yyfP3DOkJ9syXdgIkTd1CYH2s5yFJH5+ytFitBC/9jIX5FBx6IYavebFxn+gxtKzfp8kTz3qlr2R
G46WjLn3D3G4GoXzvNjqO4UaKSUZhG/O3j6gaBQvGxiGTTFgS3hvo8vMVeuqQisa/rCl6dj3EC5y
sZsy2d+xHwIPankB0IIDmSJIbaB2/Pj4gyru2xzD49wrYSjKs/T3EgAfJgiiRegH+6UJrOY/87Kw
B5zUQoqV97FzETePGhgrC0PCgD/aDKJCcdH371JOXs2/xrf26ycNME1Bd13lS9Hn7QPmFRGNLj3s
ou6W+uqSjgNSt32+rhwfktFJqLf9wVchIPPGhnq08NVXnewveaku0ZbP8FLDVTZdFyZYobou+5B1
cL7rEH5VHWnTKDdfC1f8b5G6RW748UtiilWxTUCpvESY+m47QvkAlTC7GdUwawgGpESL/fC7FOgo
28cCvEFvVRooKaA+UEQ1fdGlzFNWhF5Qj7FlUh7xAdOEJt2WbLVB5kbU39I1ubZbN9c8Ie8BYV3D
BuXlLjaCyArSCJfz2F5zCIgCzK6kcCl5I9vy2A+OUl+2l5CsqJDH2lZ3451Gpv56GYZ9Ycq3kSwp
YmOT2681S/EXcFilAzUWPztgZlfz3AikxRRl0Mk1FPvlXk6tn77WFfi6LclMXUk8pFjNUBAqP4zL
M8CN9cXzbw/CR4JDDA3wFkodBR8m0gEn/J/Q2ZG4iZIKvTM+vpPG5Dbo7sXT0BmmzQ4FhAJZZQDd
1DmMtHH/hzaVBDpBdHVi/5uSxC2lY4Gz6hyBNayYlA0Z/D/el3j1H3CcrnbiFS6mXhYRHv1FZcjM
ZeQHvL0sCTBkEJ+/RUn5g9PAzGvLupzMX9oM32pfKkZJiP/NbINnLnevMS/A5VWh9dbdQhU8ErCN
Jq1VySr+wDospR/sWtRSZypZS/dH0wplWTn+/lE56k8Sw8MeaAxIRzaEvJy3Hhxxxuxas/favMUL
35BCasonZM+ufk16MyQLGkuHLGo5jehdq7Ab4oRzL3MwArxeACc6OeyrvKEXfJE5xtAfAywoqoEs
Dnpo88UvigZPN2I3fXhPS5JZn7xFLIs0KdUZKHiuQibY3SpNlSxYYEb+PBpaDHEOMGahR6vUN9IK
YZCiaJ7qv1kqoGOXevDeG6wLz8/iw/FA4JH9GZN3V1+g6rU2i9SvD74KKrzIQtPfjxHxsxGZ7EYy
0nRlhbOOFAttETSv2s91Qjc8hrToewl8bnq0gltFGaZEGQ+PP4bN+Hln0slZ8L8CK6UV/MeA9NDa
mG+Ne2g7VNFn0j1Rc0fmnTkWmBbxDJoJxh98HeymQXEPokgLOorHC8Ra9cKQ36Ca6fHEPCymd1hU
4R9gQ2aNVs06NaxYVNnVYb8SmCVlNEVjGTa45w1Z4rpcADD0P1Zq6/4qhTLiuB9M0r3RN4FTb3bV
KycgO5/w+JFjf5idfEv5I4/FM+Lyy2a/022nfnKJMq02BTX9AnSdCFbRhdNzlxf60KeKyWwx3/pg
tO5GeMKeM7nZRrouzPZJBQ3WmLucR09At0GuL6VUT84egmX6fe/kW50AYg3ifdjlH9ea5udKv6zu
Ti5mL3hX1DL1b/+DGPKu10KNtghIxaG7IUhjcWz2dkL54IRDhyN9kebgLM17iuG9PuycU7bCP5XL
DOSjM3hBcxOAFkI/YPlExgETbdBjTskdn8GFrc4u01Xvuy0+QQYwqaRGzCOWzg3/19xUUTvfirkg
h3Wmd0zOslg/vVvKN/uWoio7KBAThRq/WtTdogOIjdia5jYVzsglBmRu5/teXKB80Z+ZugE3CCdM
3wyCTrVnSxvdyabuYZodCULZDOt0V3dKNzAxA12xiFpBQBqQWXxYH05dsS7Tyw8/rcevn6cPz7nH
IXKlFAVDKF28Ijn67XOKUAhRNotu/EBhrJmpPAk7QAhOFW8OCn7IZR5YPgwPj0F9FxcGLdh+dd8C
STa08n8+/y+RaDiBAM21MDJ2EnPLXnDbMKoQCVTEEm1AXUsnjxWPqnFPUcA6hSIX/Z1dgk2pZj5Y
8Wv97n87+wuNAlcSPltGboZ1BMcLuHWW2PfvZLIjwjKp14bovL/HYgqiIVFwluVFE8vjsYmYaZDO
fNfIqfCbedUj/WMverUgs2xi98MlsM6B/5IVvCTiy39Oi1lsHwyg8P7zao9xwUoD+ErXnahLIbHZ
wXni5YX7rPOQnHzm/iAJ6TVMMnE/T3m3rFlNFzGG6+gObPNyXwNcd1ZEU5UCIJH0mbDiu8btkT02
rqtDK0Sxte3f5ZYRt1YogGg9J3X8VteX2YkxUcXb51MP2vcoqqCaFBQK1IJIi551zhHXRBN2gXAp
beLw3OMJggZoHhtd//yDgpKBigIcL0/sV83FdpQaa2LArN15kSrOLsThGbpFH6ibl6EewaIklSgG
ghQQ5unfO3JaJneHJcyerAGkLh7sTUDph4NYbFhSq17gsC1VNPNBNSjDMMc7eDLifyyfJWc8EduH
bFYaKiSZykydnJ0ckcttYLNoYPjkcTzb3LAfxhsPVMgnhpjFg3vfJnVWTr7Sgql6egTGJJLWqpDP
h9X1MRRsJJpUjAoyk4doIxwd8HWvZhS0SMielq9GlZ2uPIdT6FjbzEZm8O+5hs7mguYXBBD2Bo4O
i6BsOOFemvcFBYihTDx/Hd8qPSaMXv7V+5TEMUvnd3ZVp41MHJuf4vvlZIuiKLyaQzc9LNDXB1JV
RMJ23Htk6T8MxVQQX395V64j/jqel1MdcjYWxOKMIqcJn5WwHCKC8P+Jt5kqwh693vJV1RxMCoPr
t4ZC1pgb7fR6Tcy//nWdeIyIM5Uh4I8RrfqNkTe0iwikTAgCI6Eu2aHcVp1ymcu01dYVI3cGM/jK
ndX0ERbvPxPl+B4BiOJG2afXGR1EjjobtLIhKVgV7QgV+ouLKfD33Nr56F6PWY/Zzd8yCvu+kA0o
0pw+sAHD+xarnekPCDrXdFEWk68x31jHXdcpl8N/70QQiPfX1PbdwFANV9NXjVOOSaJ8SjjhKD7S
KhVVqRbxhnB5z3MJ2HYs482J2DPrpGsQlhbzUrJGrwYCC+f9xMzxvZJ7rZJaj0VmMQYHQI24RUBp
3CoZm1HA/OpZmsMgwWC5orCLR0H8Z68jTqZ96G/9eaeD4jSwVdcjclld66dLgy0zObB3lBqlgTrv
HeWAYIFq4nzg1Acc/fEGCDQmuAijq1I3BglAEosu5oZ4A6MOfVaxj67edjIj2uUvGnopHp56FfcA
WEFTHEOgEc5VnrPTrz/rym8MMdHNBPXvKd1vHTGX9OGlKv8N8KJC0DBLPEr/qP7btHbodc73JhBc
sntYNinYa8fQzSqMP2bVM4cPfv57UG1C/3+cpimIwMH9o3SSIwr2d8XC1wfsLELjDDIZEIzqqtXk
DwzECUnhYsU9iCIXi5ABwAE6yi0VDVOEqRILr9QoXPHlLsZCiW/VGAB3aLrJAIOMzdWLMP2bnD6r
FRzUWQ42YIM26CNEqhDCSKFQ4/TFTk8xlb17PjaWaRzF2Bh+EOtkBOIuTQbb6Gu/09HaS02gfEo2
gJzLol/Ezz+qgLUeNj4Cs6salij04vCFNO8x2PCUsI7CSxognaOfp2Aoax+feu0iUkePZf+Enkgo
JjjzZrCI2CTsdsKilGC8JnJi8xloucw2KK/wVzzFTPMpm1dyWGtnua4i9VddQGKgbSADgiI8h273
OVXROX+Lf1WRrx6HBukQIUKz8sDmWvbsROmg8hFxVctvetCgMv3iVSs5QYzfO03oT0XwKIY0wEGR
M4vBVyA1b4wQEwEh2bu8CiL3YaKUOxj09o9A3Qi6Q1UMWi1rb1cjnhOWL+YNqi1GXEb/ACz0pFJH
q6iqeSIvGR1z6ZFR7IMgYBTa/WFqR19oinEBnLDI6AbKmQWETo31QWPQn7eGGApPSQcB0HszsCx9
hMGCGSWQnmKQk29RXlL1H6RyDOe/AMUOiN4gZcL8O/FE7zC/1s8+SP5TSDBoqlNzaWAJw0Vipo5H
H7RgUo1xZdjQUCYl9YVMr1HkXMOmj67AaNTSV8RVNqtXscl46l2I7Pug0RIXSjHsrvydOdfTGqqa
TXuXUIZVjC08XyMBWKKim3KpSs+2T5BYL4aDnqaeU9a7qbR97V2P+5PCwiqR5nBCiNy97AEoogo6
t8f/vewJPbaFKNvmmPaj+qPYB0uBAgmW4SUTIN9Dm9+Hn7/vAh2CuH2KDi15+pxiXASVO1EduD99
2LZViKt4OmU2ovhbHNN5GEc/q1LJJFBwLztamkaCxF7lr3qy4pYUdX/P8OO43ZBqVLWpdFSuOt6e
XwHVuJhUrn+bgxNxkVrhR/qaKzgmRzn5DD6ardMx92Tw98GkED0LjuqpINto8F0MJyAsqI6E2x0G
bjBHUUfZhw+6AbAAoJqImdh7PtoVsfmeZ5bakEHsg9NSCvdJAIrIa4NpO6/tR1c+ShN3NZDJuCm9
Bjq39fsSYzyI0Baz3QG3E83j5Xwp4l+hMV1dllrvNzKDx8GLiBCytFTH9OS9sKhgdxvpxJuyWuMG
lE50JXHGMBR3GU+s8iVOI+4EIDM8YTBAd5fFNydLLVzt74f3am4DYAo4NbHfMi+Ja6YsKdGf8q+m
+LQch6qzJxsxM0lMzHSXIrIkZv+5z/fKtxSlumtNRR0H1OtnMf6/lJNIBXpqnUPnWcTT4xNVIov+
mV9F+hl5IecCHpnsKzZQ+KTRSq4tK5MTTH00BM2ckEPAX/aeLbcmM9+lo1ev2pp1hf8nvSFHmQUq
U+ngnF6X7u36ye5NNsY6MOFDnnf4++h7LIDCnSTkvbYM16m+a5fWUtjHmci9RZvZMyblHKE/awBF
O70rf68XRx2fvohP6pOzDuUUTZdaZayKDdmpIGemUINXu5BFI6jpuxnsbSwPEYT07hDzx9NEPgwQ
hfWKk4lbzZjBZr/+AaG5mj8z2IZCPVrM0kp0osVHW8vcLF91w4hEJbT/V26TXgAzZdlRUzLC+7iB
ABVm/NQ8d8nMJ/EJtnuiXymQXzfvZfkBVphGQT1TqRa9k36DrEL9W9XMCDtlFstPOwW/QCkroQOA
Bp2q2az5kTWmpn4WX+72usRvhT0vIQWiRVwvvYuIFwAOWoAbOjvoW3R76n7N1+G/KGIH43craMSK
ajs1iJW1B1psY5pqAhxiiU2YY1dkV/ZnXYLWpuIxS+fRrI7X4X9v6Fwan1auPmeewkw87cfTtRkO
oC7Y58xqvKBpyHBITDihyvghPLXjyPEh2oKJo8M4XJU76by1yB06vQaqFVvxLvay+hA6BNglWbjJ
BjDw1Dc7/vkzVXtUzA+/Ri9+lZCdCUaycQ8di9885gwlqP5/j1ttlcz7PsnRQ9IHI/Q33H9K1cMS
uZErtOf5w5+CESe55Ct2A+l2AEJm9FnINOIi4Rl2SU2ImlXDldvu62Q9NDqwvTfoHQqhzYpBeYwN
1QJu6Cdk4rpdPRcMuLQEao2p9AOFI/iQcoFPX3mx+SHGnXJymVWl+bqZahQOWA5dvJzntTddLbgE
UHT/xwanWEXDL+kNGpDyP5zfclwUHgRW4oM3hXUYMQ3PN6qmFinu7xeI+d0oUwnzwtKfZmGMxxvi
1tomgJijNmFKxndGV0MxJbOC08rhM5fyZ0my+dBIjlZBQ2BRahLb42awVwvgR2fG9UNp9w9desxQ
Oz0Qi54leWA7XNeUsgsyT/eT/K+jR3JFypzXxgsYasfbybdovgm5x3ihim6ZlOik/URZ/t4ZGZ5v
M6ArfXYnT2Aw8BIPDACfUMo4RRBXqW2M5w6EmzEfXtjPls6bPmXyZqOkgKmylwS6vHqzHeq/EESf
9xytj6opFd4IzV1EQUZwo7q2fG9CGbEz1CTOjMZzaO1hTvWEk0/29Sel20RrUFBoYWH3gkTPoYzl
GxboGFMfHa5yK7Bv5xWnaPVPQPVpqC8N9zi280TTqAFMrkb+FL/raoMAuEjWtw9b2JUW7AlQ9/NP
RS0we9dqBd2gof3v7VGWFRAI+eqxVEnYP42YQWRuZIKZfDKGIS3qcH7eirVPxq1mL6TZpzkPjObH
SqevKc5FfY6PtFf/sSENgLHwZiNE1jJGysm2/RWwBxK1tJrN/pJYRyAeaLz80t0+9m4km6/b5iM2
90ek/Zyy8/c5v9G6lmwrvq1GW7VkYG1cIcEFJmUJvs9JV9umW+Rf7vs+/tsaPatgVF5mXo1oQJ2u
mCAzXb7yZJcPz6hCMCbxN/7C/ENSb99kQAAccLTPG3NIU4YNUOSJ+hhGmRSp8j86vcyIQNQ+I45R
XF+mrDppayDO/e3kHyu1UCkT5N1fxaa9y/CkaFEUizGU/RTf+Bq/1zosPMgutKklLB/jH6kqkycG
dTGcfKvp3uQWl84F4gwJWgMhv9KHWhcM2nAlxNgaf9DPIvPJs5S9yhAzQKGmeOWM7gchcVbpNaZm
rDeuEj24Oy40P80t1BhUmAoRVfd2vXVFH+uCQQ8drMaer3Q1qntgLGDBYIBMR3c459GVY7DWIVp2
Wb8xnPh6FemuMlL/nczGdjcDaZQnBU/kEjH7/WPpKL1rouy3+0idyeY466guEy+OyX2oIhPpuiPX
Ca5KLHbHQw5F2IcTDV0tLSJJaKV+PpkHroQuHAVLndeYuvn8pfGI2ScufcbcFJj9+456P4cLq/ek
sSFIYKl53/M+d2FCsSlRX6JdMvZZPnvmIrRAjN/3Wl/cJt6ZBUlnG6y+fgCUO9DYrWuQ7y/Z2STN
uOe/UYC2Be1OVc0CHaPZsU7cTl1iXJ8MDAaTVkpEXG/wh9XzK4IazL/L2HBA42TB0sus9h00BSTg
bamNfgORhd8LV6dwWHP4oY5WJTnl5e+/1LOHaqynov1LPKyfhWXFUfoPX+gxtBfzHGmXHacWPtTm
t/+B5Ls8+XAaltq9l5uPIZY2ALUEt0sqjKMU21hvNsAhiIAOTe/FRVTv/NlVuwVIW4Qd/T/rYqJt
V/ZzkFXIcIJzVdH8eyY8Md+7neMApmxqZhYEqcKROtIwDQzuKKsKpHpfQPgBTh2ZyWt5xLE0xqTB
07p5lszIfxuAiXgwjSeM1kUKfkACXCjJNDWmVc3CxitOadsXq5znS49NB0PvL7tp4yBFUAMMM7tR
MbQSLnJLewbpkXgRkopMgHUDYCWrh7XAI2arQvQcqo0UpDRhm9kJ/mjZI6fJAT7fPhJ1DTinZuDC
jZy6/dqtHtxU5LQoZsFDAvEt9QestYDogvjlh5OXYzneOQLm77DRgLiZLqO0LxGj5oSU6ITjQ3Hh
yEJVZnVZtWLLbdaBSArRqy8++bzaJAUzYFFXhwT8b2qgRQfdSFQNqe2HhcuNZKhjP3H1sHrDCEnm
swtF9z+wRYrcQErBHXJEe4JOrmv4NXbf/rICF0gMLA5JpGAX+1ngainn/k07DCHzqbdru9zDYtBt
uBPSbftfGMvQLYOg9gifoTbjtXwv5vS+QXleg6qy7B3zyHyfYbBurXrwN0Cfs1TT1FYM0yH/I3hx
LUn+nyzA8ydk9BLpgXbPzZ5tPfugFEGeBE00B/WiDiJyz8DxRcWhdIwGw2mjPEUrsyCF2HuUik8b
DuDUKl/LXnezMdnylyk1YtyBmzkjgLE62ue1rxzLf7h3njkMg5G7o1z74RUzaCWib+kBrVghkbZg
A+VUqdjkP0cUvVn37cubvKOU5Ak5dT0T24TfsZDPwY9EwCtMKGWaKUGQO/DR8SReUr8LKHujsYMK
kJFWerIuR+TDRoDw0rlGpEDFH96+B9CKrIafhujeQMqPaJzecqWsXvZg3C1OWtjirUDiHvjKLzyZ
eeM/fsTGp6yQ0xuDreFw7+sDLGy7gHNF8MfDSlXKIN/RIf5ejxBmqbjRec/W02ux+Mlj3+Lg7kHv
b4fl0A9+7uwIzDGF7mhGwpQxirS94X2MsWLoN32MPIkQ8A+XQuNG4AXlU2QEEN+LlwO6jYvVcNgP
gtypcsLn07l37jrhYNX+k5Kym1YmqpwR1d8PQ0IlAwCY5DWF+Y9OLh7qtSM4bNzyH08zdRAMVkyj
LA7m9siPrOzvAPvs27WVphC1UVTzpY9aqshE2Gd5jw4kxPUPWyxi2cIePPHmFzSXx9vDHFzZc4lQ
2UjYdn/zvaXn+/PmDxpaKwR9dBh/+6b1dtRTUnG8I1NIn1909gm5GMWLPia9MUMAUAIZelXy/LYq
eERmtwRozttXqNZboRZ5g+W1rcMOEtCLqxY+0hxRd1aj+Ne9kCYH2+OkPNBry4BHjY13UahaGfq6
ravOCNOQgpPcxMHlTlTtDYLVMCn40BBKUrHiggPyB1kupGo1ZagNI25qzYeGvn0nQaNeeWBjmvtP
Prl8GLAUa4FUbErvv3Jcatixzekdb/rCorHmX+ab7tSWvw4mHWcPF1bWJ/ca/XjIg4GGc8yKOPvp
V+5Qr+8uG05gr6dNy2tVkdrSrJ61TJthXU/cOcCp7N7mdTRY3jPvpw6sundJmzu+GnDF2cU71ijQ
WQ48vhZFH2gGsPeUnnk6CI7yRGYtMUI0KGtTex1YFDvdcyc4wOh0bgNU+UCVr3FxnIJ1kqLGl5pf
boCDJ0wgBhKOCEU8TLNFX3ybwRpidzp3NyF/xaNPU+4Sq9cDacY985tKVRqfypt+dfamLL/9PqXq
1gRfi93105khLVrxruxXr/lU5+s1mmKZ7dbBpP6PiHXu8U1r8cXAhRpR8EwMPPHkfzxu4FKyMcoB
V1h1s89kfcJdnTDCUQj8N03A3RPh9no8+99myC7SjWdnnzWHmTBM+pexmO9I8wmouIst38ndccl/
8P+ykg7gLcsMa/Xgwa9icxuK0FodLHYneJNR/XgefkaTTmknng0cWQknUjpFJLoIln8VVQX+pwzn
Q0afPWJvkaNWPaGtI+iLtLy9CIHYzfuCZ3uyqQJRKB6i9D0TeOhzEEx4c00HHwLMGy5QNEJc3bTX
2YmqWHfwcFD3LsDbdyhG5GnqMRfPT29DiRGrI5a4HJahlHSCgjYQcjOms+99cHw1KU9cBYBt/URA
p3J1832cfRDyzezXgBlvIW7GA9OvfZt0VjNP/sCGWQeLgLe47Ula1mEUNVGchxGarizMbTj7ZlKQ
2jq9MuI5TZjP5Hv+7fT3qf4qcPKb/JQ0x+L8kzZw4uWSkyvmbegQr/xLOTcv2gxOe/g4W0sII1Zc
ulmREwriICGlFyrqjesvv1j4nTL+E9tk3uUR7p28U+2mqKebFNKdahUEtJRWcaARIuq4NVbHs/NU
7Q3d+Tf2vqcUsbQOPHnrhk33h59QWdI15WRbPHADdBhAfmJewrrBQZ+Xt2fl2Y5noUgf3SzN7Joq
y9zIjfzpmvMsekt+FGNihqcGDnkkQ6GKnwdO7tzukSURmqA38ywpdI5ogmv2Vc76vFU/JdF2Q/c3
f7f2LyOKdP55bXvAqkLqARSsdk1WykD0dIXNENLv/aJCO89lmIhR3VT5iwUtbBzl/YtRq5kJqxRV
EOQCkl0iBdl1Z0pcqKB3N5qJfZEG0U0Wl4yIA+7OdlulxiMWbjlvxQa0L1rghCtrhO2ctsOp4FYR
qwCzvs4c5AXpMsL0uTBuxsJmh4NXy6wdCJw7fGfAmegUdyitAc/kRzYk885+M0rxoCV5+NtLCj4n
eHMsegIiYPwg1iE6UEnWdg0uR1UMlL29PxQpo1D3kn3g+lbOSPxR7sTrl3++l9V3jYKogWx96Q5n
n/brYyBTAP8bW5Qg9Ss0jLTrci1ktzIwQ5cCowjSrGSTS13GMtGJjmA9aP+uXBLdPHNOUXQMbaA8
FBq/ufnVslS2ywVyn2+m+E89nC+tf9j0xtsI9wpC4ct6cdK1xYh/D1SJE22nwUu4OenwMEUO8xsu
xyUkoEhFsFJm1vQpO9e3gT17CUX3CgFhoDQqjaA6iv73MrEBdcVDoI47XsIg+gjQplXKBQA1ukgO
G/8VfUOftObPealPxzhLFJfQPfzwzql9ZbvxDboiAZ3qB7R0PGuGxnYyU4LyIvvJajQ1/aOIfVXf
IJsHY3f24rS6HbgcEolPzRNixUaKALf9PRVbXPezlslRAPK0LXfJpvN9XpygvDZlqpxVTh1G5mI4
vIx3lYr8C/xUlEW8kfbxFJFcYXvT89Jrr2/I5fGy1gVCTprDmf+s1vpXeHFRfe5rB7DoncEXkL8e
hSnp0DXs8+29TCLeoJ78+sdUkBROundLNbmqb3d1wdAkmBgrN0PNL4D+JI+gTcuQFCUPRhqoAaAu
L+uANNmt+Uo+npGPuxpEEa1d7qd1nebhVq+R5HKuJFtGEd0LGptuuCBn/qWPcR70Vt6c8QlaY564
W2AX0Wu96ms1qbhY7UXqvHb9C4WYSWQTfwibpRUIDIFD60722lnMYWpl1koiOl70A8BpoYixxsdi
x5LbFN5WV+0n2DXl+Tj6FUWHAkushlTS5W0B4Y/M0hOxCtJTs5uyyhNsRfAb4QtszUP6CETH+aNw
/NCO7RkYHJTMi26hqgfwftEJsF19xpBs0hPGoRx61YhZjIfLkINYH0QFDGQZjADYpSXBoOY3Pxab
K6GRHefp20dV6yyStfqeOGv1k9XcGk6KlN7Ar/UITQ9q/ufAZAWTR4vb+D0TkfaBrPvxENshyuD1
KdUuX30TIp72wtpfa6bknkNz9A/MCkRTQtW6+fV8zdM4Tj/LT0kNv/MBqnUJLc1KfrxlsuH7b3g5
3JUr8B8QuBhvhwR65sdkLZ5EASSQ08mIdsBtUaj+DrabmwL2tP4NcanU4Go4lD3DUuvnYGP2KZuF
Diq0uwV4qBPCJtt0NsBwKa10SmO3AoaSMO0NhklEy8ozKXOdaPLdklISQzAyTt5i9lTGMli6DTJ3
PfKFvzeWx7G1oMwuVVlSb5Y5CpEWGNDgCWsB5HlIidFyB1wL4mRG9XAKM5p0ToJ4NzcLNZ/vhO8q
dLZ6qqYc8p+9vEVTuxe74ODOo2aNLR7fHd1q0ohGeOzXrZCkTbsGdHF6b/1NwvPI6VjYNYhcHk6M
xBEKvAwwP3/g4GqQaySFXRT0GNE0ZpYhWVpVmVSuIXjL20mf6hdzZC8L+A06vN+gyvup0NlIXO+R
ZceePn//PldNANlBzSH20bkA1f47+86AecUF77nPg17fOJPI6XD3kmmcwRCDbvmtqtV9b6s6wiSA
qwyJX9qf+b9awoJ0JQI0MmYOywXeqjSHVGh4YUbn6z2NgtgHn4XR0EbljgibH18BRGT7Za7W2hq7
HhHCJCurTg94hXY961zEVnv1EPoJX2SCVGzrLBr9JfcJW+vziDS5WiTH2aVglFGBXYO1dy/+zgb0
HQik18irq2LXa8IcxdU6rWt2/ZHZIgOY6wimY609fktrqTbgZiUBj5/+NbVCbXE4cu9vTZbMGGoV
aG+NMOEpAh75hiW3iETfJ0jVzobq1FaVFRyAlM+0A2LyZ85AClvnGXEzcYJf0ntFhGqDdxrWJb4p
/qCbI5KrVmBKrZY51KLadBVH4ULgLFf6nN3CxhHWLibiDE86ZujJIuSNNC9FaqjMuVg/AqLifSEi
ZL8ioh9fpF0m8/ii0M3X6ISHxIAmAls3jt0K0kZs1qpI7JJQ/SSOHYybipO9ISab2uTBDAyV3hYw
Tg4RD+bnglBnu3F77H+hchqwCA+MD5BsITCX+VLTC53UL5A/Mi7/geDTZDoJphgi4DUs8+7QRr7m
Q8nn4UGc6Tkeu6eroTtAsvBjjcVG2JghKDpsz2BAFnyDUIWAd82TVkWYt3JmNN2HnyVS/2giYeSc
OPNVb2m7YgvssHqAwzqRmNuS+qCv4/0+z3qRfF6Q6Vhrkjjc31IrmU2QIFSinQ+mFHH1GP8EOyL0
MeMc3kIAxHmMN4k0klKMmD3nswGA2WRpEVstrfSi6NNs1+kqV2ticThPvQomnaHm9SZfTf82ZDbv
nGkaatL53s9UyXz9B9TXZFGfGmeq9FxQhoT1DEi+hnNUbPo/IUEQ1lhmd4lxmHtO5yBnGTQuXvwg
ksPSgboPlr7qkUB2yWGR6jeveNEhg06y9nH9HkDBxqdZkFBQbbBIGYiARMaz50vOV+lkTtGtONui
Jn8dfLXY6jINiVQAqAncdVJj/GAtDyO+nkqfkIQSdzqjEAWVhUm5m2nDvchgiPq313muWfNLv6jF
y9dzcjb+giRGFPpUv3VJvixJhBV7EG529Rbp3zjCMomSD/+4tZminMNcIt79ZQyi4ccEKkaRlwHu
U+KzFiina+siKmmuPGgM8Fur/8S1m4WCAWrJG8lFLL5AuDYxadKV+RE7n9JvJjMODcoPl2SzRQIB
b02c86BG/dZo0FHk5+5TEVidTzzbtPmilxLEE7h+NOR/2yLaNNd9YTb6BRfNtZzRIt3QRidTeqSt
YeGD2jivviABJ3bM9ZT6yzCjS10mOesFuXKMDzsryUCxHi4p+Z/Bdz7U+vu31gx7/Y0fn4XiJ6Vf
y81UC8eUBdjWVPCzf61C7aJjJRnHkaf+atm58yJVgPaTHe8U+zpYO/oeZf+nEiJMsA6OnuKzU/ae
2pBAX990BPjgJwpVrJaUB+rxKFSdw0PB/O7V16RvQuVXYJZg3Q1MW+/5LMk6LyXJRpZHJNrvmf/t
ZxjVCDnuuq9feeEo1pDq09bfFCGwDYmTU386+z2SyGc5zNQpY1JPBUP9sTY71pXS3Y2uETNgafTL
lH2dSgihgDefMD0jKio12OpaEMJihp+DYXSlBa2SWLMliS+emjIhEYpTsjWcXILBhi4KzeN0L1Am
5Lo5JSG1MrhilaZI6SGknQpv8zyeQY/cj/28Qu43TijFAtk0GGj9ySDGgvynFwoEhkFdYVyJUS0w
gVmkEpF5/Ud3heHRjAyWClikTZQATIXmoO1MswmPWSZBmTP99Mq63u86z9lWgM2bgSCN9tBrIKlT
ipP+Jaov9O3MkPdqSrfBv5aYxl0zbTMaUKwNKEuS0bpRO3kdzR4NfC2ZDUzqeeRU+5KHp/J08Fvx
NWq6rWbpFn4OTMB033P9VpxAJ/WKtD7cKPzQnP4ly0z0HrFH1cPJyUaLnX0WDp707zWTo4nqjFDI
raBDQV5cwiNBDtJgkAie4YvpxFAHpE1H3RdQ7qc9AlF3cw7QYrSdtAy7NNab0pNnjO9aJ4LglMEq
SOQ9PImZKI25lDYelWppxV3ChEIkum4vj6Y2bnRwWhCyt8quLW9QlLwfwZj/JP1jKwlPOw0OJfyN
wq5bhBOsDs0AGuHdkjFU/G+ZkHWhJQ2bIT93PDTQmrxvuHqGvuJlfnMbejIDczhxxqItMLtZ+6Id
N2zv4TpDPvh9yN8W0qGPn+I02uve1IV2mv06d9bs+vZ/qk1CXmEuSGmqShWCS/7tJEM706kcOZkq
l0TqFXdvfoKStzsg5zzeotGudBDl4+443RXOl78OLIC3804U0CnqPnX/ULO0jG8PtcaFWCykp9B5
4lP7C1FvEmLvCqsj/+UqG487r1chJT/PUMjuLUNxKEqDDTACWGONUUpLbC3yVQ3ZhTu2IFmbOQZ2
g1s2syZOOkWpzdVAFEReYFJx5Wr6XQmBTUfZxXs9pu5nIhlewsygP8mvPpMII9vlRUPdw/ikURwt
CEtJJ24mFH6vmA5pQQ4kdkXuEUgS1UYs9Qz5TLFbNihXNs3b5OTd534sQmR2DXWJ+Tkwc5dZaBR2
/ZoY6wXLMWU6BW26fhtLnJm8dxZdnkPfmFrXtdH8jGonCdz2iUTHSF3ChQ734ys22YgoPPW0HqkQ
Zb9mewdEnU9MtchXNsIJqMlRYVrZoipTRyIbewh5IMPLR6JE9lxq5CiCk7I4g2pY8h0AuZ8PCJm+
vc/yElR9Wmgb/7dtnARg8afZQIzdo98kAGekDSHfAsRwmsDvqesQTumqPazei0pueAcmLgKjZd3Z
aPDGeP1rpADjfHsg7iOP2T3VBsNd13wkZ+fF6zMJh0lmSQXkrWrloYo07p2txA01y9shetkJToEX
EDAslPL16t3fYe2i/D+0qSE+Y6ZRfa2U2/b6V+4QqgUZKJrs8Z/dUbpO4S+n3sko3w//HtLJsHlA
j0eSFauqQ3yTbVaJ+TeXaeY3ajewuns8q8THr/ToJHr7yaE99t6pryO9SXNimqTOe0eIvV/q2zC0
srg1np0VfNWGtAOGMFz+1RF5/21knUPF/FEgL34K4lCujf+1H7cN5g9X/LBSbwP1wr/p7xYBJuDH
NiBQivtNoKKc6zCZlaIPeyflrB+TpGqsqJHonT2ZyoDspDNeG0OvW9rn8j5TF/ieGI13/jpYmrtZ
zCSG40Ot/vjmF6CWaTHPMJ7KcFwY4+c59O7J0tpfWEnOq9nFZEiN0S/cTF6yUrfyUJqL6J0aeau2
ra8UTZvDAf/wRhb5PGxbkDVlWB/oluyuvI/iMYsgRFEltnEHzZ5xCkKgYJ5krrSEaCZ6V2H8o9Qu
y9r7rWSY/L2f5+ndKIH/QwUskFk2WgTz1SyV1QuEZ+EbOpoEuzBHITCnMcleky5gLak4lvnDX9zk
GYIUxNMFJ6OQw0+CJV8AdOX1D4mQ6feYn47boK1w3KqHPrI6vE7kpu80zp7t8XyO9IbKv/8URWYK
ZBM3vSd4qlrTi0hUDiLDzuuLbw8ULHqV8no6u/0aG6ab0w3wE1IBTYcYFkmNjaSQ2pJwTlr11d/t
fi8GYIScJH2R6LHj92C2gOEbIoSQHfuO+p5PUEaxcKlfY9StWz1XE5St59qIXPrdfU6aTnvGDSh4
HSXlVP+HBUcuFcAm9AXw091tqh/XGshGkBhfcIp0c30sukDEDOrWM9DBapF5m35NS67H6QUGHkfU
0no4r1hyRXWD2Gfui0FIJcqP96rimq1LBOPceUE90HZZFTAt8P7hjqlwesxdQEAf66P0poDfxlgf
uMn8M7WBaSLHtjVe36gz6mnlZ7dlLNnctCmUPJhOrNOJuQvB+r4fEsgQMP5yobFojuW4rmkZkaxj
CgCsZCj6xFAaKT4unhv7Pay4b7ysZ8B1PPyBGrKUc0fWGr0OAZGnTzuWMH71Lj8/GBvxL8EffBj/
8con9N2efefzNGQAVKcisRo2TtYQTXKI4MV2Fl1Gft3wmhWNp4C7a1Ns++Jpfqb+eriCRUXPLw5z
mochYC2zP2F2ti7jbxEdRSPmx/fGRQzY3c+wr2NM48jvp4z0jM+cAkPu26xte1c/lvHURCu1hC/m
B9YjiXEQCowxToEqNPshRbpiVFYpjnzjDzW2cP1OFtt4mYVFRjDW91Dx6Jx/XV0YEfeJRlJ9jcJi
ZZv9dPiUmOTpY994hWJdmJjavgyFcE/jM8jFUFaojCdQy50cBPzyOC8tDJB3yN+JkvfRMGxDUhG/
Pjzz6QTMpP4nPTa7WOqOe5c7qn9S7NLLeq5T16VZwxM85qMbNrJBMOub8fOv8tAAW9efCNCFSgwV
ttnAFwkbW+sPDVADqJRhWSCFmZiqHNRKB1x7RP21GDDa2fc/Iu5ZAh6LFYemn35IFp3podT7MfjE
ln1F8Lo9nnUgsvmInIavpuIpos1TO8e4IaXzatakP9s6JRCVKzUygwt58GhLrf2Qu8U9SUmsgsyE
N5H3PHa28asWEF143f5JpH0FLQcrSEIhEBuVKQJvNB/mq3qFxERyBRzlg58XYyUmBxkhvBnT1UdP
6LydQeFe8tM3OPD/HQx9lpNOOm8FPLZqHkPar5S7VGVj4tNKZQ7bEheiR88Hp4rOWm67YYqile+d
qI1NmG8lAmK3TXJd3uX7v4gZMIKK8EGynmsPb3mNgsFajqvBLBuaFyQ4QgEvaY/9jyJd4D22FCyI
vveMbWpcVI74lC55Dl8f30UyFZnf7Z1embSByREgGPJdNpvIeZIlD05nS8Q3qXKx4nndrrR1Y74I
t1egjooF8TusTA2wmGMX2IVXjJCP13l1cUC7ze35hkTaWRpGaVhxka82lPZpoo1EmhCNKsarCLhQ
MSn1POz+EUDXhoVElO65k9hFBpOeqqTvncJZC7QG2P3deHBuhcImk/aVh7Y6jFbjTELFf5HzRxa2
BwE/3ZqoW8Kg1f+qM8DiUD0F1ixkA4Y0JFmjoPxPoE+1Hb53dtv0yi1BKe1hYRnk4NdiwPzmS7wF
32dR4N/p4x91o6JX7Ngq0BHj5ax/w+2xCNQGA2F6QqhKUYviegK97bt5KuApiSE1SXuZSzSIdyQ1
JG0IZGRp1u03xzLXk33eTH1F+PLjy+PgwyodxIFfve4ZXNTImXLYJvNTIZ5cMwil8RqSgZ7nUm3o
gxk7sveg6x62Cywcy37YEdF9QN5QONdYvmJ5VVspTbc0nfDykhg+NiNk2g9/6lLVQgqy5kdaUuBJ
fd8GiOLxBlipX0HPg5OgddmdQ6BShsxgayhxeMNGXP3aOckwnadHonzA8u3YD0tvnCDBRloQkM0g
72ZpQNntWt2Pyv3M2BEaLDUTAoMF7l+MmgDvzH/zcslDzv8UMpPMzwP268jalKxrDhLLq+Twl069
Nxt6bWrclHko/lgkJrYMVxlB1nxyIusLs7cWKFQuV+oFdeZ4NzkDcAP2alfGvTPe5vTrdH/EUBo+
aNHPFh/IegqItKHQe4gt75M5VemI3QY+UORNbgOn8mKYU5mowOq2yNx7JhBiyDmDPX1pFT+fnZ/0
eyD4MlZHSbOmYHp9aHfhktdPmJd7uH38Lg0DPQoGw5pWdViYedesIQ69vXZBZccGdElr7n/XqllC
h3IKYFzf5uyDYMv5YH7+4q9ibm0OkumjxyqHJ1jo2B/oTakQMOdJ2lpC6h6qSv63uRtiI5Yvp3wh
CU1tP8vayR4DbzjLdr69C6lQRS9W4xuJJdMSUoa0WlZs6WJL5obLBmur7nK34kpH5ZDygOyWdg/q
H6uqcgc451E6uyiPGrJwDucRBVDq0G0verYeCiLioss3QqdvMyjAALz16uIpNR0TNxbDzbgAJbSo
Uzx4X8s8cGMzI7I8iOzfXS6pxUPgyy30fjlg0ifZ3T56xiHwmc5lx/8VIn2+xoOK9OwTjLwesH5W
vP+0LG7wZ/04G5Y9tX91KIJEeYQfcxH7YwYV8N5MxnlhoDJASdGFHYf5VgUpi0NJzY7Hb1IlXZrt
nAjnCBQVgO5xwpPYpkxL41syKQbqy5K3p65Znfa26yL9wD+z7vUrxpZ1yS6TAfeXDHbZL8TAklym
5Y4tsAgL4NH1Id6sMaUKcmz0NYHjmU0Z1H4QkoTI/9VR96ELoNRy1KqP9JSA7+IeB5UXjNySlDkt
gYvQTuGP4PWmIhVo6EMPyksAoQxiAidQl+7/kzUfhaCFkvsOIeZz1piSquhyG63wRgz4Rqyo7NMR
QLsgto4nuWej/MaX4bDnuedAEQCfDnOTqlM8lCOmNBHpqV2OcaD6gxzkd/W5aDDWxLOj/ZX73uBS
6z9pKTPemoxNi0gCZoncsePqY340GYqmQdd6tt1U9n1UNyTINvQz8yMKHUjchSGWSBP/G5zHA1Yu
YxVsXVYJoYxDXrhYC0iFBxbXYwY3wI7gpax/UL3Np6XY8t16wAtVfE9eFJcmkJ7nPjdi7L71qCh0
UHGzfJlo/S8IdSa52Hq2OUsbcaj7hOszwVl11gYxWdOUFZChufmktDoexjeQ2cND3P36LxMCHJXX
Wv5b6/RM4vdMVh3y8LDRbJvHOHyKPRwmknMBLWUmM1Jk7dA98A3HKKgDhW1/TfmEtgZtltyvlGJA
DYAoAt6/YT8/lg+bx56mCi9TjefbHwKw9Xl10rbEdTwTUh/ClU2YIr4Rg18SR+Lhsx+YL9psr1Ui
8fhGngM519Ph9M4FVX00fh79ajMRU3vGLyMnrFH9xpV04LsAIBz+fAeidcBWJKIgjKxNxeAqxu28
A2zs6gcxYrDuf/Ge3h6fG0m5wyotpf7LF+AEcFdh57ld3aJJ1BtXnzFiJiqm52DKXYIKwPW1dkBX
5yXwwPcAd96f5irCAfCCXjn7ZKteTdgaT2o3FDXagbt3Kue3pOIHSp7DuFox5GWCF9benbNW7h+y
hAHJNNE2M+lM68RVmsgyyFh+Te/BV0kEUUlyjAEG+lv0mVr23aUXu/RZicCkbi6Bb6l7mXVfi2kj
Oouvi9uR+3T6E9FqOBN06tG7WLFVTNUp+CNJy2XouhSinmljmaMugpXx1HJ6ShTsVgJVxHYwjzWV
VLrEBXaAxHH21fQ/lUkHvZqoAFHcSg1bNMKQDAjKNUFYdf2VZX066TJpv2CbFV9MJzSrJ6Udjqvj
RCeKZn+/7eeo6ZMkgFtbDQZrDlXazb+qR2wsHrV/1u55JlUCZb7ru576qU46tOuVn0CkrjALe3lk
3od/Jo+yaYrLnz3vhiodX41+yPStCA5iz7OUq9RywtG+9w32SPIUgPVR7G5W8Lqw7W29QwmtRYcX
NTUm5XqFUae7zphlPjgJXWGLOm3dlbqGbXDqgOk7HjQ0oAGVFdg5mnLDxpgU8RVhCDFXc9jucvdf
cpz9QJqZBcuxLB3aWUzizaZLy5ndO6TGrVoGL/86w46+pSN4WOezPec++Q/tFmspy5DO4N3Fwv9k
B1DSFRn0UH4dU+yWtyR5FgY65r3w56mk447klQSacReMHMuyfST4m6vkKtN1JnCI7vhS+5SBANSH
Y/4jvy8YjfesEY3ueSC3WO4PNl2BXkFTFt/ABrIVpiNSztkZv90FEwLIpgiB/05MCog/BHNnIgr4
ampsDjNWNA1/w0+2Oh8Q9vPupJsdIe+Rt8M0dc5WApxPeTw3WWMl848Hktj0CVkm6otKZgsxeVhU
J3SU+qs+m4pCkqjyVs3ZchjZDc/EghJgCCye03TsQ57vfvxOQzO4Ao1Wf4Eos9aRwUYAbe71Bnqx
kjpWL6hcAFWOj7zIWfDWQ8da/x0nBRuOrP+rypRLqGWEw7UJtOzEo7IX8YC4Lkn80gxCiBq/H9cJ
GQQCQU5LmiMBkRn86HWpFLEm/g9G/zLg5RT0LpntQcovSEEEdPHqPQzodQZzkXKfauB2amFPj3xC
Hem1Oe2xyewfo8UeA8OGybZwse4MW1V4AYUz+quQYfEstW6LAdVir9xk6uHCGX/gp1GXLrN9rmBn
IXKVcQQ0cEcztpn4b9KsM/jq/bw7mbns6sckxQZd4gNCOw9Ga5yUAIISafMSgQLuLWsh9fdw3Nk4
zTjvFMw=
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
