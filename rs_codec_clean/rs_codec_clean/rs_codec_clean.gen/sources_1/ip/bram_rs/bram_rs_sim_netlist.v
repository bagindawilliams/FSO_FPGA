// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Wed Aug  5 22:48:59 2026
// Host        : Williams running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim {/home/williams/MYFPGA/FPGA
//               Final/rs_codec_clean/rs_codec_clean/rs_codec_clean.gen/sources_1/ip/bram_rs/bram_rs_sim_netlist.v}
// Design      : bram_rs
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku060-ffva1156-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bram_rs,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
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
  bram_rs_blk_mem_gen_v8_4_5 U0
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
        .regcea(1'b0),
        .regceb(1'b0),
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
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23344)
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
