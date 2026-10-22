// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Aug 24 16:29:10 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top bram_rs -prefix
//               bram_rs_ bram_rs_sim_netlist.v
// Design      : bram_rs
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bram_rs,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module bram_rs
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [7:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [7:0]dina;
  wire [7:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_douta_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.508931 mW" *) 
  (* C_FAMILY = "kintexu" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "bram_rs.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "kintexu" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  bram_rs_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[7:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YqH9kwIC39+qbZg4PSfFsXuB9k9wnuxNryS/CfnEri6Ci9fSC6fsrQ/T/hnt3u/yolbJ8DJa1Qu6
Qnm24A9jLbA+fu3Nsmm6/rM6a4vU6OfVl/gTFd/CiWDutv6Dhn6Lim4uUNPahoOR/A2Yc4Zo2tdI
kMLO9gn9WlH2l3O2oXs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XJYO2VHd/cnMxQd3i7/2qRhl57dl+doEKuhAunQyv3vpGRG/jlNxj8PqrgLoF0HMdqE3qJUVE/oq
kBSapqjVjLDMOrNGQ+Tc6VGsKMZH8FE/TXHQJ/IM5Iuiu2eozEwwVUomF+7cfqn+9OsVsqCONQ1M
g0oRlangiqasJDhhMfnlGGqwAwmgWRGQA6dmhTuua1s8zdvIv540zY6p5au8cAKVhqyyKK7wbxEE
SGuFqX+NYoyRV+rfWCcWM+hJEmnWS8LNAKkd13YE2+17sPYzUdZ23DmTxXK6KlAxKFW27CBySUfg
qdNXp2DSs2KAQYih27pBNMuHfGbM/ATFPWFvxg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lYoEi/e8HsDTz6N11EDe/B/iitERmeYndlCklmCluwgb0N4W80JUGVlkd7NlRZHRNhxaNBJPkcjC
n61nO0tb17NwsMwjbY5TF8JWRYTNw1JXCFacvQYrdKv4/7QNQEtwVGiCLxFhOA8aHlWMZIrc2fri
VRMVWaEBcPwCGorlVIM=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QEw9fEsWFbdX0OQLvYs/gl+zyEOW3ak9TdQVaq+0AXXOT3LIqF7wDxJ6ZBnlf9mNbdsUVH5tAz1o
H8u7ihJl1L3THEvugW+TS8hkvVbEA9rKO2vV15KAj4Lla7UdFT/xDfe79RFarlLI7yGrubjgdoRi
QWy//UKsffG7IWNwmoSuppWiWB4ZHJtkunNyIkm70JPGyZF62VxJg1MTT+5LUbZG5vZjjuHZud9w
xJaKv1tFP/x8RVqLU5gPOqGqTW7/nKO2S+450Vo4D9vAmBVVcXpaL1EbSmCvQ+qJmcQKtf9qYFRV
Zko08hbpHjPxstqvTDro01jRzB8592m4xU2TWA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TC7q853CWBPPJgbRfgDV1lmjUwSAtliljShAyNFg8sfRfwDzchthzoSPH1UCHV++E2JXacEKq1lB
UWsNP92U4Xh0/Gu+6esOI0pJb8I+TRTxyBN1I4cRQEfQHcwfhbSdeH3yX9OV3opLEqYmT37hWU+J
zCawYnxVESI0FtRzEXve9gdEWlrKKckrT/hp4mvxxOjvOkOSQBvy0elgUOqh6mEOZl+JnUbsR+Wm
CoZLE1eefMZy3FnVmyDNPv3JPXi88aLXMyimal0MYFkTiS4XJiGT3eAIMIbksehXY+eYi/KFpZWQ
GHpX+lG3UmiWWLwyPakFwKEHbrBc70AlJ2eV9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j9nmCKgjPWNChPbpSW6EWLrMA6oCG2JGPoum8px09v0PEAh0DRXZi0J8HPzXUsZgOEMcKpA7X54u
YFcDDCLAQ+urha/eSPbQYHQh4yGCursxAQ1C6LEyNQ2wJ0eLlO2bJeAl/gof06zqsYVM2lLJVNv5
wao1k2bmgPdfpfY3c9vPD0fSMuZPS41EoRS0cQhO5GTZnKdjxm6tEUL3GnTjB8ynSCIbCJUsMtAX
4FRHNa52gudx5B5fagR+lXgFhE7e++rWTJELr7SYB+r5Es8qZLTpCH8TrQxEkV0rY/+e4sAjNE2D
gHw8GD7VcUtc15B8y1BbVmh29qc8Nd3V2i/miA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UkCD6I/Vye4qNoNoa3hIexBXG3xyKUJPAHAjIo7UcNVCDXpMQiYEtPDqExZMfiPlJn2nswCYIfIJ
FYWqMCloKSQyyI/7yZ2EtbyWEklb/P5IyZyvGi6hhFUo/JFTb12b4bK0gZPr+bCDdlVQKTx5GVHz
wptdUJO2omSj8axVMPbLRRtVzlJIZ29dTJ2ATXVXAcBxPnFfHRAMnYYKLeeLExX61vQvpqrkLQHm
XG7hpVzJi56gYKAzxa2BLq072OCVpVS70bfWlhlSTVcSlCrUf+EcarEk4FD8+Ih2NCvrqremG6yn
TtcBn8Xr8M/6zhOYvLi6AD6eArDMKA8n+Ccv8A==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A5y5QVZU8yjPexRVPioSiAGohCHD5DX5FVobuMyhcgQRExLUhPvnnS8HOtxTj/2IapEcz68gFMGG
Hpi+m725u85/om/Vze9pGIW9Mn328Kz2FIg3W5EvGstfGwY+48LiAGAmTR269JS4lJGVYWYOz7Xk
S8cEsFd2m7j8iyKtARJzD90+UdXq/cIIh725jC9i8nbgxB364zddvm1Z/DF3JRw1qFp6GGcuRai1
KNcJ1j8c9wtIgktpsteU3e5+bxHEw8NT3gWXUFYjm00NDq97Jals8Jjktmum2nQxoF7ivPacfEey
gnSF6jRMkTsZObzc30hAhs0CEtc33hZLhPLHSn8pQ0WyvKJLHdd5s2yckgTZtqxC1Sbwe7WEgNXe
ZMX3pIkz+aoXsAL7GBLyVBMVQcyMoF0w8QGAaTe8sqatABwPqXidYRqNROTf62IYcMpV89XYgaTv
EwIn/oni9KOFd2BFVxRZbFGGC4IjvigsTBUijI+Dk6kVnDh240clGcc4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Omtp+lCaqUx7Z4qdFj2zrN8LpCkit2eX4hlMtig+ielGm/x4FSZkpjoFmiqdKFPi2eg0pg09MSai
XyGH68UzAR7Xrj8f1jlIoUmMKp4GcxfdqfTeuu7kWGOJEP6cvgTjSJFj2gawDv7f4yZcltnK2x0L
e4GW/rBTmGvZtKWb2ahjINLxPuh3dDaSaWdb+zVgbtyrI5FrjxBkq+aOxSjyNsqnCx1L0uWbxnkl
88NbXN3dTaECXHNm/fsleayM5hKis7kTv9BFajJMGy+BhQlmIYpE+F5zchnTTFUFJZCz1sX9Fc8e
HcY7irB8mR3ajdzjUZLBQEMktp096Nheq3U75A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpeBLwN9x2ZFDwroYLlUe5GjjDepHik2l0c2s3/6S7JPCRkzQSyt2V1Ad/JewAs/QNp5SXSbYYB4
rQl0My1LDMF3xw43r0g2IbcyHVpPhGp0W5msuQdF67afnsRv90iJYWLMI3QkYGCTWAzl4HrLxFSg
3z8XZRK670IcxznOrlvgHmIKsvubZrBkuc1EynrVb9Nw16QnIx2rc4WgcEXeFf+4i1RoYLDd3gXK
NFCNMdtaRYUThunFP6Z4ViZ5UnDmKq+IMhd31jTaqIlWOBDxPI1+v5RJYxIyTbn4rxlKR2fNbl5/
z4OUjBTd+1GH3I2OXlqmAOvIhpe2Z2HH7nZu/A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Mt2RhTSUwEIEWeNARbyL+EdfS1UF6nPaL/fKl/7oO2gina93egwCWDLl1fbBtkfaPco0cu4MJ9K3
OraAsyHRlY+MNShmJ1LzAIA1LjZx4y55lu9dlQqSUXR7AW7wVbkg1864mK+hM/1XygU0jvebKNW9
B7xSER+asLO6pxi0mt7uC2PHxLPAYEszFhmnap82TtbDGdQ2qtyekY+ngs+N2fAdsblxVwJruiMl
e6XJ127M8N1mYwhWU2HtRpBOSnnKoHgD9fG51XK/rhk8DxT66QnX9uLPB+H25eDupBJGi1Y5o6x8
hOwZiSUVlBLh7brfzevh7+eRn+7es6wBas0+3w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23120)
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
