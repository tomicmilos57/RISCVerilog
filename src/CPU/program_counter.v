module program_counter(i_clk, i_jump_address, i_jump_DV, i_nextPC_DV, o_PC);

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Ports
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

input i_clk;
input i_nextPC_DV;
input i_jump_DV;
input [31:0] i_jump_address;
output [31:0] o_PC;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Combinational Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

reg [31:0] r_PC;
assign o_PC = r_PC;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Sequential Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

always @(posedge i_clk)begin

  if(i_nextPC_DV)begin
    r_PC <= r_PC + 32'd4;
  end
  else if(i_jump_DV)begin
    r_PC <= i_jump_address;
  end

end



endmodule

