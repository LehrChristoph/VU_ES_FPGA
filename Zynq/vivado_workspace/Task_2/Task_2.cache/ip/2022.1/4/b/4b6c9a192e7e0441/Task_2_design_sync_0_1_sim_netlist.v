// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Mon Jun  6 18:27:06 2022
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
  wire data_out_i_2_n_0;
  wire out_neg;
  wire out_neg_i_1_n_0;
  wire out_old;
  wire out_pos;
  wire out_pos_i_1_n_0;
  wire res_n;
  wire [1:100]sync;

  LUT3 #(
    .INIT(8'hBA)) 
    data_out_i_1
       (.I0(out_pos),
        .I1(out_neg),
        .I2(data_out),
        .O(out_old));
  LUT1 #(
    .INIT(2'h1)) 
    data_out_i_2
       (.I0(res_n),
        .O(data_out_i_2_n_0));
  FDCE data_out_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(out_old),
        .Q(data_out));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h74)) 
    out_neg_i_1
       (.I0(sync[100]),
        .I1(res_n),
        .I2(out_neg),
        .O(out_neg_i_1_n_0));
  FDRE out_neg_reg
       (.C(clk),
        .CE(1'b1),
        .D(out_neg_i_1_n_0),
        .Q(out_neg),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    out_pos_i_1
       (.I0(sync[100]),
        .I1(res_n),
        .I2(out_pos),
        .O(out_pos_i_1_n_0));
  FDRE out_pos_reg
       (.C(clk),
        .CE(1'b1),
        .D(out_pos_i_1_n_0),
        .Q(out_pos),
        .R(1'b0));
  FDCE \sync_reg[100] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[99]),
        .Q(sync[100]));
  FDCE \sync_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[9]),
        .Q(sync[10]));
  FDCE \sync_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[10]),
        .Q(sync[11]));
  FDCE \sync_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[11]),
        .Q(sync[12]));
  FDCE \sync_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[12]),
        .Q(sync[13]));
  FDCE \sync_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[13]),
        .Q(sync[14]));
  FDCE \sync_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[14]),
        .Q(sync[15]));
  FDCE \sync_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[15]),
        .Q(sync[16]));
  FDCE \sync_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[16]),
        .Q(sync[17]));
  FDCE \sync_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[17]),
        .Q(sync[18]));
  FDCE \sync_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[18]),
        .Q(sync[19]));
  FDCE \sync_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(data_in),
        .Q(sync[1]));
  FDCE \sync_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[19]),
        .Q(sync[20]));
  FDCE \sync_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[20]),
        .Q(sync[21]));
  FDCE \sync_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[21]),
        .Q(sync[22]));
  FDCE \sync_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[22]),
        .Q(sync[23]));
  FDCE \sync_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[23]),
        .Q(sync[24]));
  FDCE \sync_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[24]),
        .Q(sync[25]));
  FDCE \sync_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[25]),
        .Q(sync[26]));
  FDCE \sync_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[26]),
        .Q(sync[27]));
  FDCE \sync_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[27]),
        .Q(sync[28]));
  FDCE \sync_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[28]),
        .Q(sync[29]));
  FDCE \sync_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[1]),
        .Q(sync[2]));
  FDCE \sync_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[29]),
        .Q(sync[30]));
  FDCE \sync_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[30]),
        .Q(sync[31]));
  FDCE \sync_reg[32] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[31]),
        .Q(sync[32]));
  FDCE \sync_reg[33] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[32]),
        .Q(sync[33]));
  FDCE \sync_reg[34] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[33]),
        .Q(sync[34]));
  FDCE \sync_reg[35] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[34]),
        .Q(sync[35]));
  FDCE \sync_reg[36] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[35]),
        .Q(sync[36]));
  FDCE \sync_reg[37] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[36]),
        .Q(sync[37]));
  FDCE \sync_reg[38] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[37]),
        .Q(sync[38]));
  FDCE \sync_reg[39] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[38]),
        .Q(sync[39]));
  FDCE \sync_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[2]),
        .Q(sync[3]));
  FDCE \sync_reg[40] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[39]),
        .Q(sync[40]));
  FDCE \sync_reg[41] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[40]),
        .Q(sync[41]));
  FDCE \sync_reg[42] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[41]),
        .Q(sync[42]));
  FDCE \sync_reg[43] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[42]),
        .Q(sync[43]));
  FDCE \sync_reg[44] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[43]),
        .Q(sync[44]));
  FDCE \sync_reg[45] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[44]),
        .Q(sync[45]));
  FDCE \sync_reg[46] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[45]),
        .Q(sync[46]));
  FDCE \sync_reg[47] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[46]),
        .Q(sync[47]));
  FDCE \sync_reg[48] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[47]),
        .Q(sync[48]));
  FDCE \sync_reg[49] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[48]),
        .Q(sync[49]));
  FDCE \sync_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[3]),
        .Q(sync[4]));
  FDCE \sync_reg[50] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[49]),
        .Q(sync[50]));
  FDCE \sync_reg[51] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[50]),
        .Q(sync[51]));
  FDCE \sync_reg[52] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[51]),
        .Q(sync[52]));
  FDCE \sync_reg[53] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[52]),
        .Q(sync[53]));
  FDCE \sync_reg[54] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[53]),
        .Q(sync[54]));
  FDCE \sync_reg[55] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[54]),
        .Q(sync[55]));
  FDCE \sync_reg[56] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[55]),
        .Q(sync[56]));
  FDCE \sync_reg[57] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[56]),
        .Q(sync[57]));
  FDCE \sync_reg[58] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[57]),
        .Q(sync[58]));
  FDCE \sync_reg[59] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[58]),
        .Q(sync[59]));
  FDCE \sync_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[4]),
        .Q(sync[5]));
  FDCE \sync_reg[60] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[59]),
        .Q(sync[60]));
  FDCE \sync_reg[61] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[60]),
        .Q(sync[61]));
  FDCE \sync_reg[62] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[61]),
        .Q(sync[62]));
  FDCE \sync_reg[63] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[62]),
        .Q(sync[63]));
  FDCE \sync_reg[64] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[63]),
        .Q(sync[64]));
  FDCE \sync_reg[65] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[64]),
        .Q(sync[65]));
  FDCE \sync_reg[66] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[65]),
        .Q(sync[66]));
  FDCE \sync_reg[67] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[66]),
        .Q(sync[67]));
  FDCE \sync_reg[68] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[67]),
        .Q(sync[68]));
  FDCE \sync_reg[69] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[68]),
        .Q(sync[69]));
  FDCE \sync_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[5]),
        .Q(sync[6]));
  FDCE \sync_reg[70] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[69]),
        .Q(sync[70]));
  FDCE \sync_reg[71] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[70]),
        .Q(sync[71]));
  FDCE \sync_reg[72] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[71]),
        .Q(sync[72]));
  FDCE \sync_reg[73] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[72]),
        .Q(sync[73]));
  FDCE \sync_reg[74] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[73]),
        .Q(sync[74]));
  FDCE \sync_reg[75] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[74]),
        .Q(sync[75]));
  FDCE \sync_reg[76] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[75]),
        .Q(sync[76]));
  FDCE \sync_reg[77] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[76]),
        .Q(sync[77]));
  FDCE \sync_reg[78] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[77]),
        .Q(sync[78]));
  FDCE \sync_reg[79] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[78]),
        .Q(sync[79]));
  FDCE \sync_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[6]),
        .Q(sync[7]));
  FDCE \sync_reg[80] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[79]),
        .Q(sync[80]));
  FDCE \sync_reg[81] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[80]),
        .Q(sync[81]));
  FDCE \sync_reg[82] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[81]),
        .Q(sync[82]));
  FDCE \sync_reg[83] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[82]),
        .Q(sync[83]));
  FDCE \sync_reg[84] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[83]),
        .Q(sync[84]));
  FDCE \sync_reg[85] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[84]),
        .Q(sync[85]));
  FDCE \sync_reg[86] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[85]),
        .Q(sync[86]));
  FDCE \sync_reg[87] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[86]),
        .Q(sync[87]));
  FDCE \sync_reg[88] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[87]),
        .Q(sync[88]));
  FDCE \sync_reg[89] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[88]),
        .Q(sync[89]));
  FDCE \sync_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[7]),
        .Q(sync[8]));
  FDCE \sync_reg[90] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[89]),
        .Q(sync[90]));
  FDCE \sync_reg[91] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[90]),
        .Q(sync[91]));
  FDCE \sync_reg[92] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[91]),
        .Q(sync[92]));
  FDCE \sync_reg[93] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[92]),
        .Q(sync[93]));
  FDCE \sync_reg[94] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[93]),
        .Q(sync[94]));
  FDCE \sync_reg[95] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[94]),
        .Q(sync[95]));
  FDCE \sync_reg[96] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[95]),
        .Q(sync[96]));
  FDCE \sync_reg[97] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[96]),
        .Q(sync[97]));
  FDCE \sync_reg[98] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[97]),
        .Q(sync[98]));
  FDCE \sync_reg[99] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[98]),
        .Q(sync[99]));
  FDCE \sync_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(data_out_i_2_n_0),
        .D(sync[8]),
        .Q(sync[9]));
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
