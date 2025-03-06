module cpu_tb;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Combinational Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

reg i_clk;
wire [31:0] w_input_bus_data;
wire w_input_bus_DV;
wire [31:0] w_output_bus_data;
wire [31:0] w_output_bus_address;
wire w_output_bus_DV;
wire [2:0] w_output_bhw;
wire w_output_write_notread;
wire [31:0] w_reg5;

CPU_top cpu(
  .i_clk(i_clk),
  .i_bus_data(w_input_bus_data),
  .i_bus_DV(w_input_bus_DV),
  .o_bus_data(w_output_bus_data),
  .o_bus_address(w_output_bus_address),
  .o_bus_DV(w_output_bus_DV),
  .o_bhw(w_output_bhw),
  .o_write_notread(w_output_write_notread),
  .o_reg5(w_reg5)
);

memory_top memory(
  .i_clk(i_clk),
  .i_bus_data(w_output_bus_data),
  .i_bus_address(w_output_bus_address),
  .i_bus_DV(w_output_bus_DV),
  .i_bhw(w_output_bhw),
  .i_write_notread(w_output_write_notread),
  .o_bus_data(w_input_bus_data),
  .o_bus_DV(w_input_bus_DV)
);

wire [6:0]  HEX0_D;
wire        HEX0_DP;
wire [6:0]  HEX1_D;
wire        HEX1_DP;
wire [6:0]  HEX2_D;
wire        HEX2_DP;
wire [6:0]  HEX3_D;
wire        HEX3_DP;


seven_segment_32bit print(
  .i_data(w_reg5),
  .i_mode(1'b0),
  .o_hex3(HEX0_D),
  .o_hex2(HEX1_D),
  .o_hex1(HEX2_D),
  .o_hex0(HEX3_D)
);

// mainMemory memory(
//   .request(w_output_bus_DV),
//   .bhw(w_output_bhw),
//   .WR_nRD(w_output_write_notread),
//   .ADR(w_output_bus_address),
//   .DATA(w_output_bus_data),
//   .DATAOUT(w_input_bus_data),
//   .send(w_input_bus_DV),
//   .CLK(i_clk)
// );

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Sequential Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

initial begin
  i_clk = 0;
  forever #5 i_clk = ~i_clk;
end

initial begin
  #1000000;
  $finish;
end

endmodule

