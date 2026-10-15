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
