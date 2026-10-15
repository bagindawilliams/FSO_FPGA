// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:51 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_logic_gth_head_sim_netlist.v
// Design      : cross_logic_gth_head
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_logic_gth_head,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
  (* C_RD_FREQ = "312" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 53200)
`pragma protect data_block
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
978bKudJDuz2u0wqnOMt5wK7/g==
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
