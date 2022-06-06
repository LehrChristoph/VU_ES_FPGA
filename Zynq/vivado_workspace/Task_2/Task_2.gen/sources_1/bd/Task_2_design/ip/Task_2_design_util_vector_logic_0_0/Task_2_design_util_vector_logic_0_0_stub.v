// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Mon Jun  6 09:48:20 2022
// Host        : fedora running 64-bit Fedora release 36 (Thirty Six)
// Command     : write_verilog -force -mode synth_stub
//               /home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2.gen/sources_1/bd/Task_2_design/ip/Task_2_design_util_vector_logic_0_0/Task_2_design_util_vector_logic_0_0_stub.v
// Design      : Task_2_design_util_vector_logic_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "util_vector_logic_v2_0_2_util_vector_logic,Vivado 2022.1" *)
module Task_2_design_util_vector_logic_0_0(Op1, Res)
/* synthesis syn_black_box black_box_pad_pin="Op1[0:0],Res[0:0]" */;
  input [0:0]Op1;
  output [0:0]Res;
endmodule
