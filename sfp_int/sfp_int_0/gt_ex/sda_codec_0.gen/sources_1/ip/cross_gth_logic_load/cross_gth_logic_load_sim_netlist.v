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
bpn+QjcsLfZ28N6Sz/LcY82EyOo=
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
