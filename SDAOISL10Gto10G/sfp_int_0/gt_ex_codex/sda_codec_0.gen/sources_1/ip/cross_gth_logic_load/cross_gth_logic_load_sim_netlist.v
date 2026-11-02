// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:55 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top cross_gth_logic_load -prefix
//               cross_gth_logic_load_ cross_gth_logic_load_sim_netlist.v
// Design      : cross_gth_logic_load
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_gth_logic_load,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module cross_gth_logic_load
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
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [63:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [31:0]din;
  wire [63:0]dout;
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
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "64" *) 
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
  (* C_PRIM_FIFO_TYPE = "1kx36" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "312" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  cross_gth_logic_load_fifo_generator_v13_2_14 U0
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
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
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
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54512)
`pragma protect data_block
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
+tuMbrQXVl6sGbNZHMeL/ZPq4LE=
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
