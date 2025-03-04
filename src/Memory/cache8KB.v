module cache8KB #(
    parameter DATA_WIDTH = 8,  // Width of each memory word
    parameter ADDR_WIDTH = 13   // Depth of memory (2^ADDR_WIDTH locations)
) (
  input wire i_clk,
  input wire [DATA_WIDTH-1:0] i_data,
  input wire [ADDR_WIDTH-1:0] i_address,
  input wire i_write,
  input wire i_request,
  output wire [DATA_WIDTH-1:0] o_data,
  output reg o_data_DV
);

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  MEMORY
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

reg [DATA_WIDTH-1:0] ram [0:(1 << ADDR_WIDTH)-1];

initial begin
  $readmemh("../misc/misa.mif", ram);
end

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Combinational Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

reg [1:0] r_counter = 2'b00;
reg [DATA_WIDTH-1:0] out;
assign o_data = out;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Sequential Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

always @(posedge i_clk) begin
  o_data_DV <= 1'b0;
  case (r_counter)
    2'b00: if(i_request) r_counter <= r_counter + 1;
    2'b01: r_counter <= r_counter + 1;
  2'b10: r_counter <= r_counter + 1;
  2'b11: begin
    r_counter <= 2'b00;
    o_data_DV <= 1'b1;
  end
  default:;
endcase

end

always @(posedge i_clk) begin
  if (i_write & i_request) begin
    ram[i_address] <= i_data;  // Write data to memory
  end
  out <= ram[i_address];     // Read data from memory
end

endmodule

