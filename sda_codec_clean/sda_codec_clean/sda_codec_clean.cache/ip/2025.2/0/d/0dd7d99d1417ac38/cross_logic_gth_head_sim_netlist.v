// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Aug 18 15:11:07 2026
// Host        : rofiq-B760M-DS3H running 64-bit Ubuntu 22.04.5 LTS
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_mode = "slave write_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_mode = "slave read_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 1000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
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
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
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
N6LrzGxosygMe/E1ymt3ZWiz7g==
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
