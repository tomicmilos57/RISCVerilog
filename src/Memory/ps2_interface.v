module ps2_interface (
  input wire i_clk,
  input wire [7:0] i_data,
  input wire [11:0] i_address,
  input wire i_write,
  input wire i_request,
  output wire [7:0] o_data,
  output reg o_data_DV
);

assign o_data = 8'h04;

always @(posedge i_clk) begin
  o_data_DV <= 1'b0;

    if (i_request) begin
        o_data_DV <= 1'b1;
    end
end

endmodule

