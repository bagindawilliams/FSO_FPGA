// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:55 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_gth_logic_head_sim_netlist.v
// Design      : cross_gth_logic_head
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_gth_logic_head,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 312000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
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
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "312" *) 
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
yxyWUUNsSR2wJN+UzTUoKz+pyg==
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
