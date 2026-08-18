// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Fri Apr 17 22:29:40 2026
// Host        : yrzal-linux running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ icmp_rx_ram_8_256_sim_netlist.v
// Design      : icmp_rx_ram_8_256
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "icmp_rx_ram_8_256,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_12 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22640)
`pragma protect data_block
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
7eqxrdrbPMBEN0E=
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
