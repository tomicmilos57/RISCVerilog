// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Thu Mar  6 01:26:00 2025"

module SDRAM(
	wren,
	clk,
	request,
	address,
	data,
	done,
	SDRAM_B0,
	SDRAM_B1,
	SDRAM_DQMH,
	SDRAM_DQML,
	SDRAM_WE,
	SDRAM_CAS,
	SDRAM_RAS,
	SDRAM_CS,
	SDRAM_CLK,
	SDRAM_CKE,
	led,
	out,
	SDRAM_A,
	SDRAM_D
);


input wire	wren;
input wire	clk;
input wire	request;
input wire	[22:0] address;
input wire	[7:0] data;
output wire	done;
output wire	SDRAM_B0;
output wire	SDRAM_B1;
output wire	SDRAM_DQMH;
output wire	SDRAM_DQML;
output wire	SDRAM_WE;
output wire	SDRAM_CAS;
output wire	SDRAM_RAS;
output wire	SDRAM_CS;
output wire	SDRAM_CLK;
output wire	SDRAM_CKE;
output wire	[9:0] led;
output wire	[7:0] out;
output wire	[11:0] SDRAM_A;
inout wire	[15:0] SDRAM_D;

wire	doneANY;
wire	doneRD;
wire	doneWR;
reg	hasReq;
wire	I0;
wire	I1;
wire	init;
wire	ldCNT;
wire	led_ALTERA_SYNTHESIZED0;
reg	led_ALTERA_SYNTHESIZED1;
wire	led_ALTERA_SYNTHESIZED2;
wire	led_ALTERA_SYNTHESIZED4;
wire	led_ALTERA_SYNTHESIZED5;
wire	led_ALTERA_SYNTHESIZED6;
wire	led_ALTERA_SYNTHESIZED7;
wire	[22:0] MAR;
wire	[7:0] MDR;
wire	nHasReq;
wire	ni;
wire	NOPout;
wire	NOPoutSIG;
wire	nR;
wire	nRdone;
wire	R;
wire	rd;
wire	Rdone;
wire	read;
wire	[7:0] ReadSDRAMout;
wire	reset;
wire	Rout;
wire	Rreq;
wire	send;
wire	T0;
wire	T1;
wire	T2;
wire	T3;
wire	w;
reg	write;
wire	WrRdout;
wire	WrRdReq;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[11:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	[11:0] SYNTHESIZED_WIRE_30;
wire	[15:0] SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	[1:0] SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	[11:0] SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	[15:0] SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	[11:0] SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_58;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_60;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_62;
wire	[15:0] SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_64;
wire	SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_67;
wire	SYNTHESIZED_WIRE_68;
wire	SYNTHESIZED_WIRE_69;
wire	SYNTHESIZED_WIRE_70;
wire	SYNTHESIZED_WIRE_71;
wire	SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_73;
wire	SYNTHESIZED_WIRE_74;
wire	SYNTHESIZED_WIRE_75;
wire	SYNTHESIZED_WIRE_76;
wire	SYNTHESIZED_WIRE_77;
wire	SYNTHESIZED_WIRE_78;
wire	SYNTHESIZED_WIRE_79;

wire	[9:0] GDFX_TEMP_SIGNAL_0;
wire	[11:0] GDFX_TEMP_SIGNAL_2;
wire	[1:0] GDFX_TEMP_SIGNAL_1;
wire	[15:0] GDFX_TEMP_SIGNAL_3;


assign	GDFX_TEMP_SIGNAL_0 = {1,0,1,0,1,1,1,1,0,0};
assign	GDFX_TEMP_SIGNAL_2 = {0,0,0,0,0,0,0,0,0,0,0,0};
assign	GDFX_TEMP_SIGNAL_1 = {I1,I0};
assign	GDFX_TEMP_SIGNAL_3 = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};


RegisterX	b2v_inst(
	.CLK(clk),
	.LD(request),
	.CL(reset),
	
	
	.DATA_IN(data),
	.DATA_OUT(MDR));
	defparam	b2v_inst.default_value = 0;
	defparam	b2v_inst.size = 8;


RegisterX	b2v_inst1(
	.CLK(clk),
	.LD(request),
	.CL(reset),
	
	
	.DATA_IN(address),
	.DATA_OUT(MAR));
	defparam	b2v_inst1.default_value = 0;
	defparam	b2v_inst1.size = 23;

assign	doneANY = doneRD | doneWR;

assign	SYNTHESIZED_WIRE_55 = T2 | T3 | SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_0 = T1 & R;

assign	SYNTHESIZED_WIRE_60 = T3 | T1;

assign	SYNTHESIZED_WIRE_53 = SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_1 = T3 & nRdone;

assign	SYNTHESIZED_WIRE_3 = R & T1;

assign	SYNTHESIZED_WIRE_76 = T1 & nR & hasReq;

assign	Rreq = SYNTHESIZED_WIRE_4;


assign	SYNTHESIZED_WIRE_4 = R & T1;

assign	Rout = SYNTHESIZED_WIRE_5;


assign	SDRAM_A[11] = rd ? SYNTHESIZED_WIRE_6[11] : 1'bz;
assign	SDRAM_A[10] = rd ? SYNTHESIZED_WIRE_6[10] : 1'bz;
assign	SDRAM_A[9] = rd ? SYNTHESIZED_WIRE_6[9] : 1'bz;
assign	SDRAM_A[8] = rd ? SYNTHESIZED_WIRE_6[8] : 1'bz;
assign	SDRAM_A[7] = rd ? SYNTHESIZED_WIRE_6[7] : 1'bz;
assign	SDRAM_A[6] = rd ? SYNTHESIZED_WIRE_6[6] : 1'bz;
assign	SDRAM_A[5] = rd ? SYNTHESIZED_WIRE_6[5] : 1'bz;
assign	SDRAM_A[4] = rd ? SYNTHESIZED_WIRE_6[4] : 1'bz;
assign	SDRAM_A[3] = rd ? SYNTHESIZED_WIRE_6[3] : 1'bz;
assign	SDRAM_A[2] = rd ? SYNTHESIZED_WIRE_6[2] : 1'bz;
assign	SDRAM_A[1] = rd ? SYNTHESIZED_WIRE_6[1] : 1'bz;
assign	SDRAM_A[0] = rd ? SYNTHESIZED_WIRE_6[0] : 1'bz;

assign	SYNTHESIZED_WIRE_7 = R & T1;

assign	SYNTHESIZED_WIRE_5 = T3 | SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_46 = T1 & nR & nHasReq;

assign	SYNTHESIZED_WIRE_44 = T1 & nR & hasReq;


RegisterX	b2v_inst114(
	.CLK(clk),
	
	.CL(Rreq),
	.INC(init),
	
	
	.DATA_OUT(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst114.default_value = 0;
	defparam	b2v_inst114.size = 32;


ComparatorX	b2v_inst115(
	.A(SYNTHESIZED_WIRE_8),
	.B(SYNTHESIZED_WIRE_9),
	.EQ(SYNTHESIZED_WIRE_11),
	
	.GR(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst115.size = 32;


ZEROEXT	b2v_inst116(
	.I(GDFX_TEMP_SIGNAL_0),
	.O(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst116.in_width = 10;
	defparam	b2v_inst116.out_width = 32;

assign	R = SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11;


SDRAMRefresh	b2v_inst118(
	.Request(Rreq),
	.clk(clk),
	.SDRAM_D(SYNTHESIZED_WIRE_47),
	.done(Rdone),
	.SDRAM_B0(SYNTHESIZED_WIRE_58),
	.SDRAM_B1(SYNTHESIZED_WIRE_77),
	.SDRAM_DQMH(SYNTHESIZED_WIRE_12),
	.SDRAM_DQML(SYNTHESIZED_WIRE_13),
	.SDRAM_WE(SYNTHESIZED_WIRE_14),
	.SDRAM_CAS(SYNTHESIZED_WIRE_15),
	.SDRAM_RAS(SYNTHESIZED_WIRE_16),
	.SDRAM_CS(SYNTHESIZED_WIRE_17),
	.SDRAM_CLK(SYNTHESIZED_WIRE_18),
	.SDRAM_CKE(SYNTHESIZED_WIRE_19),
	.SDRAM_A(SYNTHESIZED_WIRE_45)
	);

assign	SDRAM_DQMH = Rout ? SYNTHESIZED_WIRE_12 : 1'bz;


assign	SDRAM_DQML = Rout ? SYNTHESIZED_WIRE_13 : 1'bz;

assign	SDRAM_WE = Rout ? SYNTHESIZED_WIRE_14 : 1'bz;

assign	SDRAM_CAS = Rout ? SYNTHESIZED_WIRE_15 : 1'bz;

assign	SDRAM_RAS = Rout ? SYNTHESIZED_WIRE_16 : 1'bz;

assign	SDRAM_CS = Rout ? SYNTHESIZED_WIRE_17 : 1'bz;

assign	SDRAM_CLK = Rout ? SYNTHESIZED_WIRE_18 : 1'bz;

assign	SDRAM_CKE = Rout ? SYNTHESIZED_WIRE_19 : 1'bz;

assign	nRdone =  ~Rdone;

//assign	SYNTHESIZED_WIRE_79 = ;

assign	nR =  ~R;

assign	SDRAM_B0 = rd ? SYNTHESIZED_WIRE_20 : 1'bz;

assign	SDRAM_B1 = rd ? SYNTHESIZED_WIRE_21 : 1'bz;

assign	SDRAM_DQMH = rd ? SYNTHESIZED_WIRE_22 : 1'bz;

assign	SDRAM_DQML = rd ? SYNTHESIZED_WIRE_23 : 1'bz;

assign	SDRAM_WE = rd ? SYNTHESIZED_WIRE_24 : 1'bz;

assign	SDRAM_CAS = rd ? SYNTHESIZED_WIRE_25 : 1'bz;

assign	SDRAM_RAS = rd ? SYNTHESIZED_WIRE_26 : 1'bz;


always@(posedge clk)
begin
	write <= ~write & wren | write & ~reset;
end

assign	SDRAM_CS = rd ? SYNTHESIZED_WIRE_27 : 1'bz;

assign	SDRAM_CLK = rd ? SYNTHESIZED_WIRE_28 : 1'bz;

assign	SDRAM_CKE = rd ? SYNTHESIZED_WIRE_29 : 1'bz;




assign	SDRAM_A[11] = w ? SYNTHESIZED_WIRE_30[11] : 1'bz;
assign	SDRAM_A[10] = w ? SYNTHESIZED_WIRE_30[10] : 1'bz;
assign	SDRAM_A[9] = w ? SYNTHESIZED_WIRE_30[9] : 1'bz;
assign	SDRAM_A[8] = w ? SYNTHESIZED_WIRE_30[8] : 1'bz;
assign	SDRAM_A[7] = w ? SYNTHESIZED_WIRE_30[7] : 1'bz;
assign	SDRAM_A[6] = w ? SYNTHESIZED_WIRE_30[6] : 1'bz;
assign	SDRAM_A[5] = w ? SYNTHESIZED_WIRE_30[5] : 1'bz;
assign	SDRAM_A[4] = w ? SYNTHESIZED_WIRE_30[4] : 1'bz;
assign	SDRAM_A[3] = w ? SYNTHESIZED_WIRE_30[3] : 1'bz;
assign	SDRAM_A[2] = w ? SYNTHESIZED_WIRE_30[2] : 1'bz;
assign	SDRAM_A[1] = w ? SYNTHESIZED_WIRE_30[1] : 1'bz;
assign	SDRAM_A[0] = w ? SYNTHESIZED_WIRE_30[0] : 1'bz;

assign	SDRAM_D[15] = w ? SYNTHESIZED_WIRE_31[15] : 1'bz;
assign	SDRAM_D[14] = w ? SYNTHESIZED_WIRE_31[14] : 1'bz;
assign	SDRAM_D[13] = w ? SYNTHESIZED_WIRE_31[13] : 1'bz;
assign	SDRAM_D[12] = w ? SYNTHESIZED_WIRE_31[12] : 1'bz;
assign	SDRAM_D[11] = w ? SYNTHESIZED_WIRE_31[11] : 1'bz;
assign	SDRAM_D[10] = w ? SYNTHESIZED_WIRE_31[10] : 1'bz;
assign	SDRAM_D[9] = w ? SYNTHESIZED_WIRE_31[9] : 1'bz;
assign	SDRAM_D[8] = w ? SYNTHESIZED_WIRE_31[8] : 1'bz;
assign	SDRAM_D[7] = w ? SYNTHESIZED_WIRE_31[7] : 1'bz;
assign	SDRAM_D[6] = w ? SYNTHESIZED_WIRE_31[6] : 1'bz;
assign	SDRAM_D[5] = w ? SYNTHESIZED_WIRE_31[5] : 1'bz;
assign	SDRAM_D[4] = w ? SYNTHESIZED_WIRE_31[4] : 1'bz;
assign	SDRAM_D[3] = w ? SYNTHESIZED_WIRE_31[3] : 1'bz;
assign	SDRAM_D[2] = w ? SYNTHESIZED_WIRE_31[2] : 1'bz;
assign	SDRAM_D[1] = w ? SYNTHESIZED_WIRE_31[1] : 1'bz;
assign	SDRAM_D[0] = w ? SYNTHESIZED_WIRE_31[0] : 1'bz;

assign	SDRAM_B0 = w ? SYNTHESIZED_WIRE_32 : 1'bz;

assign	SDRAM_B1 = w ? SYNTHESIZED_WIRE_33 : 1'bz;


always@(posedge clk)
begin
	hasReq <= ~hasReq & request | hasReq & ~reset;
end

assign	SDRAM_DQMH = w ? SYNTHESIZED_WIRE_34 : 1'bz;

assign	SDRAM_DQML = w ? SYNTHESIZED_WIRE_35 : 1'bz;

assign	SDRAM_WE = w ? SYNTHESIZED_WIRE_36 : 1'bz;

assign	SDRAM_CAS = w ? SYNTHESIZED_WIRE_37 : 1'bz;

assign	SDRAM_RAS = w ? SYNTHESIZED_WIRE_38 : 1'bz;

assign	SDRAM_CS = w ? SYNTHESIZED_WIRE_39 : 1'bz;

assign	SDRAM_CLK = w ? SYNTHESIZED_WIRE_40 : 1'bz;

assign	SDRAM_CKE = w ? SYNTHESIZED_WIRE_41 : 1'bz;


RegisterX	b2v_inst38(
	.CLK(clk),
	.LD(ldCNT),
	
	.INC(SYNTHESIZED_WIRE_42),
	
	.DATA_IN(GDFX_TEMP_SIGNAL_1),
	.DATA_OUT(SYNTHESIZED_WIRE_43));
	defparam	b2v_inst38.default_value = 0;
	defparam	b2v_inst38.size = 2;


DC2	b2v_inst39(
	.data(SYNTHESIZED_WIRE_43),
	.eq0(T0),
	.eq1(T1),
	.eq2(T2),
	.eq3(T3));

assign	read =  ~write;

assign	WrRdReq = SYNTHESIZED_WIRE_44;


assign	SYNTHESIZED_WIRE_42 =  ~ldCNT;

assign	SDRAM_A[11] = Rout ? SYNTHESIZED_WIRE_45[11] : 1'bz;
assign	SDRAM_A[10] = Rout ? SYNTHESIZED_WIRE_45[10] : 1'bz;
assign	SDRAM_A[9] = Rout ? SYNTHESIZED_WIRE_45[9] : 1'bz;
assign	SDRAM_A[8] = Rout ? SYNTHESIZED_WIRE_45[8] : 1'bz;
assign	SDRAM_A[7] = Rout ? SYNTHESIZED_WIRE_45[7] : 1'bz;
assign	SDRAM_A[6] = Rout ? SYNTHESIZED_WIRE_45[6] : 1'bz;
assign	SDRAM_A[5] = Rout ? SYNTHESIZED_WIRE_45[5] : 1'bz;
assign	SDRAM_A[4] = Rout ? SYNTHESIZED_WIRE_45[4] : 1'bz;
assign	SDRAM_A[3] = Rout ? SYNTHESIZED_WIRE_45[3] : 1'bz;
assign	SDRAM_A[2] = Rout ? SYNTHESIZED_WIRE_45[2] : 1'bz;
assign	SDRAM_A[1] = Rout ? SYNTHESIZED_WIRE_45[1] : 1'bz;
assign	SDRAM_A[0] = Rout ? SYNTHESIZED_WIRE_45[0] : 1'bz;

assign	NOPoutSIG = SYNTHESIZED_WIRE_46;


assign	SDRAM_D[15] = Rout ? SYNTHESIZED_WIRE_47[15] : 1'bz;
assign	SDRAM_D[14] = Rout ? SYNTHESIZED_WIRE_47[14] : 1'bz;
assign	SDRAM_D[13] = Rout ? SYNTHESIZED_WIRE_47[13] : 1'bz;
assign	SDRAM_D[12] = Rout ? SYNTHESIZED_WIRE_47[12] : 1'bz;
assign	SDRAM_D[11] = Rout ? SYNTHESIZED_WIRE_47[11] : 1'bz;
assign	SDRAM_D[10] = Rout ? SYNTHESIZED_WIRE_47[10] : 1'bz;
assign	SDRAM_D[9] = Rout ? SYNTHESIZED_WIRE_47[9] : 1'bz;
assign	SDRAM_D[8] = Rout ? SYNTHESIZED_WIRE_47[8] : 1'bz;
assign	SDRAM_D[7] = Rout ? SYNTHESIZED_WIRE_47[7] : 1'bz;
assign	SDRAM_D[6] = Rout ? SYNTHESIZED_WIRE_47[6] : 1'bz;
assign	SDRAM_D[5] = Rout ? SYNTHESIZED_WIRE_47[5] : 1'bz;
assign	SDRAM_D[4] = Rout ? SYNTHESIZED_WIRE_47[4] : 1'bz;
assign	SDRAM_D[3] = Rout ? SYNTHESIZED_WIRE_47[3] : 1'bz;
assign	SDRAM_D[2] = Rout ? SYNTHESIZED_WIRE_47[2] : 1'bz;
assign	SDRAM_D[1] = Rout ? SYNTHESIZED_WIRE_47[1] : 1'bz;
assign	SDRAM_D[0] = Rout ? SYNTHESIZED_WIRE_47[0] : 1'bz;

assign	send = SYNTHESIZED_WIRE_48;


assign	SYNTHESIZED_WIRE_48 = T2 & doneANY;

assign	reset = SYNTHESIZED_WIRE_49;


assign	SYNTHESIZED_WIRE_49 = T2 & doneANY;

assign	SDRAM_A[11] = ni ? SYNTHESIZED_WIRE_50[11] : 1'bz;
assign	SDRAM_A[10] = ni ? SYNTHESIZED_WIRE_50[10] : 1'bz;
assign	SDRAM_A[9] = ni ? SYNTHESIZED_WIRE_50[9] : 1'bz;
assign	SDRAM_A[8] = ni ? SYNTHESIZED_WIRE_50[8] : 1'bz;
assign	SDRAM_A[7] = ni ? SYNTHESIZED_WIRE_50[7] : 1'bz;
assign	SDRAM_A[6] = ni ? SYNTHESIZED_WIRE_50[6] : 1'bz;
assign	SDRAM_A[5] = ni ? SYNTHESIZED_WIRE_50[5] : 1'bz;
assign	SDRAM_A[4] = ni ? SYNTHESIZED_WIRE_50[4] : 1'bz;
assign	SDRAM_A[3] = ni ? SYNTHESIZED_WIRE_50[3] : 1'bz;
assign	SDRAM_A[2] = ni ? SYNTHESIZED_WIRE_50[2] : 1'bz;
assign	SDRAM_A[1] = ni ? SYNTHESIZED_WIRE_50[1] : 1'bz;
assign	SDRAM_A[0] = ni ? SYNTHESIZED_WIRE_50[0] : 1'bz;

assign	nHasReq =  ~hasReq;

assign	ldCNT = SYNTHESIZED_WIRE_51;


assign	I0 = SYNTHESIZED_WIRE_52;


assign	I1 = SYNTHESIZED_WIRE_53;


assign	SYNTHESIZED_WIRE_51 = SYNTHESIZED_WIRE_54 | SYNTHESIZED_WIRE_55 | SYNTHESIZED_WIRE_56;

assign	SYNTHESIZED_WIRE_56 = T0 & SYNTHESIZED_WIRE_57;

assign	SDRAM_B0 = Rout ? SYNTHESIZED_WIRE_58 : 1'bz;

assign	SYNTHESIZED_WIRE_57 =  ~init;

assign	SYNTHESIZED_WIRE_52 = SYNTHESIZED_WIRE_59 | SYNTHESIZED_WIRE_60;

assign	SYNTHESIZED_WIRE_59 = T2 & doneANY;

assign	SYNTHESIZED_WIRE_2 = T2 & SYNTHESIZED_WIRE_61;


WriteSDRAM	b2v_inst6(
	.request(SYNTHESIZED_WIRE_62),
	.clk(clk),
	.address(MAR),
	.data(MDR),
	.SDRAM_D(SYNTHESIZED_WIRE_31),
	.done(doneWR),
	.SDRAM_B0(SYNTHESIZED_WIRE_32),
	.SDRAM_B1(SYNTHESIZED_WIRE_33),
	.SDRAM_DQMH(SYNTHESIZED_WIRE_34),
	.SDRAM_DQML(SYNTHESIZED_WIRE_35),
	.SDRAM_WE(SYNTHESIZED_WIRE_36),
	.SDRAM_CAS(SYNTHESIZED_WIRE_37),
	.SDRAM_RAS(SYNTHESIZED_WIRE_38),
	.SDRAM_CS(SYNTHESIZED_WIRE_39),
	.SDRAM_CLK(SYNTHESIZED_WIRE_40),
	.SDRAM_CKE(SYNTHESIZED_WIRE_41),
	.SDRAM_A(SYNTHESIZED_WIRE_30)
	);

assign	SYNTHESIZED_WIRE_61 =  ~doneANY;


initSDRAM	b2v_inst61(
	.clk(clk),
	.SDRAM_D(SYNTHESIZED_WIRE_63),
	.SDRAM_B0(SYNTHESIZED_WIRE_64),
	.SDRAM_B1(SYNTHESIZED_WIRE_65),
	.SDRAM_DQMH(SYNTHESIZED_WIRE_66),
	.SDRAM_DQML(SYNTHESIZED_WIRE_67),
	.SDRAM_WE(SYNTHESIZED_WIRE_68),
	.SDRAM_CAS(SYNTHESIZED_WIRE_69),
	.SDRAM_RAS(SYNTHESIZED_WIRE_70),
	.SDRAM_CS(SYNTHESIZED_WIRE_72),
	.SDRAM_CLK(SYNTHESIZED_WIRE_73),
	.SDRAM_CKE(SYNTHESIZED_WIRE_74),
	.init(init),
	.SDRAM_A(SYNTHESIZED_WIRE_50)
	);

assign	SDRAM_D[15] = ni ? SYNTHESIZED_WIRE_63[15] : 1'bz;
assign	SDRAM_D[14] = ni ? SYNTHESIZED_WIRE_63[14] : 1'bz;
assign	SDRAM_D[13] = ni ? SYNTHESIZED_WIRE_63[13] : 1'bz;
assign	SDRAM_D[12] = ni ? SYNTHESIZED_WIRE_63[12] : 1'bz;
assign	SDRAM_D[11] = ni ? SYNTHESIZED_WIRE_63[11] : 1'bz;
assign	SDRAM_D[10] = ni ? SYNTHESIZED_WIRE_63[10] : 1'bz;
assign	SDRAM_D[9] = ni ? SYNTHESIZED_WIRE_63[9] : 1'bz;
assign	SDRAM_D[8] = ni ? SYNTHESIZED_WIRE_63[8] : 1'bz;
assign	SDRAM_D[7] = ni ? SYNTHESIZED_WIRE_63[7] : 1'bz;
assign	SDRAM_D[6] = ni ? SYNTHESIZED_WIRE_63[6] : 1'bz;
assign	SDRAM_D[5] = ni ? SYNTHESIZED_WIRE_63[5] : 1'bz;
assign	SDRAM_D[4] = ni ? SYNTHESIZED_WIRE_63[4] : 1'bz;
assign	SDRAM_D[3] = ni ? SYNTHESIZED_WIRE_63[3] : 1'bz;
assign	SDRAM_D[2] = ni ? SYNTHESIZED_WIRE_63[2] : 1'bz;
assign	SDRAM_D[1] = ni ? SYNTHESIZED_WIRE_63[1] : 1'bz;
assign	SDRAM_D[0] = ni ? SYNTHESIZED_WIRE_63[0] : 1'bz;

assign	SDRAM_B0 = ni ? SYNTHESIZED_WIRE_64 : 1'bz;

assign	SDRAM_B1 = ni ? SYNTHESIZED_WIRE_65 : 1'bz;

assign	SDRAM_DQMH = ni ? SYNTHESIZED_WIRE_66 : 1'bz;

assign	SDRAM_DQML = ni ? SYNTHESIZED_WIRE_67 : 1'bz;

assign	SDRAM_WE = ni ? SYNTHESIZED_WIRE_68 : 1'bz;

assign	SDRAM_CAS = ni ? SYNTHESIZED_WIRE_69 : 1'bz;

assign	SDRAM_RAS = ni ? SYNTHESIZED_WIRE_70 : 1'bz;


ReadSDRAM	b2v_inst7(
	.request(SYNTHESIZED_WIRE_71),
	.clk(clk),
	.address(MAR),
	.SDRAM_D(SDRAM_D),
	.done(doneRD),
	.SDRAM_B0(SYNTHESIZED_WIRE_20),
	.SDRAM_B1(SYNTHESIZED_WIRE_21),
	.SDRAM_DQMH(SYNTHESIZED_WIRE_22),
	.SDRAM_DQML(SYNTHESIZED_WIRE_23),
	.SDRAM_WE(SYNTHESIZED_WIRE_24),
	.SDRAM_CAS(SYNTHESIZED_WIRE_25),
	.SDRAM_RAS(SYNTHESIZED_WIRE_26),
	.SDRAM_CS(SYNTHESIZED_WIRE_27),
	.SDRAM_CLK(SYNTHESIZED_WIRE_28),
	.SDRAM_CKE(SYNTHESIZED_WIRE_29),
	.MAGIJA(ReadSDRAMout),
	.SDRAM_A(SYNTHESIZED_WIRE_6));

assign	SDRAM_CS = ni ? SYNTHESIZED_WIRE_72 : 1'bz;

assign	SDRAM_CLK = ni ? SYNTHESIZED_WIRE_73 : 1'bz;

assign	SDRAM_CKE = ni ? SYNTHESIZED_WIRE_74 : 1'bz;

assign	ni =  ~init;

assign	w = WrRdout & init & write;

assign	rd = WrRdout & init & read;

assign	SDRAM_A[11] = NOPout ? GDFX_TEMP_SIGNAL_2[11] : 1'bz;
assign	SDRAM_A[10] = NOPout ? GDFX_TEMP_SIGNAL_2[10] : 1'bz;
assign	SDRAM_A[9] = NOPout ? GDFX_TEMP_SIGNAL_2[9] : 1'bz;
assign	SDRAM_A[8] = NOPout ? GDFX_TEMP_SIGNAL_2[8] : 1'bz;
assign	SDRAM_A[7] = NOPout ? GDFX_TEMP_SIGNAL_2[7] : 1'bz;
assign	SDRAM_A[6] = NOPout ? GDFX_TEMP_SIGNAL_2[6] : 1'bz;
assign	SDRAM_A[5] = NOPout ? GDFX_TEMP_SIGNAL_2[5] : 1'bz;
assign	SDRAM_A[4] = NOPout ? GDFX_TEMP_SIGNAL_2[4] : 1'bz;
assign	SDRAM_A[3] = NOPout ? GDFX_TEMP_SIGNAL_2[3] : 1'bz;
assign	SDRAM_A[2] = NOPout ? GDFX_TEMP_SIGNAL_2[2] : 1'bz;
assign	SDRAM_A[1] = NOPout ? GDFX_TEMP_SIGNAL_2[1] : 1'bz;
assign	SDRAM_A[0] = NOPout ? GDFX_TEMP_SIGNAL_2[0] : 1'bz;

assign	SDRAM_D[15] = NOPout ? GDFX_TEMP_SIGNAL_3[15] : 1'bz;
assign	SDRAM_D[14] = NOPout ? GDFX_TEMP_SIGNAL_3[14] : 1'bz;
assign	SDRAM_D[13] = NOPout ? GDFX_TEMP_SIGNAL_3[13] : 1'bz;
assign	SDRAM_D[12] = NOPout ? GDFX_TEMP_SIGNAL_3[12] : 1'bz;
assign	SDRAM_D[11] = NOPout ? GDFX_TEMP_SIGNAL_3[11] : 1'bz;
assign	SDRAM_D[10] = NOPout ? GDFX_TEMP_SIGNAL_3[10] : 1'bz;
assign	SDRAM_D[9] = NOPout ? GDFX_TEMP_SIGNAL_3[9] : 1'bz;
assign	SDRAM_D[8] = NOPout ? GDFX_TEMP_SIGNAL_3[8] : 1'bz;
assign	SDRAM_D[7] = NOPout ? GDFX_TEMP_SIGNAL_3[7] : 1'bz;
assign	SDRAM_D[6] = NOPout ? GDFX_TEMP_SIGNAL_3[6] : 1'bz;
assign	SDRAM_D[5] = NOPout ? GDFX_TEMP_SIGNAL_3[5] : 1'bz;
assign	SDRAM_D[4] = NOPout ? GDFX_TEMP_SIGNAL_3[4] : 1'bz;
assign	SDRAM_D[3] = NOPout ? GDFX_TEMP_SIGNAL_3[3] : 1'bz;
assign	SDRAM_D[2] = NOPout ? GDFX_TEMP_SIGNAL_3[2] : 1'bz;
assign	SDRAM_D[1] = NOPout ? GDFX_TEMP_SIGNAL_3[1] : 1'bz;
assign	SDRAM_D[0] = NOPout ? GDFX_TEMP_SIGNAL_3[0] : 1'bz;

assign	SDRAM_B0 = NOPout ? 0 : 1'bz;

assign	SDRAM_B1 = NOPout ? 0 : 1'bz;

assign	SYNTHESIZED_WIRE_71 = read & WrRdReq;

assign	SDRAM_DQMH = NOPout ? 0 : 1'bz;

assign	SDRAM_DQML = NOPout ? 0 : 1'bz;

assign	SDRAM_WE = NOPout ? 1 : 1'bz;

assign	SDRAM_CAS = NOPout ? 1 : 1'bz;

assign	SDRAM_RAS = NOPout ? 1 : 1'bz;

assign	SDRAM_CS = NOPout ? 0 : 1'bz;

assign	SDRAM_CLK = NOPout ? clk : 1'bz;

assign	SDRAM_CKE = NOPout ? 1 : 1'bz;



assign	SYNTHESIZED_WIRE_62 = write & WrRdReq;



assign	WrRdout = SYNTHESIZED_WIRE_75;


assign	SYNTHESIZED_WIRE_75 = T2 | SYNTHESIZED_WIRE_76;

assign	SDRAM_B1 = Rout ? SYNTHESIZED_WIRE_77 : 1'bz;

assign	SYNTHESIZED_WIRE_54 = T1 & nR & nHasReq;

assign	NOPout = 0 | NOPoutSIG;


assign	SYNTHESIZED_WIRE_78 =  ~SYNTHESIZED_WIRE_79;


assign	done = send;
assign	out = ReadSDRAMout;

endmodule
