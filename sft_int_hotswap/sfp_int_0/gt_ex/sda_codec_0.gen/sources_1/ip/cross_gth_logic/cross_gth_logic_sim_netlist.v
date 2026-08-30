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
vAMXHUw=
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
