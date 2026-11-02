// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Tue Mar 17 11:59:53 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 69936)
`pragma protect data_block
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
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
