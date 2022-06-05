// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Sun Jun  5 17:19:40 2022
// Host        : fedora running 64-bit Fedora release 36 (Thirty Six)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Task_2_design_sync_array_0_0_sim_netlist.v
// Design      : Task_2_design_sync_array_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Task_2_design_sync_array_0_0,sync_array,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "sync_array,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    res_n,
    data_in,
    data_out);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Task_2_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  input res_n;
  input [0:2]data_in;
  output [0:2]data_out;

  wire clk;
  wire [0:2]data_in;
  wire [0:2]data_out;
  wire res_n;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_array inst
       (.clk(clk),
        .data_in(data_in),
        .data_out(data_out),
        .res_n(res_n));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync
   (\sync_reg[7]_inst_gen_synchronizers_p_5_0 ,
    data_out,
    res_n_0,
    data_in,
    clk,
    \sync_reg[8]_0 ,
    res_n);
  output \sync_reg[7]_inst_gen_synchronizers_p_5_0 ;
  output [0:0]data_out;
  output res_n_0;
  input [0:0]data_in;
  input clk;
  input \sync_reg[8]_0 ;
  input res_n;

  wire clk;
  wire [0:0]data_in;
  wire [0:0]data_out;
  wire res_n;
  wire res_n_0;
  wire \sync_reg[6]_srl6__inst_gen_synchronizers_p_4_n_0 ;
  wire \sync_reg[7]_inst_gen_synchronizers_p_5_0 ;
  wire \sync_reg[8]_0 ;

  LUT1 #(
    .INIT(2'h1)) 
    \sync[8]_i_1 
       (.I0(res_n),
        .O(res_n_0));
  (* srl_bus_name = "\inst/gen_synchronizers[0].synch_x/sync_reg " *) 
  (* srl_name = "\inst/gen_synchronizers[0].synch_x/sync_reg[6]_srl6__inst_gen_synchronizers_p_4 " *) 
  SRL16E \sync_reg[6]_srl6__inst_gen_synchronizers_p_4 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(data_in),
        .Q(\sync_reg[6]_srl6__inst_gen_synchronizers_p_4_n_0 ));
  FDRE \sync_reg[7]_inst_gen_synchronizers_p_5 
       (.C(clk),
        .CE(1'b1),
        .D(\sync_reg[6]_srl6__inst_gen_synchronizers_p_4_n_0 ),
        .Q(\sync_reg[7]_inst_gen_synchronizers_p_5_0 ),
        .R(1'b0));
  FDPE \sync_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\sync_reg[8]_0 ),
        .PRE(res_n_0),
        .Q(data_out));
endmodule

(* ORIG_REF_NAME = "sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_0
   (\sync_reg[7]_inst_gen_synchronizers_p_5_0 ,
    data_out,
    data_in,
    clk,
    \sync_reg[8]_0 ,
    \sync_reg[8]_1 );
  output \sync_reg[7]_inst_gen_synchronizers_p_5_0 ;
  output [0:0]data_out;
  input [0:0]data_in;
  input clk;
  input \sync_reg[8]_0 ;
  input \sync_reg[8]_1 ;

  wire clk;
  wire [0:0]data_in;
  wire [0:0]data_out;
  wire \sync_reg[6]_srl6__inst_gen_synchronizers_p_4_n_0 ;
  wire \sync_reg[7]_inst_gen_synchronizers_p_5_0 ;
  wire \sync_reg[8]_0 ;
  wire \sync_reg[8]_1 ;

  (* srl_bus_name = "\inst/gen_synchronizers[1].synch_x/sync_reg " *) 
  (* srl_name = "\inst/gen_synchronizers[1].synch_x/sync_reg[6]_srl6__inst_gen_synchronizers_p_4 " *) 
  SRL16E \sync_reg[6]_srl6__inst_gen_synchronizers_p_4 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(data_in),
        .Q(\sync_reg[6]_srl6__inst_gen_synchronizers_p_4_n_0 ));
  FDRE \sync_reg[7]_inst_gen_synchronizers_p_5 
       (.C(clk),
        .CE(1'b1),
        .D(\sync_reg[6]_srl6__inst_gen_synchronizers_p_4_n_0 ),
        .Q(\sync_reg[7]_inst_gen_synchronizers_p_5_0 ),
        .R(1'b0));
  FDPE \sync_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\sync_reg[8]_0 ),
        .PRE(\sync_reg[8]_1 ),
        .Q(data_out));
endmodule

(* ORIG_REF_NAME = "sync" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_1
   (\sync_reg[7]_inst_gen_synchronizers_p_5_0 ,
    data_out,
    data_in,
    clk,
    \sync_reg[8]_0 ,
    \sync_reg[8]_1 );
  output \sync_reg[7]_inst_gen_synchronizers_p_5_0 ;
  output [0:0]data_out;
  input [0:0]data_in;
  input clk;
  input \sync_reg[8]_0 ;
  input \sync_reg[8]_1 ;

  wire clk;
  wire [0:0]data_in;
  wire [0:0]data_out;
  wire \sync_reg[6]_srl6__inst_gen_synchronizers_p_4_n_0 ;
  wire \sync_reg[7]_inst_gen_synchronizers_p_5_0 ;
  wire \sync_reg[8]_0 ;
  wire \sync_reg[8]_1 ;

  (* srl_bus_name = "\inst/gen_synchronizers[2].synch_x/sync_reg " *) 
  (* srl_name = "\inst/gen_synchronizers[2].synch_x/sync_reg[6]_srl6__inst_gen_synchronizers_p_4 " *) 
  SRL16E \sync_reg[6]_srl6__inst_gen_synchronizers_p_4 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(data_in),
        .Q(\sync_reg[6]_srl6__inst_gen_synchronizers_p_4_n_0 ));
  FDRE \sync_reg[7]_inst_gen_synchronizers_p_5 
       (.C(clk),
        .CE(1'b1),
        .D(\sync_reg[6]_srl6__inst_gen_synchronizers_p_4_n_0 ),
        .Q(\sync_reg[7]_inst_gen_synchronizers_p_5_0 ),
        .R(1'b0));
  FDPE \sync_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\sync_reg[8]_0 ),
        .PRE(\sync_reg[8]_1 ),
        .Q(data_out));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_array
   (data_out,
    clk,
    data_in,
    res_n);
  output [0:2]data_out;
  input clk;
  input [0:2]data_in;
  input res_n;

  wire clk;
  wire [0:2]data_in;
  wire [0:2]data_out;
  wire \gen_synchronizers[0].synch_x_n_0 ;
  wire \gen_synchronizers[0].synch_x_n_2 ;
  wire \gen_synchronizers[1].synch_x_n_0 ;
  wire \gen_synchronizers[2].synch_x_n_0 ;
  wire gen_synchronizers_gate__0_n_0;
  wire gen_synchronizers_gate__1_n_0;
  wire gen_synchronizers_gate_n_0;
  wire gen_synchronizers_p_0_n_0;
  wire gen_synchronizers_p_1_n_0;
  wire gen_synchronizers_p_2_n_0;
  wire gen_synchronizers_p_3_n_0;
  wire gen_synchronizers_p_4_n_0;
  wire gen_synchronizers_p_5_n_0;
  wire gen_synchronizers_p_n_0;
  wire res_n;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync \gen_synchronizers[0].synch_x 
       (.clk(clk),
        .data_in(data_in[0]),
        .data_out(data_out[0]),
        .res_n(res_n),
        .res_n_0(\gen_synchronizers[0].synch_x_n_2 ),
        .\sync_reg[7]_inst_gen_synchronizers_p_5_0 (\gen_synchronizers[0].synch_x_n_0 ),
        .\sync_reg[8]_0 (gen_synchronizers_gate__1_n_0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_0 \gen_synchronizers[1].synch_x 
       (.clk(clk),
        .data_in(data_in[1]),
        .data_out(data_out[1]),
        .\sync_reg[7]_inst_gen_synchronizers_p_5_0 (\gen_synchronizers[1].synch_x_n_0 ),
        .\sync_reg[8]_0 (gen_synchronizers_gate__0_n_0),
        .\sync_reg[8]_1 (\gen_synchronizers[0].synch_x_n_2 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sync_1 \gen_synchronizers[2].synch_x 
       (.clk(clk),
        .data_in(data_in[2]),
        .data_out(data_out[2]),
        .\sync_reg[7]_inst_gen_synchronizers_p_5_0 (\gen_synchronizers[2].synch_x_n_0 ),
        .\sync_reg[8]_0 (gen_synchronizers_gate_n_0),
        .\sync_reg[8]_1 (\gen_synchronizers[0].synch_x_n_2 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    gen_synchronizers_gate
       (.I0(\gen_synchronizers[2].synch_x_n_0 ),
        .I1(gen_synchronizers_p_5_n_0),
        .O(gen_synchronizers_gate_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    gen_synchronizers_gate__0
       (.I0(\gen_synchronizers[1].synch_x_n_0 ),
        .I1(gen_synchronizers_p_5_n_0),
        .O(gen_synchronizers_gate__0_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    gen_synchronizers_gate__1
       (.I0(\gen_synchronizers[0].synch_x_n_0 ),
        .I1(gen_synchronizers_p_5_n_0),
        .O(gen_synchronizers_gate__1_n_0));
  FDPE gen_synchronizers_p
       (.C(clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\gen_synchronizers[0].synch_x_n_2 ),
        .Q(gen_synchronizers_p_n_0));
  FDPE gen_synchronizers_p_0
       (.C(clk),
        .CE(1'b1),
        .D(gen_synchronizers_p_n_0),
        .PRE(\gen_synchronizers[0].synch_x_n_2 ),
        .Q(gen_synchronizers_p_0_n_0));
  FDPE gen_synchronizers_p_1
       (.C(clk),
        .CE(1'b1),
        .D(gen_synchronizers_p_0_n_0),
        .PRE(\gen_synchronizers[0].synch_x_n_2 ),
        .Q(gen_synchronizers_p_1_n_0));
  FDPE gen_synchronizers_p_2
       (.C(clk),
        .CE(1'b1),
        .D(gen_synchronizers_p_1_n_0),
        .PRE(\gen_synchronizers[0].synch_x_n_2 ),
        .Q(gen_synchronizers_p_2_n_0));
  FDPE gen_synchronizers_p_3
       (.C(clk),
        .CE(1'b1),
        .D(gen_synchronizers_p_2_n_0),
        .PRE(\gen_synchronizers[0].synch_x_n_2 ),
        .Q(gen_synchronizers_p_3_n_0));
  FDPE gen_synchronizers_p_4
       (.C(clk),
        .CE(1'b1),
        .D(gen_synchronizers_p_3_n_0),
        .PRE(\gen_synchronizers[0].synch_x_n_2 ),
        .Q(gen_synchronizers_p_4_n_0));
  FDPE gen_synchronizers_p_5
       (.C(clk),
        .CE(1'b1),
        .D(gen_synchronizers_p_4_n_0),
        .PRE(\gen_synchronizers[0].synch_x_n_2 ),
        .Q(gen_synchronizers_p_5_n_0));
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
