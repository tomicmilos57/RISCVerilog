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
// CREATED		"Thu Mar  6 01:48:53 2025"

module SDRAMRefresh(
	clk,
	Request,
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
input wire	Request;
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
reg	LD_MREG;
reg	NOP1;
reg	NOP2;
reg	NOP3;
reg	NOP4;
reg	NOP5;
reg	NOP6;
reg	NOP7;
wire	NOP8;
reg	NOP9;
wire	[63:0] o;
wire	[37:0] out;
reg	RFRSH0;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;

wire	[37:0] GDFX_TEMP_SIGNAL_2;
wire	[37:0] GDFX_TEMP_SIGNAL_1;
wire	[37:0] GDFX_TEMP_SIGNAL_0;
wire	[63:0] GDFX_TEMP_SIGNAL_4;
wire	[63:0] GDFX_TEMP_SIGNAL_3;


assign	GDFX_TEMP_SIGNAL_2 = {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,clk,1};
assign	GDFX_TEMP_SIGNAL_1 = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,clk,1};
assign	GDFX_TEMP_SIGNAL_0 = {o[11:0],o[15:0],o[1:0],a[1:0],1,1,1,0,clk,1};
assign	GDFX_TEMP_SIGNAL_4 = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
assign	GDFX_TEMP_SIGNAL_3 = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

assign	SYNTHESIZED_WIRE_1 = 0 | 0 | RFRSH0;

assign	SYNTHESIZED_WIRE_0 = NOP3 | NOP2 | NOP1 | NOP6 | NOP5 | NOP4 | NOP8 | NOP7 | NOP9 | 0 | 0 | 0;


always@(posedge clk)
begin
	begin
	NOP1 <= NOP3;
	end
end


always@(posedge clk)
begin
	begin
	NOP9 <= NOP8;
	end
end


always@(posedge clk)
begin
	begin
	NOP7 <= LD_MREG;
	end
end


always@(posedge clk)
begin
	begin
	LD_MREG <= NOP9;
	end
end


always@(posedge clk)
begin
	begin
	NOP3 <= NOP7;
	end
end

assign	out[37] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[37] : 1'bz;
assign	out[36] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[36] : 1'bz;
assign	out[35] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[35] : 1'bz;
assign	out[34] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[34] : 1'bz;
assign	out[33] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[33] : 1'bz;
assign	out[32] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[32] : 1'bz;
assign	out[31] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[31] : 1'bz;
assign	out[30] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[30] : 1'bz;
assign	out[29] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[29] : 1'bz;
assign	out[28] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[28] : 1'bz;
assign	out[27] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[27] : 1'bz;
assign	out[26] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[26] : 1'bz;
assign	out[25] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[25] : 1'bz;
assign	out[24] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[24] : 1'bz;
assign	out[23] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[23] : 1'bz;
assign	out[22] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[22] : 1'bz;
assign	out[21] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[21] : 1'bz;
assign	out[20] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[20] : 1'bz;
assign	out[19] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[19] : 1'bz;
assign	out[18] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[18] : 1'bz;
assign	out[17] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[17] : 1'bz;
assign	out[16] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[16] : 1'bz;
assign	out[15] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[15] : 1'bz;
assign	out[14] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[14] : 1'bz;
assign	out[13] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[13] : 1'bz;
assign	out[12] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[12] : 1'bz;
assign	out[11] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[11] : 1'bz;
assign	out[10] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[10] : 1'bz;
assign	out[9] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[9] : 1'bz;
assign	out[8] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[8] : 1'bz;
assign	out[7] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[7] : 1'bz;
assign	out[6] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[6] : 1'bz;
assign	out[5] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[5] : 1'bz;
assign	out[4] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[4] : 1'bz;
assign	out[3] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[3] : 1'bz;
assign	out[2] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[2] : 1'bz;
assign	out[1] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[1] : 1'bz;
assign	out[0] = SYNTHESIZED_WIRE_0 ? GDFX_TEMP_SIGNAL_0[0] : 1'bz;

assign	out[37] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[37] : 1'bz;
assign	out[36] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[36] : 1'bz;
assign	out[35] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[35] : 1'bz;
assign	out[34] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[34] : 1'bz;
assign	out[33] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[33] : 1'bz;
assign	out[32] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[32] : 1'bz;
assign	out[31] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[31] : 1'bz;
assign	out[30] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[30] : 1'bz;
assign	out[29] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[29] : 1'bz;
assign	out[28] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[28] : 1'bz;
assign	out[27] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[27] : 1'bz;
assign	out[26] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[26] : 1'bz;
assign	out[25] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[25] : 1'bz;
assign	out[24] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[24] : 1'bz;
assign	out[23] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[23] : 1'bz;
assign	out[22] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[22] : 1'bz;
assign	out[21] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[21] : 1'bz;
assign	out[20] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[20] : 1'bz;
assign	out[19] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[19] : 1'bz;
assign	out[18] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[18] : 1'bz;
assign	out[17] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[17] : 1'bz;
assign	out[16] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[16] : 1'bz;
assign	out[15] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[15] : 1'bz;
assign	out[14] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[14] : 1'bz;
assign	out[13] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[13] : 1'bz;
assign	out[12] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[12] : 1'bz;
assign	out[11] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[11] : 1'bz;
assign	out[10] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[10] : 1'bz;
assign	out[9] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[9] : 1'bz;
assign	out[8] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[8] : 1'bz;
assign	out[7] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[7] : 1'bz;
assign	out[6] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[6] : 1'bz;
assign	out[5] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[5] : 1'bz;
assign	out[4] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[4] : 1'bz;
assign	out[3] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[3] : 1'bz;
assign	out[2] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[2] : 1'bz;
assign	out[1] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[1] : 1'bz;
assign	out[0] = SYNTHESIZED_WIRE_1 ? GDFX_TEMP_SIGNAL_1[0] : 1'bz;


always@(posedge clk)
begin
	begin
	NOP2 <= NOP1;
	end
end

assign	out[37] = LD_MREG ? GDFX_TEMP_SIGNAL_2[37] : 1'bz;
assign	out[36] = LD_MREG ? GDFX_TEMP_SIGNAL_2[36] : 1'bz;
assign	out[35] = LD_MREG ? GDFX_TEMP_SIGNAL_2[35] : 1'bz;
assign	out[34] = LD_MREG ? GDFX_TEMP_SIGNAL_2[34] : 1'bz;
assign	out[33] = LD_MREG ? GDFX_TEMP_SIGNAL_2[33] : 1'bz;
assign	out[32] = LD_MREG ? GDFX_TEMP_SIGNAL_2[32] : 1'bz;
assign	out[31] = LD_MREG ? GDFX_TEMP_SIGNAL_2[31] : 1'bz;
assign	out[30] = LD_MREG ? GDFX_TEMP_SIGNAL_2[30] : 1'bz;
assign	out[29] = LD_MREG ? GDFX_TEMP_SIGNAL_2[29] : 1'bz;
assign	out[28] = LD_MREG ? GDFX_TEMP_SIGNAL_2[28] : 1'bz;
assign	out[27] = LD_MREG ? GDFX_TEMP_SIGNAL_2[27] : 1'bz;
assign	out[26] = LD_MREG ? GDFX_TEMP_SIGNAL_2[26] : 1'bz;
assign	out[25] = LD_MREG ? GDFX_TEMP_SIGNAL_2[25] : 1'bz;
assign	out[24] = LD_MREG ? GDFX_TEMP_SIGNAL_2[24] : 1'bz;
assign	out[23] = LD_MREG ? GDFX_TEMP_SIGNAL_2[23] : 1'bz;
assign	out[22] = LD_MREG ? GDFX_TEMP_SIGNAL_2[22] : 1'bz;
assign	out[21] = LD_MREG ? GDFX_TEMP_SIGNAL_2[21] : 1'bz;
assign	out[20] = LD_MREG ? GDFX_TEMP_SIGNAL_2[20] : 1'bz;
assign	out[19] = LD_MREG ? GDFX_TEMP_SIGNAL_2[19] : 1'bz;
assign	out[18] = LD_MREG ? GDFX_TEMP_SIGNAL_2[18] : 1'bz;
assign	out[17] = LD_MREG ? GDFX_TEMP_SIGNAL_2[17] : 1'bz;
assign	out[16] = LD_MREG ? GDFX_TEMP_SIGNAL_2[16] : 1'bz;
assign	out[15] = LD_MREG ? GDFX_TEMP_SIGNAL_2[15] : 1'bz;
assign	out[14] = LD_MREG ? GDFX_TEMP_SIGNAL_2[14] : 1'bz;
assign	out[13] = LD_MREG ? GDFX_TEMP_SIGNAL_2[13] : 1'bz;
assign	out[12] = LD_MREG ? GDFX_TEMP_SIGNAL_2[12] : 1'bz;
assign	out[11] = LD_MREG ? GDFX_TEMP_SIGNAL_2[11] : 1'bz;
assign	out[10] = LD_MREG ? GDFX_TEMP_SIGNAL_2[10] : 1'bz;
assign	out[9] = LD_MREG ? GDFX_TEMP_SIGNAL_2[9] : 1'bz;
assign	out[8] = LD_MREG ? GDFX_TEMP_SIGNAL_2[8] : 1'bz;
assign	out[7] = LD_MREG ? GDFX_TEMP_SIGNAL_2[7] : 1'bz;
assign	out[6] = LD_MREG ? GDFX_TEMP_SIGNAL_2[6] : 1'bz;
assign	out[5] = LD_MREG ? GDFX_TEMP_SIGNAL_2[5] : 1'bz;
assign	out[4] = LD_MREG ? GDFX_TEMP_SIGNAL_2[4] : 1'bz;
assign	out[3] = LD_MREG ? GDFX_TEMP_SIGNAL_2[3] : 1'bz;
assign	out[2] = LD_MREG ? GDFX_TEMP_SIGNAL_2[2] : 1'bz;
assign	out[1] = LD_MREG ? GDFX_TEMP_SIGNAL_2[1] : 1'bz;
assign	out[0] = LD_MREG ? GDFX_TEMP_SIGNAL_2[0] : 1'bz;



assign	o = GDFX_TEMP_SIGNAL_3;


assign	a = GDFX_TEMP_SIGNAL_4;



always@(posedge clk)
begin
	begin
	RFRSH0 <= NOP2;
	end
end


always@(posedge clk)
begin
	begin
	NOP5 <= RFRSH0;
	end
end


always@(posedge clk)
begin
	begin
	NOP6 <= NOP5;
	end
end


always@(posedge clk)
begin
	begin
	NOP4 <= NOP6;
	end
end

assign	SDRAM_B0 = out[9];
assign	NOP8 = Request;
assign	SDRAM_D[15:0] = out[25:10];
assign	SDRAM_B1 = out[8];
assign	SDRAM_DQMH = 0;
assign	SDRAM_DQML = 0;
assign	SDRAM_WE = out[5];
assign	SDRAM_CAS = out[4];
assign	SDRAM_RAS = out[3];
assign	SDRAM_CS = out[2];
assign	SDRAM_CLK = out[1];
assign	SDRAM_CKE = out[0];
assign	done = NOP4;
assign	SDRAM_A[11:0] = out[37:26];
assign	out[25:10] = SDRAM_D;

endmodule
