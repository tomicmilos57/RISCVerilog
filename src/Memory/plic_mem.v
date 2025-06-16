module plic_mem (
  input wire i_clk,
  input wire [7:0] i_data,
  input wire [31:0] i_address,
  input wire i_write,
  input wire i_request,
  output wire [7:0] o_data,
  output reg o_data_DV
);

assign o_data = (i_address == 32'd2101252) ? 8'd10 : 8'b0;

always @(posedge i_clk) begin
  o_data_DV <= 1'b0;

    if (i_request)
        o_data_DV <= 1'b1;
end

endmodule

