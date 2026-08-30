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
