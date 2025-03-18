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
wire [1023:0] w_regs;
wire [31:0] w_reg;
wire w_state;

CPU_top cpu(
  .i_clk(i_clk),
  .i_bus_data(w_input_bus_data),
  .i_bus_DV(w_input_bus_DV),
  .o_bus_data(w_output_bus_data),
  .o_bus_address(w_output_bus_address),
  .o_bus_DV(w_output_bus_DV),
  .o_bhw(w_output_bhw),
  .o_write_notread(w_output_write_notread),
  .o_regs(w_regs),
  .o_state(w_state),
  .o_PC(),
  .o_IR()
);

wire SDRAM_B0;
wire SDRAM_B1;
wire SDRAM_DQMH;
wire SDRAM_DQML;
wire SDRAM_WE;
wire SDRAM_CAS;
wire SDRAM_RAS;
wire SDRAM_CS;
wire SDRAM_CLK;
wire SDRAM_CKE;
wire [11:0] SDRAM_A;
wire [15:0] SDRAM_D;

wire [31:0] w_gpu_address;
wire [7:0] w_gpu_data;

wire [31:0] w_hex;

wire  [31:0] GPIO0_D;

memory_top memory(
  .i_clk(i_clk),
  .i_bus_data(w_output_bus_data),
  .i_bus_address(w_output_bus_address),
  .i_bus_DV(w_output_bus_DV),
  .i_bhw(w_output_bhw),
  .i_write_notread(w_output_write_notread),
  .o_bus_data(w_input_bus_data),
  .o_bus_DV(w_input_bus_DV),

  .SDRAM_B0(SDRAM_B0),
  .SDRAM_B1(SDRAM_B1),
  .SDRAM_DQMH(SDRAM_DQMH),
  .SDRAM_DQML(SDRAM_DQML),
  .SDRAM_WE(SDRAM_WE),
  .SDRAM_CAS(SDRAM_CAS),
  .SDRAM_RAS(SDRAM_RAS),
  .SDRAM_CS(SDRAM_CS),
  .SDRAM_CLK(SDRAM_CLK),
  .SDRAM_CKE(SDRAM_CKE),
  .SDRAM_A(SDRAM_A),
  .SDRAM_D(SDRAM_D),

  .i_gpu_address(w_gpu_address),
  .o_gpu_data(w_gpu_data),

  .o_hex(w_hex),

  .i_gpio_data(GPIO0_D[7:0]),
  .i_gpio_control(GPIO0_D[15:12]),
  .o_gpio_control(GPIO0_D[11:8])

);
defparam memory.bootloader.altsyncram_component.init_file = "../misc/bootloader.mif";
defparam memory.gpu.altsyncram_component.init_file = "../misc/GPUINIT.mif";


wire [3:0] w_red;
wire [3:0] w_green;
wire [3:0] w_blue;
wire w_hs;
wire w_vs;

gpu gpu(
  .i_CLK(i_clk),
  .i_PixelData(w_gpu_data),
  .o_HS(w_hs),
  .o_VS(w_vs),
  .o_RdAddr(w_gpu_address),
  .o_RED(w_red),
  .o_GREEN(w_green),
  .o_BLUE(w_blue)
);




wire [6:0]  HEX0_D;
wire        HEX0_DP;
wire [6:0]  HEX1_D;
wire        HEX1_DP;
wire [6:0]  HEX2_D;
wire        HEX2_DP;
wire [6:0]  HEX3_D;
wire        HEX3_DP;
reg [9:0]   SW = 1;

mux_1024to32 mux(
  .data_in(w_regs),
  .sel({SW[4], SW[3], SW[2], SW[1], SW[0]}),
  .data_out(w_reg)
);

seven_segment_32bit print(
  .i_data(w_reg),
  .i_mode(SW[9]),
  .o_hex3(HEX0_D),
  .o_hex2(HEX1_D),
  .o_hex1(HEX2_D),
  .o_hex0(HEX3_D)
);

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

