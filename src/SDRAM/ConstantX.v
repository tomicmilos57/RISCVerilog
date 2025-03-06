module ConstantX #(
    parameter size = 16,
    parameter constant = 0
) (
    output wire [size-1:0] DATA_OUT
);

assign DATA_OUT = constant; // Directly assign the constant value to the output

endmodule
