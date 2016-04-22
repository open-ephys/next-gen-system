// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.3.1 (lin32) Build 1056140 Thu Oct 30 16:34:49 MDT 2014
// Date        : Tue Apr 19 19:57:42 2016
// Host        : open-ephys-pwn running 32-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/oe/Downloads/xillybus-eval-kintex7-1.2d/vivado-essentials/fifo_8x2048/fifo_8x2048_stub.v
// Design      : fifo_8x2048
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v12_0,Vivado 2014.3.1" *)
module fifo_8x2048(clk, srst, din, wr_en, rd_en, dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[7:0],wr_en,rd_en,dout[7:0],full,empty" */;
  input clk;
  input srst;
  input [7:0]din;
  input wr_en;
  input rd_en;
  output [7:0]dout;
  output full;
  output empty;
endmodule
