module control_unit(i_clk, i_bus_DV, i_instruction, o_load_PC, o_state);

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Ports
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

input i_clk;
input i_bus_DV;
input i_instruction;
output o_load_PC;
output o_state;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Combinational Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

reg r_state = 1'h0;
assign o_state = r_state;

reg r_load_PC = 1'h0;
assign o_load_PC = r_load_PC;

wire FETCH = r_state == 1'h0;
wire EXECUTE = r_state == 1'h1;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Sequential Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

always @(posedge i_clk)begin
  r_load_PC <= 1'h0;
  if(FETCH)begin
    if(i_bus_DV)begin
      r_state <= 1'h1;
    end
  end
  else if(EXECUTE)begin

    if(i_instruction >= 32'd27 & i_instruction <= 32'd34)begin //Load and Store instructions
      if(i_bus_DV) begin // value received from memory
        r_state = 1'h0;
        r_load_PC <= 1'h1;
      end
    end

    else begin // Any other instruction
      r_state = 1'h0;
      r_load_PC <= 1'h1;
    end

  end

end


endmodule

