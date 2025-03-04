module seven_segment_32bit(
  input wire [31:0] i_data,
  input wire i_mode,
  output wire [27:0] o_hex
);

wire [15:0] w_data = i_mode ? i_data[31:16] : i_data[15:0];

seven_segment_digit_interface seg0(
  .x3(w_data[15]), .x2(w_data[14]), .x1(w_data[13]),
  .x0(w_data[12]), .dot(1'b0), .en(1'b1),
  .a(o_hex[27]), .b(o_hex[26]), .c(o_hex[25]),
  .d(o_hex[24]), .e(o_hex[23]), .f(o_hex[22]), .g(o_hex[21]));
seven_segment_digit_interface seg1(
  .x3(w_data[11]), .x2(w_data[10]), .x1(w_data[9]),
  .x0(w_data[8]), .dot(1'b0), .en(1'b1),
  .a(o_hex[20]), .b(o_hex[19]), .c(o_hex[18]),
  .d(o_hex[17]), .e(o_hex[16]), .f(o_hex[15]), .g(o_hex[14]));
seven_segment_digit_interface seg2(
  .x3(w_data[7]), .x2(w_data[6]), .x1(w_data[5]),
  .x0(w_data[4]), .dot(1'b0), .en(1'b1),
  .a(o_hex[13]), .b(o_hex[12]), .c(o_hex[11]),
  .d(o_hex[10]), .e(o_hex[9]), .f(o_hex[8]), .g(o_hex[7]));
seven_segment_digit_interface seg3(
  .x3(w_data[3]), .x2(w_data[2]), .x1(w_data[1]),
  .x0(w_data[0]), .dot(1'b0), .en(1'b1),
  .a(o_hex[6]), .b(o_hex[5]), .c(o_hex[4]),
  .d(o_hex[3]), .e(o_hex[2]), .f(o_hex[1]), .g(o_hex[0]));

endmodule

