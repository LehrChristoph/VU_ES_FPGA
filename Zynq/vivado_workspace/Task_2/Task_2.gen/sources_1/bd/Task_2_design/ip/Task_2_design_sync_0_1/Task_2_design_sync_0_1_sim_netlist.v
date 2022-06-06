// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Mon Jun  6 19:36:00 2022
// Host        : fedora running 64-bit Fedora release 36 (Thirty Six)
// Command     : write_verilog -force -mode funcsim
//               /home/christophlehr/TUWien/studium/es_fpga/VU_ES_FPGA/Zynq/vivado_workspace/Task_2/Task_2.gen/sources_1/bd/Task_2_design/ip/Task_2_design_sync_0_1/Task_2_design_sync_0_1_sim_netlist.v
// Design      : Task_2_design_sync_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Task_2_design_sync_0_1,sync,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "sync,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module Task_2_design_sync_0_1
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

  Task_2_design_sync_0_1_sync inst
       (.clk(clk),
        .data_in(data_in),
        .data_out(data_out),
        .res_n(res_n));
endmodule

(* ORIG_REF_NAME = "sync" *) 
module Task_2_design_sync_0_1_sync
   (data_out,
    data_in,
    clk,
    res_n);
  output data_out;
  input data_in;
  input clk;
  input res_n;

  wire clk;
  wire count0;
  wire data_in;
  wire data_out;
  wire data_out_i_1_n_0;
  wire data_out_i_2_n_0;
  wire data_out_i_3_n_0;
  wire data_out_i_4_n_0;
  wire data_out_i_5_n_0;
  wire \ffs_reg_n_0_[1] ;
  wire p_0_in;
  wire p_1_in;
  wire res_n;
  wire \sync_proc.count[0]_i_1_n_0 ;
  wire \sync_proc.count[0]_i_4_n_0 ;
  wire [19:6]\sync_proc.count_reg ;
  wire \sync_proc.count_reg[0]_i_3_n_0 ;
  wire \sync_proc.count_reg[0]_i_3_n_1 ;
  wire \sync_proc.count_reg[0]_i_3_n_2 ;
  wire \sync_proc.count_reg[0]_i_3_n_3 ;
  wire \sync_proc.count_reg[0]_i_3_n_4 ;
  wire \sync_proc.count_reg[0]_i_3_n_5 ;
  wire \sync_proc.count_reg[0]_i_3_n_6 ;
  wire \sync_proc.count_reg[0]_i_3_n_7 ;
  wire \sync_proc.count_reg[12]_i_1_n_0 ;
  wire \sync_proc.count_reg[12]_i_1_n_1 ;
  wire \sync_proc.count_reg[12]_i_1_n_2 ;
  wire \sync_proc.count_reg[12]_i_1_n_3 ;
  wire \sync_proc.count_reg[12]_i_1_n_4 ;
  wire \sync_proc.count_reg[12]_i_1_n_5 ;
  wire \sync_proc.count_reg[12]_i_1_n_6 ;
  wire \sync_proc.count_reg[12]_i_1_n_7 ;
  wire \sync_proc.count_reg[16]_i_1_n_1 ;
  wire \sync_proc.count_reg[16]_i_1_n_2 ;
  wire \sync_proc.count_reg[16]_i_1_n_3 ;
  wire \sync_proc.count_reg[16]_i_1_n_4 ;
  wire \sync_proc.count_reg[16]_i_1_n_5 ;
  wire \sync_proc.count_reg[16]_i_1_n_6 ;
  wire \sync_proc.count_reg[16]_i_1_n_7 ;
  wire \sync_proc.count_reg[4]_i_1_n_0 ;
  wire \sync_proc.count_reg[4]_i_1_n_1 ;
  wire \sync_proc.count_reg[4]_i_1_n_2 ;
  wire \sync_proc.count_reg[4]_i_1_n_3 ;
  wire \sync_proc.count_reg[4]_i_1_n_4 ;
  wire \sync_proc.count_reg[4]_i_1_n_5 ;
  wire \sync_proc.count_reg[4]_i_1_n_6 ;
  wire \sync_proc.count_reg[4]_i_1_n_7 ;
  wire \sync_proc.count_reg[8]_i_1_n_0 ;
  wire \sync_proc.count_reg[8]_i_1_n_1 ;
  wire \sync_proc.count_reg[8]_i_1_n_2 ;
  wire \sync_proc.count_reg[8]_i_1_n_3 ;
  wire \sync_proc.count_reg[8]_i_1_n_4 ;
  wire \sync_proc.count_reg[8]_i_1_n_5 ;
  wire \sync_proc.count_reg[8]_i_1_n_6 ;
  wire \sync_proc.count_reg[8]_i_1_n_7 ;
  wire \sync_proc.count_reg_n_0_[0] ;
  wire \sync_proc.count_reg_n_0_[1] ;
  wire \sync_proc.count_reg_n_0_[2] ;
  wire \sync_proc.count_reg_n_0_[3] ;
  wire \sync_proc.count_reg_n_0_[4] ;
  wire \sync_proc.count_reg_n_0_[5] ;
  wire [3:3]\NLW_sync_proc.count_reg[16]_i_1_CO_UNCONNECTED ;

  LUT5 #(
    .INIT(32'hFFEF0080)) 
    data_out_i_1
       (.I0(\ffs_reg_n_0_[1] ),
        .I1(p_1_in),
        .I2(res_n),
        .I3(data_out_i_2_n_0),
        .I4(data_out),
        .O(data_out_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFF8FFF)) 
    data_out_i_2
       (.I0(data_out_i_3_n_0),
        .I1(data_out_i_4_n_0),
        .I2(\sync_proc.count_reg [18]),
        .I3(\sync_proc.count_reg [19]),
        .I4(data_out_i_5_n_0),
        .O(data_out_i_2_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    data_out_i_3
       (.I0(\sync_proc.count_reg [15]),
        .I1(\sync_proc.count_reg [10]),
        .I2(\sync_proc.count_reg [11]),
        .I3(\sync_proc.count_reg [13]),
        .I4(\sync_proc.count_reg [12]),
        .O(data_out_i_3_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    data_out_i_4
       (.I0(\sync_proc.count_reg [6]),
        .I1(\sync_proc.count_reg [7]),
        .I2(\sync_proc.count_reg [8]),
        .I3(\sync_proc.count_reg [9]),
        .O(data_out_i_4_n_0));
  LUT4 #(
    .INIT(16'h777F)) 
    data_out_i_5
       (.I0(\sync_proc.count_reg [17]),
        .I1(\sync_proc.count_reg [16]),
        .I2(\sync_proc.count_reg [14]),
        .I3(\sync_proc.count_reg [15]),
        .O(data_out_i_5_n_0));
  FDRE data_out_reg
       (.C(clk),
        .CE(1'b1),
        .D(data_out_i_1_n_0),
        .Q(data_out),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \ffs[0]_i_1 
       (.I0(res_n),
        .O(p_0_in));
  FDCE \ffs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(data_in),
        .Q(p_1_in));
  FDCE \ffs_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(p_1_in),
        .Q(\ffs_reg_n_0_[1] ));
  LUT3 #(
    .INIT(8'h60)) 
    \sync_proc.count[0]_i_1 
       (.I0(p_1_in),
        .I1(\ffs_reg_n_0_[1] ),
        .I2(res_n),
        .O(\sync_proc.count[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \sync_proc.count[0]_i_2 
       (.I0(res_n),
        .I1(data_out_i_2_n_0),
        .O(count0));
  LUT1 #(
    .INIT(2'h1)) 
    \sync_proc.count[0]_i_4 
       (.I0(\sync_proc.count_reg_n_0_[0] ),
        .O(\sync_proc.count[0]_i_4_n_0 ));
  FDRE \sync_proc.count_reg[0] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[0]_i_3_n_7 ),
        .Q(\sync_proc.count_reg_n_0_[0] ),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sync_proc.count_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\sync_proc.count_reg[0]_i_3_n_0 ,\sync_proc.count_reg[0]_i_3_n_1 ,\sync_proc.count_reg[0]_i_3_n_2 ,\sync_proc.count_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\sync_proc.count_reg[0]_i_3_n_4 ,\sync_proc.count_reg[0]_i_3_n_5 ,\sync_proc.count_reg[0]_i_3_n_6 ,\sync_proc.count_reg[0]_i_3_n_7 }),
        .S({\sync_proc.count_reg_n_0_[3] ,\sync_proc.count_reg_n_0_[2] ,\sync_proc.count_reg_n_0_[1] ,\sync_proc.count[0]_i_4_n_0 }));
  FDRE \sync_proc.count_reg[10] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[8]_i_1_n_5 ),
        .Q(\sync_proc.count_reg [10]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[11] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[8]_i_1_n_4 ),
        .Q(\sync_proc.count_reg [11]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[12] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[12]_i_1_n_7 ),
        .Q(\sync_proc.count_reg [12]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sync_proc.count_reg[12]_i_1 
       (.CI(\sync_proc.count_reg[8]_i_1_n_0 ),
        .CO({\sync_proc.count_reg[12]_i_1_n_0 ,\sync_proc.count_reg[12]_i_1_n_1 ,\sync_proc.count_reg[12]_i_1_n_2 ,\sync_proc.count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\sync_proc.count_reg[12]_i_1_n_4 ,\sync_proc.count_reg[12]_i_1_n_5 ,\sync_proc.count_reg[12]_i_1_n_6 ,\sync_proc.count_reg[12]_i_1_n_7 }),
        .S(\sync_proc.count_reg [15:12]));
  FDRE \sync_proc.count_reg[13] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[12]_i_1_n_6 ),
        .Q(\sync_proc.count_reg [13]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[14] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[12]_i_1_n_5 ),
        .Q(\sync_proc.count_reg [14]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[15] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[12]_i_1_n_4 ),
        .Q(\sync_proc.count_reg [15]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[16] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[16]_i_1_n_7 ),
        .Q(\sync_proc.count_reg [16]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sync_proc.count_reg[16]_i_1 
       (.CI(\sync_proc.count_reg[12]_i_1_n_0 ),
        .CO({\NLW_sync_proc.count_reg[16]_i_1_CO_UNCONNECTED [3],\sync_proc.count_reg[16]_i_1_n_1 ,\sync_proc.count_reg[16]_i_1_n_2 ,\sync_proc.count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\sync_proc.count_reg[16]_i_1_n_4 ,\sync_proc.count_reg[16]_i_1_n_5 ,\sync_proc.count_reg[16]_i_1_n_6 ,\sync_proc.count_reg[16]_i_1_n_7 }),
        .S(\sync_proc.count_reg [19:16]));
  FDRE \sync_proc.count_reg[17] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[16]_i_1_n_6 ),
        .Q(\sync_proc.count_reg [17]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[18] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[16]_i_1_n_5 ),
        .Q(\sync_proc.count_reg [18]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[19] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[16]_i_1_n_4 ),
        .Q(\sync_proc.count_reg [19]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[1] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[0]_i_3_n_6 ),
        .Q(\sync_proc.count_reg_n_0_[1] ),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[2] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[0]_i_3_n_5 ),
        .Q(\sync_proc.count_reg_n_0_[2] ),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[3] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[0]_i_3_n_4 ),
        .Q(\sync_proc.count_reg_n_0_[3] ),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[4] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[4]_i_1_n_7 ),
        .Q(\sync_proc.count_reg_n_0_[4] ),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sync_proc.count_reg[4]_i_1 
       (.CI(\sync_proc.count_reg[0]_i_3_n_0 ),
        .CO({\sync_proc.count_reg[4]_i_1_n_0 ,\sync_proc.count_reg[4]_i_1_n_1 ,\sync_proc.count_reg[4]_i_1_n_2 ,\sync_proc.count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\sync_proc.count_reg[4]_i_1_n_4 ,\sync_proc.count_reg[4]_i_1_n_5 ,\sync_proc.count_reg[4]_i_1_n_6 ,\sync_proc.count_reg[4]_i_1_n_7 }),
        .S({\sync_proc.count_reg [7:6],\sync_proc.count_reg_n_0_[5] ,\sync_proc.count_reg_n_0_[4] }));
  FDRE \sync_proc.count_reg[5] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[4]_i_1_n_6 ),
        .Q(\sync_proc.count_reg_n_0_[5] ),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[6] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[4]_i_1_n_5 ),
        .Q(\sync_proc.count_reg [6]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[7] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[4]_i_1_n_4 ),
        .Q(\sync_proc.count_reg [7]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  FDRE \sync_proc.count_reg[8] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[8]_i_1_n_7 ),
        .Q(\sync_proc.count_reg [8]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \sync_proc.count_reg[8]_i_1 
       (.CI(\sync_proc.count_reg[4]_i_1_n_0 ),
        .CO({\sync_proc.count_reg[8]_i_1_n_0 ,\sync_proc.count_reg[8]_i_1_n_1 ,\sync_proc.count_reg[8]_i_1_n_2 ,\sync_proc.count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\sync_proc.count_reg[8]_i_1_n_4 ,\sync_proc.count_reg[8]_i_1_n_5 ,\sync_proc.count_reg[8]_i_1_n_6 ,\sync_proc.count_reg[8]_i_1_n_7 }),
        .S(\sync_proc.count_reg [11:8]));
  FDRE \sync_proc.count_reg[9] 
       (.C(clk),
        .CE(count0),
        .D(\sync_proc.count_reg[8]_i_1_n_6 ),
        .Q(\sync_proc.count_reg [9]),
        .R(\sync_proc.count[0]_i_1_n_0 ));
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
