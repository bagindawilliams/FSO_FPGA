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
x4nFjhA=
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
