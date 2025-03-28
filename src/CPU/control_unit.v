module control_unit(i_clk, i_bus_DV, i_instruction, i_div_rem_finnished,
  o_load_PC, o_state, o_start_fetch);

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Ports
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

input i_clk;
input i_bus_DV;
input [31:0] i_instruction;
input i_div_rem_finnished;
output o_load_PC;
output o_state;
output o_start_fetch;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Combinational Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

wire w_load_store_instruction = i_instruction >= 32'd27 & i_instruction <= 32'd34;
wire w_div_rem_instruction = i_instruction >= 32'd14 && i_instruction <= 32'd17;

reg r_state = 1'h0;
assign o_state = r_state;

wire FETCH = r_state == 1'h0;
wire EXECUTE = r_state == 1'h1;

assign o_load_PC = (w_load_store_instruction & i_bus_DV & EXECUTE) |
  (w_div_rem_instruction & i_div_rem_finnished & EXECUTE) |
  EXECUTE & ~(w_load_store_instruction | w_div_rem_instruction);

reg r_start_fetch = 1'h0;
assign o_start_fetch = r_start_fetch;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Sequential Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

always @(posedge i_clk)begin
  r_start_fetch <= 1'h0;
  if(FETCH)begin
    if(i_bus_DV)begin
      r_state <= 1'h1;
    end
  end
  else if(EXECUTE)begin

    if(i_instruction >= 32'd14 && i_instruction <= 32'd17)begin //Load and Store instructions
      if(i_div_rem_finnished) begin // value received from memory
        r_state = 1'h0;
        r_start_fetch <= 1'h1;
      end
    end

    else if(i_instruction >= 32'd27 && i_instruction <= 32'd34)begin //Load and Store instructions
      if(i_bus_DV) begin // value received from memory
        r_state = 1'h0;
        r_start_fetch <= 1'h1;
      end
    end

    else begin // Any other instruction
      r_state = 1'h0;
      r_start_fetch <= 1'h1;
    end

  end

end


endmodule

