// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Aug 19 11:22:24 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cross_gth_logic_sim_netlist.v
// Design      : cross_gth_logic
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cross_gth_logic,fifo_generator_v13_2_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_14,Vivado 2025.2" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "11" *) 
  (* C_WR_DEPTH = "2048" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "11" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 69920)
`pragma protect data_block
v8TsGfsvYSOO1R/vRSRiTNlIxcLfXD3RuC8R9S3UVsa+BS7GBdxe9O9fx/UWNPNqb/M6yjpqFhF6
gCYrFbLktffAyNRwrTILEtOQ5zzlz3FkqiP77RbsVurTH1SUzBF7xk5058rna0nkYbPYWx3a0oa/
FDi4vqjen9pPzMxS/pus241f46ChTrUkz7jY972qu6ja7W2R6GC0YCMRWBbERhwSkmi8O2WAwqRd
fasPiQNrSy3d/JqFC3SSmsXNKVcNWRAj/vNgCrGqQJobdmNCX1xlZLcMrtaRQt45xxx/O7F4atIk
15/9JMBBjm0OD1GWpp6QR7pqzKiktBcxIj9Zj6OGHOXiaiPn3NkPsmjcMwPjHXWkJm3opj2EifGH
YSwXnQ4SzhtXf7Uc5Y/HjYz2ByyWGhiufqqwZ8s2HgnZf6pxUV6Py8uVS/1GgTE7Lxka5Nvat7s2
GXynwf2iA4Rm7ZnFpu5DOPlouYn0eVIz1JUlMoGcyPNjUJMpd7GTwvzMxrA0PmJGhpejD7iuvPfn
FegRSai9gpfUs20u7VuICxQFZpJAQiX94JxKXcezpkRCmPn5HXu5v0eW5n8SAGGCOvhHnz897Af3
LFbgWOt4cltQ5VJ72VjyRNoFz4c4eDi0R0GHvdQMffunV3R5b+4vGOnODGHuF2dhvUShFRyxsz+q
pPhCJRYec2uSJsCKsd4BBBAMUF2RBuY2SZbr7SC+2vksJr6uVlZIzqwHUFRBCcZQgVA/E8fOzpjq
LGSH4AqOnXsTVpH7LHTFKFJe62cvFX2v/oD9gSz5mh7tOLPxm8/ivM3uNINQIi1/SrLQBvPxn5TX
HHD4e0XtUprFTw0Esvn87yRgGxaNG/p+byUdieyJZTaGw8NwSE7p4ithKjQEMbRv/SsbntNm/X6v
YeSjNbV4uoanVUNDVePO8FmY9pbojYy9LzZ+lB99idmb8uqLZhIXPT6r0PpCyOZLlOvxNutqR9rB
6gle6B6RS3KgEdhO5ziIWgCGvzcQ8ni7KEAWOekdUWCkzTT8+CddZxpgnkp8indTIYhOfHpgMzXc
9lNl+NwnGyR1TD6bOKbEskTLe3tbAROYysMNVcLnMoEPa29WKKOS9gVZ98aJu6dFYjdxCIxKQ5RP
/+mT8Nf62Ps9Tm0L2kcfFvyXDAdCx/wtdkqPXdwBGFRUQ2kbA/BTDEuRUwvOQWqKHKOJQQMHkU4l
LzEf0gMcuat2sxkMWzvaA+Y2A/IkI96EQnNY9/6vNyP3Q6F6lg6weAWbnUehXtVtYrCjrKJ5Apj5
Z8u3s0Via9c5Iv9izE8BtHidQQvYLGNmNHdjVRAEBzHonhqHBsgYy8r8dYoFnv7Rvu/CwDS9/ipt
kBi2/uF1sKpC3bJ2t34jadbeG7HvVXL7PEJ8Mpbn43PmtlUPGXW+MAN0u1IfN60ouk69LJ44bb9V
bUwKaoOfmeCQKaKhsc9NZBYEhUW4GsCVGYoV3dgOFMkHkm9zROsh83qxYtsVmoP1ARxeiuP1b+tZ
bxnxKFBRd9+/P97x1lIYW89LAtINaL1WnsJJ5zPQF6uNTCzzddrayh7DxhWioIQUmQIN9tfDq2Yl
iUoJdeDnRLi6xvDOd0b755227PVy4YxFJ23+G60E9BjWazQVlOMrzIJeOC8UW1LRInGNgLGCdfcc
xo+sMSCqT6u6x5iS1h22s3lUapqdsZYpXmfYEgYcJVGEuOralyWNJEocMlDqUOrSAMn3fITBxqJR
FTxJnzqHmENX2RG2ZmBnZ4VBFKOw/Rfy8RUgkfLw1PdXDJx5YccmFLVHM7ovq3jrfm0idNBypajH
T0Db457qRXhnx/3nav/On8tHntIKQxXR1zrJx/FbtKIWGGtleW1nFXJWh3K/aQOXSUVaAgSms0Db
KMH1h3Q+vTLFu0D7JyxdRzph9nyj6Wssoe5Bv8NGhG5BVIKZ0zr59ld1RGiVbnVZ7P3vJRq2MZmb
dS/SGW1Ui607OMbksdVxcAHZjOFlt3VVfSHndg1a8gZV3ZbHbjLVp/XMe5KPGDdlA1BakdChJZhm
NZzTOiEVEecAd3BWUvUSxw1tpgAstOboseRGqTZPkTxuFkv+/UD9RS30hbO/6wTfzYrPQZruQPRF
+bi+Py/XocmQe99VobYqJlA5g7ZjNmI19zOb8Om2PInUI9gq3F4NdS568prZWzNTkb83bzbFQ3J5
ViBzbQCkQGsA7aAEHn9SL6fuu/WnOTuQBINWFdn6OwwRr2zqapSw9r/wcc1y+JurGbNUZ56/u3uh
kVUM8KuB95ZD1j7eMCspi4w7pjDsJ5hu8zSV/Fwns/W5aJW2+S9sjll/9hgpLTBYRljG8YiArtAf
Vaf/NTl7cCfB97YpbZprtRP6lAkoastC1hJSj64firvZS83iHMzXdOHK7DZYsuo64TTXT35ymkFe
CQJBDhU6Rera2JCjyfGam+zcyS7F56kStLfo601WudmUZV2XQu1ZzwNT5qcKKKoHoSWILb4EuEm6
ZdDAd8xgvIitWbZBgy0Shu3Iz1munhMIEbtMEUSpIAU+bg+utaDbc3nOvNR6IqwdQa9eHvHZEEQC
ebM4/a9UYo/FVVh4SJDTg4NW+YSrT+w7UKRshSfUQS4j/yf4NONBQJLj81SE5IURszdxZkfhcg5W
uJ1+7tLBfLOlwaCq08SKt1KRp/g/kciizGVkTjJCyAEQFXZ31sB3zY2VE+oqrtAYJW5Df0Dy8R7A
5BRIZAes6XMGhD2BgRpuw1Bp8Kp9L2D/EjQ06oM/LFqY7saUfNZR4RK+die5cBYsXFbgbz8F2BdZ
PY5OkquBuI2wcdBuBCUyu7cY75uVEpbdahhUcLLrkCPf4/X/riLhgpEP7rkdIFH3hV+83EYRkkys
Qdme8SlaqYjnb0p3i3aciNEUxzlV1rOHC4+Jo+hd6qSOoolkiZViD7aD+tWL3N5MTJgNiRYX4Gdi
m7iybI3jSYL3RzmUQq2YoS3T2LiAzvsJDWUvnJOMqungoYsn6S10nMfjJKVWC6UDodWV5llyoxj0
iMiZv5e1GhhH8Om54X1EXLgZCB/bJd8Y2EZyrJnUM4JKLuVnVS3Q1X5Fwv08MvCgi/YYxSIrPElJ
WhnuPidnkFLPnLDuB7ICbvOzkCkbaxxoA1xbD8XO8ks8IPwuhCaO0OYkRFgmZeuyLJ6F7VHifTk1
SAXmoX+v6vv43GVUGT/6IB53RUupGc52WVkEOw/moYIgQ4WJzD0SRx7CyKNZAER6D9Wmzs1yduo6
BfxPCTlPUTckiLF40Jb/qEDsvcw5dlcUADzUhovHNX/RsQHnBGUj/IickSIxfKguf1rWa00kELwP
DZZAOuT2dXb0uOMoYihN5EsN6zh5mR9dHEKtA5n1dBAq0uspI7AbMWc43I+0E3obGGnojSLSVnlT
Vx1KoMUx1Iq8lgG1UQHLOJntldMMzdZ6f7P+p2oUcccU5wtvSTdZXWfDWVYiw0jQbcAEQA4iiVCJ
Sv5iJ11PM48EOq7aaZ/g+LDPLnwBk1WHcJjh1y7iOStwBcftwQOQjhUyobA7gHgd6fz/W2Gz0Gwx
0pBLpFqvNPnvZfCssNGayVtQ+s9f8fnZ9XxsH6moFsC3VFAKxywUQvWwN1h7BXU5I970/rybIo3R
fvi0EyI8mSAeKyahxQJZ2KEZy/xArZIHW03d7LZ7v1jhR00wyAig2Bwxrd71fa8z5Ta9v/5Nkoca
qSFYxTWFgdl9L0TJ3JEws0UHE1ZibDyatR/DfwnG6e9M8ieBOfonq67WjtmHoF5I18h2Wh7AIKxg
yPVlmUF01UAKhAV4+VrbPIi74NqfrDheBuLeDp7agxl/slq7xrwbPzVcq8CAL31ZrIZlB/HuYGJ+
uL9J1mBag6QYhfOX8z78lMxRlejDsbAeEeQlav/GnvZpovirAQ1Xu3L89f2CpubCLK/SIz5mUXUB
Me7JkUSOyWaaL0humjbF/7mEba6+iNbu9xgusFF0Eg8OmESmvXqOYEiEQhv/zBHXrl22ApHPYEUQ
wO8myKMZUQpyN12558G+3pKlr1rvmDhzmyhZ6bHGjmhVCfIaD0Tg7z0mS9ztIDg5tc7f3eYIFsj/
juLSwg63nATB9bBltCDDI+esp3MvtAgePCZAyS1T+Nc3/HNwXi9BtF2ZVfezomQVK+46M1XiOa2d
HED8hgG12iF+m084Kglo/DxrutQLNcgxdTbVcsjc0ekI1/bl7IqV4G4XEu5zhD4o5gEDudWS2J+8
0JBm3F2n3bQ7X5hvHcyuDVZ0gC3WbKTQj5ZG4g1gc9e0JhC6J8yBh/xcc5srvPTvSN7yddyHJOlH
HCQAGyC+5ahS+f2jeJbqFLlFcGOuiQBBft/1feJuhGPxMTuCdWXYjMcmKlFbbdxRco7Dt7N7Ozcq
4yXKsaVOAGdI5pYYtVWuyoIZ1jLwqM2SpcuPfGFBbTBMxWoX8N7CBMBYY8qyVTl1/eprBxcuEzHC
u+OX5mMy3Vc7a9PyYd4PMyv7xGnS5rUBowb3Lw9KIIPmUgJ4UpM6l77cnXw/AqG38LTRuMwS6k8r
IOj+vvsTxO9T8rnBsiObljMxkdbfnqIpQtVnBcf7Alzu+qONuLVEp6CrbBm4ZVP/AN7yEd1bccNc
sWOQo5PfpdS9r/zGWYZTnh56vfSmagx/WCDACS4JUJ7eWrfRqsarYvjt6Kklekqlk8DyD3+sICvg
zRk4TXT0SJEaqvG2XBokYn4V0rTFi+MD5sw4gq3VeEjJFvuaUMiIbdVveAHWt4fChLL+WP8AHPRX
Cp2+p+0ZzQTsD3NO/YnIXsINiLqfdmk+em0/GIE9zEwqRu/D65LJGxP0dYmIeMMGTORd1dsevdNK
vLzTyh2TPb+0lUnUO7mZv1FNd4gzmurycsgFpJP0sTaGkx9i7qm8IXf3nqLLGtE83QYjaZwFBsUI
3ia0+I+hi2NDdPUz+pjZ0SsA+acRBd4mBw+fFwn9+IceYamBr36fOgYIB3xTCjZTWPhuQHry/mik
7zXBacu3qJpy0ohs5BauxCrMK9d6zpzPgjWk+Pxy/QhlybCFfMhPGX6+n/rLvg53ChDWO9UPe5Ea
wLgKZJ2gR1/BcgPOleucTW+28rqQhtyPtv8DQ3jSxp5iTN0NPpX63OL4WKA44kGYU8PzCMjn8F9t
IkwtTw+fjEcoNoDXbYWX3R8En0mz/C6n4tbn4M2oBGZQcZ+4b42Z37PJhJ8D+Xb/XNj9oCM6e9cc
Le+AcefWdaBI+pAMpjonVDS0Zdx7U+rbx7E0DxaSVpk9UEysQDJYJ/c56DvQMcI4OQQd8XxIljUx
IIfpzY+vndgjNQymBc7gY24vgfYqjoUYh33O7bUy1V5OKWjSzoKG2/Qy/cjmbrVinxMvGWFpqH9n
aOmKpF3vd3W2L9YwWLdyeFQTNKT3lMfFHFQvnJsRIxMeNm5sHYF0bhaLkvE0/qFrVIUOM1lq5Yf6
JdJAN5I6OG+Efx9429efD6lS0cJg1qAdDm+8d99IsKgzgPNuPQtomDxlhWl7+FDV1nRPNrGEST6P
PcVIMNZgqBIJchWSWcaDnWyLoLXj8R27B3JuH3g/GzxWY2ywKmuXb3dmAp3M1Cy4ONcaAhsNzene
2OdHLEyufcU9WEBIgsIYJumQehTbC51tevVQ/LN54pPNGRn7VAHLP8faB10vnSv39ao4YB9GNE59
TANBEYvFhZz0K+bXfJ/eUh+s2BVC6A1mw1JcyvhO9C1f76gSCTAs7SNWJjUXXutcSuZLnZABYtLM
XLbLr0H/f0dYMdla7pFnv7vUhgpmdBpxxbrnv40hJlfutw05IXmBB+5bT5lEivluOAl2DRCGmAe0
mNRk9Lq6rsPCHoiNSTJmw0yKrlnuUoam7438UDJm1nVzXV/mwqdIndHIT7XVsPwbJgAfG/hjCS76
MysEUX2OPjqe5xJrqM3SGfAyTdDGizEQ6J02YjxW7vOrn/1k5TVMILa5Grj1D89p6ytn56C2Fszu
G1O9IAT33Swk/OdLgp/aNbPwvQFJ4v1YB+7V9jigAQuoz2a08LuXO0wywYYQCy6tTIHxVDeBIAFL
JqinGSJaRgBCcxsOywzxCRgO/ZdEjlTQp9/VEs1gdwlO/11k/4x2zYF1Bkx8PICY1eCYXiy6sCK/
TT7Nssvzb2J+ImjWpbJYXa5/bUYDzXda9qwvk0JYbzNOsPmk+SStkdA5LgMfcCgvyPCTe/W4Km/G
HPTsXLLrEHZ1TzADLsJK2Jo2CQK2df3hKVlgwE36dFJ0X2Rou3uZX3xTy9VEu9ygvI5FPIk3gjD1
QnG+Q5apYHY+GJ9AfgQIMr/Dsa6pNqX8Gpc1b7ulO9tdJ7w4fjovZm3BthkqpGsPmuG1HA1Z6uOO
WCsonCZv//Nh7tzkngeQ9flME/jGabn2RmOv8j7Lcfy/y6DI7rxBtEkDamUBTiEnjnJmqnkg3oVF
wBKLspKy18EMWzs9QJlECJdoYrquN7N0NrjayjNn/U3803kOMNsnosTZ6zuDXZgEqSUv8otunFRp
S9xOp1sRfRmwuYTK+5qUgZ7V6ie0RhXfl49sh9NGT5La9fVqtYP3OC3/OF+wrNwKMeKSF7CzdhHY
uD9tXi0bLL2tbQf+dN2J12WvhyuiBKCeny/mUpBNMns8Oi/QDzdplvR4xh2f/Cnc47HrrTQ/c9bm
5BHkic88mMcYj76dsDUl3v3Y64QYV5NNoo6SiQpax3n2JsW3mxAhOnpcHJSjMIrJ3Nc4oqX2spPI
zKhcVUKrHGr3KVg1ZNeNvlKun0hoGtdnMud7ccEgJoAdHWvznyA9sNijfe1FRV8MQ7n07TzyvOMW
yecnp4lDqaVWrZ5cLocVQvWaUJiu90a/PlsCzLbvv3mWGObqBLhFXeB9lMap+fF6wuypFRSxYS8S
zGJ5xV8A97W/hqzR8cbgWyrmHLShjhgDhF0oP7CNdcqzouvBo7dXJRngLF55HHdbuP7fmsWlG6FS
DcNL7PR2UD4Tf6ouFXb3ZxDA/C1LN2jLoAirxCTzm+yug+beLG7AqI+KCmJn62LLAACkk9PAfTuu
MgFoaeDWJw7i0L9NQWRN9kjz1q5pb6XQAN+w7uMxq8RYv8sCSd1r3KCxuYDdmpcigebO11c5AlTu
ISS5Hx2P1hg5bnjkn9xnNoZWDs+yYfVVR+SWmVmApYu38Imb8sKgR/Qy8lZsVP2m3dJefrlV/1lU
yRf/U7OyORoJYVYGlBwt3+3BhOAXs6d20GCC/CoGE0zTvHgomrPYdH2daC0S1Dt0bWw+owQhx8iB
gyN+LnBc/Q/YXN8s90P9VOAvSc8Bp/p9RHrgj14bUwUtpxKRVwZf4a7/5pWxsOrKTN/Ws8KSfbR8
at2JMon/H2HliEF75LXSWqOfFov+8xftXdpF1UQ3ujU+GdC+lBAeIifpAGyuiZnOJUV2kSi7FWkQ
P63ewKyA9y7Vbak9yofKcYUUS4Fp//o84AU6JW0RPtzNAdF+K/WZafMC244kMfh6ynaSPkZ5C9Vb
ec5vkr4BC7dxs8yBH677mR3vFE4jlD8AW2mqF7Ge7ZqUjLdUW4zS2pzinps4rxJIniGrXgGCaPbG
6hO/xHY9OxLQNZzUhXGWq12xy3tnPav04JPeDAeIQZDjFXz1sG4WPXhl9aPoJnnL0CKNwU34t8GH
0E9deiqit65cdBpSjtsvGhngkfImcCrW34YTu8oOf3AOcv2ypdnUxCMwBuX+GwBIyd56vRqlkw3Y
bpP+ZyKuX5OUACw+t2rcfLg6W9+lmcv+o6VjNmFWSVHlC+q8Q7eYkZ1xmjZmNC6h4sAL9nYYW/Qx
l/aDXc+rMeyw4HRX9R7xjuL7Uj63vYR7iTjzvbGmvhwUWCzqGGI17ZOIGeAIt0tRGJFGu4A8B7Cn
uZMlKvE4yN2O58e/Yd7KhG9FWqX+1vplSiN71zigajBOoiPRt9vsMHRxewGtLebZ21CR99JAekeT
xi292h/se152vBQpJu1eQbLqOHD4gEnHHKWOiw8PeDf6eHAIkSj/AqqtxmAqFdAaLNjtZDbNVsj+
fJxYe2Lr7GXTtXhYKC3RXYTB5ejb4mUzBWD5TBU6hZ9Sv1gNTfjHZdxmHYEcGRe1dQ3aaSYW/g0F
scVwgpl0jl+Qh+uq0doZU6Ur3N4iLwgGOYbH0k0p4hCPREpxabiSQlrZASEU6VrZZuy099W7QsoA
KbVLi4mM1nhovKXjzRM6DMViMybx8n+Q3TvFx+QwT4+XLTZzH+1KetT5GOZFpYRx/G5RdruRbvqn
EI8JVz+20rZ96754YU6IRSEuFiUvBDbJulLihmf7zD4UL5gYSm3ARRhmE/nEFLqk1ua0NdxusZed
z5f2ak6xMVUsG7zYgmpb1zsXioB2vqOooN+sRRSJcvhCvpCSpiPKEWxIjZ3QxWeRVxdFv5vpDoku
kNYlMAY6I+Vt+wEC+0Lna6ooHC+NzMWbwAI3Ra5wx+AGWB7ZUmsuEV7sxWWjDxKUmudpf41okdil
WsNJrTBEKz041FGtu8M4fhg8PME+gyqV3vhhLgyOydhofUZILtRphceyagTJ4shJs2cj7ktx8Z+r
eU8KjOs2v2Y/NgzfC+hiUI6S1aoQDYsl8oLW7h+14XWCUzNAabsUpMLiv/C8E2OIzSv5eeC6SHxN
dmsR2Rj2cvMrHzm/KKYzwEkSGIOLvCpIsjF+m4uXBTUn2UPLhJX3b+piNiJI2NQAus2co8l1byTB
w8rwitjtnlHQoI9tgfhugib6VtwS9OG+xo6Uz30pNeedABHaS29/pLm3MOziBKvKbuhmW7svLSuf
lZl/npK+oA8zILi+DvruuBE693yr4/+LyoVGRstfGxDlXWO9QNOmA4fVoxrx+BuyxXNbbpg0Qo4V
OY6XuUf81jefT5S6Fdfju9fiM5eZPWeeKcXmL0ceAMWP3S7+L8MfDcT5ykRU/ZiqdQoE4Wyxvxus
CDVumZ1clmG6oD/1nDFaHPDCIiys2HdMW4AWGjg0w3VG04gv7hbEB3JZt87DrFt/xa3y9oKVszAg
VRO8D9BHuSh6m3M0VdS0tVSgm/PduQgaBqEbfAXYd5N652K8XPzReY0M+w6SW9lWDKyBovwKbTkp
QeiO84UpwYEwnOoSbwJtssGsU1JiSzKw9OVv2TWIMFqoFd/mX8GKAZwFwn09/QUk1RcOBYYGNufL
64G9llDF311mxiTxf88pjHzW8mjgR9Gb+xFMv+Uw+sF/JFQVbs95rHwv2nb9uKsVRQwMdOXKF1/G
fVZ/GKyFSswiMrFG90npix6RUMRRuua0986T4OGDBQXr0HerCD/qVlr6xliPvvCjd4t3hunxjuLn
V4fV4uFC0DIpgK8+tKLQ4YAt7ZGNswnHBv1vZAj68dgQgFGYtXjrOFQvgZRY77ltWp5RKGus9c2+
LR88q3rIr3dALM37VS5T3ifxQNU+bag5kRKawA2qzix2n+/vPpyU5o0sMv7MTjVvIUCF5nF7KA1Q
TZrcb1PW89lXJTX6GuNCTcbYzHC4P5X9seemMu9zg1sjoRk/yeL3GtKMNDkw0KBlQ7NICmSKKtRY
I+LBDKgMqMtoD/vk6QlqnPU14hRlRevgeC+jvkxNXY+9tOmbU2LHuG1w8vb6B05XTLYKi5SzCMEn
RWhvi+BxUq0q48RuP/i5ce+XBfIoQKC/3kFmJOT7Q1W/QsIw3Zb5PEaiYxLohnjCCIXEonb1azUc
fL5Kw/UygwP68rPC7forKyswYKkV7zPwa7FVAngiESpUluxpabdCEDXbQXAM96WLqBktm8Emu59/
o08pL26Yb4Z4UCBw4lB1+2QWmcPefRb5yjFlfUqvqL6w2QhH080c0bjRDrkAE7yLuPuXU/YDqdPI
/MWxiDMV41ioDfuPVk+zmJyDEdku05jjegF1a22pDIGAfOM0lqhYpBADsUJhj9JAYe1D+ZA82Uzw
Q10GSub7XAICQqpAK4aAU07/U8PCmCWszGyBTpCsDU7tgsaoSdAeWyuZPvAJBldWdfqoV42CR7mg
F1C7mK3BvZdKIYUmIVjNKNjR+0XDrxtd9EILTk/F0UGYYzu53BLvkfUl3QnAMlZxcB1RR33mRuwC
aEAwwgF8Zqqpr2w8fI5w0Mio2s7FFe8X6a64fkf2qpPfoQQL3cdmisQMoPzu9E1KWiPCEPTlzumf
Bqj7+F1qStMeehe926OusyemJUb+or954t7ijXSvNbqZIGkveuikpt5RsjEr1L3DeXbzF5wN67pL
Yyx6rYELri/u9Z6Z3wdBe/TSA/l/xw5/1qJrRQibtXjpgc4S6aOBiOMhmi5Xf5PSQcDUNpd1YXrc
mMDN3s4f4kbH/lBBp3wnk0luKe9KAe7HmLFD1na3tHW1Doe/i0WN/3qMOkeFO2o1ZzviUyBHWPXd
MkvW1gD0dvWQ8WF26s2l6eiXqK64BVzEthFhDufz6QBub3IWUsf1FsF4r7zgjjHMyVOIgtdKVD0a
LzgDHEADoO1MyuH8nOku5j6SKss/PtfM3iMzgtJBUMvgqscSnOhmiGWqRhkeBXoBywTeS3rDCAIB
wNuLvJA1wkt5fFbPNvcL0gdH73b9RE2JeYmVw6zfYefmKyEQix9Fji6fWLjnPUpe+5xciFqnWbw/
Wkpg7Ukl9Mo9VpwWLuXYleQCrUFXqcA9GtWKRbQZ7c2EAYWucstLc2HbBfWfrWT4fz9rCXrpjc6l
/d3MAZUVcn3NprUAnVWo9XgAWf02TJjUM0uRK5MOVCFpGQOvLphnpkrDvAZ95V+rjQx9Y1RSAuB6
gZduZogdCRkUYl+cGL3g9oPYkAYoDBSM4cWzvDtBpTYynGu5OQTxGGWTK6ib5YV3i7u1qbZ5868P
uwnf/vU37LdMa5kVjh1yYHVyXl7EVCxL2kQ4gSDfYN9jxQs2vK3HOjLWpqj4OF16UTJyXAvj9O3v
mEMtYApYKh7Ep34xNTIvXkOCxbZNCW6Jc4uaMNSLzWfT+2m+HPjE91wRZdJstlkF9CWgzLkUmXv8
oaLk1SwH6qk6mztOSRS/eBpxK5HZfJruBUof8hjG43OZLzurwBty9RA9VjCJpG1wnY+jSHiKpu/7
SZ83Cw8gJPYPM1JLAYLMnx6jPGrhkcKojkivEgSyqqyu0aRrfxIAjnwM2dUd8alG1LNzyMQoVlni
//b7Gud9c0nKmZrFRJpjuMv5sYHy031HgY3EjO+M0rdoM2uGB64kWYIvJoMKJ/Sksbezg2+XD0wU
hq6AmfzHZ3pxiIrgLTVUr/XFRoBmAVILNSAFSF4ttXQyolJgXrJ1eer8GzGcfk+OnvkmTPM9vJfQ
aoCbe0SaVdgVAn7mWbWG4U7bN9flSCGjTetgbxdURWZ2XfEyyA0pD2NTULi6ae1dzTxHVLGM1aKn
nb0k+f0014OX+pCdP4VYNnQDxAXS+Nup7xaNlqlVZWOgkOIP8h1r0/FwcLsweRwDimRlwB4mcpfg
AQp3b8LbDb7KFCWEqcl45SAaEgSjbplsxyne6x8aqI4w7gFDPFt/FTui9ijgfda6uujdMPL3BMWb
x/ppSu4MKPhmcym+fAnOWfoep7rQ+Erk684W+3Lqe6sOvhMA3OqA8ngmAkK699w+WxuyokG+Aoe8
vXExpl5rnHWbI+DQBHgJ9wXcCrSBuMDit9QrfCk3w7Yvoi/FAeTN8BjLGLn7JVMJ7/+Ez+n1GIvy
OzQza0Y6fbZ3UE/urgnGNf8I248okVTNwy1VvPiiBMDP19q3r9JYe52rAIHNK2397qUpooRbOYS9
wGeD6P1hGYxWY4n8bxHavDad7jP43WmXgC+2RojBIF5SQ7Kh9hH0k5MHKbCu4fYyeWW+w2CrHPkC
hI4JgEuNjUFGIItn2W1ZwXO6lUiW+IIjOell5/X5lTkOnzaHEEjRhgxeElFOgVUQkZPIY7LiI5em
Iyqs6gMIOtl4XY1bnEAWf2yxsth5Ay8PIGasnqWAY3qhcxMSVh7W/mcCDYQbDYGj5vnfuxeTYtJc
uimuKe0GXbyN/5n3dZMaTxyShZCbJNootKNCADTfsRz98gp6mDKAliwfBMMNxZ49QVFGbp+j2vLw
0IV/ptbY9QuS5aluIigCBZ7v6yLsOfcWZNehKJtZ/oRuFpNH3+0EwhnJ94LRlK/w1a4Tu7hH98uO
xtie8Q+ZDlCBnX3qUVnavZ5I2l8gQdOLRM1iGPV6EjIvd/G4QOd+U5J6VKi9NG7ipPPFDtdURo3Q
aHO1sArPxDq88YqcSjr95QRFlPWbpCBMmxIcGR9CyDWAvhx6ZdVx+9flQZvijtAy56k58x63GVye
q42HseY19FYzWi7frARh45JliCyscHEY57j6mhlUZGU9YHuXnXVKXaVss3e/IijUMIDWVzK2bZll
9wY4FoHEwOESDvEE6XnVWXs6+EyASbZaXTaPAdhBPEoccobXgS5e4E1IP09NyDkI0iiUGQQt9Hft
uVq8ntl8/4VNNAOT9sXp/FVRsI4cMdRsS6NwL0nYOo0XAh0OfbZiYB0POwSKsGHdpL51FJnVeURo
kxeAGu8rhjKXmoQaYNxXYz7EWee241ndMCCkQ4GPbzIwQNybArQoZPy2kKVPFhYKCY3Ch/0zfgbr
KdIgJDFnmjmhM8uG67JrT3Pl8HKQKVOhDXrWshb6ejjJLjndI+eD0/BjhaxcOg42hJkz+wwTKXbK
k6bxnYMIq3YSy0tlv0P3RoWccdvFSUitdKoBR0TO1V3gS6uX8lwz4aFfQ8VHHyze22VQ+eP+r2em
JtSBCX0B8/biayrfZXxmbppEmA1aq4lgshsTyHRMSmNmmZoMxVgx2iGV8VIdFdvyUJxQmdullDHm
T8+B3mtMdPCjRCxueglaaUetHNj5dBVsdttjvbzM9xNxsaYDh9bCkOsJYTCguR7bND0tHDM9e9kG
eS+rUf/unvThOB0cHsRf6GICNwExml+rIn2B+RC/S7fMRXmFo3Pj1XZo9OU+WW1z+GK4rpHLMG6N
qve7SZVnPLLNV5lsxQ9XuDtaYbbGq/8LCWzlLsfnN1ZJl6/W7nZtjBbH76r/d2AMDLpgJWM6hkeq
itO9XM3Txdi/VgL3sylT3WzJm9SE35SUtoT5D6sL7uCcF5qXoaNBTrVna66MZQGF1+vaNn3GxKWe
U7kYRTbpAu43J9ldkoDbZbfAWpJfFeD56yWb1fm4NRXD7yHxqCFugUie0u1qkiYzQfVtQoosjkGp
QTJOBVpe0qlC8pZ15uGNHQNASJz0eAQiqgGjfInWhVVwTrILTmSEv66SToFgC4jZhGevDNIXif8C
L5RTtnMAptmrIvBwgMWyYFHuvwkk4zKqSGZx7g+Org/oIqxX4nxVi0l9hnzcvHCU5OxGNYIpxAlP
sA5NamsM4e5i0RqUyE2ppQPtUVpTT0gLy4a3B2q65e4+IgD1e6W54r0di9etqbxEQGZr+dzjnPC7
HFq2pBHR6eh0orA72iUEdAIXMFhGsdY/m9nfp4ueHC2/42nvKRr794icLgTIE3ugDrBwlO1WOoHa
xKxg8mnIL6OL5BnTiBTKChaLudlnPOelSVYcfrWG4jhqBsJwC/EwoSrr9MXGLnaLObhPJFHbCWII
qrRSFjGelo7ZTHi0k396wxlky4eGgzRWaV4aWKNK94kWQPmpppialh8oCImvIRiD/IBDQF0HROQP
bWBRxfx0dDTNG04/fxRrJ6oChgfyfgelGbw8C8hEcYwuZuirXwtIt9x/oKTCAbLF9LwNXFcVbsWR
eN+BMzgZaYUwGKQlyqTL70bQ8EnFpZ/xiv1wEf4n/QGu8NwnehZEivvzkoF/rfja5zNabf1TDcy5
zSKaSgpQ+STUHTXm/GCKmTYjpSuYpZvt3KYFBz7A382N7fhIST1AK7ZeUBj3MipXP1N5kh06UZ7w
H2EoTugjXhbN70K2AVjMIuAOnB6IfVxlw10l2A/mnq8vnGUIE7tAEPpnhp9/eC3xvRKmzh7PPpET
rePJhX4qYrukzJxq68nBzQMLb9aZezjbRGkDN+Zj6YLIYzEF/TRCNI49vG//dwkgJ80hy2kaq/15
fqquH5uAMCR45LkOSUJR9X/vnpijMSBDHBXg7bZ4rl91p9qsjzeg/mpXLaHn69LTEosY7Wn3DLZx
+KyjQBtvShB0ylgh7W/zfzt3KPL0c+YkGgBqNzp9tynrtp1ndAshEu0eQFhia+FC8gA4WrWDXGHy
0fL81Ifc41lPV0OpOXvkxU0ZuRe1AqbSXKIju6YmFmTGtCszf36E8G0oT6zQTl4Nz7SQqPoIIuNF
NFuVnvpyJIavSEd45u4tkhAX+b9IE/azeo57qNawyhVWMx2YoPTIi5hwHaYvRp+ZPrqY28J/7kX2
ZNEGA/tAX6Vk6BwDcFYm0iLR9B32xdrjLHeIPuZR7rreedK4Sqarw9Nvo8k4VjBIXzuFZcFoUid2
G6TObHINbm44YewFzWGmKYrfS9ktNMRg0TlL5tc0Fg8n1nJjXoNRsEhoPteTXXXWCVD1gVyKygMJ
O/hOxffi/FlAt5Fr+UnHDCJ3QRmgh0tjbuFxyUAfxlty6XiyhEjwdMs8t4fGcj/hLEupAq2/yhRE
WCVjGzvhDE2atOOfp5Bmsl+NB128SSy8zrj/nQRcmtJ2sQC9f8EtoqmIpSJwSJQzyLiTeQb/YlbM
FZ4SfDzZo+SnWLDseAW7cUPgGfBAFUbEhj8qujf2XM9Slbbg2c9oe/I7vFXlGyUao0pp6zkSlxkR
nOs5H9S1utoz2QwGXJyxjfRf8W9WsLoPLfflT2MtouaSY6qCkgx6zITSdZkoYFIBuNTM+3rHSY5x
4B0J8v7rhJrOGwZwA4hNxjLDLySEJFFBUbxAHLet8BURfhYCmBtZ+LNMiXnvNYGeDAGASiZXzQ6z
UVE0VGK5ESyW38mABjTfYB2sxnJ9qSaF+GcAxBntehl/UQ4KH7+GS0auLUfXNH2tUgx4Pwc6avWZ
lZD5j4UsUDe6klrwMOnTMIg2E0t09r9Rme+dZKt7DKhAIWBjzvsTQzViVM7QN30UxDU6vzJhmA3O
NTWiVKcZSf4GM2vyive9dNErwZQyRKY+hfs7ruq4PU9EUxx2F2Dlw14J2i5smvkhSWCbRq+6Q0kg
UYeW4nNvC5apTzADUXBk7LC0iL4vTeOi3i0WpXdO2BIkS01Fn1ZOBTTyRn0GkbRjn5QalrTRGEZD
mZN8DEBsI/gPoR6fKTcx7K0XTByFqARWqDDktR+4IF3pDYTMejlzdAMY+5kLa3NsmVzMZvkjnd77
0d7x2t28BSGh48AtpUPj83pNFcg6CUuPkrHtFBEvQUhVSFHxWOjPB4xAuZFudgaN0E7ZythrQExZ
Bns1yt5f+QsPwKVGQOrnhM0TTC3dYnGZUy97SZtppHZ8lu8FxizXUVzt0Xk8+w7Pt8AgifDLw4kg
pr8/LZFIMVGYuac4B8N3XX4t0u/ftNnsxVvHPZm2ruj6N08WfpmU8yCNjDygseujIeMdop6aRiQq
+Z//b9b798YI6B77yTKEN2dBXXCHd2RjjkRN3YiGFVrNivBl7TLABX9IojFDQhlxIWIVeQY+IVwo
DXtpayiWVwduvAMe3U1XL9h5swwOUwEpwkpor8UUQlTxbMg1NuMLwE3xrn3zjyW9e7l+nd7yERkN
1c35afgGnVYsAguATh2WXzvm8GuyOpG+gjdk3vYiQ5E3qJV7SH4TKhKY8ev+yf/bU8WV8tvFSRY6
/DGiVb7j+a63eipoKmvFcoK02A8DBhXTEF15jUWBqbVMDAyYlVBLcVR1E1EdbET9jnMbyirvxP5u
Gq3sGynupCqvY8CK//7O/GAMNB7r+v3KTHzMaefrv/+/3QVwp+5RXuLFII84iy0wvC0x42w/x+N/
VzBQ1mggfgREQVlIr1y5LbeqlZGeuKmvvTrAKeaHxhTL21uNSAFuEpay1+qnzwI0oWIPk3qiTAwB
AX/0KmKy7TixkRP/wzrYcsDdi2aCi/n5+sYWFtb8TcZ1tmL36tA0SoWkZ098YiUGWZa6el7PeOLi
UkNevoctvliEZE9OOnzS7N8jYgZFMd5qiYsn/+VkETF/2wwu/5d/7aI/35l+mtXwu1V19PcOe4PK
WgIKBFIk6l7wzJ5AsxDpc9qf7uqYXEiTvHgUjKpg3+2eV5/aLpvMc2w3TKwddEZiD9GBGps+JIIn
tMIYIicsVI2T4ZJY7ikIjmOf+OnndthvhbDbaDVqvPAqGYOqeaymRWmcj80B8Z4IsrI8vCVTxPj0
vaGK6kmjSqBTF5o7Xp3vrs5FvcewhN4apzdlZvMo+RH43dkKNzP1/HMMlOgICLDe7ovBifVxMfV8
GyOEGFMayBXCXjGZ/Og0X1mSjBHWcdHBHEBGy6GgqrzLGhWqRSdXy0lKU+JMH/vSoCq18UfHRsNA
uMSo2QWmhv0deu0OYnivodZ5sWNPTuSfCS4qm6VbFbHrwlxiCZriNEGwPUTgKBg+IzBQuDkcVUDu
mgmXlc26BFg4YvL275W9BsWCCTWA78uaho0Xu3PEgY5b4oiEKeh1av2TalR5KXOVhwmUQVGH4UEG
pCeFB4mUOLVeRBKqnYUJH6xnW3ZAzp/Iy6Gjwiy1TReknhNuh28rf6FYUBksFLxWUzfHSjvmF+iv
AE99/D+fo2Au4Hpp1JKv5QJMjxQRu1Z2e75aFlVzJmLrmo1UIUFFxdQuTicAxGWC1c9fnzjDbGfZ
6K9gx+r6PbCxX8jlngJ8eSda2zGH2Vp2JD2C5khEJgB1pyYB8E/JTgi7muLtxDjhkNSAyww/mYTx
1OdJPqYIbQZ3m7VFwD5/kcN1WBXLJB/9KAWa7ZJ3PVh25AXkmbbMFFRtbrRJePqPtX8rxr6tmmUB
flf1EEYfWB195VOuyEQkOIqK5RLzJeqko+tJ1effQ9uSDO9SMozpZ8BMvXIZibtMMkW+dwn+gI1I
MXVEQC7fulLaLPSMkTiq9/CsEFBeQHtvIrSj9yU9vtwXveDDlHleRFOC6KTIcje2l1zIDQhI0cqh
GAnvVlscaHi8ThD8neTvQiQ7v0QUyUUYTitWIh7OGmdEzmwZTdMp020K5OZlNUlSzG2DWOAfC6rR
uO2boCqQcgozPCUp/jAhAHIboIGNKzJRtvBus8PogbKo6+1sEJNbJxfz76w5WAZc/Oh+YmYTf1ox
lW5zaLO23QnC98JZ/i3l9ZnDnrtaFYIkgMqI4fZ/Jc+oMujuglmoq7XxS9pXgQkF6sncC62T3v62
fLgNoqC11C8qYzeTfPkmH/kUyoUUS3k+eznzALZ/VVth8Y0zUpeQG78MbrIaqo4cq7dp9SjHuPFx
8VTS4m91lLZGItBXXZI9+wkABx4X4q6N2PW9kydqhMpl9Wo0nEloXylRMVTHoRvjos1tL/5w/TM9
dK1MD5kf3ZAXHZiAK+3p9TVNKgUdEwD2IG0UBBPfvERk6ttoEQTxTw0en2U4zsxiB7WqhBSw2qGq
S40xRt7BQVpHfKI8kvcDsdq5L/6bKZ0ncfnm+xG8JM5SLRMnm/sUlhJNG4oWMKGvVr0ngcrr+gLL
mg50DmuuUfN8elsuxSEJ8Zo+j9ARz8UnR2LaElWWD1Qj9O7CIno7GtB/kH3ytBpWvTTdEMLB8KpB
OBD8z2nMfP/DxFIa2j35G3u8aU9mJikVwqpnaJ985D4MLWamFppksjjWzlEKAu3Z3QPWz/h4BoCx
xelSL9NeZiaLDcA39a2mIfcHq41eLD3u89aRHGM/MlTgWEsW5Iu8/hlaoinKayE6HtANXqWX2AeU
52zQRluB2QrpgTPn7KtBXt0WsraR2hMAZz/j+Xkw9JaCVIpSFtzM4Uf9nRxKHw3kx34/Ps2Atywz
39iB/PyqRtGeU+wH1FxW6ICQ6YiMxTSc+Q4KZwwqNEXuD/Qf/sCMi0oFQZu6DzjqrfgWXjaMUONt
kRv2xI4vV/5QTdP3iWLk8KnbCabNhkwM9NHisYhbcgN62xR9NJMKLgsKO4naM4HbzaWftaj3OJUj
0H+HtlT4pj8YsVMqD51RYp4rWLSew1Ci+bN/vG9DAxyi4BsciujCH1uMQ5frwr8CNzspI5SMieF7
od/PcRiWaZi5AWKdK3OKYO+4ia8wr8X5nbpGx4ZK+am/S6hlG/M2eV5i3luGSTdgDjeHmC0kc/AK
vpsEiwHikuVdXExaJkrZYDFpNP0hYP3TJPJZZhuPyGGRokbvK5hTa5OMnItJgUlTHaeqc7GGwRfo
tQuKpVuTUbk8vrEbnNNkpXuBgBP7iyzYJGRWhPBWWSNc0VTwab3jxO/H/f8sQxViUgcsyPGlxNqc
z6DUFDkQNvcF89VLmpd2k9HVEZaOC1zwP1zSZ5jJx2EqdgfouPOeGPcfC3OjCulScptUFACDp72x
nJ5BWkgadLWdPa+gav6n01wf5zfqdkxbixnHBGp756IndwbJfpDm2nMIoDfmby8bdpPiozzFi2VP
P7/F6o0B6y1aW25QNQytoVGCRz2f7/cndgahJt8wAF2lNzIVnJPQyqxeDe+1uUQVkTle+aDBleUf
yd9535KrBJDESGA06kqBr3UlwF+YXBvogFHBg3OJlX9/VIFN6hTxSi1uuLwPc+2LTs92Ni1zgY3G
p4Rk9Ghqm034txFA4VL3JEhHCpdYRLGB3lYHp7yXDqcLcT9vzc7Twnh2HNb4LgUWnztp7o++aEj8
cy5wbmfVagpHxTlbMzShA0KfO9Rr89IjgPEUf4QuqovYVs1fafaPt3c10whf9dcTkMzf279/9w7v
xCsjpa65KVzdzSOFjO2ufL0Y+/a4NHWudgJtxyBw3ejH2admS3pU5sZZ9Qq2IeReCEG8Y+d56n30
ua3EpM7HAnvTb8Ft/+y4aB72Z7KBZGhUqMIAvoSoXh+2jcqwXv9qCrePtp9xhATWPqf0PMnoUZNQ
ZBN4cvCjcIobakQvAcv7TCnVjvRcBnbaEwAsNy5fTy1fVlcF7lS7SGpB4DN7utH+dI/M6ujd26Q7
gUKJwVVTY1OIblPd63qdEHus+dzNyz8aICwmdTmxC0A0EkU9BMkYg9BDsXj+nBXaj42hpkRnnK1c
chfOb22gSPW8N05rsOgMJ9QrRYxxkw2vB3PcGA4wXzW1WActmZvjDSdbk6XHaFGA6vnm1lbu9RrC
WnM5S5sVPdK7fwzUTBy+TauPjIWY+H0bNohjTI8l6XXhS48WAyQmvM2QssFNoym+u3J6IzNFrouU
ogubUPHsKN66VkKarzUDtN0DskTPSpbgaE5k/eyvD7d4NE9FUkcdXhGRgtLKQ2M3S8fuuS87H0sA
sP9n44HITrCmAjIGVCODiDTXptjzJCnXBwwP85oPb9SzohV6ecqTuuFBOKnCd2z1aCkBFc+7VYY6
pkUvUUMne8lq7X1QKU14PBqrUrGFq2kJ79WZkkx5OgtmA2eCdVZSrAZx8yN+rOk4x9Wk647he4/K
zf0px3yB3WuxPZaHe+uwn4OXSM3Lt4ThnlC78KBLAY4gaFl9tJ1szjqPUaj8kcSqljq1Ga6cAV04
KqtqXuYocx1jXKC1U8x/xVKtwLh1ElxoW1BKWqzFVOtyQMubBvfdWqGe8BHWhX234+fKXDuY8jun
eBuai8ALqXIAUkdqBWLdkNrdjbulqD1ZzAXTkZwk+l6AwG8mSEPZ/xWAZ6zAeD4zJTTfcbeMjANC
mqSIUQkI1euWGJF32ll5eYv+WOHuHGuLTARx+OJKj76DyUA1WHWdGfDomGdMU/ChVUFPKLJQXTJN
s/Z1A+FlN1oDVi7VIrfunwZkRNBCJ+0YsQSlVYxELUryA4N6MslFAxtLtEsOE5IR1/7WggF5G+sh
LxL+XkNTQ9okAzDSotvF0mhnUi0bzp1Npg4DvhBdjtj6TAWEXFXkQ0LW0kig80sauwwqD6CKbDQ7
xq3o8WCx8KjQjMURGYsTz6umGaEk/2Kzwn1BH7v80SCvC3IdTeCImJVAWnNsFjHiaYoYJgH6dMb9
2QQ36vhg3qgJQVJqWJZ9SsRS5HGYF/NbsdDorcxuAW4bmqC5D3+9rKHwvAiLErJMtT/hiHgpNS7R
z/dsIFdA8ztjls5OEOc/7qlIoC+OGM55zi1lK3v90I8GzdzZcXqN9V1h8oYy/Rl1kewEGTfOEEFq
o+C35zBpIBxezO65ESsLBo9VJN9iWhipon1wIvFbbw1krQhfL4e3GOrWvFwkbvcXZWvX58xZuKIP
tt0z+xe2VRj4TVGj1AyMFGhLvIyN+31+Olc4nBr2Cn3cj3vZRJNpD0J4pqxdLRpDW8kAo/AK4yl0
kxbp1jENXxeLR94+5h0ZrQrkSLc5y8mAjVRnGNiYus5YyDuCdQEbt3X9TJ1BYjLNlM5TX7NNef4R
XqNkP/raSsFQZcjTkWhXPOUI++9zYvXCTHBIHFOO7VsT71NuBO+w0cJBRe93ULDgSORofv07XS+6
4zW9s3S6NmPsgUQQwOZWOV9GZypLN23V7v6r1b4PuJqWbBC3/PmWyLkRWjbQBVuS43CoPcMjkJnh
nOP0T/zqNcdgPs92a414glZWBVxiUmqzAUP1VPzpTTa9A9vkiIYxLffT/r98sv9MatloYR/3ZVyT
f+jnUulaouK0oiA4zZFwjIkPFaRTYNjJoqtHt64NNc8m2BANIRJJFmsBNncrAipgcdRW2trxzvZb
/MD85EpUw/uDxhSB7ERFW1tXLVmNcXQHh8ND5c+N2bUVL8FCG3zvHSf8vuEXn+thoA6OliXEp17f
R6m3afbvwxcF+OQ0h24XlJ0FqMHI6MnoMCKh97vdw8Pe8JnBf/G6PzgZNEDHC6Z3szxJ7vyBbeKS
5/OtELmLJP90MivxudRXF2Iyr6KouDfLwP6uZMqUTO5qutau6HL0HvkqZoztsK8xzIoK1V8M+2yl
ke2tg0T+RcL6TvZMD9QcA4QATmzto87+HJsfX2s1mDOpmwjk2E95BmgJ0ODyLBvDnw5s81gOSZlm
JT9fxcsyYkZFgfVHKYqhsdtxMiSv9JbDXGnG6Txd/dS1dts26c54wyhVMDnUE/vsM2sAUkbPuOX7
9MP55Oj4lZiaW/gX542+HpWNjkpVs9LZaBVW0BmePo4lgbMQC2YnsDGEq7P+Xl4+yrwz/hLu9cT+
TQesaTB7sqQnV3ZPwFJGoV+gmOejJfk0DSkIzAy4HY3ZPfhbaKAfpVR69YYF9LAD+1EeHbKrYiBS
2HVCVAS0oSacH++gR1bgQD1idjIZRhSZAqhsKzLKGl0kLkDygCEMFTBpuxOXQ7n/86n1HFz06xVi
Jrubr0NcCaQJ64dl3yIhoMd+Jb5In0vIwrhQesxV2Asrq63tcCVWJ/3FmCm67LpZfPLMX0X+sHU+
wP6CpJhRgJV7LDoptMU81PwdZZs/sis2FR2RkzjlbUDHOb4chLHnC9n+cnOHIReaEWo5mNpQbDst
HILtUFP818C4maeehOqFj3O4c1o2vqSrkttrnGo5P7OBFMU+tN9EqgDgk+Pv5caikEAlvdfwDPpn
FKmafzADKUsApj9Pima1pylf8jhjgy+NBmfC3szkusHoMFInjYcU1OBmQ23g7VJitWUoNikkR4Mk
feoKu5XuKcd6IJcDry/k7NxWTNbWS4VF+MBXSN3nk9WpP9sM1yJ38bXckP5x/KZ4zlzwIDxe9UqG
jCbbY3mUP/3oqnm1D+70VLJTIzE7BNwhnQcVFmjEth7jxXF8Tt8Pivwfx5G/L/W0XP52h7+nSmqk
NXGCAEGbthTVT40hArYYvaGT3V6tgrgvz5UlL6cT9xRhk51e8aeWBcE/yzucd9vqWRlfEWdiWOhc
0eRBdkOH81zs3IYQQ0SYhoNNzdbQf9345nPE/4rd/6tmr8rJ1TUBCAsE77JladK7nEN4KoQxPfQt
cb8k0Qo5vBp0c1IVQEsp4sBeNQgKERm4TSI85thr1AlelF4fvByB28WPz5iAfBXK0HetcThSz+lN
B818MAsJKyDUq9I8ySur0GHUTwIBaSX98kZ9IdKgTnA2/HVqmWB/NI92WUAXbrSrfji2mtP7dEuY
9dDPA/Z96r4jzvji3TeLFeKREZZgyHl9DBybpncLHfbXBklg6NEcVDcmxZz1dC3SatVPkkedDNs0
3zQKveKL9mmSOWAfR4IDEB4ZN1aWHWOn24yvICP/ZGE8G+3zjkXDyxPKeU1YNRgZmeO6y5/OIUKV
TCv8/xlxdVZfo4CA/rZyCSZ6Ykn2ZIiq08slTqDkmE6OLi4UrwF6IxLQ4/EFxP2fbSVhd3iyXo2M
SzHEnHcxnQgiqeDHECqB/StTgmQ5awf+liavAtalMIHy2sOzv9pXD/bVNR4eBpI6CB/JQHfjkd5F
2Eu5nzm7eD5tkaynbXFigM60nSE7YXuZYX1BHaKwBTk56kFmW6GToJnABndX/vjqKLi5LOiKCrB+
NUBHr1UgM/ES1U94MHQKxrsJj7YHWqgG8JFh/OSvZT8brLZHrj2QBQ0czqS/4B0aybe8P5PkIQeU
9z5jxg5iia78JKpFdy6x+G6WLATS/ukG/WT6yyxIPVkT135w6KA8vcM/rsJWziGZz55K5I/8ncGj
XIaBAtZTbiyKBpiZ+l07SgJsLLTnSnU88DkFD2fEeSLxnrVr5lAsvLnL1+kVPfbsfC1uLlZV40RZ
qKqmpGNXTCEMgEIms8zK4n82voleyNV9tBdYOhobB8/ueQSFjXCw5BUyWRpL9TZOhTykv581Z512
ai8dHZWFk2BIfB9vEmgI1G6z3Qa1gzZ0PtVUMOPqREkoPCOUO2BrCqYD8HnjnZt+VeBEd8tuHxol
jnrnCP9KSl9XfqMVZpovKVdElABQSKRfCeqKcrhWd+Rsteo/J5cLvnNuQm4m455K47oXqujPWjrq
Q7S0NxMERGGV8TrTnT0gno0FzjGgaMeJsuYaS2URS1+4VQo/376WRZEvTr5PXScM+LDXGi2DQ09g
vPN1bRyesD784k2f4vA5bYX3e4GoMWtOSMzytho+TuYOqsC4RpyJlniTGM3OWHnZ9y6Hsh8FtTgZ
mxLeW5VtXbuSgukk5yeyUGCh8Wz+iRD/n2V2s2ybuS3DdLF064AyL3hdh0cTw+IGyauHH64vq1jO
rnaH6JYAn6Hpa8sbBwlJXtaj9q15fUyErb0nI1cRSvN8rgmY8RCc5gu/tsUSPU/Al74by0IpbBl5
adO9FrKf+Nc61RaBiPNIHBzsKmkl9RYzpt0rx9MZKKvZJMngwib+I5vT8H03Lanu5rziJj3lk5nu
8nLIfAGTjWt7qP0ayeldrcVQhhw8pIAah4LNenuw04qLiFXhIrSZzCqgtQJlEjb+CGtaiXx3+8vL
xx3QHZ2+XZr0PGO9CvY86S2d+Fm8uOWFnOoelap1hSBTFS8kY18oQpqk0FOXHbiDkreTEWEd8Qv9
Msj+sKo107c/FJ36GXdBlCzaCttyhkpGGgNnns6aVFQ4GoXhJrBpWDnL2eMtNIgQ/TOBn3byKeBf
Sf8s8Dcxnyr0X6UoFvwOKaj9uiKxKR/vzbfjvH2XKJqlh1MkngbtN28uTwfCB3a71q7xzizSapUn
+q6r+Q18QQJ5afF4P7eu+op7E2ONjR+18KPRLk+Glv205GJ18qHwPJwRKqd7NFo/VBq2PZiwnsVZ
GdDExffHEHEwM0NtKmR9uhF+Cei+ieD3+XCtHil8r+N9GR7ASjO3ra+RZmkU1nmYSSqAb2YpCp+I
zhpgJ5n8zexGS6tkimjCPT+0KLXuEJxjT3cyMAZ6Jq9z99lZkuYpYaAo6lh3FF/ZyIaBcLu0PRNU
3viXbz8HpdjX/WTj1CxP2uB9Kr6XFD3yTFUYsY/hC6ySs0DHKDI/1Ya6TIHOfxy1FMtvSWRVP5j+
HwJwEL1bSXhIil/y/YGe5OKVEDW0OrUbiMNjAda6WY1BwyBDSDizk+hBtFTtWWOgj62JwkGBzhjH
wyidfTvgzDEwVYdhIObsXmnU9ybT4r/AmiU9dk6xQy2YUI5O07nNGq0z3A6C7Lfr8/kPmJGvBnr4
ogqxeFuMxbXqbsbeYu0WE8Xm+4+VfmSwTBsyH5Ci+yqH6hAVASWEqKVU3YFN4qPLcbCg5YYVNNyC
99CS6/VG+NFlI6vJPi11pT5GlGTavbyCbvV1p3mqKKTyc9PSgW13De1yUwrjps0u59/Vpo8twXNE
mej57pi/TUWw2zgx+9kYFzIdmhaSfgaHiF2pG+SXJjcffbG7Iitg1kZmRNqWDY6Ai2+rhmZftmUN
neHy6qZ0nQNdYlbsiYl8tWCjXboWasX1kfIe758HqsM78/GBbKBB9wwlQoX7aa49jySmd8UHRUf/
1njFP3tcZY8n7y3ac01D1y/7BZqkgPn11NbAabRzMDEplR1msg1p8GglgB68J4PLe/ekK/Admk81
Saxy8QR0xQweo+ichhgQ1x3O/q56cmiynoOrD7Zwya6KWQx96vWd9G5L25qmjV+h6GmwNUMH8neX
gJCBd69q29+ZKr/FgQbTO7KH96FiSbgpbjDWBfd8sl0zxku5GK6NbQJyKMHvydnfa/cAH0GqWJXM
KTFuRhBjeZkNEStz4JqJAOagXbKm9xc9bjCecU5m4C7EWG+DExsXExKxoKrpA9tTxNcdLqbBaIkt
4JjgbCiH7+fRBiAhIuDoGNwHg/R1ElUooDx9oEjzMNt7IlTTS0mChsoAnizmJKBvLHYK91GKpDyn
YezsqgQvEhLSwHYNUDhNnRo3jQLOUcgE6OLda2h0P0PtHCJr1kuF0i2zUFYQnRNFILl/jpIk13A9
6sjYxNaZJeAcvn92gR5bkMrtgZEQZGPcHWixyNKlzQVqbr0myozW5KhKo3paH+z7xa5i1Ygav1Vb
3nwIohbuvK0CewcmlG0cc2VHgliCvT+Y6DwzhdYH9NOlNF2HzDEf09oLQG/AQ5FgavPLik1SCPDo
QGd6QSZFijs028h0JDv1N6lEYj/R0b/fOkl2yPS1jG+AbxPCXp/EHeiyANCvbwOCPacpv6s9K8xu
zpZw3Pw1EQizEXgNMEGe6maBV1tiKBfzbmsby6NJYlbyhG51i0eN6sutTGGj/IqkKIiWTI9O+PQS
mW6+oIVlzN/NbJmXRPm/owl6Rz9QE8bVev6+cpIhKVP6+yEhLnncZ3BFSmw5NStt52w3q0Ki3Frb
kDlNMiWm3FM9igY9zxIPxZ976CvfBcdjOArj7tKPhCjRTOmTRbGMJWJUNBlApC2UMEEobr4ArTxz
oDXYk5AHvcYbMHJiZEPEqF33Ob5BKqu76E6GpkPtX/urTCBAWuWNfM+omgzPkAIG1PMETvnJ7xSf
gZBdpUvfsMIRUF8J3cMMEzubtH14cb6yFCk/9HhMBdMrbYjw/U/wJLmnTSyoNC6KACGTz9eJA8Sc
XP/bouLfP4C2TBB/l3AH81dofI498qzckztYRWLQ6jvnL5WknnVZJYX6BBmp5VhX3haG9lBWJ0Fz
aObpRQhoELsrQ64CvEiFFHYc3+R7hRubjjwftNyWhHbg39faxBaPtN3onL9FoOJt4TIfBya1+vhO
dvE5NGO0W1n6PG/n3ZrHQPGTl2+XrkSnsIz3LicaBJovnk184MEpRri8pyrh2RALJMtzIS1tIMh8
DRPvxhR8S+ahP3KaPBaU2z94fmFBBMOoCYKT3o+WTGNTdwd0n3YXmJa9XIF67x5yukYpYF1zE8xV
m4b2vyVWjzFGErEsSZCKy+EIep0Cx7MpxhYyXOIJtz+89J6rFNHEsgWIA9h8AQaMmdrss5jJujy5
8ns+z3Gds5UnSvWsGG5DaiQVNbe6zgBOv5xy5AuuEjhuTsjiAu/I9fqQfCBVfFVNQ5DeAvcbyxLt
KLCIUZn6f77WXp22lmx4Kk5PVpGtQrh06BvRLqOLbUaKAkGXPa3wuLmXJAhuWWQnIxFAfwKEKpXs
WQ+cgII9oCFW6xVYebbvOJtctiqIyewZqXl3iukALeAWjmV2/8McFLeRNE6yOahC2RwdEQd3fGSG
fBJHaE7rKzcrT/fKWgiJ8GF5YBl1hk4uoU7MFqhVGIInBoNkyCxN6q/Tdg/tis3gN4/1c2uaHAwV
bWFI6oPm9sTStnf49044CURAHCoJaefA/KmwWGCG+mEu2qI2gTMEnCafNVA25+55ggDAVeuHvNX6
A8ficssjimR/0EL5QQE9L0ItJiGai/T0yLvFkr8QMDCniz9AdVhSDWVeqJHqxeM1IS1MsBD4Cxsg
2DjyEaKEDjq766S8L/PO5xjPRWRo/xZPNIdrQnFmiXCTNcBmjeHFLjhlFP6z7HMOKxY/lL10lZJp
yu3fg1Z1XuxXEhd/FWJB1UYaNSonLfIIE2/YrLEIBPeeSFN1eJCM3wOkHDZIj29WyGOY/OJ6DMAF
49ulDYguU4lDyFXHxNiG3nJeShXKX5NyZDK9K+Txd9Fr9G2J7ebn0GMW2OWRWhLv4sayClpjYVoX
BJCSyH3hkoq8bVppwcJ4FajIwR8bHDGP8j7Z6p79Z2N5+j3yyCevAM+Ef8gPMgugmruVAqv0AHym
cG9jpu3+Q2gfnvYkUAi7zDURMQUR1fZsb9ktIEKbB+5J1wtjjQ18BiFhsNjujRvfAtfr5S5FuQc0
hee1Clb76Y2+PPYOwSJ2kg9ZOp/Mpx2m7OrmtSTDDe7YKfERnX7EBCIYS2en5//eG4kePY/JBlbV
J0IxmveeowX62KQ03pjZBF7Y3qDULRK34vvlWq12UQJ1nGx+a9Gt4nx6X4lssrJCW3GzXdDSiQ/m
soljlbHlumQCEQ3o17qmnkQgLAKbYKfV+h9kZkKYpvzugn4ZJwp8HY0h633bTisXw1ZDNw3iBzAk
HccgjxKdQ2JOE18H3fY3IX4OhauTZUW8oxdiK7cJz75KVrS0XLK2ZzMNF9jsR3NZKo22zTlyoLpS
4znrRc6vEeXdkJHxiO2hwAYuwiGaioMzxbN1SsNhhni5tfO7Jilq/CGZX3sAXZ2XNPjMRSqQUUPr
BmHaCDZ2UsiNqrRlvRa7u5t2rSZ+x0SR//C7Qx4X395icNJY4bnQGWx7lIiv611NBRvsjgqPOV1P
MdmfZPpDHZBqCxpulkb1kaAPlpcm9GIiBtVNi4vqyf8Sljc61xXTrBmV5fuHwVkNoTkJZpc24sbj
AbUkN5YKiS/m0KJnB0ZhoeuY2joAehaGQQ0nmFVap+sOAT3GRL7I/viol8KueAKMx5WAqx/YNCiC
Q8mXvTePtA9owcu7yCQYfbpOXffsJc6aaUDD2eNpQtZTGwqs8H2WmOk9j/OrvtlEWxHWUIzguYE5
zr96raH97hELUG2AYEwbTdJujDYBQxU3IJfLYVZifakeLfv2IJ9E3WogIGZO6a8xr7O6X6vA2tuQ
E0QoBwxkedLgbtl0n5nkGAC3THDYsmj5oqNmtRreCKcnqfmOtkYIbQqJ1FhnRF+UydqmQc4ojatC
w0R7pxiTo3GbMPAgNqi9lQCcNMLMQRFDqE1ygG78NopKzYKpjH7yapeHcIfdmYokk/R0wtr2KmGV
7hNwJxYtW9H4hDZBPpHib4rcihnbw7xtHhEtAcZgyGJf3ok65PM5nzmegHicsFgFNf36yR2xvClk
CI5S9P3XxJqMXp+hfC2apmzJJEMeHgOCwXBq3Z2uX1LikKds8ZlHyN7lV9RrhPebghjIGRFm91VN
Hlm+OuGh1Rby1BycrrtQpJerBGPN3NICQHYs+455UBpXogO0MhR50yGAdEw19s0hLSleXopTiVTy
IRd4f90uiGDxblQ7VzWdrfvIwArz+qehRbn2JmkkX3lCdTHd8q+cjhJK9TwcNoYhvIKDUM+W1yGe
h/UqYBCOpPNKsKEG4MqsFLhg7H2rPCWJMNy1YjKaNWq5xHLkiTtt9cL8uVhpAWjuLBbF7qjk3Uu0
yzZK4zBr/i2qLkdxkXDmzUf3oIY29h8JXO93Y80oyFcA7D5HWDVzSctTZEk5jzcHROqkYEEVxLV9
T8IFUekXFmFkP74+dku2Eht8bWPPk8Lc5uueUoWBJE/ILeVpEapq7gLS34AeIe8dQz9D3MD4bQj8
1sNpGqlQm4BXYg9xgbIKJTt/Wwgcg0FnVpAqY5LZJlmThEcq1pssCazb2P8FpsZiQo2ZQ2ioOas5
sE70yBiT+JRcVeGwIUmOOqyboM9wAMvIp5OTejURwcfzCc0nJ7m334TAWYzdmGqEz1SeT7lIR0wZ
jAc030bak7RerAJcsA8M6Fb07c4CJrpWVM1hDjwCZqigJTM6FIqeGIL2cJadQm8hcUxBSm7rWyq+
wDQflREqo/fu8PFpAd850oAqz0f1gsvT72YMTYtXG17ASe3Y7sU1r7gwX/cilAfox7J5gT6mmp58
DIvud2Af7xFKI2O6vWzq4vsRK9CdU3hXB3GsAYgRuy45buRrOgNXfGRevTWK22vRDnNjCveYWqus
jhaK4eWIBYhV5F5/jYAlC8Pk/JKZegECTJigOypfjYyqXszpfJvvhJ0YWLeqZwL1XvRtjQhECMmk
dwF2gzVlEbN7YV9PXVSiE1fW/D3Uj1qRIYGPiZweJu7AvkssiGVHBp/iKqZkYb7aCzjd4azow7mf
+3UUccJAf8u1C0XidqfAJ+vVYlywPuhm5MP+o8aJHlUnqOc2Cv8i4rUb+jImsIlR02twCD4su4Dv
yQmm2MhoKYRUzp17aagbyIBqbUfoCjxWPQ8ImDwUb+bewGLF2CjuEV+Xbw5cvKQk1pMLwXVCDLXK
ahcgSrz96BwqdmfC8dQT87kl15bpnxX4A4nO024lJNjkadzkPK2lMGX95Ff7IR7xeDVJcK1MqrX2
jqHMUO7iK9387vq96hpdSpmOrxEQ5E6GTKIhBifLiCcc9NRzubEiERGAF1x+tY79W7D9DDQyOODh
BNrUcfFpuL82UvGv2irSDcYxSSJFd8XpIT6JNPGRIpoUjTgFUl1I/ZsbmOvT3cAZNQjR6FykK7SR
KvGqlZPPrWp+T8o92jlJcprfC1as+3f8TjymbYtytt7xrdrsTquzBoFxm/os6kq0T1XVcei9/m+I
LynYWLaiMxx5+iQwLPCfs8xvYWj8lA6g01ofTsecSuLA2lQq7NUesjpNcBxUavLVyDq8lXJdENl2
owKePjUEJwV2w2javOKC1URtK2JM+OFw9gnIiPgzoVT+BZ+1Yg4XK4ygmo8XYHzosTMHh60FDcu0
14o4gjGRxMHw6BG8sGpRS/pgBiJaEWehFsHcQp94M5sO1pIPluQ9MCAkGgjXCYHdx+hKp8w8WjOB
T9riB6gG40C0Gk2VPW29bOROkpFxZm3ir8SZeYggHNDABm6YMuOHfCd8L1EQg9u/ukXunDCOJAnG
tmUd0Xr97JOQnjR1N0PiFiBQwzR14mhpiUqfHjoJwJ8v1HpVhD5/1NTGo/PIDPaqgrGYuF4GZUll
Bc5BCY/GiYfOHYTG+hDymh9lS10KuQyz6G4T/afD38tJ2Pm3YPeVHkmICyzAUjhh2Y+NGvewqFJj
C0Rmld2Xh6npNjuEkLc4ue+mAUhD5OfkriCicp/1ehngM4e6bU3U3wYO4B4Ux7ASfa9jKnnwz+4d
f/uTLPpcuHBjqwutPpF+LLd4lU546IJZ1EeDVy7/YdG2qAseh/7KrK4PFrZZKr3JvosLsKbzNZ1Z
jR1L02/4BCndh8XSaDMc6agi2Q28pWResf+OXocz/Y+jVSIJHhlNqLo9wS6pK7cw2WSI38IJe24L
OsckHN3laXeuHmsHvwWYjH19iDTvZaQFOxM7vV5fkJJsdL4Vkt/6WtIQWweQkYYQufmtPgdd0w47
8PRAhKFPEKc6mVUSothDbn9Xy9iubNF0T8td9rGmvLP2CkghdT0vERiBbLID6ahGroxf4YPz06d4
vtLSFJUaLodpVBA4YyitjocMtBqmhtlHwjCwI7+M5vlsw7Ki2JZsVv6Dch5HGH5+VjOlZ1e+hE48
tIhHaP0WhpeT0bAfDMNctTUtEqKyyl3oa7mSu56K46v0TO4NjX0xoc0Q4fMWLSDzJhr/J5qwcRa+
0JUzYXDLXq6c2eCFsIAhEeH1skls0MzTDlj4VhNLIOdqtFE0QLwGnKWQOt7AFd1nG96Aokb/yrUC
hyUw6OChLxDFBubOkamkIWIZOBl2cepsg1nyeGOJuSGt9K8IROrlSTX2ulum+vlrsYYowDmOpA6F
lP0xxFPvkd9iz7Nqpa3te7rOYW+2flj14EBsHOYvOwxbkfIkMH5SZdFpW8jAUWYd12pCTrdrvtG2
KtrCYG2eMFngH7OORRJNAi7ivNOWh3FbHSO33y3q9uDjDPrCEs9NO3Hzv5fQt1BouGAuYcCskm8n
I5oIwowWq0vr0N31guklnxAIsfdRLDNxtDW5lH2LSJBJx7/Ul7mjok6A+keytNVrhR/491YlPFYg
QPYqNxUpF6fIB+WcKg2L9FLBqgrv1We3RpSBhe/F8RHcle8+7yPtTISS15dNLVcajSqQyIMXRaWc
5PchoJMlz2XBAWriAzbeV5E0U7fzEOte5JWt4fwQiA8r2RFoM1HFg07NfT8/WZpnKn8ZSTVw1woH
qoonpFUhjNoNtdf8a76rrn8sz/rsqYYccK+mqWOJjv6PVm9vg8oWCqrLsjf+GcU8rDdIzSev3IrT
PnCAE1TCEakHDG4p7S0AStxGVLPhDNLk8DP8R+fvFp/FPA47UfXTs20Zfr8I6i1vDsplIpAHUShD
uGmHeAZJAbrK5dR1s0IXDNNjTjosfI53N2t1ph2Cz/mGsuq+cAvPRi89AEhGaNANi0LYxWHiVPGb
MRn5hQI9A4fWFq1tIyU4XnWiRatVL+itvW14haHEU4oAjL6pvg+8YIo+ymELEGAy6armKGcJJzoE
Dy8luBry8Ra1esf7YhcdK+hbkFAyIjVUSp0QZD3r8Nj4PBJ99iH6EF2/Z2M0pnJSLLekjKP+dPo/
2lbyytaG5PQsDVE/Swzd5qZvmmC9ESGIHk8jX2JpeuWBVkE3wOYNdxeRVHGv/x3JYOFTieqSWGVC
ccUpgYgvpMdep9FDoEx2VwpeJ8JIccHKwFBP3l1MOYGdeZeVRAyiD1Vb2vgEz0kAJICXVwCmLvxF
XFURdKf31DT6b4XGbHPM6MAevucn73M0etNsiJDPVMoaWSkSmrjcfjJsgpiOxXIsE92NZj2+/d66
USvbpGoFcacYuvFqxc9cpfg7XqVD52sO+jxc1wqDjOvv/DvFPpWMOnjlc06rvatNm+yDbNMn7XpM
rZWw5fvp+txJ1KG0Iu/EPULTz85kb8hKvNPNtR+6Mqu469D43422t0hmkBsy2RviskZ5mB2Dabr2
/5njlW7woG7U/qNfcXWK4qPpimfIDiCD5xdmy2S2DgRCm8gJM5i2on5UEkuiYYVZtN3wBueXYY7t
mwNF65x6HdawL0FKVNh4/9ag6Ykoe91tGlN6BnSlZXIM5EuwTknfbhYaAgd+Mg+xKqvyJ+vgYnJs
oYvIZYsZy/ZmbM45NrP354IE9HeyhN75mYJWUqQIHgzkw6mbQzkkhQFgwwQUvsV/YgFEqTaDh0hn
WCWiREeAn6ilU04CAIuvaAiLlN4V9SoDNvW7w5f/r7anL0Rrx4ZDxntCC/WDAoRYt8mpfCtvwTLo
zMq0ppoxp5KutyluQ8/LCnnK5rcIn70FPDbcAWOJyABqe+SBKPCUoPIefdHARoJJSmCUkZqaYmjr
vetc5LeIkJmMf1hCHRSD8PtMQ9ethD0SC+V3zRhqXa8yoRuQEZA/9tK7HvnCOz0GqDFzPn6kEzWY
w2twFVVb9RCrGMzTr/fvmjsr1f62Cueh42QVs/3iE5131ikscNWd7njTOAcVq4w0P7FvxQOsRr8W
VloHY0TvZwatu+nlinD9fF6U28KCM7BBkf3oT9QWOag0SyMwqxpUWdGuRmkk/bXsWNfcfdC1IxMu
RFJE/GCsaoUdwPp3yPI3lLNLIvWoe9Ny0/tPBNO744f1jigYfN0XD5tNmR/eMBrRVvBxWaQpdlTG
adND23e1wgki6DVQCY9ykBiwTzeJ5wVVhau8CS5H1B7CP23VH9FAwAgkg2NJIzZyox7z66rpfIA2
H8w4G1oB6AFsvis2Wcu6m+Pvnu56gF7p1AB1Ab8G7wc0+ND4mCdd48kHFmWrTZxfaQHVwNMBH4ye
NZnfp+WATzAsgA8xkKjNRXG2QNB/5/Rf8VsFZgOboJEp6t+Op6uO2nNz+9JL5EtnO7LjIE64faPR
LXGcecgfbfMt368pswVm8vCazQ8K9GHfTnF1U8HVuvKll7PhygODH86ec2gU35q6DzRLvPsgEF1p
LCKU19najbGLXn4jjOtGOJdNSHNe6LzTtri3Bib5S+8pVtSxGoZFQfb1NHBl2zYemoR0IDbi4Pdh
C8BS8V+mIWJi7rq9egG7fQtl8sqxMWeBLRjU/+JoZ2wXCPqyqtcNy0oAj4yLm/c8ff15FcWLoMeo
bYGOqo+/ZwEnrgPucOYo4uUSjMn27Z9NvFSdjccBad1iW21X2XqIBKVL7Zv16nC7k7cYYyKEkNMl
3K4ye4ZbbJQC7gAgjJt1DgHX/y67o/7uozshVn/L31GtkQ2N4czRt4/ePw1luwnnXP49d88ClpB8
gbraT6NI9BBJZcJ0+BMHB6Bz5kCNuJ8Ru/Aw7CPWu3AIOTGcmk8MSTCTQVSKzmED4GEM8Z9JB049
KGawSBeb+Ws9XVkX5HsDaQvR9qSLI3QdAOMRRYCqueFjFmN10Oj+LLNeyoJ3l5WM7BGy581DVWK/
oOns6BeATlsqg5TL3zzmSMzk1LqViMvQmfbGdOqQOlq+/xxSZh7XM+txvZsAaaBSGJF0yXETse75
m+CpzJBTJ4PRemtqFOZP2Up0wDpLEQDYKgfoNDb5ECA7zrBjAkw1bF6wEh4NQ5IPj+2GsL6RwvlJ
b67Rfi35Zm4jOVIsxBU1gu4VVAAhHWVi2iy4ZPV0OWKqn4ElhIU2gEwL+mt1EZWSy4990KDzt4gJ
wS9EbXvIvCk8usaKLuir7FgmDUgcLYWNJ64tewu8FMW9aP/6Pb0ot1vkXMTTM0UcBl+gf1p+i2de
gNJp+FgxGEt8LCBies+1a3RYphpHRKAGiMOp4a9z+fXGYiGCjjbbEbYeR68NckXZ88FbgOOWIayF
QcH5xVApmlaxocjgoE4/GGQb/mNb6e9Sd8U7yh6IwmpSVRfZ2EfNWkXmJbaZiMeZLgamulsH0Z6K
EVmjVFRg6pYQF4VZOYYETcCHBqirxGYRdetwIiV3qvfOIIubqKBU1HSMofv8Qn8OYF78hkP9NMO0
6aNHdpkOxavzeaq1wvHcVNG5jWlfqmkudj2iYt+5EUF2smm0XuO82VfItw8trJDb3pY9Ok7eLhC0
X8C2vI8ZyXAG2f2Tv+rJqeRxfXCmK7baLcj9INP9OWokGE3aNwj7l3ujHag9+TYcF4ufEiili81/
tXPTxuK1Mp7K3sV2z/yVVY3df+H+KKUaoseMB2EzKGxDaogEuosNOdiKHe4SrAyAzm9JIdYegmGl
mX5aWc/O+B0e6Nz2C8IABsuBmqrShYVEoX4BkZpBM70Bm+NzznYOWjCYsUz/+bd/xw6TZpaKfQIv
tuKgT2EAb+mh+fbd0uxe72PawVCEDXnUGnZUTxMRPlt9RSUpcf4MOfkmC4+6KcKtEfAKrv81LDTZ
k9/rYKafyMMtDFzcS1JhF5T+Sw5WhY12aJ232jmFyv0VRQXHuU1uGsX9Wgh3m/KMB9Zag2wR8ghG
znarAth2flqEDOPap8NRQd108KDfliA+K/byRsMPcgkDsfgj5zyHZ71d5qhSKfTyXKSylXNmlm2W
+rMFEAEcu/O0OhmNsFvlCd/jgbSRXtGuq0kj49NF6ZPLuUtTP6s5FdVU8RCwgW8iLVIwNPmofe5L
2z/qXhc3YZ42sbaJ0o/hpAfgEqFT834oWenotqASgHu/gIDCE0CXNPsb37yBuIBwfZDTh3KJjA1F
QYGI0PUGMPL6bff1UrbSFzgNyLVBaY9gUhiz6G2niqDJ/pCw8ogHQqWN78Kj541wg6uWS1NbIooB
OTFt4+0Twy6j2CrvJZIe7a6QM4g03phnXAZU/OJlyfiJJ/2xKknpmnYIFJnnFLofsqDpCs9gFHv+
57Ww/uBSccuHdr6VSgLsQ4/C85G1PdNxQ+075wPD5U+gbDLr+1SSadFOZ/myNO72iyLzW0u7hX7Q
3V6PB3DB4rF+iZGRHGJSkBbPGML8Vsub+CvO+yEgLXtXe7BEPsYGRUP6oCS/IN8rxXCkLCd8D0DH
Ljx1qpEobpacYib2GhgdMWs8XDoUWXfVN5KqVf/b0n0JPAdcZI88RONCdJmpINUeFVBFH4W5jSu+
x/nkqK9a0efjCr+VvS1ZJCLq7awyv1Nhor2hbOTZepEMW1wkXQTlXGRtCWmyGIS2NeiDzW/eL82R
swAfRIHR9lIM255g8oNL+rOqNbDGT7X0eZ2d/e2hRtAIiBYahq4uKjuTXjc6r9Kjt2Y26fvWCFHr
eQpDxHpJLAPzCSah5pTiAM+0TiefqeO21gPOQq1pk74nXTAb5n/h2BjJSq95jYsOLYt8tmrxEYaL
eD0lwxWGUCaYJX4GgEnBn9t263HcNJt+CUb+ZRjR4SN8zLI56LcbB38lRB8fOZsHntaQZ6JdFQs2
9kYDh0f3DGi6foftjCX8FbS5+sX3oW94amOi0MPBQes50QKL6MOTDQ0R+QHbRMp2D8DtrxbH37lQ
JOIsEA6jW2z+jRBdFlgQzBuxsXDIPZ1AyE0HYIRUZJ7/9NW9NNNXuL6BeLTQ0kB13nM2tMnGmH5F
g09f6GmfXTxblFx8OXvAbBrRzLLsGiVJWUc8/69IYf/BWyXo+X3JM7p5ODtMllVUCxy9J7rIeQ2c
VX+weirYb+j1IUA4rCPMRhdVp/QfIju3ywBP2RqCZ9ZV5rIqYvdoX3jWHxR/syQ90kKNMu8pLZZ+
XciajV43QD9h/8lKhUeEis1SuNGY/O4AY9Ki8qnSoiX6qbjrjv04Y4zH+TZd6LXDenZjk3PneMXk
eQNKqA0mkdogK0Zln2W2fESXWVCn1NW3+NQdrN6vA+Gnmr5ePOfog5XDdoswW0Bo9KxlmE7OCcSG
LktEQ3scLGdYN9xgTLPzuChiUpuxAODjNQ/UDkEbvbeBj08hPVZWKgCxSPEGQYO9E0pOT9bsjJj1
CMvI7aM2+S/lfCAqF7LPZyZ1nNnhjdvQBruymD0Iuco7sGMxkyxx58xOHGlfqZ6RM1uLlCcH6p3U
EZTOp6wS7p1fbQwIA7RD9Vc9pjXtE5cjyXo3CYTa23gfJQrCM/BmAdiiErPnWoTJ2nZYHhRMWxgo
CyPzjrP2r8AYDTnXvyKyhkvYszjqyo9sd5+BRe89AlStLNM0pZVdORkEUUyonekUgiESmPLzqrr2
8p/j42P0WmvoJqAX/rX4k4AS0FD3Pbh823G8p2zFBHUGW9KP1rYc4NdjJPchtopsAItGtYDAx17X
IA1KfQ9gLfatNPaCSVcKdz7p8VypZBE/RGrGEt8vbN37vnmZ0/TLA1Gb1TeL+ONJ7aVkkvPowYFN
P0NVHwBAUIu/BeAAYuou9XSoLYlFAR5onzVX1MljzfwtPPxfT/VtcjnzyF5F/LjXdEtJ/gZ1Fo3Q
Bo/puFLOqRwyeniuTvPjwXSs7aKGJwyqS9tmp5KtdLDYKWV5LGBmP7ApANYht1a0Fe5zm1bBA/EQ
Kli7ume4pyS0klR/r2l2S37yodKAdCrWQfU8FeWSI619fV1V2SX8fqGaGiv73uYNR7DKRNPmmtNC
9OwNc+z7XndFb23VMTp4g/fxWfZRexr7hCnW4e+yagAl/buugk1ggKlM2Wm/J8M2V8hBtCtG7xBW
BjhgYFZ5a8iqWBHyWyCPl7mOQSO43jKZvRqzXgtWZqg5xWkZLNknH+/gsg+OyHOiB+X3eHy3SJQf
Q8pSpatc0EHWnmXpxVViOdUaMFQgEq1Wbf71w3j2h2JiPgKUYqXnv+lGjVgjgEWXRw8S871iUV50
dLW/Ds3wIpnsmfxk1UdX3HhU48STBoC00zMgr16YZoLs3vSWG+1q09d4Q+6XSjG7QQs1eaL0kkgU
7+Yn5QwH0x6RAp9TYS4ytoNRXAk0t7u/iFiOWH9ECiV+uR24iQ7kyA8RZ3k8PsV0yse6Dzovzsvj
z+4WoVZKdaKdSifIX8pA7Q+lNuHD+ADILWJB1IBWPcQ4VmD3yiSVSLiCnWKEbmVnVeaPv/AoqbHN
L1k7oPUtOUo/ClK3qWEi7Y16PEPavHJU3iHr7q4cYVrAzSf9s3+7/DjshID0gJXrP/Sx4z6X8dIz
MzGGYQQ+Ib91MHNDDfhMUm3EIBV0x89SFgUQy8//6UoLz7JLpN5F42K/ooKa8fHnJ0EwhoTc4yqn
ZlWYaI1PIiBicCXfkQl4uUqsfR3LZM3WivjY8xgJ72BUx/yaKNcEHtAsg5MpMiV2oUzWuZK9C23P
GCq2WgOWmM6csshTF301kwy67Lxt+BKeopAGqB83AB2oUcyQxi1P/RALR71oJ7JROpXDgb9pEmy9
WLfxdqMtn9JA2oa1dAEppBuiNkgDlIOSxiImQn5vRk764U2mhMNulqjeTBWHJja/HpDqdk3EL7qa
HwCiN2DuzRqTVccQIbhQD0qHyxsi1XYfDAU5lHr7mmbKVUfbf75P+ChRAvyEnyHIqUg7bsX/vYIt
WZ+SvW9v6irx5CGK1hmOHF+peZq0YugfeL7TIdsZHMoy5iT4xwBKkJ7myT6nkT7lywYS2DC5ak73
fX3CrRPFGw80uG8PBA5o61Fki8w+Nlj5VxjD1LLB8Tl7HPGNhRCgksq2tgAjjhrrNxcLmCb/GQ3H
KjCeY5GDftXXF8ZVY/u+WQHh6gsFL+CaxVcMsA+rKdfVLGjmqXqQ3k2x+kkufkBjb8cgdtGbsP/x
H3tAF87MgTjgPUhjW7e37dsnV9YpVJLV1CqEAhzQ2xjf9htbTvCMyK2qHbChthYU6dLwH40IeGbz
JXGdu6/rKU/ZLM2EFEs9kur3NEtvW1I1Ssy5XBGOlUB9550TRQZFsohCAmaR85KA6D5h7bDRGA72
9CDOqkkqOAG5s0bZrVcPv535PaAVAqewYjvqtkczjwG+1SEdNh22C+5t2zgkY17hSpYmRNEOaIng
9bOeFWL/3Z2NA4Blj4FUNU65/jImmoIlMx3zMmzcrY84Z8mMibD4PdKZj20oGHxuNPZpCHMVecHe
9VGfuYl5n/Q+r7V5sZxu76CNMtbw5uk6wss1QfPlpFe9QcfibL/EqZKPtOJNYkbPOnNBtOJBkpMk
eZrkThdyn9lophVmJsndxrmriOaSG8lCSU6dqMY5mRxfuxSZsYtw6wmiWG3JRWeJFmmwJY6Lewsk
GRlhjibGXK9fhdJlGRgib295fkVNkO/RX4eXTnLH/dHmieXHW9zDyoWrtq5du0WGQrbvj1ytkCPY
ePOhWm5xcvxIO23CJXkPoI/A0SgkoiFYYm/WUx5MX8phKiO3Ub93DlwOadwzHxRynzsQSCuxf78i
Q/rKMPkQA3gDZJFwIsa0pxZ8rBVUvjsJWZyLRrYdeC8adMWiariGi7ViRXQhwtEMopudapid6wMa
H6cw9gdzz4EwJfOftOUnmYQnXoPdjH83yythNs17kZL7t0YhdV8iuLf82zpB4H5Z7hWU0WIYr07z
Ra+WrLw1zi2JNDtfy3OBl3cqIzIuXLlZzq7bpqIHPrlShLHQvxsbmy2yS5tH6PmwSllANlrd3Q3O
rv1KvMva36GTkRNh8IS5yeTx92zKevj+3EJeVGbeCIjLywxJWvWWlGY9rTUiZWKnqy5zHVgquB9B
DMpbTvysT5ZP9XTELvgv74/SBalY6dirYwOF1C7UKMqupFnQ29QAQLe9JrMQZobqtwwb2D3Ur73R
JPtftRZPeiutKxgVwsYSghgsSSTxZeZGZHFbw1JS93d2x3hWaOVdOAisxEnzyZaAWzArvS3gkDxw
tnT4i7+xBTdwuw4j6y6qC1FKJiy8sYIj0bAH0uhXMKjYLF8jKqfCQDhGDkYse7VCbJik1s4UhD/X
B7g2xgK7hOs3hc7ZZ4R8BFlcRG1uwRnQMJg67JtpQ9BJ3Gy57uLUZgbfXD4mKhQXwDDwpDfYmZxW
Cm9IUB3Z+QDTv41+Jy2MA3vgMom6UC9Y8Mb4bk1BzNLMvFRoB2O0GMClZlUVxSvS7mZ0n4yb64I/
oCGNWhTMKColetlq+TQb6BxjyciCATWRIZwzmj4loBBHdULmDN8sEGvC9G+v3YbWsNGydNg6T4Tn
yWqBV9ZFrOlngtx0Fgapqkp5Nwl57EJxRe38S0opinWNimw6yA/CmLqfdD+zbsNOG7hSIf2AHSwy
wEz9D1PkXgqZ/Linx+WN/TjUOYNJsdUJqxhd63jHwN4V2e/63qaUEp6v4tdjiX56aAwXh58segTH
aCHq3Hav7ciHhSq+BZwSljbsQWMru0Gxd2cEcP68zAM0HHnWTpJiLFBHMsm8lU/UaCsk+E8zFKE3
XSTsUdCy3jwetfn7B1vgXg605fTFvT9MV4rIuqTUI0SnhFQWDWDUc/iffGVcWdhdLj4gcYKGhRzK
0FnaiVIdCrCOXU1xgF7Jmpu3dwKcjqkfSzbCDQdbBHvlJXu3iD0yA9YyrVD/IXXnkFrn8jLVFiRx
Bc3Ia86ounhBQn3v8FOuqAEV9n9N3dX3xuUXENlyr6v0Ss+CJh+qRS3p0MR9CZ4yr4evSdNjcZrZ
9rQ78OAuZkcs2tuYkMz2rDokrtupmqFltlsOC/Fj0YOBrQ/JGgG/f1CSvifQ2Oup1xcwccr5dCTh
WAfEVus0wORPH0ZrlKeSCPVOoUq7BmddojkdyKiz/lYc9v8xLKPtbxSNGyk5/2lkBkGdnMdvJROg
/jZD6rPtTFJzsSLZk0ioggsEk6XEZncljlnKQVPYM6Zf5M/+mWCtWsv1cLkiL+WwM4DICL7jUPa5
mIcGB1RzQ0Bl4P7k7p9WJ8aJmkuAoBRvmU6J2Fctb0mEz50WPXJRFkumw/tZID3jYo/jl8MkCwYR
PsN5iPSMtl90FSW/jtEp5cFWOZZ5fDhVzUsXhHEcW1HgmGyDmmxQFYKlX+dgfkvnz+qySQbJlhsa
i/NlhhWUt1o7+eR2hvyz3X5KXD+JQh8ywnrtMFHJ9d/3w8RkcS9I+PETU4arSuuj1tG3ScUcB9eG
wYHET3sfg29yBQFvZ9qQOAenSIunyTUXW1pWWtRYsVQ9j2/A9o6MBKHhE+ezd4lmv4fL25Zj8m0l
z6VXr90Q4MRfzpve/doRQDGkTegmNMZ5CxKfr4VwK79v8LpWFVtFS1KljFDygs5/BOK6mmJJUHTh
uYg5sFtOaSXlRyyF3uIS1dB4J9TIaenEs8//ougMyIq+xXfpMc2Uh1jqNkGdF7a3gGWmwmHlvYrX
4cQdQxrN2ndO9rwF+apqrT2dPQWX83qGyQ5jtSndWoWbusFGJ51d2l1Psag6AjHTql7YpZ0Abdbp
kZlQw8lwSFR3gaVyScVS5kOXeZ4KAi1Ua2L5kYs1hkwH3WuZCWaGbp2qlmkuKzGd7xNDBi8dh8Nc
iicMAue+fNCDv8t0+PfVHgDv2Af7aTms5DAq2wgyGTzH9N6yyZuTUjBEV7nqcEKSy9bfFO8m5jqF
1ZW3pvvrJA2K/ArFLwdOC4H78RLUjmwFjHt1PT8y3UOa+/HhsVAFyr0YS3BAHSVjyWoVWX2l5EYG
HaJ1fw2YaEazH79LwevN/rBRryQzgyTG6PhRivtbPxv4nals84p5AzJysbxzj/LbS8KG5J9NRIcN
+FR+jMTg1aj5/pUOm/K0dowStaofm3oCP4nXrrDe9hR6ELPRaSgLJHiy91APrl1Uc1C46CuhFRAV
t06USk1LV+wQpQGfnpjLiPPEl7DMdObSBKyphY8S2CkudHzyhL53NFkEWqRWyGmU5gW48ci6wV/J
cRnl6J075S1MzU4ZHyCMkAoke21vBr5c+KpYxdex+MieIhMmtLTOQjm0LV5XgrkWiV8CSoED7weG
PrVPRAXyDCEpnLpzb4AznKfa0KH8WL7ttnkX3aSgRVWpogpVz/M/eNAUlIpnSjq8Wi9gGWgYOF3a
/lRCdNrMzT71PiZLOm6A35kxzZ93e5bg6z1HZzhpjLa6rJAioz3+U9Nw3MVc4ttoxDdJt5u+hBOg
zQWqLOVsykB+/qo4Z3RdzQ+c73k2673WfWO7y+1Y4d8OOm3x07kL7Z4QJjWhKFnDwNsXgC3B3HU2
e71wZJDGkj37De9wkITgkKRv9R9hUYWUumbcSm7VC2mQDWuOPMQzPm6lqfISc8jnjJDd1tWz2FDK
7yXQVmOkL/8XBu6AOUZBxwTzorZSjuw0CcPeMW/nT8GYcjSTEbHbEuL4k5jk/9pR6HLshy2wPPSK
vp0HGzG5XD2Xi1YSwuHAXRmJzdDSWEA9sEUgoSDThH2M0XAI9oUj+Gj5d/YBKhSrbWhyc+7+s5TK
Te1A1YRJUbd9NWU3I5ic+I58pG0nwvUohdqUAyqQ8Cx4BcL6VVJitm2s6SU0HkzImBh6sJmF9pea
M8u+PjIBLE/3C6Vyh8a4uVjivlHp6hFxmS44kQcy0YIOkR5/J1myZ88nhRtMgJJntKtuBPRwDhHJ
FzjG1QxDMVqgh111xWzLhLI4CyKMzsMpwWNTenTKd7k0DPUpTP+KtBBPuZHzJd2Jn1swwlJgongp
Tc81abiwS5D/n1XyqZL5u8n7shCJ6aWiGtEajmtBIZj134C9mClYtk3LH71v5PVLPWwyuWUXYnHc
joOjm4RFJIxA5hfBbjC5w5olYh/LG9Rmi9ilgAUWhabJe4GQlKx2Wg3y9qylJPB67qJgfuWFN68O
0OZSlUX+1gESRVhzHwXRf5GQ8waI5zJ2lbd65Rjm6FlhoHSc/y9IufO7+jluRPRfHVnGNVGRJL0g
c20bovRyZ1HAfVHxOhXwVQQhnEplm4FZoziu3fM3hkPGBChl1n6BdX+0yuQzl4vunSgsOeUmtuyS
eO0o+n0tDX2iz5HfDIvXHjLZPIWEEgEYa3P5FZW6Wc3Jr4ugsjBobw1HK0Ilkpbcrj06PoAd9ste
l5skg1RayVMqEoQuf/LnlOrUxXyMtF1hS79TQgogPQUksC9XXr6PhClJQumJwdcUNIYb/iQ0wG8E
X6l5eAB0cWU7dzUvxZIJcJHthimwnlA2BZyYhyasnDWRbXWHBIEyuDAX0FGsaPN36r6Wa3LgOUxP
vrCSyKWpgzul3DONRSWY0JmLyHImi51OFtbDCBEcHS40K9+mauAKYHF1JygbHeta8PvQiL+Sbhbh
mWD27OpT1RAX/OO9fE+iuIU9o3FFXMIt6ZBrp5PMJvp5J+T9SmO2naoJL1oNymn6bF3/esn1JBHz
oUCQ38Qmp+lXzDQKpdBpBK1CjDOgH3CkbwZDdeaDESpdMrc/tPxqeezoFX+IhofoQhgR7rE+mvKn
nmNUg6p+gkiXlfjwHuGqLtx7OB4kzG572d5YD5nN9LQp7zfXmM5/NB7/juLSNQk9L5rpDStM0tfP
QBXX1KJuSimZExxNATxfveAVHM0VR0tlnx9VGB/4bmh6HbUvqqCCktz3hn2J9Ukcbmyiqo/Cm5EW
Rt3TuJl/av46L/otGXPhyv1oDF9wnPBWO1Io7sEZ/baAFDk+xfe5vRuU0pocHUduqRTLJQUt1iRj
OdaEuGAp5D9f0bjc4CUgXhnxOPFVIzHTIuvXPrwvau9ZvLiuEyYIcOvn92p7D3sUeVJEtumPspsR
UwjelcfdreOKC5OgKGih2/64+RmoyQDRPCp9Ns/yDsYYUw62hYl32R925qCWMLC2N7RN4EpP+E7z
Zh0+3sRor8wnVY9qKSHe5r53szaJAQXyTLYezItPGjF7mhZ+L/vOVTcRI5dKyMP3zmc0ZIp50GgV
aJX9J1/Iy9pNXQLNc3WSWxFjoDVB/eWcYUp113slxg906Z3zPenm3bi1tbm71AfZ7Mfj5F0uzMuw
es3jNP+I9TAefxYbR62xBfG3r1VcD3/B2ZKzuy7Q5iWR/cv/XrKkToT2fpub6HKTz8/r8Ym/pOqy
v01uAzZstjCtyJ47HcGBrZEDE5pQHVyvPqVSEjZr0cSZSgPULOHyHFSUBvKfGvcRZILAmCL6rVZG
qFFLByfp4FtjJRJyi3dLVnpdAK4qGxZQsI1BGyzqZMqce9qYLYqPyqCB5kyCBr9WfvX+P439ST+U
LvHfozcI5JLnU6P67lwfRQxxDgc+MhZAHAFSkL1t5KNKesyFmBFgT+RLmOcv8ThPF9SCOt+L5o1b
LDfj/XTNqOdmL+dBZCzeEWT/c+GkCthb3ryRqHPo6O7zFPCjDn1luk93/lNtZ+bcXrJNOmhwGaVv
HPqwWWHxxhCV9+NQXwX2LUj6mTqV8d5X6jBR4anzpdumeCf+HAseon9gRWTnt5A7/gaaf0xBW5kI
3H9dnEymKQxeoT/adVhU/T3IIjgwKIFngvG2+Zz7DMWHlsyHMZZCGmGLOVOPdlaAewAqR+wbwiRI
oq/IInf+w7vGAe8vkXsSe1N4M4EalfeLJvkUJQpyv9NUr7/00BAgkPIB8caCcq86ifKfiR82laSW
KVFiQX56uvyr5KRhGbufUDly/N5R5VhEFwbaWY3xE5IToCpE0Qorsp8JPR0mWIrnQ5VHKhYLfHWW
QdDFnpiHO1BBhbvRI4nSoh2/FBjIvWM327+MHyRxkCq+jYKuJyJjArIu1yMmuZSQk/V6hh8iuZWs
thUveHT3l1LNy2da923YxTx+7pV8IBr/91qB5uUBf2nfdiJagPCl8mDjek+qQOh91R6u8cMUydWR
2Ys1y9/qh1pR8Fr4F+JAhNbBXhLSCNZDmz8iBevdawtGpu21M/NIsViQ4KDYK32YemHJfs+RwQeE
km2e8KDEZ4pvndcGv/IsdRCxq4VeSpqe3GVW0B7JndC0PzQqWLnqjRxKuV7+qDaruUV2aSTuufZ5
RQeBXZGtl1O+VJhB4TpaVI6TJCoou9QDy5NHlpkOV7PcOvTEGfw0ZQw+6QXbkpTMounQkDo+RffX
+nOmo0gies1iuZuGQC9hulYsrGFSaicl7zDyDst9oOSEll/qMpE+UjVtJCxeGRe92Ya5D/ueS9v5
DbBZIKF3IpW5uqJkk9n5Y8GF04qzUyb2PL+sHBZKG6WqsFCtlQGxTH3IOKoU21ZpthcGOkZrRs34
k6rWPIL1BG8BgaZVnPHgwnfEuYocDJmR0u+nzgPyJBJ9FPePpxbb8FKrfuJXJDUf9hL05DDtdTTB
00IfERJIt8R29qWx1cOJMKVXLyBFSAGxcfOUCNys631b3liHg7FiiXQjXrWqFl72IPphzWkS1gva
D8sbb0mdhOvwQoO0Kj7kSzoVriKBE2T0JnwMHf7D1GsiJagk1RNUGR61myB2mpDMd2+b5R2m530w
9WSUcAYljUQkObPEjkEJvfc2H0sYYh599IeKnatLZdJZVJXafl+p7wXgm0dJtO1h1DVHiwU2QmA8
tqAs6mNRXNFL4BxF4cCd+gzkcYRatoU++jaQH0nry0Z0bOH/ajNv/ejRKVMTVO0mt6r+IVsOcyAy
tOfkolwiLLZV23sd5paCVczffTZYVFbjgtgf4C9q8lTpGpO3RO9Fxql8ReG5WvCQKFn5T8AgqUyO
ZNjzqrRe2x0zua0p+lIqTTrHdpqUat9lw8Jghm/bBkmsK+vGDWt6ssiHGFIUAj81RAoo6r8De0T7
d9NF38sxyBsfZg7OgvIZnyefAbg2woQa5TyXgWGlRU/fC4a0tuTpSs+PXKslCEdWvZ9gJiwcYA4L
MD2cvV23kOzvklT5VgmyhH28YTrw2aORPNaubbe93gnJPvrlfmk6Xl4tI7N/6DZtHPwtX/T6DYY9
BVxSKY5bIi3zUfQvXOjqMrtp0b11v7UmIRfTAgtlhRK0M/fcaXZMFarJbh15NuKNtY0vMFrd+W8M
6vCe2TgJgzrCpLUGD1dwq+OkoqHNfhaTRzP7Sg4cGQAbeq9QgQkl2sX35q7puUA/Xrkxx/RHm/y1
sQrOZpcliIupUiIzOl0E3RbzAJmwoWIsEK+l4kTyQ1vZscU7emUz1ElduOTPOjaMY77SmTGK97ci
ClFHrHsSayVSO9K9ekw+jpjnRRkDzwHMBELIf1shx+WtAP5pDC4MVUdT7b3oR+0/y9OGO2OZo5uU
JZPG4UXm7ZuKWbAmbd77nk2isoQ1ou0JsYRUTJHvVNQslJxfodOJHsGhSzfU1auRI24u/TzDCKAW
N598uBb/SmhvJcZj0XLP87ld4SPUMJHIoYWhybQoExptvwz7YV8tCm4ZjI4GTpI17Iwwip2Aq4Tj
OUCJ6CFyhke+fIRdfCVt3sQta0N+5NPcxLBBug9s+BZwde60G34RGI1zpeb1vCguoSQ5MnhOjMb4
XLqK2W+mwXQns23hG5xbAQN9B1TVWTecN6O5ZuyA/krUjreRTJawupldvExIFf6ooo9GfnxYrhj/
44QOt+qD2/XSST2WZd4WwxDCVc8n/gPq8iX/ckLAOsYvPcbMlIF60clOZYqDHE6+tSqolIUp50XO
3OTkUda+LOE9/djNGSCjy+hoNF4ByBdHurImA4K7S6z+24FzdmZjyhhUlq/3nM00+B+IO+0iFpiI
7s0VkCgCMXs2+A+vuNxGwSA0FLmgkayKYjI8S6IFkeY3nEFGZTBskzgTbmMMe3H/lJLdCW1l9r4u
Dlze+NlCiLlWLODcaZNwBvrU7rUcmldTKrb+zA/A8WZTQtuRLLWLP7t2MaXkbWXmY7ik9LEW1YPg
pmsK9GCXOJBSqGkDzGTO6dS0Dp2swbtmf4znCxH7gFUrDCluc950Lw15GpB4z7mPeNRU4kj7S0Mx
d1aqsF2gnAuYeA/JTMNlJR9Zi6hHX9AOVl0s2J+o/IJaX8VpxgUx55JzQgcLKB74I2mlN3UXvdWI
HSn1ctQT7r4f7M/mEKJygCyhslCDmW6Ug6qAOxO0QIiB8crif9ZxnvJOMQ9fqTH9EL9+vNOSpB3u
9aoZB268arvH8DkVBT4rVYW7oxvGcntq9BOff3nyvgfS/Sdz9+AyrronlEGsiw549U0tBkPPkWTd
CXPGFHNMVCLw2M1MHPA55lJHCRRFHkSRJBo4PcabAroc5hPz19EXnpmI4uk/BTeExdjmYA1YDwvP
zEpoe9lu3wFMsinOQIFYQu82tLCIRzj5SloTGCACt8+IWsWN+GSCjzoGxPzj5OJiXPzpW7p3l5Rb
oIZReOvERKVB7p6Xy69xXSMQ3zfw14behboKbXTxOniVyfnafim4vwrg0ZCRD0tYMMpN/gsbNs6V
V5nNVpWFacRJdzj9Q3RxbbJ/e+ZrF+XkzsJhW8s5Rmlmu0cGskYyomgLbDn0UwQIxH/vVjWg23hC
XeFOn1lMwnbYdpVc8VKnPA1aEEkSp8j5c1xDrgWfK0qV29caM6i10DH7BNCeiWu+WzeK4tzKv1Pw
VF+q2t/bnq6WIDr6OsEqqUpo9rqnWEsepInH14G7r+b4LqOrR0F912zRm+aGh12EiyQr8n6i+rLZ
ZypoupVM7sLV9c9cYmGoOvtUU364NoRxFTDQyqC2sTTZ3nUVmz/3Js5/LJkwE2hHl2oPQ4Kd59gl
8UCVz4OHxBwrX1EraaOxxlfSifcf6XHKT3KSYpJvBMfJpTHf3FhPLL57YDChKpIVtBZn78sw6YMJ
mzMB9Thwepl2kuEtvaAhGTNuD5fLtF8e1F0bEmqQOUTy/9v9Yh4SbSvDFz+vSGUeWmjNSFedawvs
na33nXdflZs3+JX2UEw+oe5HE3q5b5AOauv+NsDuYnZ4ZF4sdtSdhF/+bNi/sVMA9fTBPczqOlLA
WVM2QWfTHaUeilj2b5Jk8ynHP80skCOMSdREPBhnhwCuxwvk8sGfFGMIvwn0jwYPPT6V3rEVrYVU
WQqYg/NgRekeOgTpxFSoTCnO9z/oB6RqyKpO2pTtJ9NCbNrEQOuJgugJKosZI5TNf9vSjtIg8yw6
xVdt5s1LAS9MbghXTsVzzVyDtGK6szHJIhcxe6wclbWZXhmeIR1/QeniNgYXxQBsnJI/WSEEZR9v
P45czH05OmGWsVgqCRDESmKRoxEokpDSGduO4ORoThHKBRO9b7WyO9dn6gc/0t8Y+3/pydv1ubwf
IcE5a4VYgBwmJg5+m4rF2YmsEQxjJ5O9t58CHY0c7ozn42T5Kx95iB1gobsk72MEQhFofqkjkb0+
IjPawRGX7EhkeC4QtIPD9j9/aiNeceCsi+Dqhj7flGP0dsxpyda68d8gNMiwzB6j7ApHg4S+BDvb
h4ao53hnVBMPqd7q3Yh2yfZYDozDUwTQSYkCa/5gVfNlTveCnEdEbOn6D/Lrd1XCLNJhdAitCHcD
UI/FlzL594Ai/rhuXGoNecUR2G3nsUJjHFcB6xlIGkZ2Gckez7z9C7ZlaZm9FyORlYnY1N9o+Xbl
1DmkzmqMLh0Xcv+vLEd+t1z4YZjfNaW85tThFlhG0GDQlbdEy4W4UR+wHlQ4FqRBBwZ9ql7m9C7M
lKMXb1YOe1aKYLvOpoBAd6s3lUQpM3ieA8IOMe5IPFi1hWjw2S7xA029ijHN+irD6CIa1HXF3Fph
r7vQGwKF5C1DqLllDOYpBhl8HFUSBYj/OepNTcOzpW08bgdQ7H9/YiK2YVqi/ZnYodZ5zwMaHOkG
0BbhTTbRmpeEISo2d25/Sf7goiH7Kom9XI5OYjc1UyZh4gKRC42gqEisYkOCKv06rjUIsj7wR7wx
3BTy9KMYRKZgjuQ6BQTWkPv2Nsby4+iEa3o2XuilWB1brcFELJj+DpUKGwUWZ9y4RVcM3fs8lg+/
3HOpdRPxpajH/YUYDUR4DSqjPCmQB6IlHtsJaGpFDiTcT+6zentSVECBJYabOfqugVEqfyBt34oO
RFoiqsTn+fn70I0NkhFcXlUzOASynAuXm+ywQ+ktxg+8lBX90fTxUywqgu9N70sWgCQgzfrylqUq
LhkMgmKd3XvJVPWIMDDNis1rscV7IK4nkg6YzY4QAHIGwkRzX5k6dV+awoqaiNeCHZbEg4sSgDeE
qgz2GdUaKDyT1VnPLkZWODt0yYDiy+zu4+mYwZpLtyZ4QxdvYSFIN1uQapUpn3DLpu19rMiRaRr2
J3gp6gU4zF9ml/G/0V//PLl6oo5+S0y9qWOnVEf2pXtdHgylC8Tj0wmbrReMM0bN5GdJKCnb1PN5
OKmTsc+TfJvE84kDcTzpdHhjSBkrNN/kFrBI4pXTBswcCg5SeJDOg3L9+uHiWhzMyMDrnBCPB+ex
0QVPN0iSoY8k/UE7q5zSJxtiSScYXf/pmEhHebPhwbpPnEj6pn5ZtlRR4NoiUkHtR3SQeeIKRE7s
x+ZuwoK5Llwf9c8sML+xf6pgANoepavi1pCtMz1ckwkSRPiWXCnFxvMDf6wjfjUEwYr8zq8/x6mb
DTTYiS3MtKZbubrvkvsNxK4k61o8Bda0ucDtf4xbm0IxGwp0lXZxyyfSDFSkintZlnHlz488Pf0z
jSWa07HxvWqRUuj3suUH23xlAOsyzgDJpCw+NpX1hNPj9pEZnUy7vRKVK/EqH9QxLDvboR7yOTaC
LHKEL+A5w+Cz+OiaLIoOVEVCH5gYQdIa0nBYVXCTjkvp3RTNAWXmgq13O9OEhLNKKijTm1P+aLJ2
3Fq6PsFAjutd9Njuo4o5tYlX3BjaI/YPMCjnLsKBD1EurrCfwvaovNKfSNhDRTnh6tLDexbM3/vL
xVYk3n+a6MJWwH2omb6tLCJ3HOixUbErr56FW9pmVnM1zHz2Q7xrbK0CVOeBRT0kZtvB7MqKoM65
XCuYS7zrF1hvCQiSVCWagW5q1+uuK1C77QrwHs8fPpUe5rrm/TxpKcR8iRRuAuhYUx4HthZZ9iNx
sliaDwKfckzrpHI+8C037lKdPX5/h3QUz4DYLe12pViNDLHXDmv/5bBmVk1us8W5XXmM2cifDkGy
co/ivzVb3ggFRNApxvAtn/RQJSq1rsmUFUVHlYUWtKEM+KPNNt1uYy/7lKT/vHj+oxatMV76Dn1Y
O5h/ey4zRBP9xlUjVDr4m25OwYjM8PINyxTDPAb1zuBkayKVmwa01KE+u63wxTxdSGLUuJfGAkSV
ywNhnHyUgDrs2te+OcB2vQEN+RwKQIQDomXBYoDVqWX9Qd478Cm2aWAB+AqFAKLrbE5k52f8hy7V
PE0O7ba1Von2EMKYgLLYwVwzOGlKKx4Y+PwNFqrmru5eRBZqMDfuFC28TeaxS3smPjL/LhKyEHlG
8za4f49lfPcM+Cfz2u0n6Rpfapt+bDx2uZ8iujd82E606wc1sMXrzfSr3ZstsAGjKscHeVIOefl2
h7wC63VcpvbEimZZdSQMfv5jAWhOcU77XDWDWwSLB2vNVG8lcJV0lc0qSkZJ0Blgbh9qAc5j6vnW
SP2tTBgzJB0SuoZFI6gVi8+Lt/lLkZyjzwcPFmzkOIWMCcpfEQz6JeKvAtMeX4S6GfMP91KPzjeM
GIyFSHWVPcL6Az90bgX6SJstkpDR1e6SND/4qjgg/D8HlKc0cGZiemw0QImwB+XwLR/Q1ctc/pku
P8H5SAwylyUeKox9KfFjtgl9XEBNlSEyutK/CKvWr/6YDay8ZywEgrG495bDcXI8oZ5ZZc2UkRPM
273xZxDgBDk0PcStBW1/CWdoaRfmqdg5vyRNubBqIG0ZhFZGWzyhKMDYEiQNBqbk2d6+LPM0jsli
6HA2aObrSI+G7mtrC/x55YQxtI3Mj/wZlllN4rdJ54gDlvXiKxp0ULqtnk7B0s6+UIatvOuVTW31
TK6D1kkRNOu4+wsyGox5SJ0Z6JTPhm0tcDIu6wP4rpgN7wQRfdngN68i7rPV8FWxdPPVsPGmO8tk
UXu1jyVx8UFWggEdJThRUz8CaZQhvjd0dpRXe+fcl2YTosLIOsNKoIwaljn945qA9eg0cUEZbJDo
ZBQyMIva0Zk70CnbXk0k1sRLC2Xl5PI6GOFKi1kS6AfF+4VeZX5AJlyq3/jMFxLvz4iVLMLNGNt4
6/BU+teyt64sORfLBPR4drMIn+KxPA7z7bIphYR9uj5Lw7A+FIPFyk4jwH0az7M7JjSGCY+xKGQ+
goadnamzdZ63luJ8gBvRxeA4PpnMUsix6V1MOdR04xGMCP8hjxgkJQ9CRILYq6gFGrf892FoPAJR
eZ2yquB7EP8pmSABS597tEMeOJLWNnjwZAn5G7LD0GlnwzYpsr3j29FbZUaqe/w/Cqa9xPFp5f86
1x5CRSeh44GYncbwf2CDBOcJfLHwWyQRdyN0dYfs5XygNZbCMTSrI1ypx7h5SnMJbEyT3P3X5R/E
DEf5gCHxTcp6m6ZsB+pwhcgaZ7xGqbznRlFqUVfRsUcilwiiHGrPsUtezLN8wbceVNO0ciuacpmM
LuV/w8YjLKM5XgRUBBPNAE3/A+nvhkqnxTn91TBdFFyhc0y7F/D2eLR6xqQMQtJobnY0GO7aV/vu
N8LmX0MQfHnTZlezaoov19UMhVH2hRx/cBlKk1kACDyS/wAuEbB51mR18WtqeHmVBG89gLv07tdF
LGzMhV/Sv9BeolTKbS/3TeEUutyNShMIPZ2IiQVh+8KjWpCb33jXydzRS4vAQlPgHyZoJ7g8dEJo
ClW6QdkDJTVAwnTn2ITl0jn2KYLeEMF5XuXZ/PYztZmpFauRGqB6KZZD8VFlNgfAQaRx15AzI8xT
9hOrBWJFOO1YOdXHYiQ9R896E1R7a3D2oWAwwmahmNt4qsioYvg4EUtm0XzKwwO0JicHuKa+X9ko
MDjS291q3Wh4y1UNh3EZ0FBcYtEmyu8iw5Yeh+WtNQx88XoAElzANKIgJfV0z6AcViiEwBzyW8d+
j/hZIEFuoNmO2S9+rUtabmKDfX1TgVSVLbVhqomj7BCJ/5BcV+uuoGvrIkLC/3vvmyoKDWgSywQb
qLDW0T0v75gaaFXOpzP+QTt1IwYWPewTUheC6qPVOS0XtP2uYbaXkHQK2Fx6zR8sw0C3LFYQdcdI
j//lzUQUskqWy3mDQ2tHhnkNIrXTsLoIyc7Gl3GL6HhuZCXL6aE1b1rlHZUkoNbK0+eVgOnp2hNy
Nh26Uzp6av2K6vnH2o4CcZU9tj067rpeR2dMqjNC05zTZgvuYDFfzE7fUBwVJD3UqfNx0GPvZjX6
U3cdGIwH/qtXCrweKu1boN0CZqWEonrTTE9gxNDkf1KBlkVYdQuOUC6xL8SJSEtUq4J/RhBWPtht
ahWzL7wULGcJZagedZqNJNDb/ohKSPskM5kGYuKsO3Qwe8AnoWxHv853djgOwEAf2nEC3A0xbbZO
mNaevLqhcBQMrcDx2dQLc8e9b8mMB/Uc/17hyMH+kY/W3krmr0fslhZ3Fn6w5HIAjhFXBDvS9RAC
urmrmw83o7OLTYjOENmHcLL8xLUanYKcTsarMsC4AGv0ujIeHkL3TplS4U3TQF0qAcPQvi6XCZ9z
6IJR3Yle8bksNBQQIVgIoc9dCVAxBr/pkYKrOOAn5nrtx0p5k0w8qZHq1rGNJFmTkTiiUjX8E/qa
saL8+MV1dNF//y4D25MsOw5Lh3g+3c4TB1k+DWTZWgJDj4tl/SE6pQw2cfNV/ZYHI4O2hzJPoJgX
nEeW+wH/LO1dsoP+HvUOW0o3fqxRYJn4Mn8B8gJVS91mRl1zq3B2xbUwf8jkuRZk7WzcynbR/Stj
z+rc8hAxZCmwQMyiH2Dlkkv6Nuw52BJutic5yzlvw9qmF+1tbbh0ELs0PSjTrkZI3vZQcP31kqXU
nvPSftRoo3XdgoADodD1OeGwPRK5LQev7tkImk+oezxIm7UBrpJ5F/ZkWDhUVETwjpFqMPzJyeOU
A126BC1ie7Ymum8g6W4NP+VjL7WYScbqPxS6R131vEA/jyU6XvOyYwuMZ2Kzy8HMPIht7Nphtstr
DneHr5seVaJxU6jBPcIO9dy2tW+J9OrzyNazdHGOeo7LxMY9434lQfNUi+frq++WpXw51g+3V7yR
7vpFmpsgjXkd9Y397hYujfsMrOtkEwhE8wzYYl+ml6CQx3YUvQ3pYIO5CppdFzHFnogfP/0XtlA6
GpOQ1RPtqsl2cTAsE9agP180uECprW7yoFWtRlCrv+HvIdkE40OluilNQL1+GU3ASHpeykZtyKfD
2nw99OxB1WIXPb5DaBovZgHEYa+/q+yO8SCb4k9InghxOZE7+sC9htrgGyf9y2UX5WE46DVUEOrx
LsUvhgZ9VCu0pq1pP4DEDrMpFo9d/nveQk3mzUY8rX8rzUG7sv1av667/d4FgGv1rSiFAczj5jRt
SwXPqBgkgtYAc+jFq26FZCnQYsIfpDbNuERVaZ5jaNYuAyEiQRdhTfSskS1JdSF14y+RhiHJv7g2
IOTyjm87WczUC7VzyRd07nHA0sfdfrH0aZSRjl8STAlrSKoPGg/hVaFM6KTC0eqeY2r0c05oF8Vr
6gNaCRwJQCOZFO00CPimCS3b9U36cCjxGRgATsEG2mN4mzmA8HuH3si83Ctl3UH2hGd43cEJ8/Tf
if7UA+iU8aovUVw82Xy/s6YgGIQDwycWCs2w7osKonIXHDDMMxmUZPWKRS9yFGFXub4s9H/97A/Q
Wy+qhaLKAsW1oVfOfDVzUYoAmVEbT2WZw1k+bJ6JRimfJ66N9FPKqJKuswPgi7MRzW6rsWeRluCB
4Uf0Q50KUzUQHjqYEyiFoYVdrAUwkqVNf7XV6B6tiSCV7XwXdXwLzgzJInLTk0cVqvFx/HOoGpCP
CScblrd3OkOxaVrnPKqN6Sx1Dmif2VUb2YpyNbyulaChEQS/Fcp8J7UA4x006Wh+XxSOYA9uiXm3
xFdmrYh88NPNM7xhygKd4VhBX92M0ibgtO+61vMvFIWYod09N+4D3A1GPJNpBR7iZ1oGTiN2kOUO
2MLxT1vb3Q2tHKS/kRPZVZnXs3TxCtNiAIOhk2PqrtTjwvopsnUckooInMIMK5FRJNZ2RLItX2U5
3B8q3xvlmVfcjf/tRbV0iW/uETSRdUMGPthrPk+KKltaNoRsGXUXxrWaMLp2rRTOgS6RjcPWSkrb
Nb4YBIo3YFzhTD8WEkYd8KzZWxIseF1dQz0Lneo2rPsst3Ycg5GmfA8eZWwrikqSCD8b+Rf2Ewzf
3sBmFQReJ593rYJP4riA9VeT7JlCsHD2NAob13EKZjKAJXTW+bH6LWu2mPjDMI7PLtVomAECjQLr
L3VKMJDOG0qnYbfpICptRgjOgMRfrLjBAkQ1u6SC/8f3670hfmx4EeOjInNNtK94DT/sVmkzaeGw
y+UaWU00khinELNmBOnuPjqdikklhLp82d2sqBhrazalrggHPsi39EyJZC2AYjU/B2fhadEGTB/j
STh6OgOHKt7NYlGjjQfbnNxWEuyGEkw3du3gvreLhG6dEgEJiwT5EMtUstgn6aTixjZttr6gWM0w
83MBQQhn2wHG5WGcmuakFnYAvUBbLhUaLX2AB0qS0dqC8ACX0n/y8TgHN8ZFNakcIaupi4S0qvAr
xH6VA1q+Ru3mn/lBKuNPF+VGL2q1P8v+dZGGYUYkzoU/5IMkHsCqVS3aiApQf5qJLfP7mdrQTeEw
KwI07ZUfrKcuDiHFqraubfbmf9Z9ePTSeJm0rXUjUKD7HXBD2IWzDkDq5vnu56UvCDVhJ7Hq+8If
xLU68/5xZSVP40AAlKy/KzBvFlfvtsAx+AypA2lkty28cds/uozFTV+IQrQV0YGF8R5hNl/sTLu4
p9f2Fsv5fx4KVorjPu4k+BQ7LHAylDgk+cAyH4UmNJDVhl5RNGR9YwSdumAtd5Ca5Sg/+bHSQUwu
7+Nvrt05rvOGngjN25nvfHmbcwy8Sgtwrk4m3cBHau9zIwqLF/SvQC6SwSwMyNRA35Xqs4Ld9lvs
18oz2sNscVohvNb0S3kwbMv34YU0aFgs/eO2vgSo32VqYlEhsNtYPs9tY7Plh8zlxFxV5ieeirNy
/PM1XqBI6Tm1M8iyAWdSDBGD3s1Dz7UwQpACZmzALWWnTeY4vudoNo+KaZsH2iQhre3ciCmgzal0
MLAPs1BLod6noQLCP2UxFhRAuGt2tQ4aI5PokVwu3ySMBLk4+chf0w0Y1jG89RF4hkV8M8G76rJX
nV9UupjPp6WlLrCLaoyYLL9Dr8wMiq445jaUfJPP1yY1ghotJNQhs5+weLbnX0B5Y/DuzPtwRTGQ
t2vx0jR/3/tcPoCDWVvYQRRzxskvbKVlLPPJyCCPlQ0Bcq/ky3q9OpcQhcKutGL9G25gObGRHikb
7d4T7nltsLy0e3QEEFszk5zHCRLkL1vlgoqY4VNsoq5M/Qb6bZsLwPozWjHArvORTq+0BPsJAQWr
xZicjolkVxJcpqavccMFNyZrNjfxLhhxF6bQ33lZKbJqUgnZriGKmmQ4i3ter2bKswcEUep7BB7E
G8O1q/pblCcLLUaUgMuoLngj1tm2T8Hl2oSkt04Uv+9AV64lWXTZDku5TzLEc7C8CRgxhXPjIgvA
Hb4e1JF6Zfo5TjWP+hSf6mIQdI1IQ/ipguLTEQYqzfcmaLUK9h/aaunTka39R1xh89EOtJdFiLv6
YgXGVXcJTUkMV/qtAvTumPMHYwPRQY2AwWhBXRrkWPP8nzCM29w+QpXKlwp/hYZif9C+Fyy39M7B
b1R1JgJgnXcgpdEj3XY01z/eHs1VUaxu9uu80xf9tltTu/b0QON4gvlNQoGaFgL3rRLe/MMTcxFk
WqVPAnsDUH9sxTtN/Axyc7D2i80e5/Ev+lzUJqQojXlW2uRc5qOSM4VHqkspANi1tkkpHDWSG59I
isYhu/KnzgYc6+JqMdpX53gbhBw60uc6XripCCUEDrhrVU/5w0fdQ2hwOLoTk0j9Jp3VHMT5y5KA
mx68Ph1jClgPRSsGzvSOzHZzTHzWFycPmlICrc/0zr/55Kbj4I/98gwZ6LzGo0HTvTlBEhMda1FP
VWvgphAO9YvmlEpYJeLvo6/x1kXGbiIhwXvYrl5Nrwy5CZSNY67sS/j6HMFsYiVLMTZyApOwII1F
W8vuY9AEYxG9E0MCUECPM8s7jtMTZB0JgVnxdWiuSjiJQV491M9pvhm1TJxmmEChNtqavuPZAN+W
zp6T+eCFKqSImRx6KFlddUHk+U4tRO/kITp0lLCBIxb+MHrzTY/p6b/9t8GyJ2YjefXUSuTYkVeP
DhOB39Q/aKNKH6BoZo0XWjnevy3S732VIpIKbZf8RTvi+hyT6Gb8SvJ62//LFvwiZ3mNoTjbBXX9
gQJYLZT0M5BAvF8yy7/szbtScDcAnCuHlhOSPTG0buxLcRWVgyoCQRfiOc9baNC36XLl0N8W+1ws
V+BAn+Bgw/BVKTehHEyGV2L6R/z9Dzl89ZaKg7mP/xkhwSiHY5O14RWXFXHd838w9DlTQScLeM+X
2P0y0R0MCq6AgZMlCBu44FxOnQIVtaCUG8X6K4zQr9AnEDhpAbsgBghXADuKduUlybQIhvbdjUzV
sgtOtrmP5x4PXXT69iOnq0bJtFUFBd2W6shLMPLzS3ola2Sc9Ns0Fbpu0k3zjnaplm7vMNquCKl9
JRx8RKlhS5NpOCcqQKY1ZgMRYM+7H0o8MKRBv1OnQyA5yZyAS0GdF/HvTB39c8ld4SWZDYs9caWP
zSS6w1+g0FKytvc6uLdilZl2r9lv0A0uHVtAugpqyqHUjNByZKh5qq+5ISBx32X8FE+fj07L6SID
YtGcSCiwU2g/v3w5eW2ggVS91gMuLFvvmqPR7qaAdzeRjwc7GWerEb9Xl5RbKYlrRmFGHkfVFuLd
chovgkkho9qIQFoBrbZaMtR0doFcRI5yuyzzCezrSerXbT7xRub/YE/s/jgqvZN7yuZSmnjKoza+
hmzgUbK6wYjtoD3vac/mmCPcyBOzqBWCoyyhUcB4ANLehJefVmB8jjYweNaRjY4Havu7X8SEc3Us
nOTh65CWSUJQf43nLigZhLxadqxVOp+a5Mo9ciqw7bUoD4byvIJZ8cVADu8LUN4R7S4hsF3iwc9I
Ue4+K625VgqrqbIc9UXQ+IfLKuEfT6gUrD3X27dqTCQp9BzvaA6WUlVxu1J3Dwl9trlEaU4LQlix
7X2IANM7JUsq97Xs2eP8nPprtuGisvgBpQib0qTuuS/7uOPbJzzIt5fJ8CGDUOK0m91C9LjwqAvw
tDIIpIsF4f6qL8TEoLVqpN8IH5soid/4xneaN9wZ3XqkX0Q71nWLr6KJH/A3n/EUFDUwYBIHaHnn
b0SUnAqr6LxMx908c4IXS1uaRgyab4EWSZqYcRWiTZQ64xeR3ra3DluxNSkjHofzbayOe5EoaQWR
Aix0jKDhTX/MrX8WEpx/26PsQpT0Kgp8qTGBpiimm6aXDXwXWO1fWMFWI/1DWPs5qdxZkRZq2Ax0
/ffiCfa0qfezi+7bvqVyga6h2EN2L0Ez7TN4dAu4C4TKpXD7liU2P2LFB2iJXI4zSmEsc1b0MjoO
Q4N5yYM1YjfubmmuTxKwaXeYidIFtnNK7ILZfePNQE9TJTFbNZMvjmc3kXek72GB69j/0rmScTUr
pur1vuUKlAfRIZBG//FNxsg2Bf/Ie6Epx3BgdTWq+Tr0E45e+W9ffLzwMlbsQyfYAAS39Ov+bnki
BQyO9llMel5kKWhtZ/4SbJmm+kji/WaM4azzzoPxTEaA6fL39BR1X1hbJn9VqkT+LHmUGtTUTyHj
ZadJoQS1KFLFTvJTggYNJp2XtHfNtfY4EIeTNFf4HH6XBJ0DLeheUM8oTn2UnBAPYBQ2ss3t4yAA
OE63xV/BsnV7BfeResTkv7xwx5gIatoEWU2G+8IzOHngOBqk5NAxqpnV+1hWYi+gaDsYs9JupR9v
NjMOLv5TgoszHvDSRey7ZP7NsLnwB6KunsCrCD96D3aT1ggJVXQ9pDbVbklMP28EriPkI7X1rYCU
QFrIhmgKdTwUn+Dsrk+alIw9ZwCPyLszq1eULw/+DwMRRxGrGc7WkJXh1VJPWC4rQTHxDA2jUkx/
oWcpHol9MCPTB/zba2g4e/szxSUv2eKN4Q6Yn9ksP+V/ZhDfD1nx3yljjM3LW2ezCWqQvw280nIr
Txf2mv+r8DYwxof8rWQz3FTpJE9RirAkJKRsl8Y0x9nXng+N9SzZb/WoMiQDJuyb6/oP+wDOdkL7
VO5VLGqqP0xiyg3s4EDP/DHUzYAWwLPChuDwCm7pFYEwp6ZdggcGvwFZxWPZJJEVAuw2/UuFY/5W
lO3TAs8qdlj46B9vTKhbPobeQl88dIJSS/pUh0Ti59/7+Iy4U7EfBDEGWdTm+FLo6Sl1/1wDiuwU
4odTgr5ICR1oBn/ABSofA8dCQ+nUck/6t0B/Rp1uSqIifx2PSbMj34km7yqqT1eAfZe9dh33EJXN
HEeyC1Q8OW7A1Cps1Xu0SpChdcN3Y05qIiIYqjNkZshdKAVDFdNyBWP8iQsJAtxPxQ+tYaIQr66l
dYDXbQhlX1INkt3ozFgcF9rW7rbDPvjSTmRE06az8QrZpSdw6at34CPr2iibSClgpW26K+/14tt5
oz01uaGIGSQMIptXCMLB5M7a7CBL8citu5Jli/HlvsttM1pq4xHS0YqTG4i3ZqB/wkelFurQuxZ8
kyinP6VzHWVbuPFDnZ+kvs09KShjjRfe0Uh0UYbqw0EFym5/vLbBFgFB2xntDG80k2MioKARRkYV
dqdJ7noRFQiKP/2rDONPpBKNMS9WMvnLD321UqWqq1dmkpEma1tR6j4DClE4JpQaToixGBgtRO2p
/1K460fyGWU3L046cI/DE4P1ScyU9kg11olY9g00VoEpmVJY+dOqbs8fUISArybBXNja8IvfeNP9
kLd79UYTRZVp7/FqHD90dLDjOko/R+KFsP5o7jwLwqa6hbbG609rKrl5C36vp4rgtsH3pMwDAuA4
/o+qa2X6pEpcA+4uER0beUzTlozancLojYP8RMpCmZxDsdfMM24Hpd+UUefEljrbf/I79G1zCvy6
aQhQPwgCAvgkDQOvtEV5Bc1fHd7opY3H4sXwXroIcCNN9o3JlPRzuEaQZgheLZaavUcxbdsXBcO/
n1pXVVGgHAUc6kevbK6Ukm4GUmf4lDztx+g7gcJ+NgTy0Km9TOKX7vGr9Jxj/oCyI5K0evqJn3ip
Yu3JuHNHiXJ4XFy++dItz5v3v4WVTBghz7py81dWX4dktMTLVDCXNyQfPfNBru0BKHzIzaKze1f4
HZDeJMmL3rjuN8FSalQgfTwZxvM57zdmrnuUWzDxs/TCoUwzpIGPkST/fkU1vU2x3T3XRXcw36Tx
V1HM49UEVgxaGxpJsv/1w8TYbO7ViD5NjlBSArsqo/sWRaXDXjZlOcoLV8el2kSuDClXdy1cMby6
QmmwfIuPUIPC6NZnN7DW5LN9kr6GKOSC/v7Mi1DgvD4ypK2p984Q8wju7TQ8s6ankajPxCD2E/hl
XvQXA6G6+zXGT1K8NT1vgD8XBheIAqvx4/+vvZBusOJvmRJpK1dCAv1oGr6Gci6V7aJAIFEhx4O7
Aft2JS6BjIOmxi0mB7e8M5s/G8EGKtesUAuMFHTWB38CCCWYsTtzamkccQZfMpNEQFNdhjSzyN9s
aqxVYlvpNZvGN8yj4nYsEbQQHQEZ3pA0RPrXpkoWXwwT0gnL4c7m37uzoa2ZtrZWbI2KqyH6lGmH
r7wyi7tKRCvsRlNv0cXWsiRjIA71i7ATgGfMZQh0Law06GOgE0gsSJgVLRtAtTpgWOVxu1PvCoDh
Max+Rmswe+olnfm1VucZmfeKvb0lSxjT1NLdR1dDSMNPYMXW09c2Gqx7rBlq9VMvP1Ujdb5lUmQK
vwLkW0b/UEWk9i3aHqLGTNUYnnKDGNusEoZioM9/3x4ATGHjst427oN+czTNbKH9ghl4dGZJv88z
3YjaUZCUB2eUKIzmnI3dS34WaRob7sYxhpv3k5Itye/RRpzu7wk0iOnxZM4z7LuLVBq5x9izP5js
YVXl1prf2ZPMZYOej8NQXJ3HHOvL8DJwD8tBFCs7LxW3nwx3LbGY7RX3oBYeWy5XHMe4CZ6ty4Sj
tfs7CffKxoxa6e+RSwFHNTN0UTRIO0euJBqv0IgXLZo8kl3VI+W7zsZJQPrge/b7iACIsA3Rz20z
EzHQbzKEH/mwsBYzdo2+tQ1i9I4HWBEkfu8wCj5DfitqaEfGN8kI+F+r44KW7DpPIjMpgUZjjidI
28FSMlmx6jyzXyimznsVNWqVT4wzwM6YnP7LfLaT98aSfXqu9E54kml7SWjDYQXmE6TPZDFqlxhR
N/V8MGVreZdh4eEn47cDunQloOn6pXmbdjhyAdO+UzRpejL/AZcAHcuwVBC81UiOreUy4vUCaK0Q
v883uvfa1y8pjpk39hqCqfpUR+V/CERkOgFaxrehZ+HwY3ivKmiL7ed0jsVCf73uP91osKxlNu8s
2Syuy8oR/NGBlOhA3OHcH0nCyiQD4KasMtN7VPdNbNpQ8dnPFWOE7yWzIbrqoOWu34Dcpuptl1+K
2/WzfAYSPcLqqpz/G3PNEa0Vt3rKZD2qvoiOUV3JUziDWJL27a3MvZ3nKjtirvKPO5KmptdztLCu
KmJmquZONRGRdtGwWLYwdpnatjVob9Eenri6OhQ4zqHJeAm7pARI1vmCW7tyncrWLxsHdJRkJR0u
ePCxeALgDhCONFxXkAim6oR5n5y1F5GLODU15T6pp38cBNS1F+YtDpGRqVZbDWaBIQFQQJpn6Zpg
e0zgy9qXnvR/K13xYDjQj+E9G0l+ZKx7uAnP6VAJ6vXk4uoQnVmWz0N4ktkS2KF5BpJZS2uEYoRc
bBqSB/Ck0lCD2vbsn/4A/p+09EtyeN7eUbPy/KBBhfQN+bQ6P3qQbLqEvQKoXpEDeV5OuKLgA3Tu
+EdHHNUBjQ6rqBO0SHR87gi7FFbr28Dstnp9swtI9ddm9eHkeAjjtttmMOOEQ0+qVRDLgqN802MH
5HBfAKwikRIVHdEYs1O5xMPC77IWPZhPzqS0Xfm2YDvxfCilRlUSoXuuYcis1uxvDl7z0wlVcOnb
Oewz3q1AQQc1Fcmx212VhEmOsSICw0nbVzhJQjZPWRr9KpW6KdkwNOU2LySM26Oyk4ZeUmE551RA
Rn1NA0zAIMopLXdgmPKB80ylvht4NLAVjz9qw02hnxNVpkwVjNIEyNrkM7buDGlKqKX7VnPPka/9
7xF1hTmcpv8oWE6a460ZAbv2aNYvM8j+Bv9fJriVNT5eT6SES3k21tEc9zAbrOfJSYL15lHy2GGI
r4cdm0kcw/urqTLBOWwaJJM9zO73WjWXhxQ9b9FzKpY1//2tcQP3eK2pdnFcCrtn+N2tFOFs0U4i
Dv9xoaB8pxgnEUNHpmvg/8W4f7I+8j3V1G3QGaCeU2QrK2U9/F5BHYAApB+kB3mNzXFBGHbBC41+
S2LSkW+vzVD2DDYoz6NXqn7t6oO66GSG5ymeEWee0uiFJTfohtPkuKy1lZgXZdu27y6omATbfWXd
18g6kUztgMdkC764xuVSxlab0V9ODgJO8z61WCD9y+p8gBVsXQr+NnMqUi6UB06xWDXwlZKPHLqD
naX75CP1kswEkql5Uep51Zkr8xkNkYHfRwtCBgfAujz8bzWqzzE7jM822KGhduURpcPDBFyS6uQ/
aQI+Vj2cuPBL+HMcoDKemjEvP+dvgYcyM59gkcGP958ULQBwv0VsWsrsLOf0EGkWZQn1SSHEUz3s
KcbH7lVRWq2+Ktpgv/9DujlFOVGT3NFuCPXINZ/FOBBbtkPnN7NV5uZS5CsQh/3ZuYyY1HMvdQDB
B6lslfR4qreXc3RTP2v/XjX6xC83wERsgKh+J5yU7bUDUCByGpGANH1/tkvOyZt/FY/V6Bg8ipA5
lcAfKw3RA/bLvsfepGHil2vJ3hz+Dto8v2BtLsFML4QPvrVAHEaqGV8vA3hINhkwkszs8RNdA3dk
CWGDEMgyD0rwU8kGw2lY/JGeYiT5tVqVdgEJbmntpFUBLIT8z3nhN1jAfOlDimE9gA84TUdrZkhc
oJ3wNdhpCaKpud171OIBn8n+V7IGo/8kpi/V4EH2tPVLPbGxISBdsxidFAE/EBKWl37+eDZS1yH1
6AW/0/Pdyp/Lxtw3IF8A5ncErU4qdCVmYmi5qLEIeYx8wwXk/RaXBnOLARzezy7X3ltUmeLxAxM7
I83jJlSN8qWu6kPC0PH5ZqDHWHIg+jl4JYpdlrXE/S89wV/54E2lcl14o2IS4YQHIrPNSufTd/uY
YbtFPwHO6iwzxsaLbdWsCPMyB25tj1eINUwvmP4jYhurPqvxuQ/gO07S/AxI9rTQBypbkEOuW/tc
31BZUDRjH7deYu3eEW3liqPY6CdxTk40c/Q94vtgaWznzs8UEeB2qx1YN4h0Hf7rBimjoiJUdqP8
RhCkKogEeqZ5qwTWUWw1n3OkL3/qWASvzLJyAt3BbzxxHAknU2AGGWgALubsgzI84yBPNvvikFef
JFYTVwpwA19ujKbumTh2sAep+IIaKdr/gXHGn2afVB2OFgbyEucXKQNlTSx/lqS5tI7f9nBaEKWs
3TzbncuzsWzWCR/B61AHm//SZC0hFlcmSJE36a8GxLcn556NG9DFOO1rb3hFZPHbHxeo/Zb8h429
qWXYKAxH+fFRff8shX8vQ9xxgMnIJOccSGkWto8e970/JE/yf1eiLZBMGbdqQs2xGq8L6mOVhnz9
4FfJSNlte7/mY4pP4RtiJGZZ+OG2Mt1I52zL2L+3p35qSpvBad+sNxSyXYRNbDERkcneiHEeye05
rCNjtN+ly67aJtknl10zgdOT2LTGSr1NawI5RuOPSDhwvrczGnVR7NvM9m0hQQzqwjsSUPBaolZi
EJLN4A8f6zb3NN8VifuZtqV5QP2y1VJP4AsOOVF00rAup/vSsB0RSCPx2sU5qwLwJDggi9svVgUg
+2gKnlUqIgzFdfW6EbI8cBiJznKnRY7ODCn5+qCUEdQcfFlR+p+pUSgtNVf7OghXnDlMWZPmTq4G
I6Bh4Z8qU5GhtgfIU3dBhgguAPtV0AY+dFiPwS9w8oMYbg2+XvXUTpXfInitaUwrN+086hE0GTM9
DLnjxf6umfvLrr12y6QtSJfUADdPrnwRqJQEeh2ghM8MHp7OfaQKlsMcFZLUYnS26qGLF/gIuh2e
Fkt5S3NUcmplErS5E15eXajbP5emltNlOSr5SIqRo4/GwIhfYVsLY1DmdUZU1HjV/a6mUSe9ukVL
hjywLyht/8XDV3K1crwquS/V38HzV+3FKvAH1sb+42+l/GQM8QJfGrM7l62BqEG6zMMdc6jPY0wk
+qY7QfZB+U0PVV/rkVDpu0YSAF688wSGz67supXK2SmveCRodtBl2xlalRlIjzQ6AvrXfCGevhNw
TGwMdqblvOrvnSMkWPxFPsmKUWSBlrtalDRps8ZTJYOUZ4g7Gj/5M6cBGtcuEZUOUH/9GmXIKyAf
Br2NM3xF4pG84X4JQNs/WVDzBeq392zSecXKtLaoqnbgGrJygo5QjowuoneiBMaMalhqL1Soe0pG
KhxtkGQjJnkm0hl+tqUMkMeZvDAsBic3SU/KpHmuY2pS1+/xnc9BJykFwb378hRdVxRzjf4W/ExL
ME+DLXP8D9sx3oT4LbLRRXmWKciCNIY1vSc17Tfy9M2KJvO/VwjC1XeBcdBqM3gbvVXlOz39tM54
jd9/0TQXV+s7NtLdbvYzJbH+LLMZ13WPYknRqoUojpt3S6Lf8Wy+/ciq0ze/M2ctHP8DEz4d1GVl
SbeG2pfKFeZuUXSoXCNSw6I0PpMikgsqPbGM/MLa25WVhFjAaq2iORM2ySGtZXWFp0mBl7XL6ZnN
DuiX6yG4TChJYuCH6jrMRxKh1M6bfURg2cQtQf0mzkPZ7uozPJM3xRkQtuoZh0Q7rw13id4pBKDz
gpw2aKdEmWUaKestSlXDhS8crafIT3avK7aGddLb+7+OnNLV1gNUdnW3nIUQTptxF0ymhAf5N1py
3rBKee/RVg3FJOdhPDkprOf/qJ7iF8FXPI8euyIqnt7C++Rekffcx03E2PfUgzLkeUx3S+KSc/hx
0/uMhTiRH81YbtS+BxG80RafZmhri3mMZLp1v9XijDCwzKKxARqBjUFwVsgOURpVRyYFyaO3ZlGS
r0qwmyugE5L1Mc4M3KMpGpWHDvRNfRlH7OxBSqrZ+A5vX9FiXNnAemzcEQBbyF+vMArLJVrP+/VC
/ElwhzmnQRg2GRPmOkywtK3ilwX0uLFQT5/0ZC+jQ3L+Y2YCKodftmg1dfukbRryTO2H3me6W+DJ
P2zxkq71rI6OLQo80HQ1KahD2W1Sn1e3+gkXgUB5U9SRiBKoYBevcQJCxw+jkYjkQy86j5BvO2Bi
0oGp0eFLiy6GlKlf7akwL6SASIOxrK8pYQxdc3AEdSHP4qTBS5BLtfkL0FzVgvDoPMJExllmzK3s
mqrpJsWpSK3SKcPrfFFpWKpjWw3Ax1BHV6qdygS855Y/poyVAhSlvKeY3Ybqdbm8doO0s2JjjFNp
1fj5S1hlxspuYAzFY1vthMKDTjANCDRC02kybZ2m76oFovi9LIy1dlAsYHTRTuT5UqjwGh20SyG3
Dc1DXCanE0wy5XwkqHk1zd+S4KQvO4ckjNBrQJRqJQZcnztA4DiS2FcAr/26OXaqL3C8KaKJvNE9
pS2ejwCoq3C61XDUZ1XCQb/SgXzmPXkbOPGvx0In1CI/SwiNjJ7MAhn7XjzJhpAGUYl0DdESBxzW
UhKzyFsOQJfY8JcfnTLGgudQPe+oP1WEu70+p3Kp+kGcYCq45yTXKK15YblpquGIoUga/+Wa2EHr
Gk3SRVxk7pa51Ak6dVERHdkS7sm3YuPi5YeYJglx4rY3p3++hzEALLCX8KagUOdz7x+c8DVVac08
BtYdhajG15J+hvaeIiQkc2qdQ64Kmh+Q/Hoau8t1nEC9X2UDmvsyDfJyKKVPoRkW+i05o8Hix7Pf
uVCOCUbgGwxy8Gdk3jg6UeNVC1c4XKdwrARDtnHjIxRgJWVXCpoDa2LQhSsboEqCWjWG2TRrPieh
/odrC+WrlGMtVIZFs21gDBvFGtUNGTAgFTsfdwkQxR2VrNCOb9N0ZF2y938zGYBUV0LqTwfz+Juw
BL2w0EER/CfyFRpJLtm/rTAnZe92hjqPXilUFvDfhB701hsu+R+9WCmVrrco4u7IG5lZENdj5xtl
JFQvhMoHDMdDa3n6WmxRqfWHBiWt6DLeTLowVEsxMZxZx4SOzY1+3S0yS2e7Jc/6X5ztEAgwqlDr
OcGtJbI6nhz7cqcQ7QQrZ3x+m1SDmwV8MnzDIlo/UjSnLDT2zlKKc+t2FHOjOfQQIUkRuKFoowI4
n1rOSS9T2kCwXUmFd3dCJxeZKPSKALfg3pXuEgg/wjusjbMMan/73185bAQzCBjmekwpW1pxZi1/
UDAM4zADMkrEC5LCFv3XhZEcLRUAcF6dnLjO/25HJK03z1QwNKoGXmr097ljXWoB8+g6UBAdjZEW
vt2GPTOybxAPZhxCXQyon7wpTGBR4UrRYcyA3Dy3/wWyVeef+GMZqyhzUBwGuT32MsV3J2pJSLOr
LgzvZ3woub63XAD9HtC58ND7tOEBKK7cfkM1+MLn2KPIVAN3eI6Ibv6PWPdSY/XE0Mm1rnfFbXOk
jObmv1oVmxob/j8ijiuvicMLlQ9nyf+yE533d6ls+gkIxzZgmWPMfVFrIyQCkiIcmVnIg5xBP/uK
EjESGEM1+bns/JZ5XZJ0/NgTxB3A2JTld/pJwYHh+0YnXOlW1k8IKD2RcahwbU0+G4xJDe0TdTsj
IVAyKcW66itRmTTqdugFMBhg0MLFZkrNU083hxOIvtTpYgcQ18bHtPsaHezkcSgPUq23V/CPAUan
V3gY8Mqp+BYv5trk4mZSpH0AuarL31lIqsDzsSrUEDnZfghgh0mD9fBXAQP2pvG8G1RUavZKvJ5d
LvQS2XTAA3Sz2r73TeKALyoYE8V8Dl4f2cdTczKplGyJr/2OBXOjqJjON4My/BrGx+q6gutLWsbO
AjDaogNFtP8rrESW9c/GMhNOJN4tt0EunlYzpwVmREmt80Lt5PLwZZuhrZ7p5/XSY1+cig0/8YJN
yZ8djW6rbIoUBgcYSFMNm/Qjw6qbB4xbMWaYBll9cuBUw8ntKqC1zEBKpiBuitYPmV51AK9REhBm
13/jSlHf6fLqSnuj0cNjN3HJrwSAU7IkkNwDiXrpk0jm4NbPyXX06xVDLFqJjIV/Cuu87LYIKK0z
G3eV9yxHsmsQY2hf9FT8LNXj0rsA8SlDr6neQzv+nUDzE4MlgRDIOhqwH6ObeC3//80rzPlm1A0r
CLPCeh1onmWmaiI6xmz6+JLcxQS8qWAVUBV+/UgGZfBpLYtlNqr6cGJi4dx0d2GTIAF3/4fuXLZP
Yb/WBjypm4niS5XXEHLrRlTwbhSe251zAI6TfjNdc6VwVkIVnPyjUvZsNKyU69LblPxf4jByoWdC
TPDYDGdgyQfO2ErS8C1N8WLS6KJl7CXNmeY0lcX0L7LtXg4HZVoMOoskX9VdTChlzSD7fKWk55c3
/CaHrN7WIvViz+lf6q/+2agtJUNOCA3qlOXJ8VrgDzMPmMq6gGAmU7BtKqYuLv5nnjEiKl9Vlhyu
SrB3pEXLclW/hhYbNPxi/5F6MLck/SrfSwHjaUP90u7lx9OJwQsV4sPI3JISqiFCHfn7KKP8PvwY
8Aqhr/Ert85ZaNE5bhEXGV2pXS49QIiOzyp5wFJzzrV+DKRIrR4Z3LYjf9iqNTlvyzou8ucSzbwH
VsuQiF2/mp7mwGdm5qUIbBEo6sTYMTI04x9oO9uoPCEycULwZWr74j9JvYx7OlCspzSZ2g95GFZ8
6HpIlr4EWIuNjJ9YRG4OP/spC+sYOoEdGVSYUMKshsANH9i/NFMNmSgEDfo+mROSyFpAEnmFMGl7
Ph+NGel1Ei29Qb5la6oKYUuVY12irZlMQeXiTzijbTE9ced2OeAHpE0uIbkMGFZxfVYWrlcAFDJ8
n7YcdlX00f5OWBQmAcfToYRRSS+wCgQDW7Y9XuN8Tcu67/KMourFBjlgV5mtOfs+xl7ZzhJdElTD
U7ig1BxVTd9KdDoFgMu29z4VNosesJqYbciz7sH5SkNmdO8Qp1/CWqaig6J6p92zgep++9Ml3GHD
gUBkDb30zbb0j314qno72r0WeHvNs33fr+maHZHaZIlkCLETT0KrwttmHoS+v1seN9PVWP6MXY5d
Gm7mgJeNHCnAFhgR8VunekMyUJbH6X9ViR9zHSBdobNaLQKGp0yHCa1/t4i3HtLWU7i+ubV4NzVm
gcbV+1jqR3km1uJZo/JfQEuqqhrq9dLBZ4I+sh/BXcmIg3qc5V+JnSL9L8n0KYhp4/dHUGTapA1r
1iZs/qC5dPLxov6E6AHSzpId7gYQ6EgrGZ7i2JFr9qCbK15Z9KAsB28nLiOhD+436qMNJKFQ0fMu
Dl+eEXgpIJKDXiwYZGUD+7KAuZ0BuJvXouScsi8hervIa8DLDRtPInMmQic/N9wCBOJGDb6iBqYK
ClBe+UFYatv8L2BbONdjv+Ucu9+qb9ajjZPsCJD5ZD/lPo7z5a7UJL9IVb25YdvfaKJZ7DuzNuP8
ALnWpRLZkrGxmrmzvJX7iUts9csw6iRwCp9PeK8mnKx7wbdeCsIzKXcsyb2RcvTLnK2Q4ArpCqCd
K4L/fVd+FKcftqLxL8QFfp7d9gzLTfiiQOQMRV/auem5EBw/a76PLQFpXdg5egZt+P9jcUPWpZvD
UrAaxJ/+4P9o/fTa30py/dw+Yd5D1KFEZQ88sBZ89xo4zai2PW7sIc01FXqD9CCTookBN9v38FRT
zyS344mwsEf5D/r0mO6ozQLIOsySnYihrVVUeDKFMQ9xkVsYcSSjp1iE3wSv/WNRUTsjESdVzcpd
I6CIzmHMfGxDP8u2Tp1c2g44dsQMWZrgFfsZ9+wBg6k7ghTzydE7/QDJS7dxOhxZ1CcOout8iGtR
CIVeSSNrFeTLWtHUyRISkfzuy+b/g7DGozLU8neD/vLliDtayj6AU9CJ3rA8dhZwf7JlC/djlSGe
EMRFC/EJ9hNzZu/J0p2cSbdpS/rCr2izk8P41/kCL4th47s5nfFXvJOBpmlIfr+ECno+0uhLjSyL
ZtzvJI+NtLMjffyckBhHKuPPm+kpF35SnvpjhqukrZVsesda830y5jiAWvo1F6gz/eFwzM2Tgpvi
lgdUEZN2Lngpfgu8Z6Ym8GieYaaqa0CMPItOsdSyKW5xsomqvWbACH7XV/Ho8HzSs2Tzy6txHKQ6
M9wb5cHZaV6aObyw4cPxMHxMV2v+tx/e9iud3/4TpUyAulF3Uu7VFb4xVr8czHPKB6CBmv98QD16
/I5omDMaUwHhhmNqRYwLcLo/rb40IHc6UfVCznHlGAgkeqMfiGDtQWtegy2BKXtKNx8i4rti19F2
D8RuRhpxThpAkICc6ofMql3aBeqlrLWPWCvf2u63kORXV9xuT8LP0qkJ/cjTuYWsvO7z8XPc53m+
3xROwed/9bh31IJWbpiiMpAMaKPxCSJirQCIJltk11nhIQTzXwbCqlMROs1ENlOy8IVO1h8IH0Od
3lDapntkHR31AdPhEHHgAVcq2q8PdgP0US/aeG6X4ODkwWvLNt+8dthfJlAMm1HZiRgE+71tbksD
Bs6jDVO3LOELPns67apOgXBKWvIc/J6+iJeodi7p5c5y9CA+4gszL/Cr45JkP4QU/OeMURWL4Svd
5qdpQFXZlw8hMB2Aie53k1PXDr7PozvNvDJetYVpbM+v0ZHS1iil6MEK5VLi+oqyeQlcqsyBHynV
UpOIwZojXpfHBj8MMANSZOrMov2mo0DskwZuK0qrgQ66sP2+EL1lfOKoWRnZggd38b1iiMF7xSM1
ndxMId0wVk9U+atEXWBEfJSfjU+oqwv7JjGa42r0jD1/A917MP+BQwLnn+631EZbmacOpJFWRHht
DpHL0RK/HpmzpokdnUJ1OrnqA+Jp52E92csUgOv/GJCMXfCCyKVIx9Tl55DQFS9CkpkmZh/roiPq
9Zh33+xkwh3O+6ePOrtPruJ/+czkygBs0mQNq5QpacEJQqmIkkx+wMBPZcZAHMooyjv4fjaGVWyV
Zq6Hrb3C0HKwz3w9HpFxy+/xWNfVpiUV6S1jiBJH5ugExRmKZM5WCpE7xspOlNE6ojRITctjVEqz
EJmga2BgV86+a+Mm5HxI8fmJiLBSiCJko3rMlbulN/CbcBKZTqec/ShOL0ureTM4o6u8mv2pZrXZ
rgd14hbeDM5HbVR5M5O3GGQbZvg/YjuaxvITnn3+6nMafD2JWZt9hOaWs5WJAnKRD8g3w2vVRKHJ
4Kw+OepS4YWJKQC+uF+kNipTGs1y11LiaoSencmfGagpTgeyXzGqMM5oOEYXkjPFNYFK4cl+fOXz
b+ElOv9/1QTnNoLm4Cun7y28Lau7IoWHQhSUoAgc8mZTKhI08mOrBmii62VUEbufIOmOpogtQfAo
geSXsVwo1r5zjW7Yp1FlNqvCLEMNv5m0DR0sv59KhocdDlLGzQydm5Zh1Ei1AsIH3TRsiUZ5d0Ih
H8Qsl/6LufOhzLNdxwhcJDgKS9Ro1uOoiirrrUnBfw/LMkrOkqAqSflNcVV/m/tPo7bo0jsaB03/
J+RN5mQ96bOxQRSg6YnvD3zD4DR5o2n7k9s0UxKA00Lrg2UVxIkfIRDiXyfdlm8ZaD6I5zvqfSfI
Qly4IjowFqRESFSDyH/2pkcEmSbjbu/Wr5xjbJXH/crbafBgSfGJtXmYZwvterGr+0yLs8OGWyaD
BhEwki+f+D0CeZnmuY9PkTylpNJt0b3cxjya8LhwB9AB29WDXMmlawSxWHgrPFFhTmlV9lbpzrkQ
tjnpfsiJihSCQxMipRojhgO9WFM0Vl3YQA18VWaYD9F8R2lzv0xRl1bIrKvxcB8y3MsAHnkYPhxF
6NtXJwEkH8ENB/G8Vt8DTk3H6xluZ9tZfwIhTxpGtUHFflsR6R4Bv68Kf4lPSzP/xHmIIo6rU8u7
4Gdt2KL4W11IaTYLtdgZNMmC6kGhES5lkaHvloDtAPXyJxxv3H20cZO3H4UBdK3nwjGD0C7GgWCA
vsjBW+Kh7hdCNqCdSebEvI6vhR8IdvdfbedWHgit0VLLOT6hPexebFHvsioMhKUwtdGlusK5Lqg2
iE7ltwxtGOW8pEQ6jt7FVH7yD1g0bnE3T9h9JE3cuy/XlHDNq8b63bKl84gmIE/Hce4WRsdJk9iy
V2euYZ2uDP4PwxVoSt/BD8R0x1q9d2c1TH5K3GOtpUrr2Nz0zl2Y1HlHOmmo2J5BLQvfDVC3BkBw
r11GrUCXIaCL2ACchuDK4QwPRCzukLIWFMb/N1m+CeiqxhD6hQCiBWgtPNiILMkBqWzZ30Wb5oLD
GkItBekXtL2Qr5CxPYBUeL1BG9agJ/Q99QgC1tgr7jdvNUewMBqzCgP0XTFg53eEhvnS913SxnK7
Jg0KEJTxTZgbfcZuKx7sifN2F42XxSNIMDeQA06o8syMCJ7foCiFQo94AD5t6GrDy+zWsyaWZUzr
wl1pKUj+fPQsNtQgXeTbrAv9B0kTMimfaNB8Itw3CnGtYJEOdRLkxRwjV1giqAuR/IbWudMLNCfI
OOvHIzsy557qyLmruRfGjWGn83mphwmwguv3Ay3jU2eLO0oIdQE4CrajCC2kLjdZgcSIuZEsmnfN
wZXJYXHgtPZYBz+p2iGkZ7vJAC26SDqytYzfWGAxByzLDXet4DZ4ESFD8YvVCbPYrRGF9shKzc/u
ex6TlwnHU825fMOjrILcvdVA9IvpyH5k8Aqn6ePWYfoVNISQR1Z1DNzvQq5vTuZbyU4o7QIQLWiU
j0nPhUiXLkUU2k2q66rb9p0mU/XvsJASrGx4awT2MhwWvDy3tfZ4jMx6aDAydQ0Z+NjWpybmqURz
M0MORFa/KQLjhqqJjL91nzeuBu8kkbfY0tsMbFzejPZZAfsL2dJmq1lrinhjihmR0rpP+iMyosPE
oJaVUNTX19I6+1wG426s7uO48B1kmSsyQAGXXk3CmOXAbep5sEC25OJFlH5ZbZrq47MNwmRF12Cm
gr1sdL9/bOcdMEjvtftCPoS6cee43fmJtR+mzPhNsi8OS0+DsYAvAKw20iDnJQm8ZJy7HbO3Sj0M
Zk8YI2dfrwsyb6Ic4//Ih+K3pBrAQmPXXLDONPkE+6ng2hsFth2vWCp56qKTne+yubXyX8sihC67
BHOk2/9vVy+SWF8ijMgd3UzXB4tyAIlyIysn9E2juXKJ2L4mCks33ydUKItVv1GE0r7qAZutbfmp
eYOzfC1P9AkTLSBsDJ2pDR1FVpiO1AyN9pPvNMhfdyWlbrnHNS04PxQPqr80RYHtJop+x34vZxgk
JgKK2bfDrCiQKBamaJLiodKiUFB3dLbkGo3qvCedHhXPU9qoc0lzmxnzo+0EkvIs5Ro5KsMQOqnH
k7LqI5hLJ/sjCiOt9rKaWzDVoSZBcHd/kL1CVEXUOUwtNh1IZ+B001sW6yvshcKOtWj5J8jJBFLU
/VfBgXW7gNogLLbDR7u18HIfvjrQEwvsuPC300aeKpcrs97raTxyYLYh/kXMcYfR87kC+BTW/4H4
pyDNeFASAHQZKKgv8V+j9DdwQ4+v4LrENPTVEwRc6ldHKBFHcXog8VbqcjwMYlw/vxQRjerjAD9r
hAm1FUuH6/P1KjlcxBzi2vmCkAXJdyYSqtsm3vIpIfBGfC9JozjaELk3pSN4y0kKeRqA3EEHMAcO
Q0Pn6H6XnM7AD08HKwjuQ9eDsDaNg7L8w4VJT0n7a3HXQIoR2BoGmBMGS7GmmeGU1h6Crkeu7Ppp
XHjcdtLCOYWGARRLqvKrnXXg4Lr8h62NP/kh6RvDgSbxB9HUsZcsKkxkfDATelHwjpvWO47scg0P
Q95Eiqd0JNbgFMNstg3XbUNZ2aEAWZ9U/OtaR8zLMM5r39S6bsvs/seggs3tXh5R9D6KzHSCvNwk
yoVo8sowZa91NgbmOquvrVkdgqKOQceCfhFqH0mYih2yBMOSfxnjColgg7Gqkopam7oPSyg1ZlI4
AqZ5bqTRPem5t7q00IBNks8CSK3rCMQYqRw+jvtKKbYb2TuPsqhd2ruyJsQUbsdeziMmYrIpFTjC
Gick5E87gfy1Fn8fLeW5m4M2H5wHEjDUiFihCyq1G/ka2DB99fVFULmYtNTUltLWdgVZLXm4miJo
0lPCkXlhHSPZ3ThtMaOqpoeFH3l9ubM0GUXtWpXpc2+dXGbcsLImO/wJNlPbhtPLv2bw4rnJom+X
HUAUCF6uW7BiZ4vAfajuYJwgH9z81E4Ek0Ndg20Av91mw1TvxjhEkfIeGWQZB+M3bHSwgNp8atk8
+dBuBHNLeZ2SUEri5Ez83T/yJG+8A3xjb4KZuL8axz24oGR+Vj3qbsSYueTmdSqjyoqI1mGuCZTD
Y2OizllFTQZiyBlHtizegs6GEh8gPMMavEY2WZOulbDhoRtw298vexnRrHNBYAQWkv8o8BiiF3a3
QaqXcG0Dw3wOEXwzGsn5MXPfJwQN5qCAH8xzPjmWGynUpJdhiKnYRHLzchNVIoJXp85wXDbD7Gk1
8jeERgxKHx9H1Pz0RKg32ZeI9kbQ+8+23eXDcWbFGelGg70mFTQkYSBPzNWY3xAx6af+co1A27T0
hTN3A019X18AWOzC/TgKH2Bl1011Tagk7We/RI8BMHOXj9UEFMXgWVIYhET2V/OUK31Fpuuu07uf
gyU7ezAE4OtrmGB775Ag5pdDMSol+gdHXYcKBw7YBEkBlUJXbwTctmRa0aZLmbZP9MNwCCjxXPjS
rhBpcw5us9sSXghj3JspBADMWOu6R+w6R3OGFUur+90ysvZ1f8nPYOEoDGjD7cM3UbJDJ7LVCsZ1
bDsCdTPjqZfkS9Cnc0ZDCxxOHJFrO41A3NxgirVHB4wVuKvVkBBz243WtPniB0/nD1w47e+H73BC
LCzF/mcVNfRmOzfcgcUGCnkTdfJ524t4nh/jRwFXBTDECKlwJ9uWC3wogfXtpc8wWDOkxF4pq6Fx
K3L6lQ89iaJjrHtP/1HrinRd/ErOAWpfMpO9V+fLHbyCiiGhqPcp2Ms3qfvZjWWF2rI773/Oaedk
V4YyESRzFyRXE1oGrXDijb8czPM5dzQuA1HXhC0A4U+gthCarNSsOqVgqyTFUiu9cbZlJzfh5pMK
eFmLo5OVjo+AO92vzd0X7xVObSnVkRFfq8ljapXa9pS2n5Sw/J32jjlFK9muyIx6YEl61K5Ck3FN
hETcMPIfPM3s2K+il3ZKWKzzuYnAFVZKTtjLfIZZ2k6yfkP+wkKOmZVMkNWDEbggp5TRLobekEPu
kYALC8jt4lcLC7ZvfliUmKRvnxcJpmx6grHYeojeRi6w70vQImZnmQJY6JeelZ5XzEvYB6LE/nko
qtSxcA6Hcj9onbsu8mV1Z4wrrw3PO+ndekbMjLICC6+nfqXnxhXuVFkvJMDvsCHwcAqje60RtLwU
cSFaq2zuT7UTgMc0vkzAG9uF39CLQuR75H+l4saI7FLlmbhfBC9GiMK+R6FTPOLzFD4qhuTbPCtX
pq6Hx1Egl7qywS0skgSrPwytrQhg3gyZtIzggBOjR2s7039YCkrqBFqIweHhwm5zGqNmKVWrzSCZ
2xOaYPE44STwBczPGhuKJS2a4XQebaS4UdNEStGZ/PDtn5Qp6kYTkcU5GKbnHx3Ja4fEdeEb1clT
tzohvW29chot6EUKFJIEDtj9bLWBOHtm3hX9t0KAQkBKY12SgFJR6Frw+55/hHsAYz35YJYTdHZA
jWRzxCNnE9TNx/HuIkuHafTnrPEzn7l1zTY08u3S4FrEq/kjuwskLxZNKA38zPaFHwGocwFdWurs
t1oJzDRCriZI7AkyxX140fEzvxuJVdvvsmNH6wDkivp30b2PNKjQMENHYzSWly3RuH93Ss/N55gk
UK1T74bl+XvTpz0bdSD3BjpWREONlcQuG/3jn04zd6g0NVwdbb9Nd5JXoiRPRowvjB4f6//XbGuf
1m4zdG1Zt35D6m++0stohcSLeEychcblnNRf72RmmCfglW8KioQaxVCOQguGsLKXpV9xR6qTlt28
S8u3DOWWqZSe46ntl8paBozkDwV5adm3g8mDRYwLyJNi24v/XBAmkfX+1QM3frZhzyyPpWOYX7yA
LMzLMAeHQGO7XvL7TZfSSzZnrSKYpz7Tev8dCUF1/Vn8SmF3tJNoQYPaXZt0Orlf9O8NvzIFRELb
38KoroxeN8H1txIm/5dw1VE3BtzsFBIJw5NFgtpfoi3e+sVytyr6cLZVo1EmGortfFPOzAgcvSyT
msGl8xJH4TlyBkSb1imUQeX/dSmMYW4wiB4wqOsqIumrA2Fw22ZdiGHV/hWrCjGamNMq1aaTCFu7
th4ovXAzK5BfA0LZHEwxo8ebwhN6sMmhoOeqfDNpL6Roplbud4QL/OB0j+L1M+2dDPfWh7nOKveu
9iDx58K5t82Q7pAwuR+uJixX9LK4Z7yv+b82tCbkl207sUT7pgD9vjRE4gmBoTWnNztcYHoY6jIG
0InKGVlAZ5/cR0I5dId6FHE3cbzFjr0BKgZ85EzU46Ubvh2WYCAgQ3fdAN/EfE6fU8lJrCBocICK
uirCLT+efYognVQYVIeT8Ptno6RpCVea9kIZsCna8RIm0S4QWThWWuspExrPjCaTGAk2sA0s7YdG
emiOF+4dd4Wn0a/g3s3E8sjSYZW55vR2OzUdczkO/tO5daal3KN2FDeXu4t3J0nVKVvMA2x0bpoW
w6/w9dTexqr+3L1RiwfrldS06KBF73/UuzuDS68+UqtyCJ5bxnfGmyDuw9FgeTKmRatO2VkQu8SG
pSlkGVi2iqZHVbPsY6BW4KpGiRecYwm1cbU+4UpiRf04qh998GmEKBneGm3601L4eF7AsElvib8c
cdco9g+H4DEKQ/AvjbbI//OqulfVpyPyEsF0L7Fab6QaKFGmW92ESX2LryH1/P8zXCmJpzEskr3a
0fmUCK3lbczbH4eYrBDvKlwNSGOgAOGVw6BmVfUKNa9C7IQ+iMs2mDnKrUj/a4y1DFi+r2Un4ghq
LJbJ/ZuGPWb3bqBf4P1NaTTmsHwbPAWdFuFwxG1p7cQY4aHT76T+Alme3mpXhJ6GbmaoScg27BB4
6bqhAxt/Yjx6J5brJ3YgxdXIQob52jjeOgnpay7UzzKjhdg7Ks+m3hCf0VTA90mU6GbF75/gg9cI
3OZUTXtUKq/xUI/vQwSFZ8iyFb4XtZyMLCOC2lGBoy3uBY1qW64eTxpMgN6NXd70BLdOvl58I061
pTtVjINKwgGTRQioeKgBFq+KrIt//I/dPev+XOfAYIUoaMPuPRqxM4aXHQEGlVZ6zgl2dhHhu8WB
jL8GvtjBbvmURILLfC3tA8KcGBOh5YODAtBhcdhTlUc9UcsjkWZofTifczWMwzMQNqBO6rURI/tp
MiF4XZwQjY9B06RfGRYgKVbwqdSbroIppP2REwmXUargg8IHWuUryHJ089bceOQ7MFefXinijUUV
7q0eYs+laYN7XgTG8fWTwvT7dL+IQlVV3ujNi0rGuaBwXygF+D9HHUDyZ5M3OLpq8MfLM3ErZUvS
FLjxfqcY/BiDnqrp8/Jejl20bynVAZR8Nuxverwj2OWJ9q3Mpd+xMRVrL4MDu9Wfrx2eywllR1QW
7iADIvuEYzsAPlFFyjMvV9KWY+bABgJ1PBMFPAzEWfhrFVs8TAXjfmSVw1WUewnj1qUazAS8BPQX
ca02DtMqgQ93VhIkAK6lbVfRtXCCAJLQsXR2s+cfyi3HD7FOeLvhnkvHRehcd6sMp1Pwxh0Ao/Sm
/B7hlNrUepXVw/Bz1y+AWgUZSnBCK1f7k4iAufzi2H4KvLK3CKUO7lEs4XMBzGMLczrmjN3Vby4T
KAcX0tO3Hyly1+7jxU4OngYLw6a8elI8l/RW1OM5IR8TkEDAgBjZpM36Vj2rMWcSEP25RZbMF7mW
E+iDx2NedxkhNz8Cbj4HBbxITrnFPlBcrb9tp+FQL2IghJPswtjMbtzVZlhoIjZ15CjLzgsSDtw3
K7XWoBCwwCb/gdqOUxqN8JCuZa2nRYo14pRCGWqORvHp0MMj+zXhITNrHTgWDbCZ/digPysHQv8f
BW/eAcyVuk09SgcQUHza/S5LFhihEIEVtBSIXDC1xqVMRMLWvZgUBvW3a3IGNr5iuT/OezcsxZvt
fvsSbyOheKJnQOokZfBaYSO8P1yFH0pojxp+tH1HrgIUHwMduz0qVTuAhBlSScWcHCg+oh7s26yt
/BsLpSZGAbuaKkq6gxhFj9FyYhEjj1EQoyQ6l0C1JlUNHFsNke7BgLhSShalBi8AaWHtFjXbFO0j
z7MReIrUiSxvhg11O2cN+s1xpufWfrLYP28haTqrCNE5/YpVJtGdpEDFcph6BLO2oi3hAZe9pJGT
kaoXz+VZbKcNZuFHV8huiCPwxcMgIGO6tkPiSyMQSbhobUNuOdo9J1r/sITuz1WPlf1/YKIfRR+Y
CKUOtq27tQlFgIavd+5T/6wB5rv/7hGJNHhRuhjbS/4hQgSYUYS5D2Cmk70H15bdrnTp/FXG4iey
UAJAMxHGZ7JW1pMp3P2euF6Mjs7DTunbCJ5JRwoKtMTekrCVIuK7OtmplHiUT/t5L6q0UKgsLshj
rKU3PfOdZFivLqSD2miJb2mrmriNQULxb5YrgUU7BtZ7TQ2NprN1xvUHFreKmZC6vSFenGj1XV/l
isMwA462gAmEkYWap95KiFApl/eaFlCuEGZliMBIXkvc1pQqojhdifUlXElGRZ6sxoaCer1HnFad
Vi3C5LfhzHYVpo+7tL6DzV9K7y/yl0yP6WLG50I56VRybO8SyY5LpHK5m0lw5cxua0Qcjp90o7G/
3XMmBg+S/y5dMPNhI59CFSUaT3A3HuWOWtnKQbNNxB2KIgAx0pXqHY2i+ZV+EY2XXHybU8B5Eu6p
9fg2l8S5QQGc7E3EaC5A9N13nJAK7XnATVQfv8O8BTfVqu4ICTj3kKV5wqXiA0zxaf2Uz2vnVHSA
E6aw/iD211UaQ7HgKbKB3tR1GiHv2REdoOKIjETHAzJaCqxZ5foLvpbIlE0OYJGgpVbnvm3gOhqM
J69Ghmrwlh+raa+BAO0t0mZoOjvP4hMivndf0/jd0mUM1IDFGmw2vEmNKSuwIcmnbRLpkLZ5YUUl
aa1HpyaF8HpZ1sqKr9aJJJ6Gvt3k+ralP6tCOK45HWI+CFbSITEFlkvvOpHRc6TksJgq7M42Bfik
4DRaMCYCbjAx6z3llQZJVmzf2XEpSBlZoijpGmIwke7k9dWJgDPxkzAlOven88M64DExyKl/8ySw
jTL8sLt0ClgZt9KQCNaqQ27x9M2GV28Bc/ksifyqJqwZBzt2dBZ+pCUI2XRVWdIVrFOnHA+w1g/o
5U0uCkfHMBtlwPbyDoY24n7cKQm9t64oGdWEl/UgO+pnwdft0ab1eWo1HWlDPctfMEDh2eeU6RFo
oYjmZQTFbRGE/r4Qx27ARKJHZJ/Z/BwivL3f0VhMZj9hFqPlPSo1hI07t4y8LvAQy8KxHvNSkAIv
XuILNBuzKT61ivW1jkKsjY8gMObQiOZ6jG9WzVzugEsmT89eY0Ew0V8rbKkTJnlzIPPZM8ZZHq9+
ZRjn7vZl5ufeJ1MFu1orBHZdJtkLWt4K7P9tOloK8e9lO0hXSj7W3d+eKLXWDDoR6Zo/ypLXeA/l
MGcYToC1RwrSVincX1q/Lb5VRgZJRNuHja0sGvjuka3SeMyb0rKBUAfCuB/PqJeY/zXYXA4nFLK1
f7jNqNd8M/r7ml4jm1n1VA3uPxp50yQ3Kns1FhdTbfzDL7DH9wUHmmhwtCfQ53wV4MBh1beabYPK
V3Nc9zpSBYaO1CXSXnRTvGaTFe2lOObYaOj5X7kWyaVNQAJELs0JQIsB4r4l1cbLAhQnIVY2ofW0
WrgpLsdb+sh4B43sKSVWWhUpeqOWyUehNJCkrHCR/p4OaIOPMhnWMGmT28lcFfqVE/0J8umZGLm3
7LH4E5HnfiZcnUPtgtWyQKCID+pmKEvzdyoIF4QrHB83bw51UUc6TcShM0D51anupdQtFY/ljEcZ
tgGnQzFFp/4eEsqBuEUvpPr+GIiG6K2u42QxOsH6/RICtZk/CiTwfjHqU+GkfLBl0YhAxtSPI19S
V/i5i9y9FFXBCj/bng8kQuBWxhhB0MNqaf7xB7sJ90YEna5kA7uGpVKJdIoFKy736MQ9gakgy/K+
pobaBeXbZ0YWsb9k7O8uACFiAKaaCcyOmpZUF+X29fnv21sgmNN0WO3C2puJxodDcU084Wv6O79+
zKr+ICVdZUOQDI1SwgFC0MEvXVcvCAKHRzE8NH5EFyOY8uDQamlXSaCgbrfeurMT++qJPBBtpLnc
n/X5Y9Ns8jAB0ZeixQDSYEd+A7BXTQ4fsFq4SigsgGyWIck3U+aERLQsoZD6IqUtjsbzYTkv/yhh
OOLGGI1mMDBHF6hwwEkbT7oTn0RGFE+9cIEGZL4DB2PdwE5B5fYgP4UkWfTgaAbdVoX739aHMBEQ
16MuscWJdVyH+Mo5OcwfAxGumzxdv1U1T2fQfPV5WX9XmvVSr5+oqJv+w159XVBL+JSxncrVKUYP
AN+kTPJ26YznBU93OXihyn/E844SA+TTeb9XtJK6Kv+A3dwpE/+lEBKoMoxRyb8LmEcqTkzHC9t6
sIn2Nu2wu35HznNwgdIJK98uX/jGZwjghdasJCxaJcOnm3dzzhfHZsh4Fw3zjlPS8K4gAw97i7S0
SGNerpOs1qw81o+i54vvRdF8hlLfJRHZmLghSt3DdchnjTWVUUxr4GaNlz2eRgWK+ZjAnd60iT3M
sPG2vne2GVwFDS1fuO5yzgxQrUAh+P4735fS3uZkwBm5+BwkHVhSvXRHvYpHCTw7SzvkO93tMeRl
NXcQWC5LkS+IsKEFZpoVLON/bSYCc8Ay+xH7oMphPrnIKXqj1xL4z5wmL4ZMpusMhgvm/P0AVRo6
sqd7tW/QLqClgUsbYWUvqE4oi3KCYtGnsANa2XlM4rGjufdN6y348UuUuVslA4BwTxMcOqxMfb5o
4HTjutPoUhSET8pPgzGA2cFGwqXEX1DrsY5SQ4Ho/V2N1/Rc2p0vrndPZZfhOikCiSAjRElBVeaH
JVk8sP8SXtsKPPF2pHZMWQn8rJhiMAhfc3WPu5oaRIGyVTTUMhOEgNdxhLBPpT4Gp46Q+IPRM79/
Tb3WWqb+4n8YmHEQnsvRjOoj2525P3WYQmgE9zQfUJUW5n8IKcq8YzymIBg4V/94oqizkBbnFAyr
E0rPGqbcxFSKKYy3Y7mY0xJFZiM2+4euiqgnYO+Blm1g0j5jprFsSykcJ+kQkk5nY9KF3IKa8CXq
Qqhy41aEDKFq8bO29jV4WXvbS9tbrHkog/tEANwjMbikDSHUNJ0s/PJDaTlsPYBPMvs9HnLNSviM
VucACi0kRtjwUsatf4DWoAQL9oxrtxf7Hnm2vy2IRQw5E18cS1vu283cbjg+H/GlzuMQE9EZyw2E
+TmhakH7guhFSO9ga92l4JNvZBM3MeEAFD1qhp97nmuJnrcbxRXJJnywON4V3MizXWKNAFNY2zmI
AGL3GrLjmY2ZddUKMyD6i02YGQdiFw7nM7S1hYQyBBstMUTEIlKlXaXB/jEgegbPPMzmNpELtxfl
XdMZNMU9u+ZgI7aLgmFL+xjBOOxSKbGliXzGgpKWy9k3w4TIuRfmiKtXiJxmOzlCOOVp+I4W0Eyb
JZIU3TPqG1Hrl3fLUGs0GZZzYCh3YN+z1upbmDWeXra3HGodiIdqPCIGdy/TFuzXxcY5sf2/DFyp
xqrlWlKtPINlm8NecqjmupdFyUYearPDH+XOHLG4R7pqwWdblnIza3QaxipVbAAqtkUzGmdawgzk
XosJJ+MCn/0/SLGw9xojanKj+0p5yeKwZcNYr5nepvkdYp1QnqmDqTy6D0f4zMYIPKiXZR5N0W5n
isU2oLs1xQy2mOytHQxN2u7oLUIVocLHxEHIWasVL2xVymTIX67dsub53jVEm6NGnyUBag3GsxrL
8swAKs1iDN1MUKb+r7jLcf2EJ7ha/LGkCy5pMtdgeM22qQES8nub+0yCYBrAzJqXVLBzkEWyAiat
nFJkPQRFr3VxdBQ/2sAlBlJcetBUuE7mxoLTY7AqTwdubh0z92Lej159lnI4ag9axItnzLkkFqw6
Go2M1s3+/uu35on7Yl6uNzAMv/368m7ynAFGj9xxiM/sGtINgrmkgxue8uezSW1uJHERhItuirud
PkG0rNib288MYYCGc8qMNMExfKVmyRpKP0gEEybLPJhHMtHBFzKuiTH8th/9JJY/k4Ck6Q1kt0Ha
b7n0yjA+iYskQwrPRtc1eheiTrIjJB86NhLvhCS3bpPTKEz4O2EPhqHAFeij8dUCBp/02tGVMRZV
N2iahCYU6f7auir4WmMcmM29MAwtYDpvvKvRl53cYcQ7sDyErHJqicupi7SgcdG2oqPP8gV+5wJd
I0M/tlVTp/F2hHscNDz/UcCHzWl2els2Pl4FOrA1XafP4ye1AprHBwEbmaf2UpAvXcnQAu9eH+g6
sKpGkDOZVkIbbTus3EHi4/F/ym/vTxZxeGKc5RMsW/oZ/J4NiEmKW3Kg61yx6lGKZh8NYwxxYfdu
MZB4VOZRdn1ls0sAh0syvQ+CirxusFU8B6eZ31s3pfBvi51IJRt3QwznRTjL/ptsgsPLTXl17uTr
k4RjW8UIfHzBJvFt8jJcTRW/OF6pl5gU5OmoM3ewDaRKN7GADUEzG0+osCbMTpSe/OvfViIWarHZ
xkXDXLTRhSRct8bczx+jqserzYWay/PW95ifEszySkO3AT+6DyA4MXzlSA+XmySkW0jPFrT9JysO
OR6pgCjpr5QtVIMamAFc+A5OoyAGfdP7uaS69FOVCB5/11fR+dhCAmOmoGZaKvTA94/236cpcY+i
dZEWfiqWi6iL1c608Mpq2L5OhjOo+eKWtezTde7+PAiCrQBjWn3vrdc/UQM4rjxZgtPGLpSyVSE4
2f1F0uanoL8RGcMuhgF1Rop3EcGwJddXF1nB0fDKm9puuhy2QBf/dUR3R6wB9pVP5YvnaDVgFHEg
eX5bX6nsC7AXQESY4CX8TMcdjDQpMW0ihdSFv3Rf0KxhsD2AgFDvhMn760pIxvp14nhY4OrZjflS
7SMu4ojob8d+2kE7NSHGlnVKBp7B7nE+C7zvuJ591A9D7J9ChzlrKfjKJviaOgX+nq8IZ4GDr7Hv
9+0OmFPjs2VuvflJwgVbnFbyQBk5kVDQPdXTZfbXvW5RNHUW4nWrnjeEOQNQtubg6QeKBTabbZ7r
zGzEcXFNXv/FC83kcGf27q4jAT67WldeEJxd8MprYw0IT6Nw8BJZUlVx6s+J2iYDpPPDc8/Nz4uB
/7XRDdsiM6Jl/pEz+/6PA7qy+XlsvZPdlvonB7KXBVTissbvvE241PSynzgAZWm3WIHcEJHNFTA8
RAonTjFct2VoVcGJLB5FNQHMIRVz3OQkskD9brhBqmgfFJcM0vnNW9L/VR82IkdwPd8juYNyZIui
qDx1Oe868kUTI0b+MCHH3tpOgmdah8VTZfsUzMgaN4lpDO0PlwpMo2zutENdgpuFa6/c/KvPsb1H
FoxEku19dFBiyjnK9aXTkIFrMSOldxiBbJ8fL+Gdxw+H/MoSvt/yt9OMK3X39Ai/RE/Jnp13z+af
MYqAF+6idWQIodgfPyotbtgvNlMVizVUgOxId0Vk9b/EDbxvs3kDq1vjGB2iDcgYs/nEWMMjCGKB
+C7lZIpQoGAXDJ0Y30KwvQ2cTPccCXH9stj7d7I1MUiKebnCnXpjgXsvo6VKqApB+CsQvP6elvsM
zBhFLPF/FHUEsNb7ylSGGVXVBXk+C2NZKvflsUtgsWGADfhjiflV1EywOaZbjsKm1cM/hFlSSdNt
VSEG++m//1azZtKrW6adcJ+Zre/+m33XvSMVyp7b6oWCm7fQ8roixhYLxFAm1jJEJfYVVCUGNnV6
nYy9BE3+6d5SrJKOOdkWAkFGsTEAcPnCGCVnNgQYJcHrUkjxrnV2qYqCoDCoTqBo/o+5vFF3RZ++
gjk0ZYBtUAPvcR0s+ld4sVg3/PGQsreSn4qS/ASs95CBeVYiuNjJR11cvLcvIKwLNhb5DXMbvc28
Df/3CtJqPeegMf6pwNUOmeRt5X/DaPQfhpsiuqoSsoeiXZiilirUsHa273YKjKnYmne7pCYpxz7S
jQ5T/QxhRPOVuAXTbiey3q/cOvN4G0yjCCpSDGKM34qdKWlkASejDVefnT3MFXyJwg6/IoZALqqd
DcB+LsrPYQ8flkDMUgvDFSRXxxt2aSVOtYB3Ay/k3JU71AUPgs/yl/zj0r1nUBxBR1ICzf956KS1
aD6qXs9c76bBr5U4Pt67jq9lnXLZCiVxZz5+Vpo9C0z0LAqxo8mIbO3/D80IexEWnt42hpezX1QO
uhcfLTXRyC2r/1xGLwpx9VOQCBwW/yIvwIc3QvcPJHOeXYfnbC8YWRT+k372UD+a6felYxku7wru
Kfo7mq65xf4nQU+JB90MJs3KDl6eKwniRxRlDz9/TDuI5Hmt3CSRkXqv8Rj4E+IPG+6g49j6aU0D
pL/PtcwKi3GTtTgmloCyk8AtKSXzaez/rwjijSUzMYRPQk/jN6qzWuAFrg8FJycv4jV3v5PVo9dd
RfmT8y8ppaLW6E7sNTmooquGc9k2thqNsiEPbc3/Q6OQZqNh/JIXZQBJ62wHjvyJ0Puk6L27cPd0
VGxoC+HD5Vt87wUoKiRVTHCDlifEqi+F2tFY2U1Huh9aCaaG56VwHr+EWZLsGPSTG3JJc+tcMzCX
WJBcFoEzK1pezhR0LPRHO0leniJJsjY63hJctuR324V8/oi3FkGIbxTYNicnDZfB2K67svn/pLCy
MVfinr/kH9YEz2pky1sf03Ceo0TFkLakH+sQXVQWWmJbUITPbCkepjYzQ3il3Jc9NyyJrdw49IM7
kCWYdWoVUpFGxNG5Jl7oDcDuqM0YR1kcsUljX8Z2ly/YAIq6awoMXUS9t2G+i+kUudFgdG6WdGoq
2vc/tetdQ4scSW5ij7vn0aL20nWARHT2QEWiUQGar/ETxVIzAs9Uimwn0zwIqaXsyVgB7nUvUvNt
/3L7dSO7Rywismt7XaqakFuUv1xt8FUcyjzMREbX3CPmcABVTPkn/4rLiEKdytA3bFlYCrCdYdCs
Ed310iwyYM3ooGkSRzTpzSavMDC2Gk2K3XiWIB+XuKzRBPZLXYxqj2ZXqmjmvShozbbKwHylXjWt
qCGGP8yVTxNsixsw3C1pqE9gwssQIQH1ZeXthfKgIhERjqFS9R4BE4IPDl8VhScty9lcktzi74Hn
zjlR2l7NvLypXL4mHxO4F4raflWLgER/0g1H0IGAayala8x2NNfyLmW1j/JzYMDkHNqxX5FIO3xU
ApaPqjJE7h3/Pvk1OlGJ0FAbwKaSzGD1j8slOre+LwwuVu3sfejA0wngP9/mSzq6idDmavv+dfbQ
+3BwD4ZSyipc6S3PqU1CZGGWLqI8iz2kyBbpL7Pk4AM/Qdp+KvjsoVo57sXVPvgqXbemLdKr5MPq
Lya7SLoLcNXMQDcZOewAGyyLPPftVLJ2DxixBWnc/lKOkDJDIRsXfQtrwG0kpmtiAZKq2OvBh/BX
Wr/lN4K9luXsBsAGX+EDTxYA7tLb98fkDlxMG5GpgGjZ4wcQXeScDDWj2BlX8XW2bhcxWiyfq+B6
GtFfdM3EU1DueoWKVEjZ8CwVqlM4mOsAX0me1DjT13B9vgosFA5dNZtkcioO11b4/pJEAYYRsIoD
XCtEyJ8N+OZquX/ojQOn8QqkhDmsBYZ5aBmnoXDlplbPzwwcN+p+QtKeJy+idiopBopYYQgt14Us
GEenTTJ0+FYbUe4CKGcM+GlEKyLyd9WUnpTN7tQp0X5cRC5L+Y8PMYIkm9rV1eT3fagcIFqeWjYv
7/5zgN1rmsShb0LU6pww9IxfTthH3A7P4rkj/Q3dOrUAQjKT30nGjvyVfNJlAFsof7Y+1iamqUIE
OMBBR8nGjEsF638mpgneMOtBGZRvEvo0dsTuHa9CKTrFVC+9l5BtrhsGyJnbgK1b9BWrJ19HrZBZ
fWrLpxxWyEi9IQPY99sVPP9/ZPWAPdf4NxyHJ+OTgT4Pc4dbnK6BnlxpnSu9mu1IMUegvbolV10x
JAAWjlISC6adRiVjt/QEmZE0xf234BPdFAVXS8NAzb8w2R6k91Z4p27tk4IArXLVdUb54o4g4bh2
7vGaYniYNe3wfYTZbTiuDMx5XWiHrfQ8N5/b9wdx2Yv/Tb6aDcA3/Cyjuyfiq7EfnHgyZF2Ju73V
oG/+4k/T2aF1zGBGBLpdJBPvTfm7bE4gMKqaAxUaVSSEaIN0PWvz33V+jbTRJK6tTet3F1L8+nwC
RXZVTqqz/iqAUe6ObRPjqSVCsqs/P+MCW2ezWRG75zAFoypElZq2rTiBVTlm8dz1gP5aYzGzImd4
lz44lhA3F2utJoaKmvgagx+OSwSk6L0GfBlGSkRp936lltpl3Og+bo87AFya6meTgPVqJZkARzTi
U0TYKbYuzjwbEmETZ97Htla25bPN7FjNeTfRB1WIPAdonNsuZBfc01sGMtPWxiM/ccg7QVXvMWbV
35y0YyIHJcHsQRAmpH7SKBr5l1iduaSLl7YOBgxrsVbeQKaoKqNAXyx44bQWFyS7XcqUWmkVzsac
wEXwhEaBfup64TTseqkVOi6JAIFkDku+zg0b3b/roWzEVExid9wN0PRBVi9Sw9Iyay6aa5M7n4l4
7ifRF9n5SeUigCQc5Orlzu4IyHiz88zSRa3uL3RVAU07thFhP+YWhyDoqc1iBZUIxULXILQtGhfY
JIcQr6ITwBAUTtRrIjpmlp4eq2fA4gEu//etPFIYXpHrXp8GryQa/QMc9tBg7yq70T3ddRoZA/c3
eqxMJvo/W5fgkiNq48gQ5DJf/Y0VgoD0tvlLWtIl6+QsoqH/4anC+BxS13IyOb227sD3zj0fGKS8
1nKIbkrvBxTz+16kX7icQgQnN38Lp8slHv73TEzN/DgIh5ZZthcWsnfKycogDB5k1ppWB+3O0YaK
3tj6yeweOTi5NH9+QJqi9eb4BQD4IJtOL1MTo4XUTfiafcxjuEznwqfLYOBtvb4jq9PnE9t+MxCg
kA+aWJw5zbjE9UmE7hygtPJ5FhcdnhtZjK5eURL7SGgzXyK9OEqYyJnDgp0ZiCE4JYLacwA6TWHO
1ZkI1aTSMYvcywM3+wO3gCaHFQda7WEU2IkR1R1sEbJDWoLUc7bxH9k+qvHJj6miLVEhGEQZTaEQ
vG01gQkS/cWnWwtaelaaLOb2rHlk71mREpOpf9rLMRwnJpUjxpJgbdMYbVfHn8tkq2AzeQ65n8FF
GsBRSlp5gIKK5C8dBO2VPTzY7wcmXW83tG8zzcpB4eVM4pGm8g6HQe18O1zqi7TobTvvj3ldizUg
bE7xHQp4Srf1Xrm9oMeQrACiec01SAK4klLrDOzkj83YVnHOW6NCg3gupifm0ZEmiOr0wVq8lOQM
CoAL/VDd3Q3cSizcxOzQEJWqF9/I+DNcWEm27SkS4wFHRbigmuVcgpHw2gdZYTF0Ss2yCFrXir8c
3AaB5Y3IwQ5P0CQWziKtAhOtPWwWmHZcIupQu9k1yEM6L7fB8i971FtqX+onNRNe/sXSUEBARiqa
5vvGjqF3LrGu/UkrMr42moDHx1f2/dm28klp8GflbK3neMOkxxHG0qSYrz89qsdRKWIydFTjAQxh
Y4In/zYR8b7DdHfikbXu18wacwpwkwuStrqONo/uvhnXtbx1FCxh1C75BY7MnqG3HTNDuZ6arvKD
+pmwaiH1kMwjVxCmNE4woZlYYw7KMuSu8xX5pRBWxTmKUvyuz8OV5TtpCqQSFka2yMUtDJFT2dXR
TXdBErGcPipt1HT1T0cpFQDby+oKtqn3uBuHWiGeco9ZwWxgzFJVLhHwTavCdjRt9hmeV3K4RdPc
xTh5pvph+nxgS0aJbkqNA1QA36lzSk0g4Ejx/HnibYCqnxzA3kEYCj/Y8kVu17H12iNTq+FTyUv+
Kl7QHFrh+r6fG1dbRSfCA/tqU6fpkobLB3jKKvANSYvIQd8s3FIxLFPRmJWJTynoQkFx0dgfm3DU
YENHN3MHaxkHfDRW08ABQ81S18Rl52G8OHTzYjjI2q+XZzmoktqbzrIZCi7S+pj7IRNTU9UDtw5r
ACXo+iiF+ztKKg2ZY5ViPUHMObDvDR061QneEbnGZhMw0/k8CpSwSMDVzsx//lI9OtRnCqgXaNvD
sWwnu4MRHJ51WRsnG2mJyHMN8lvfKOsBpRmnfCmQGATkqPaXLFWt18FX4AMbOhBgAa0nd8G2X81k
qvMLl+mNMObRH2BXqNffLJfTI/5edg+sk6hSd9bkmaaBX9jcysLExvfllAdjlW7LF77BifTKtSkx
OE6zg/Xy3EX7OySAwosapO9v8SiBgs+EW26jvvylRQGoFkHj9v3pS3KZ46r4zNJhfoP0A/6Yls/p
f+1+DBgPiy5on9M5ej+Rglmecmosov4MZRE7dWsgsomnE7adMxIPqrkBVArWTMvFvdNgdx78saO8
68A8714nHjypSxEZkxDmslyJP8FrVJ2wbrldd2XhW0dwoD5o7BMXlDQ/5vkaKgKsV6LvJgcItgBH
iUi2AcjMwwqCOmXEhqyRFC8IxhcArPCESd8miZS/Mrzd3z48S3bs/1F9Z24fQ1tJpD0ZPZI+RAZ5
qU4VgSvBBZtW9dhj5aG+LAh2osynV/or8U1rjxFMVhN7b4jZgHW9eeO88/64X0s1fS83ogSEKeyb
kckgRLafX/3hYPBx/FYm4r+6NOtgSK3eUVHnOAP04yfFDkqKj45paSV/03EBLi6dfsILKePosgbI
tNW0cmk65hZtH7rCy69I8M+4Dx6FV44wAb8LDi8BV36TwSdbAV8wDd8cVo44S7t2gXm80F3CBTVU
FE6CSek8P4zH4aTxs9Sl/Mb9pXoRA52FXTSUNUfdri4/xOgaDvw5z7I4phdiXt3oFqrZdKqwKwRe
z+bpyDRgNQan41HdWAr8neZHdlCCkDs5uUR0c6pnAbPXmTwjrRrLxogPFecG0gf8zpmPZ3FTPXJ6
EDu57Xtle3YsnpUsv3Y0oOB7Nm2znTuq0v/lz9njchJ9FbCJ83d1jYXXvpw8sOsQTM6dZxIPJwrp
nDUD7B3QK4kqi5RGVMESnY+45eId80Z0wu/edGaW7CFwDZXnWQl5Xn3HxRkBRDVMpaRIJkuMzfA9
fvjtYjpk4pxBeFui9iQ4szv0qMfGcLCY2g0+tDK1FcdsMOLZzS1Iy/8mYJ/cXGSec+R1lrrn3VuS
OjwMvmzfuXxO09UIVWnwuHyCb4QY/Z/H8xucJ5FMfLYRQ0rror724VdEaABlA/P929ScTwBFyIfJ
a6uJSPlwYzo7QHqk/peLrI0OJxxCg7kKg2C5Rrc1JWs0+SZ9SQEPZR+257Yl3wFrJOewaIp2hUKZ
kQEAPcXiaTDUZemFt2BhKNPCRDAA8Xil1wnmJq0yBizS/xMHaqitDmBQjWPCYxRIQHplASL/DW1u
vxTg0RTbAo89tkB/DU8EW2FoAESAht+LZvKO6jliE+VzqE86ShIisR9BQG++FVYXmk12TgSLPWED
rnm84ILZK4c48dKXEMnht23groD+V9fMDXqX5zd6p/L0zNlATKU1A/ehmfdD7WCzVMXTeu7zWQ9Y
KBHkJpsyuIzoHoOdZBlicGsaxcC8rOFHROuVwOFdqhJrnQjWCrbdrVG+LnWiUzAeob+w2XN6KPXi
hmxG0mpXroGT3nFrzh4+ww6BiJmo8+oZkCyxYRl39edy1lMc/9coA2RjtKIu5+yIQeg+tX2/FRLe
brznK7wsJwS1VGJpMk4gU9PObI99wdP1sjqzJOODM25QTB2vQOSVBXYaVBlPl2lm3nvo4EhYE2Fq
b1T7zRfWdd4QqAa810ddm2mqpkakqEyJ7DSqILmG6mmkxBiJTpavqk3SEreGnKIjTAYkmBgiCiEy
oUHnNYRBoV0qHCrFuE8D6hjDP+FHBj/gbX237VmECTqCEMAZd+kMo1Z7H/+pjdjffPsq1QZNfG9d
pdLm5sNib9jAVVxQESbdhdxKP2zMCdeqfIm5V7SGJfnodxDMDfCIrmzNLqr8e4K7fP6auZWZtiOw
BOil2HA0e2VvLzLU6xMEQEH+ogYabzrvWomzDkVKfPplI+BiAiO+C4ef2GubFkv27mcfj6xrcbhs
2CE7yNEJ5peexuHBMpF9mvvBc/4VH5tbtosolD4119waaJo32teLVxpougXWATTPtmJ57UEENnN8
l31xCvUJ/qJ//8T261QN9f3xg/+OFW0SHR3NH8TVBZsCVmu+144oJ19ArL0Xwv/3yToftDZ7caNu
yTQdI34znFB4m1YyrFp759MRS3af/y7oCH3jgkaOl9OnfO0+b5ZTF+NoFjP8GlM7edzxQjQZGfqR
ei+Cwiqju4kjELL/ol/ZE/ddqF0r9EIeRPOYsHT+Av3O1FvxdG3KObP63oncT2BaB+QDh5ApvcLC
hyFQkMpLSQgabR4Uj4PgCyZkRlroG0jOKqTMi+0KET1X5/jbz1hksn4xE/LO8iL3daCrEGyKs1k+
WSMceqrOBuNdmtH7+rKHW8KZvDyp51XXIZtJEKqMfQYJjdajHxP3lCKoa1FP1qwszUbypwBfKVXI
RXdn0EskFUnvQ4UzNfd0UzPNYUvKcmAxHlUvaZtwsTtTzC0zAPBG+TMevf8fnh7GWlKOWpy1WS9q
fJXtsVNHFNtvJzDMPCtrDumiDXfPMhYsahWud6XY8ljFsGp9DqAwObj8TPOMS4kiD6pD2jJFUNXg
M6Zb0rEiSomzQ0hptBL8aGX6li06R5e84UhSBKBQMKUckpNN1PijTBp3L4Rgyx2sOMLOyUIAFekd
3jHNvdYhUOVMhYHDjUPpcJUSjyEHGSxECn0Etq/Rscf3vvu3Z0w197cX1CtANbsOonMwCRavMq31
FCycHVmyUMQOOX2fAUB5ZAPIzji2WlOLEVmicOkiUWSFzhL8m3IlYbstMDdGPNF+vA2cwlCthv30
VFmDHwQ0rjMglUhdD9dkExuxSRsgalWbSWRzZYoPwQ8G3qQBeu6ajOUEZ1/54L2KtzLv+zr7akIF
9sx6rr3REoc+CUjM68Sv2Z2GRTuDiG5AtPPww3gxoy132UmNzyPZ0+fm4hjBz8ptIICnZL5a3B28
7IDP/q9f2wSxZAEvNQMqqQ+TVpk2JGQZppEHh9BpGxdMj1nRgUoOZkC0bhKyakZ/LUGpi/nbf+Ny
GyeoohDX2DuTdv560i4bzeJiIMnTcEkZrPH5zAh/ckd2XUeTU+RySYRz9WT0M9AEfgI1UmeRTzah
jGHZ7VBRCz5qtmoEdfIsxvg0+tjzCaywpSRvuZKBmZ6ruQVZwSWDfLinE/BLgK+dF2u8vzC6ZfLg
CsGDkY1lFC9wy4cEjUXYjLZBMeR6DNpNt1ggUxermjNKktiEklyDWl+OpVZ/FAVBjxfa35eawKg5
DQV7EK/XM/OemiifnZNmDBL8JYJRS8TteiKz6tpuuVpNKiWZutsHRoF1zje5lWXqV22oEQiHKNz1
QRUb1ljV8slENIauKc7TQttiYJHBnk9pisLqeWY9wl7fbzxlL1WOev+/NXXdNviMoZKGXHBJYBAP
6axLL6JQnCK/shbxnue8kr4GB+MUbUn0loVwX0/MGjdQL2J+Na2ri7M7Pf8VttzsbLljVYxj0vtU
cKlAzPqwBFEFg/J64nrNOXOBgEknFo5unobXCSFJwTAy1DV3widrF0vwclaiJXQ+rwKOWhGIwC2d
tl0BaBoAZKuN3pzbK/HPqn41xShxemKED7CGEhotsa7tj4HMPFI9oWvnNQRHrrA9NPJbn8fNx4w2
CjEKxPhb0/eythSD2MYQd2RvrdZoKGsHjMX4e5K3Z4iiZ1qM0fNVAxrBEZuWOIqY0GpyR/4BRHSV
idAuE9GkoQQVw2KLYIsD1FkqzhKeyOsrMt59fqnmPefhriuHpRCTcBPQ/rtdj+cSLojS1Yp+9Gks
HsSitzd2rIdqrsX230V7gnqB0trosW+02+x7SbnyWmvE1QCDHK3jubN7cNuedJ7MM4GnJIPKM+hj
ILfcAIS+19Z4zysbWSbti7Vy0K2yvLeObkHMGjT4QqZPYOjKVP0r+hL5NQKaeeug1BxHsW11EFWX
PBiLtAiz2pbn/pyO7VXz+jwuKbc5RgVuY269NhIJLrFH5nz+FehLHGNqYJzXAACO3TmSMhONuzqo
zFO5slkC/AO6W/JBY4JTWkkzE9QvMsvyRpkN/OyP1D7bq9YQMzl0o4RaO+N4wCp0g0TKT1nobuWY
sjWHD/OwMvbn4La+siFQuHClNIZTz1ljuPcZsFL4J/jiF4MkwTMU8NQGJztwDXs0fFGytY8QzWEd
s2aQCuVCITKEoVLjWbQO9IWnMyWZNLys0Heq4uOoUZdhevXVVD/YACEyb26W3dAbW1z+S7JjC3zF
ddvbbIZ31w9fL/pqvZEx97jkkGa/JoiN6afx2c5L9kaXG083xIcNRJk26gAeHWqcA9Yv4GmdoplE
ru7ryV81cH367q+eYgll2ZiG4Ryxn1EJwsCCIr1HWFdt3j9Kl1g/yW4dx7wXjRw3y2R26ysQQATH
Hw7SetnsdysSArpSbXXc49Qz+h0qMOSni81NtkrQn1gH1Ny3wF1BaqV2TGXnt75ErZEdZLmZaMfF
bt1cvqrJpi/Pl0QenetyKHDVXvq91c8mHJOY7Bd11pms+jrrAefojSGQJDjSnikRjRrpYAZkVdMG
0GK2+AZs6pPRStEu00Ax25FfVQnrrXskevLlBmeI5O7OM0Zafg9rp3cjKHjRg/zUKWZrjfTnTuHJ
N3xq7qZf5iT+7YE269YzkbRBuQXPl+XMLkwm6DNAFbEHHhPc/jBOI9Isc0yzH/M9cvH56yWr0El3
kkJpQV2u3ti5OhzPTK2E7A0uB7vPn8sTG+w9tAnwxzJsDb8fWTpBcSuR29yE+MRTM6/j4zDr6H/i
lFtui+UssNuxTDiFWqpr8kUxuSiVQpC7rZ52liiMFhcXfYX/hV4CI6P7shJb4oir5Q7kl5GYKQUw
XCEsNmfZVumisxC8i8tRvNwTkdzsaj/nKHqtndxlxVaVR22RFP6/+IPZcodyHyYT51IBmjFm79A0
dNrjPRql8tZFz5Ydktrbe8QrQYZ5Wp6ke+ClVcfa8pKqLJw3pKM/35SgzFf8XiNuiI4caISGWyPy
rib0MRvxwBBLWOZ0dKtFRwH4EmtPR7T4HbsaeQzLro6gOwXXzuF+fUOh8LoupvZzmQaI8ZZUQl15
ylMFnim+cIXUkVMstUkytlAugPHCSdPh5zeNldnwipEmAwb0JicuMZaYW6u3qvSHvjry7J0naBhl
cqe+acLBCA+H92IF36gVbBeocasoIrwFBnow8xkeaEZrECYN8PSkLZetglg/Sio0XL7l/WKCR0lU
MHYvoxks5UxDVXCilM870rPda3oViWZQvdA/RM+j3HQYNjgK7oaQpGHot9IRR6CS5EWyvpjemJPp
JBZ5vLVlHBt5rcgzDlr11OxL8oMv9gNABkOHbOI+ENNXuw8wcTe22XD1uCNHBqD7bOwOMPc8TQ3j
1xpnYRcYZ1JXOoBfxjpiuvCGOU06HoLf//nA5ds5Z0jfp1619K3/tu3RBaJ+GCnuDtPxIVi2YVzE
ogWhPAgQ3MAKxGg4CRyM+UFW4a2iXTUSAOCPz1EudgwwlqlllvV9E0TzsyAov0QWtlT/ZZdIChdl
/FshNBOAa+OlLZyL9kd5vJlPmzO1YnywilG8eLBDbVl4ppflS00Rgj23ZoWtkVBJpXB+6Ex2/yBr
b10gXGinNUmimhp615aW+YbIhPJ4h+usVvOiUGL7eeXi/wE2KiK3Mfu64q0uKZ9s3uISBg4N5VrN
a1kbcK06LAWCn4Qq0KSqYFutDvCOGCaNXiQeJSMEAiI3BvXKAb5paf5bpBIPOUSrqh13bpbiJ1aP
QfuVZArl+HU9rTfpMOEp4j3Dbyfp6e1buQglTnGBnXVnSTUwe/+ZfT6hNoSpOb9dfJv1EJJA7fAg
4xdJCahZC+uGr0CO5qg+xe637DHiwi52iYuzLspA/yUFlT4ErCb/2khBe8GogN++BjfDpUkAmaxa
kk61xJK8Mevfh1Qu4iX9DBCfI+sljkjdKdS5JWOR+a9VWAEwftXOB9Iib2aZl+SrniTIijH++zrD
gi+zbFFnbfPcwJ8dqcxfGfiV4AYrxoc5iQanJgP4jy+DbExB3iKIe2g60p/fKdBZXAzeMlRPVBqn
LYQ4TSnA57OnlK8CI7ZBeBHZimxDbrr+HWxPGf2H2/W9CjoHgZ0F5upHWZDSbRIq9c72TVs5z4V9
DLCvKXLAntdbuMYK1dL+AKgqeTqikD1sCxqVsH+3pB438kZVmZESHs4o5PYSXuj/nUGLyqBGz3dR
g/H60FAtLqK1Pa1i6DYc3vr5Lusj2Jl+62zLJvt/Lq1XY/Wt9amJdj7M3gb32GWrp20QWFhdRXEO
BCT3UASoOd1+bj4jJu95pmkFH/zU7VfQHkSpwHVtf2OzZLfeKSawJKxRbQ4n24JXLcCJ7m/+IEO4
Kiuj6rEdeqHCoLS/AWkyf5S53U7RPHtl0PLfFE1HSLCheRT70nMBICHj43JBiwRWgOpmEHLaqMnj
WZ1JOJw4JfbJT2UnYsGdUa9qjmpi7l6tLnuo/W5odgck3Wc7c8B8bK5Ty4uKaYeNtxuGmxcTJ11d
3/nlXxlLTor7EDHdJDaVZFTDcFG9u6BmGcrkwRhZNmqyJ/hnj+SYOFNERztypy8VMLDB5TmTtIJ9
9CjutcRYdbnEsPZC7+Gn90qc+Sxt2NIRgeKkm5q8glAIzgnqUWlgpn6Q2htpgT/eikvCg87+jyrf
vhAZcaXXzyKyrszVy0XQP38qNm3625pUPShI/StJ35x6JVVvpWU5ZbeCHJ0N9LOKXVfjdG51CcPu
4sQk0N7vneOGjXnQCiwol+PZ/OQV/cXNnrTDAGbWTLj3kUso+JY9GvXApOA++veq9MLPzdOrOPFg
5qPl/JEh7jyFtWlsCZ33VwW96gE1v3FTTfkjO26FFMtRQIDoMEfhiZxHAGkQHdZajw3tjvJob2ws
uwIVhB2uJryCIR0/d+i/kCwl5shA3nfnd6BkDj+T8FrirGk5P2flVUxRpy7HTG8quQ+qugWTDFYQ
mZihDAvP2Zy4ZKs4KQXEpEGZkcyXqxAsQNjrxIMLJdjxMGUSQNaA8mkVWHIf37EGLXmc99L/xWa+
nYBqOjd84cP93Ukp/ZDAMr7ZZe67UN6YXAebQeYoOljTuryLLGXV6ndTOUgR5CzHUTpFh3Z9I7Sa
w1+9vp/lrpfmNdKcV9M5u/TVxSal+GG59/4KmK81Z/6+K5z1+TUo3Fh/X0ujVh4pUiUuoRd4Hl9m
fRNfnIekWzmyuJ29FBwXsemhvsgyoHn7BopRbiVRs0TdQ5CdrM0wNv/ZCRwSnhnUIWdA1IIvPcou
vxS4svzKPO5nT9krDSpgoe+Mj9+WNBXgyzUB3G+LD/9h7MntC2cGksjPPUGmrBSP71vbkklxoUw1
jBlV8MxzDLmtWuB/VvRrcPEsFR7zVCjFr4zdwd8XjXG4Jvm1ReKjOLVLxJ6UpmPwVJr954FC14WJ
z15jcTysrki+0bRozvni876o5JS9T4O2QAvIWIDJpBvf57915dfdz8/8itIaV19S4eqIoVW1OdRk
V6M3iUXR3J7D3GoQY/Uxs6asr2Zu3prArDlwy1V9rafEHrYv/OGXDStbYo5mRq4RwXXWhTcob/SG
Aajz/0go9V8bZYNPE07ldXmgdTdwkPPxGGyhbrxLleuDZeBs/nZ/DfXdIRZCcIimgDVoL8ZRDsfN
Za1mojS5HFIKiGeC0nZAS7uBxSNFs+tfcPl8TpvTgXrjL5tFUeihgSpdzqOdyJ07d1YWGaJUYlrd
tDQLBbsHgMleFZnctyfwznJR5ptAzWT12OH35jPIrQ4PVS10XR5ivyHjYZhq5mI2bD6piUoPpazC
4uNN7lahddJoFLmpXaVpG5wb547au4eOD9Hq7IP40LbAs4c8oEWPQPCoUh9RG9GLMAmyAfs19xwg
b8GC7l+o4ma3Qgd/JFCLo8540GD5WxzR94ik9J8ZcZUcWy7IXoWlAcceWd02178BFosUQ2Lgik1V
UXVSvv1UDSxu1RQhyYE10PcJ8wg7nJZL33Cebh2qyzwUznrMBaD4hojlYLkX7BKUgNmeJAUhp2eU
7V/Wgb+XK8dcJIcc5l/VHCdLo63serb9bRMwC9V+9GfrqsaHFkX2X2r8sTrSAlXhBh9yRbFSHSZH
hmJF9+s7lPm92uOMBamTvCVq5AVX2Mow79H5x2v6t47YHhIApT6JrHW4joIBhJRC0oDHMVmHP94B
tpWdOYeOnQ7Y8W0Y4ffZGLLouF4F0xuavhbqzo+hGOskIXKU9QYTPLLhCAAXLRILQl1yIqRVk0BD
+VlVCd+KcGFc+F8PJYmwriquJA9P3qZk74C8AOqcs6ASBjEABrZbF8FH4x+DkYM5e6bCIr3BSLE+
xHSDBKHZpgr0DtVj6eW9Jegkw+IYVuMRDOaVOXlGKTatJM7EdLjW4sEDLUiZecw0YigmsVoCrsln
0MryShNGp1k/FGN9V/8kQJMeg0Ffw/rJ7A0hnKZo7m/soU0s/eX4RrNUiWGGaTpg3a+3qYq/815D
mIc3o4SK4m0IOoAnuF+H/5qCSRzBDmsCA5EQpT7DalY6chqAx+Q15tMS/uzFFWGKbUr8JGY/PsMZ
sH1fXfxnqoUlXnkzWBc5YNbIfzBhqoqJwcEqJgmot1vcLe6m9AM=
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
