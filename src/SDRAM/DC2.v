module DC2 (
    input  wire [1:0] data,
    output wire eq0,
    output wire eq1,
    output wire eq2,
    output wire eq3
);

// Internal signal for decoded output
wire [3:0] decoded;

// Decoding logic
assign decoded = 4'b0001 << data; // Shift 1 to the position specified by data

// Assign outputs
assign eq0 = decoded[0];
assign eq1 = decoded[1];
assign eq2 = decoded[2];
assign eq3 = decoded[3];

endmodule
