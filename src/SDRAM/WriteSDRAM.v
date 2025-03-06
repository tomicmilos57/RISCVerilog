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
// CREATED		"Thu Mar  6 01:43:39 2025"

module WriteSDRAM(
	clk,
	request,
	address,
	data,
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
	SDRAM_A,
	SDRAM_D
);


input wire	clk;
input wire	request;
input wire	[22:0] address;
input wire	[7:0] data;
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
output wire	[11:0] SDRAM_A;
inout wire	[15:0] SDRAM_D;

wire	[63:0] a;
wire	[11:0] ACTIVATEaddr;
wire	ACTIVE0;
wire	Ba;
wire	Bb;
reg	NOP0;
reg	NOP1;
reg	NOP2;
reg	NOP3;
reg	NOP4;
reg	NOP5;
wire	[63:0] o;
wire	[37:0] out;
reg	WR;
wire	[11:0] WRITEaddr;
wire	[15:0] WRITEdata;
wire	SYNTHESIZED_WIRE_0;

wire	[11:0] GDFX_TEMP_SIGNAL_0;
wire	[63:0] GDFX_TEMP_SIGNAL_5;
wire	[63:0] GDFX_TEMP_SIGNAL_6;
wire	[37:0] GDFX_TEMP_SIGNAL_1;
wire	[37:0] GDFX_TEMP_SIGNAL_4;
wire	[37:0] GDFX_TEMP_SIGNAL_3;
wire	[15:0] GDFX_TEMP_SIGNAL_2;

assign	GDFX_TEMP_SIGNAL_0 = {1,1,1,1,address[7:0]};
assign	GDFX_TEMP_SIGNAL_5 = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
assign	GDFX_TEMP_SIGNAL_6 = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
assign	GDFX_TEMP_SIGNAL_1 = {o[11:0],o[15:0],o[1:0],a[1:0],1,1,1,0,clk,1};
assign	GDFX_TEMP_SIGNAL_4 = {WRITEaddr[11:0],WRITEdata[15:0],Ba,Bb,0,0,0,0,1,0,clk,1};
assign	GDFX_TEMP_SIGNAL_3 = {ACTIVATEaddr[11:0],0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,Ba,Bb,0,0,1,1,0,0,clk,1};
assign	GDFX_TEMP_SIGNAL_2 = {0,0,0,0,0,0,0,0,data[7:0]};

assign	ACTIVATEaddr = address[19:8];


assign	WRITEaddr = GDFX_TEMP_SIGNAL_0;



always@(posedge clk)
begin
	begin
	NOP0 <= ACTIVE0;
	end
end


always@(posedge clk)
begin
	begin
	NOP1 <= NOP0;
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

assign	out[37] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[37] : 1'bz;
assign	out[36] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[36] : 1'bz;
assign	out[35] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[35] : 1'bz;
assign	out[34] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[34] : 1'bz;
assign	out[33] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[33] : 1'bz;
assign	out[32] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[32] : 1'bz;
assign	out[31] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[31] : 1'bz;
assign	out[30] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[30] : 1'bz;
assign	out[29] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[29] : 1'bz;
assign	out[28] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[28] : 1'bz;
assign	out[27] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[27] : 1'bz;
assign	out[26] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[26] : 1'bz;
assign	out[25] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[25] : 1'bz;
assign	out[24] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[24] : 1'bz;
assign	out[23] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[23] : 1'bz;
assign	out[22] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[22] : 1'bz;
assign	out[21] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[21] : 1'bz;
assign	out[20] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[20] : 1'bz;
assign	out[19] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[19] : 1'bz;
assign	out[18] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[18] : 1'bz;
assign	out[17] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[17] : 1'bz;
assign	out[16] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[16] : 1'bz;
assign	out[15] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[15] : 1'bz;
assign	out[14] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[14] : 1'bz;
assign	out[13] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[13] : 1'bz;
assign	out[12] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[12] : 1'bz;
assign	out[11] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[11] : 1'bz;
assign	out[10] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[10] : 1'bz;
assign	out[9] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[9] : 1'bz;
assign	out[8] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[8] : 1'bz;
assign	out[7] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[7] : 1'bz;
assign	out[6] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[6] : 1'bz;
assign	out[5] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[5] : 1'bz;
assign	out[4] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[4] : 1'bz;
assign	out[3] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[3] : 1'bz;
assign	out[2] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[2] : 1'bz;
assign	out[1] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[1] : 1'bz;
assign	out[0] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_1[0] : 1'bz;

assign	WRITEdata = GDFX_TEMP_SIGNAL_2;


assign	out[37] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[37] : 1'bz;
assign	out[36] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[36] : 1'bz;
assign	out[35] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[35] : 1'bz;
assign	out[34] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[34] : 1'bz;
assign	out[33] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[33] : 1'bz;
assign	out[32] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[32] : 1'bz;
assign	out[31] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[31] : 1'bz;
assign	out[30] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[30] : 1'bz;
assign	out[29] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[29] : 1'bz;
assign	out[28] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[28] : 1'bz;
assign	out[27] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[27] : 1'bz;
assign	out[26] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[26] : 1'bz;
assign	out[25] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[25] : 1'bz;
assign	out[24] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[24] : 1'bz;
assign	out[23] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[23] : 1'bz;
assign	out[22] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[22] : 1'bz;
assign	out[21] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[21] : 1'bz;
assign	out[20] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[20] : 1'bz;
assign	out[19] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[19] : 1'bz;
assign	out[18] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[18] : 1'bz;
assign	out[17] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[17] : 1'bz;
assign	out[16] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[16] : 1'bz;
assign	out[15] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[15] : 1'bz;
assign	out[14] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[14] : 1'bz;
assign	out[13] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[13] : 1'bz;
assign	out[12] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[12] : 1'bz;
assign	out[11] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[11] : 1'bz;
assign	out[10] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[10] : 1'bz;
assign	out[9] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[9] : 1'bz;
assign	out[8] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[8] : 1'bz;
assign	out[7] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[7] : 1'bz;
assign	out[6] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[6] : 1'bz;
assign	out[5] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[5] : 1'bz;
assign	out[4] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[4] : 1'bz;
assign	out[3] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[3] : 1'bz;
assign	out[2] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[2] : 1'bz;
assign	out[1] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[1] : 1'bz;
assign	out[0] = ACTIVE0 ? GDFX_TEMP_SIGNAL_3[0] : 1'bz;

assign	out[37] = WR ? GDFX_TEMP_SIGNAL_4[37] : 1'bz;
assign	out[36] = WR ? GDFX_TEMP_SIGNAL_4[36] : 1'bz;
assign	out[35] = WR ? GDFX_TEMP_SIGNAL_4[35] : 1'bz;
assign	out[34] = WR ? GDFX_TEMP_SIGNAL_4[34] : 1'bz;
assign	out[33] = WR ? GDFX_TEMP_SIGNAL_4[33] : 1'bz;
assign	out[32] = WR ? GDFX_TEMP_SIGNAL_4[32] : 1'bz;
assign	out[31] = WR ? GDFX_TEMP_SIGNAL_4[31] : 1'bz;
assign	out[30] = WR ? GDFX_TEMP_SIGNAL_4[30] : 1'bz;
assign	out[29] = WR ? GDFX_TEMP_SIGNAL_4[29] : 1'bz;
assign	out[28] = WR ? GDFX_TEMP_SIGNAL_4[28] : 1'bz;
assign	out[27] = WR ? GDFX_TEMP_SIGNAL_4[27] : 1'bz;
assign	out[26] = WR ? GDFX_TEMP_SIGNAL_4[26] : 1'bz;
assign	out[25] = WR ? GDFX_TEMP_SIGNAL_4[25] : 1'bz;
assign	out[24] = WR ? GDFX_TEMP_SIGNAL_4[24] : 1'bz;
assign	out[23] = WR ? GDFX_TEMP_SIGNAL_4[23] : 1'bz;
assign	out[22] = WR ? GDFX_TEMP_SIGNAL_4[22] : 1'bz;
assign	out[21] = WR ? GDFX_TEMP_SIGNAL_4[21] : 1'bz;
assign	out[20] = WR ? GDFX_TEMP_SIGNAL_4[20] : 1'bz;
assign	out[19] = WR ? GDFX_TEMP_SIGNAL_4[19] : 1'bz;
assign	out[18] = WR ? GDFX_TEMP_SIGNAL_4[18] : 1'bz;
assign	out[17] = WR ? GDFX_TEMP_SIGNAL_4[17] : 1'bz;
assign	out[16] = WR ? GDFX_TEMP_SIGNAL_4[16] : 1'bz;
assign	out[15] = WR ? GDFX_TEMP_SIGNAL_4[15] : 1'bz;
assign	out[14] = WR ? GDFX_TEMP_SIGNAL_4[14] : 1'bz;
assign	out[13] = WR ? GDFX_TEMP_SIGNAL_4[13] : 1'bz;
assign	out[12] = WR ? GDFX_TEMP_SIGNAL_4[12] : 1'bz;
assign	out[11] = WR ? GDFX_TEMP_SIGNAL_4[11] : 1'bz;
assign	out[10] = WR ? GDFX_TEMP_SIGNAL_4[10] : 1'bz;
assign	out[9] = WR ? GDFX_TEMP_SIGNAL_4[9] : 1'bz;
assign	out[8] = WR ? GDFX_TEMP_SIGNAL_4[8] : 1'bz;
assign	out[7] = WR ? GDFX_TEMP_SIGNAL_4[7] : 1'bz;
assign	out[6] = WR ? GDFX_TEMP_SIGNAL_4[6] : 1'bz;
assign	out[5] = WR ? GDFX_TEMP_SIGNAL_4[5] : 1'bz;
assign	out[4] = WR ? GDFX_TEMP_SIGNAL_4[4] : 1'bz;
assign	out[3] = WR ? GDFX_TEMP_SIGNAL_4[3] : 1'bz;
assign	out[2] = WR ? GDFX_TEMP_SIGNAL_4[2] : 1'bz;
assign	out[1] = WR ? GDFX_TEMP_SIGNAL_4[1] : 1'bz;
assign	out[0] = WR ? GDFX_TEMP_SIGNAL_4[0] : 1'bz;

assign	Ba = address[20];


assign	o = GDFX_TEMP_SIGNAL_5;


assign	a = GDFX_TEMP_SIGNAL_6;


assign	Bb = address[21];



always@(posedge clk)
begin
	begin
	WR <= NOP2;
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
	NOP3 <= WR;
	end
end

assign	SYNTHESIZED_WIRE_0 = NOP0 | NOP2 | NOP1 | NOP3 | NOP4 | NOP5;

assign	SDRAM_B0 = out[9];
assign	ACTIVE0 = request;
assign	SDRAM_D[15:0] = out[25:10];
assign	SDRAM_B1 = out[8];
assign	SDRAM_DQMH = out[7];
assign	SDRAM_DQML = out[6];
assign	SDRAM_WE = out[5];
assign	SDRAM_CAS = out[4];
assign	SDRAM_RAS = out[3];
assign	SDRAM_CS = out[2];
assign	SDRAM_CLK = out[1];
assign	SDRAM_CKE = out[0];
assign	done = NOP5;
assign	SDRAM_A[11:0] = out[37:26];
assign	out[25:10] = SDRAM_D;

endmodule
