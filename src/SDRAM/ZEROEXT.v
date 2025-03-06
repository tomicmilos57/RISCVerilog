module ZEROEXT #(
    parameter in_width = 8,
    parameter out_width = 32
) (
    input  wire [in_width-1:0]  I,
    output reg  [out_width-1:0] O
);

always @(*) begin
    O = {out_width{1'b0}}; // Initialize output to all zeros
    O[in_width-1:0] = I;   // Assign input to the lower bits of the output
end

endmodule
