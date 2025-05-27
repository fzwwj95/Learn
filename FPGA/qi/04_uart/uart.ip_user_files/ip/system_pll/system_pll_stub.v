// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue May 27 16:39:37 2025
// Host        : MSI running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/fzwwj95/work/Learn/FPGA/qi/04_uart/uart.gen/sources_1/ip/system_pll/system_pll_stub.v
// Design      : system_pll
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module system_pll(clk_out1, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,locked,clk_in1" */;
  output clk_out1;
  output locked;
  input clk_in1;
endmodule
