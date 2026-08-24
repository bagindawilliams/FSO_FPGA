// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:17 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_gth_logic_load_sim_netlist.v
// Design      : cross_gth_logic_load
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_gth_logic_load,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
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
  (* C_RD_FREQ = "1" *) 
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
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54784)
`pragma protect data_block
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
wgnmO7Gw/w==
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
