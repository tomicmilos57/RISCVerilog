module register_file(i_clk, i_data, i_IR, i_load,
  o_regout1, o_regout2);

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Ports
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

input        i_clk;
input        i_load;
input [31:0] i_data;
input [31:0] i_IR;
output reg [31:0] o_regout1;
output reg [31:0] o_regout2;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Combinational Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

reg signed [31:0] regfile [0:31];
reg [31:0] r_IR;
wire [4:0] w_select_regin = r_IR[11:7];
wire [4:0] w_select_regout1 = r_IR[19:15];
wire [4:0] w_select_regout2 = r_IR[24:20];

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Sequential Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

always @(posedge i_clk) begin
  r_IR <= i_IR;

  if (i_load && w_select_regin != 5'd0) begin
    regfile[w_select_regin] <= i_data;
  end

  o_regout1 <= (w_select_regout1 == 5'd0) ? 32'd0 : regfile[w_select_regout1];
  o_regout2 <= (w_select_regout2 == 5'd0) ? 32'd0 : regfile[w_select_regout2];
end



endmodule

