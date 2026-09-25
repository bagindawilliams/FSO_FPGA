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
m8V9EEc=
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
