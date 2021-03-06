// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Mon Jun  6 09:48:20 2022
// Host        : fedora running 64-bit Fedora release 36 (Thirty Six)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Task_2_design_sync_0_1_sim_netlist.v
// Design      : Task_2_design_sync_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Task_2_design_sync_0_1,sync,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "sync,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    res_n,
    data_in,
    data_out);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Task_2_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  input res_n;
  input data_in;
  output data_out;

  wire clk;
  wire data_in;
  wire data_out;
  wire res_n;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync inst
       (.clk(clk),
        .data_in(data_in),
        .data_out(data_out),
        .res_n(res_n));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync
   (data_out,
    data_in,
    clk,
    res_n);
  output data_out;
  input data_in;
  input clk;
  input res_n;

  wire clk;
  wire data_in;
  wire data_out;
  wire [6:0]p_0_in;
  wire res_n;

  FDCE \sync_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(res_n),
        .D(data_in),
        .Q(p_0_in[6]));
  FDCE \sync_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(res_n),
        .D(p_0_in[6]),
        .Q(p_0_in[5]));
  FDCE \sync_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(res_n),
        .D(p_0_in[5]),
        .Q(p_0_in[4]));
  FDCE \sync_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(res_n),
        .D(p_0_in[4]),
        .Q(p_0_in[3]));
  FDCE \sync_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(res_n),
        .D(p_0_in[3]),
        .Q(p_0_in[2]));
  FDCE \sync_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(res_n),
        .D(p_0_in[2]),
        .Q(p_0_in[1]));
  FDCE \sync_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(res_n),
        .D(p_0_in[1]),
        .Q(p_0_in[0]));
  FDCE \sync_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(res_n),
        .D(p_0_in[0]),
        .Q(data_out));
endmodule
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
