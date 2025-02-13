module CPU_top(
  input         i_clk,
  input [31:0]  i_bus_data,
  input         i_bus_DV,
  output [31:0] o_bus_data,
  output [31:0] o_bus_address,
  output        o_bus_DV,
  output [2:0]  o_bhw,
  output        o_write_notread
);

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Instruction Register
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

wire [31:0] w_IR;
wire [31:0] w_instruction;

//maybe instead of i_bus_DV -> re_bus_DV
instruction_register m_IR(.clk(i_clk), .in(i_bus_data), .valid(i_bus_DV),
  .state(w_state), .out(w_IR), .instruction(w_instruction));

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Program Counter
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

wire [31:0] w_PC;
reg [31:0] r_load_pc_data;

program_counter m_PC(.i_clk(i_clk), .i_PC(r_load_pc_data),
  .i_state(w_state), .i_instruction(w_instruction), .o_PC(w_PC));


// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  State Machine
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

reg [2:0] w_state;

control_unit m_State(.i_clk(i_clk), .i_bus_DV(i_bus_DV),
  .i_instruction(w_instruction), .o_state(w_state));


// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Register File
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

wire w_load_reg_file; //TODO: assing this wire
wire [31:0] w_registerout1;
wire [31:0] w_registerout2;

register_file m_RegFile(.i_clk(i_clk), .i_data(w_ALU_out), .i_IR(w_IR), .i_load(w_load_reg_file),
  .o_regout1(w_registerout1), .o_regout2(w_registerout2));


// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  ALU
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

wire [31:0] w_ALU_out;

alu m_ALU(.i_clk(i_clk), .i_instruction(w_instruction), .i_IR(w_IR),
  .i_regout1(w_registerout1), .i_regout2(w_registerout2), .o_aluout(w_ALU_out));


// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Memory Controler
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

memory_controler m_memory_controler(.i_clk(i_clk), .i_instruction(w_instruction),
  .i_regout1(w_registerout1), .i_regout2(w_registerout2), .i_PC(w_PC), .i_IR(w_IR),
  .i_bhw(o_bhw), .i_bus_address(o_bus_address), .i_bus_data(o_bus_data),
  .i_bus_DV(o_bus_DV), .i_write_notread(o_write_notread), .i_state(w_state));


endmodule

