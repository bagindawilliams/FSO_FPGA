// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Fri Apr 17 22:29:41 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/yrzal0/_FPGA/12_ethernet_test/src/ip/icmp_rx_ram_8_256/icmp_rx_ram_8_256_sim_netlist.v
// Design      : icmp_rx_ram_8_256
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "icmp_rx_ram_8_256,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module icmp_rx_ram_8_256
   (clka,
    wea,
    addra,
    dina,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [7:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire [7:0]dina;
  wire [7:0]doutb;
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
  (* C_COMMON_CLK = "1" *) 
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
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
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
  (* C_INIT_FILE = "icmp_rx_ram_8_256.mem" *) 
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
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "kintexu" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  icmp_rx_ram_8_256_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[7:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22656)
`pragma protect data_block
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
q9/37kNyR0/c4lEleUxCkFzscaooEbaL7izn
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
