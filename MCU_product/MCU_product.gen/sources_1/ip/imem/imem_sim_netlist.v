// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Jun 23 22:11:50 2022
// Host        : LXXTc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Workshop/HDL/53MHZtestok/53MHZtestok.gen/sources_1/ip/imem/imem_sim_netlist.v
// Design      : imem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "imem,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module imem
   (a,
    spo);
  input [10:0]a;
  output [31:0]spo;

  wire \<const0> ;
  wire [10:0]a;
  wire [31:0]\^spo ;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;
  wire [28:4]NLW_U0_spo_UNCONNECTED;

  assign spo[31:29] = \^spo [31:29];
  assign spo[28] = \<const0> ;
  assign spo[27] = \<const0> ;
  assign spo[26:23] = \^spo [26:23];
  assign spo[22] = \<const0> ;
  assign spo[21:20] = \^spo [21:20];
  assign spo[19] = \<const0> ;
  assign spo[18:16] = \^spo [18:16];
  assign spo[15] = \<const0> ;
  assign spo[14:12] = \^spo [14:12];
  assign spo[11] = \<const0> ;
  assign spo[10] = \<const0> ;
  assign spo[9] = \<const0> ;
  assign spo[8] = \<const0> ;
  assign spo[7] = \<const0> ;
  assign spo[6] = \<const0> ;
  assign spo[5] = \<const0> ;
  assign spo[4] = \<const0> ;
  assign spo[3:0] = \^spo [3:0];
  GND GND
       (.G(\<const0> ));
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "11" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "2048" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "imem.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  (* is_du_within_envelope = "true" *) 
  imem_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[31:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(\^spo ),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
AWk2+F/LLIwJ/3H70MT+p73z+MaZAUnylB9xu/zfH66xX8dAaOizqpslZkE4MXrWhxdHpghP7sIj
kwvWqhJ3gA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
f3tnX2YCmmij/BT714m5fPTuG3pr/Sp1bWD1FpCFiwTkcUFmqMNcr7abCn+qa2HUp1VAs9a1kY1i
yU68W3C4ARAx1rnlow3CtMBZ+4vG1QDA+Ciu5T+MSJsiWTAoMU3jJunULwD6zEC9h/Y3bBf+ZNGj
RvbKgHQFYSq+EYUzleQ=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
C6xRmzJVnvguMc3Lt5tkoyg5+/u1VuxRooNBOmgUvD6c148xX9CV/zz4fw53vbCzqUg3WYMPAs5M
/tMrhPMrX5cqjMMHbC20NaFxsFGCfdbN+1Jiu6Ffu0obXLvBu7UGBCEaDTCY0wST3S+7NZ+HnAat
RIt5cVRmnWtLEj9MP8SxAk019LKc3+2AUY0eWFhWbTGvNoTLcRFak8vqIx8KBuqhc16O50jjNmM3
PJltfibMKzAmWpsf6xiOkaD+BvARuccAoYGgANLBAEQdJUza98//SuTN0KLZKbFSmy2WI5iAzkxJ
bhH9hPn6Ks1JkH9+j61hMSpdxSh8rM8X8Dppxw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pefxdCU7VwYHa7diZaenheQOVCFpIvDlVp0qUtYsCnfw3IK+d5+k4O7xc5MWvQPeJpwUWNg+c9U8
PcbHo1enWoVg9o1V4U5fg7wxYqKmubBjgGF3yJ5FYGt6FeiD7zcnIJcaP2puAYDdVnxtiJnNmFz2
OQ7UQsleDpBQo3E4NEsbtqgSaopjHREMjI4yjJ9l5XZYNPCWUzUV/mSGX/kF+vuSOZclwPm6w72e
TE0MyJZA2HPDY3HIy260pYSHuDTUpe8gTxi0s8JmpFjaMaibBcPzq2gqPSQe1d6pDE8cv0OxNYKL
gFy+uh/H5gpNjfWVBhRmUo/kFf8fs680z0B0IQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
q8meW/DFYsK3R2jTQ13P/a1BVQyF0Eb3aLhqxNSrqINAq7gQ0DvJ6JFuxd6Ce7TIpxqKUYX9026h
UujOPWt7f1brVrSWmt8cW5Um2Yy8tv+YSNv9Ig592u4GssTU6dF978RK/7L4ZuQObLOKvWLJqo3F
6gzw0VbqYS3g5aaGu+Y=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GVM7UoBz9uTOdnKd0CVM0lBuJK2N20FwcoiRGregMBQMsQuevbc7y03ZehM7mfGvEdERp1TciWoI
1b6cDAZYb0YBfSuch0bItCwhdftV3A4/R0nUF0HROsZ/rm/HV7DKDXxItqK0qcdOwqf7ju85NMa4
FJRP/Nuq/ya9IvX9BCpmUlT7tLkICG8cEL8/iJrJY3jRIBtKw85mL5OM+r22LQeYg1/3rb9Rk9BT
RZCTbDcVSUq2Awr+6f0L2NXlRwhFraBy+h9iSZKZ/U7uolyF0nB1+/BSgOl+rttZ2KxfLXe6g81N
FbxtrlpK7FNc9fx2jrKWh5bczyW6p0ATPX0ZbA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rYkJ9a3QzTBGC5CITub5Su2Qs6nnM1m+OFLf4ykZkZGIsp11NQi6h5t8dsi/rX/MeEof1XLVJGEU
N+qLOHuLrttRAipPNBsj7yqH3Amnleqy/rjy8UcckD0gxIYzuIlc+2VKoAoyrEFgofTH5bKzBaaQ
q0JSt8PES8xuld4SvsKwr+0Q23qJIUpeNL3HvzxZDmYf5OhTkwlZPi/aLwSMoPZHKwetLUg5SdBm
7K4UmxvUPD3GNxo6GW6dkG2tFW/N9+ju7i//O1A74VUrDPo1OwQfEJazwHFFpHGjCJkv2CiPU3+I
TIVvzssQcs8IphMJulwZguc7fFiYv6aZyj/GrA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PqIVM68d++A6qxRgSePlX8JOoCfHcFLdhzsYr1BDYvLE5JJ5WKFO0Bie6pyEiAbsH8z6oUFGm/Qy
BLXAyWfv1fmbVAwztezaMaxBF0Lw4epvQlAFVdMGJVKgvxfU7ssvLc1KfpF6R/c1o5+4Vf7zn3X+
R8k67LVYgJoxhrPoY3XYr88CjSITfNW0jLDjh0jtDWf7H7nM6QYSXVbRYczQPcepXW2MOFcCZsbi
tdla+UNJ4NeKTUK5bdE9tNZx/8BYKrJtLhyvNdwHi7EdonKLjQu63ExIHoriUmiZScMNbtr2LUBc
YYGUTIENquQ/OhU+DAVXmKbIZcQhwGaqjYeaag==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YMvD1GHkklhDlN9yur11SqhNZTItCRHxHobZtty993SsbvXTWJBbLeIJ+nQ/sv57gpjV5RswiJYh
Vu7QPlLUy2DbVjjcqxaxXlPvYaWV1eKD7BVBOV6HDzPAaAIaFvNjeRurYX0a9Dz1qkgkmttneZxB
s04mTyRdVOc7jIs5wjgXiF+iA0W50/g9JmIYyP6mMLkgEy0MbGyVfpbRfDMcrB3ACnucHTo8A0nT
V/rBUOGbTCYPmQ01tbuE2nqoEfTlmqHVKO6BZ93tQUEjrYoJdteva6yHUfH3dbV1vwwBtsdolICY
7x8cMlorxb6y2ZD7vQEYz6Q6iVnG/PmdaCkLSg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10768)
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
