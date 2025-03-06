module ComparatorX #(parameter size = 16) (
    input  [size-1:0] A,
    input  [size-1:0] B,
    output reg EQ,
    output reg LS,
    output reg GR
);

always @(*) begin
    if (A == B)
        EQ = 1'b1;
    else
        EQ = 1'b0;

    if (A > B)
        GR = 1'b1;
    else
        GR = 1'b0;

    if (A < B)
        LS = 1'b1;
    else
        LS = 1'b0;
end

endmodule
