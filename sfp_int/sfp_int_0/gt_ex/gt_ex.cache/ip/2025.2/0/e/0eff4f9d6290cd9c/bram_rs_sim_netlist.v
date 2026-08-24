// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Aug 24 16:29:10 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bram_rs_sim_netlist.v
// Design      : bram_rs
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bram_rs,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_12 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23488)
`pragma protect data_block
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
hH7NPQ==
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
