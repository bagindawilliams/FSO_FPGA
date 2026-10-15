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
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
06lNQCA=
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
