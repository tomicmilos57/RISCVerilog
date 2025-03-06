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
// CREATED		"Thu Mar  6 01:47:28 2025"

module ReadSDRAM(
	clk,
	request,
	address,
	SDRAM_D,
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
	done,
	MAGIJA,
	SDRAM_A
);


input wire	clk;
input wire	request;
input wire	[22:0] address;
input wire	[15:0] SDRAM_D;
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
output wire	done;
output wire	[7:0] MAGIJA;
output wire	[11:0] SDRAM_A;

wire	[11:0] ACTIVATEaddr;
wire	ACTIVE;
wire	Ba;
wire	Bb;
wire	f;
reg	NOP1;
reg	NOP2;
reg	NOP3;
reg	NOP4;
reg	NOP5;
wire	out0;
wire	out1;
wire	out2;
wire	out26;
wire	out27;
wire	out28;
wire	out29;
wire	out3;
wire	out30;
wire	out31;
wire	out32;
wire	out33;
wire	out34;
wire	out35;
wire	out36;
wire	out37;
wire	out4;
wire	out5;
wire	out6;
wire	out7;
wire	out8;
wire	out9;
reg	RD;
wire	[11:0] READaddr;
wire	t;
wire	SYNTHESIZED_WIRE_2;

assign	MAGIJA = SDRAM_D[7:0];
wire	[11:0] GDFX_TEMP_SIGNAL_2;
wire	[9:0] GDFX_TEMP_SIGNAL_7;
wire	[9:0] GDFX_TEMP_SIGNAL_3;
wire	[11:0] GDFX_TEMP_SIGNAL_0;
wire	[9:0] GDFX_TEMP_SIGNAL_6;
wire	[11:0] GDFX_TEMP_SIGNAL_1;
wire	[11:0] GDFX_TEMP_SIGNAL_4;
wire	[11:0] GDFX_TEMP_SIGNAL_5;


assign	GDFX_TEMP_SIGNAL_2 = {t,t,t,t,address[7:0]};
assign	GDFX_TEMP_SIGNAL_7 = {Ba,Bb,f,f,t,f,t,f,clk,t};
assign	GDFX_TEMP_SIGNAL_3 = {f,f,t,t,t,t,t,f,clk,t};
assign	GDFX_TEMP_SIGNAL_0 = {f,f,f,f,f,f,f,f,f,f,f,f};
assign	GDFX_TEMP_SIGNAL_6 = {Ba,Bb,f,f,t,t,f,f,clk,t};
assign	out37 = GDFX_TEMP_SIGNAL_1[11];
assign	out36 = GDFX_TEMP_SIGNAL_1[10];
assign	out35 = GDFX_TEMP_SIGNAL_1[9];
assign	out34 = GDFX_TEMP_SIGNAL_1[8];
assign	out33 = GDFX_TEMP_SIGNAL_1[7];
assign	out32 = GDFX_TEMP_SIGNAL_1[6];
assign	out31 = GDFX_TEMP_SIGNAL_1[5];
assign	out30 = GDFX_TEMP_SIGNAL_1[4];
assign	out29 = GDFX_TEMP_SIGNAL_1[3];
assign	out28 = GDFX_TEMP_SIGNAL_1[2];
assign	out27 = GDFX_TEMP_SIGNAL_1[1];
assign	out26 = GDFX_TEMP_SIGNAL_1[0];

assign	out37 = GDFX_TEMP_SIGNAL_4[11];
assign	out36 = GDFX_TEMP_SIGNAL_4[10];
assign	out35 = GDFX_TEMP_SIGNAL_4[9];
assign	out34 = GDFX_TEMP_SIGNAL_4[8];
assign	out33 = GDFX_TEMP_SIGNAL_4[7];
assign	out32 = GDFX_TEMP_SIGNAL_4[6];
assign	out31 = GDFX_TEMP_SIGNAL_4[5];
assign	out30 = GDFX_TEMP_SIGNAL_4[4];
assign	out29 = GDFX_TEMP_SIGNAL_4[3];
assign	out28 = GDFX_TEMP_SIGNAL_4[2];
assign	out27 = GDFX_TEMP_SIGNAL_4[1];
assign	out26 = GDFX_TEMP_SIGNAL_4[0];

assign	out37 = GDFX_TEMP_SIGNAL_5[11];
assign	out36 = GDFX_TEMP_SIGNAL_5[10];
assign	out35 = GDFX_TEMP_SIGNAL_5[9];
assign	out34 = GDFX_TEMP_SIGNAL_5[8];
assign	out33 = GDFX_TEMP_SIGNAL_5[7];
assign	out32 = GDFX_TEMP_SIGNAL_5[6];
assign	out31 = GDFX_TEMP_SIGNAL_5[5];
assign	out30 = GDFX_TEMP_SIGNAL_5[4];
assign	out29 = GDFX_TEMP_SIGNAL_5[3];
assign	out28 = GDFX_TEMP_SIGNAL_5[2];
assign	out27 = GDFX_TEMP_SIGNAL_5[1];
assign	out26 = GDFX_TEMP_SIGNAL_5[0];


assign	ACTIVATEaddr = address[19:8];


assign	SYNTHESIZED_WIRE_2 = NOP1 | NOP3 | NOP2 | NOP4 | NOP5 | f;

assign	GDFX_TEMP_SIGNAL_1[11] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[11] : 1'bz;
assign	GDFX_TEMP_SIGNAL_1[10] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[10] : 1'bz;
assign	GDFX_TEMP_SIGNAL_1[9] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[9] : 1'bz;
assign	GDFX_TEMP_SIGNAL_1[8] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[8] : 1'bz;
assign	GDFX_TEMP_SIGNAL_1[7] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[7] : 1'bz;
assign	GDFX_TEMP_SIGNAL_1[6] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[6] : 1'bz;
assign	GDFX_TEMP_SIGNAL_1[5] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[5] : 1'bz;
assign	GDFX_TEMP_SIGNAL_1[4] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[4] : 1'bz;
assign	GDFX_TEMP_SIGNAL_1[3] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[3] : 1'bz;
assign	GDFX_TEMP_SIGNAL_1[2] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[2] : 1'bz;
assign	GDFX_TEMP_SIGNAL_1[1] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[1] : 1'bz;
assign	GDFX_TEMP_SIGNAL_1[0] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[0] : 1'bz;

assign	READaddr = GDFX_TEMP_SIGNAL_2;



assign	GDFX_TEMP_SIGNAL_4[11] = ACTIVE ? ACTIVATEaddr[11] : 1'bz;
assign	GDFX_TEMP_SIGNAL_4[10] = ACTIVE ? ACTIVATEaddr[10] : 1'bz;
assign	GDFX_TEMP_SIGNAL_4[9] = ACTIVE ? ACTIVATEaddr[9] : 1'bz;
assign	GDFX_TEMP_SIGNAL_4[8] = ACTIVE ? ACTIVATEaddr[8] : 1'bz;
assign	GDFX_TEMP_SIGNAL_4[7] = ACTIVE ? ACTIVATEaddr[7] : 1'bz;
assign	GDFX_TEMP_SIGNAL_4[6] = ACTIVE ? ACTIVATEaddr[6] : 1'bz;
assign	GDFX_TEMP_SIGNAL_4[5] = ACTIVE ? ACTIVATEaddr[5] : 1'bz;
assign	GDFX_TEMP_SIGNAL_4[4] = ACTIVE ? ACTIVATEaddr[4] : 1'bz;
assign	GDFX_TEMP_SIGNAL_4[3] = ACTIVE ? ACTIVATEaddr[3] : 1'bz;
assign	GDFX_TEMP_SIGNAL_4[2] = ACTIVE ? ACTIVATEaddr[2] : 1'bz;
assign	GDFX_TEMP_SIGNAL_4[1] = ACTIVE ? ACTIVATEaddr[1] : 1'bz;
assign	GDFX_TEMP_SIGNAL_4[0] = ACTIVE ? ACTIVATEaddr[0] : 1'bz;

assign	GDFX_TEMP_SIGNAL_5[11] = RD ? READaddr[11] : 1'bz;
assign	GDFX_TEMP_SIGNAL_5[10] = RD ? READaddr[10] : 1'bz;
assign	GDFX_TEMP_SIGNAL_5[9] = RD ? READaddr[9] : 1'bz;
assign	GDFX_TEMP_SIGNAL_5[8] = RD ? READaddr[8] : 1'bz;
assign	GDFX_TEMP_SIGNAL_5[7] = RD ? READaddr[7] : 1'bz;
assign	GDFX_TEMP_SIGNAL_5[6] = RD ? READaddr[6] : 1'bz;
assign	GDFX_TEMP_SIGNAL_5[5] = RD ? READaddr[5] : 1'bz;
assign	GDFX_TEMP_SIGNAL_5[4] = RD ? READaddr[4] : 1'bz;
assign	GDFX_TEMP_SIGNAL_5[3] = RD ? READaddr[3] : 1'bz;
assign	GDFX_TEMP_SIGNAL_5[2] = RD ? READaddr[2] : 1'bz;
assign	GDFX_TEMP_SIGNAL_5[1] = RD ? READaddr[1] : 1'bz;
assign	GDFX_TEMP_SIGNAL_5[0] = RD ? READaddr[0] : 1'bz;



assign	Ba = address[20];


assign	Bb = address[21];




always@(posedge clk)
begin
	begin
	RD <= NOP5;
	end
end


always@(posedge clk)
begin
	begin
	NOP1 <= RD;
	end
end


always@(posedge clk)
begin
	begin
	NOP2 <= NOP1;
	end
end


always@(posedge clk)
begin
	begin
	NOP3 <= ACTIVE;
	end
end


always@(posedge clk)
begin
	begin
	NOP4 <= NOP3;
	end
end


always@(posedge clk)
begin
	begin
	NOP5 <= NOP4;
	end
end


assign	SDRAM_B0 = out9;
assign	ACTIVE = request;
assign	SDRAM_B1 = out8;
assign	SDRAM_DQMH = out7;
assign	SDRAM_DQML = out6;
assign	SDRAM_WE = out5;
assign	SDRAM_CAS = out4;
assign	SDRAM_RAS = out3;
assign	SDRAM_CS = out2;
assign	SDRAM_CLK = out1;
assign	SDRAM_CKE = out0;
assign	done = NOP2;
assign	SDRAM_A[11] = out37;
assign	SDRAM_A[10] = out36;
assign	SDRAM_A[9] = out35;
assign	SDRAM_A[8] = out34;
assign	SDRAM_A[7] = out33;
assign	SDRAM_A[6] = out32;
assign	SDRAM_A[5] = out31;
assign	SDRAM_A[4] = out30;
assign	SDRAM_A[3] = out29;
assign	SDRAM_A[2] = out28;
assign	SDRAM_A[1] = out27;
assign	SDRAM_A[0] = out26;
assign	f = 0;
assign	t = 1;

endmodule
