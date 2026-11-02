// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:53 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_logic_gth_load_sim_netlist.v
// Design      : cross_logic_gth_load
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth_load,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 312000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [63:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [63:0]din;
  wire [31:0]dout;
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
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
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
  (* C_DIN_WIDTH = "64" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
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
  (* C_PRIM_FIFO_TYPE = "512x72" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "510" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "509" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "312" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
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
  (* C_WR_FREQ = "200" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_14 U0
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54688)
`pragma protect data_block
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
1TOEGB0OYgkDajdNgR67qOGU902haoQiVw==
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
