// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Jun 24 00:30:42 2022
// Host        : LXXTc running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Workshop/HDL/53MHZtestok/53MHZtestok.gen/sources_1/ip/dmem/dmem_stub.v
// Design      : dmem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2020.2" *)
module dmem(a, d, clk, we, spo)
/* synthesis syn_black_box black_box_pad_pin="a[8:0],d[15:0],clk,we,spo[15:0]" */;
  input [8:0]a;
  input [15:0]d;
  input clk;
  input we;
  output [15:0]spo;
endmodule
