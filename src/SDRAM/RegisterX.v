module RegisterX #(
    parameter size = 16,
    parameter default_value = 0
) (
    input  wire CLK,
    input  wire LD,
    input  wire CL,
    input  wire INC,
    input  wire DEC,
    input  wire [size-1:0] DATA_IN,
    output reg  [size-1:0] DATA_OUT
);

reg [size-1:0] data, data_next;

// Initialize data and data_next with default_value
initial begin
    data = default_value;
    data_next = default_value;
end

// Output assignment
always @(*) begin
    DATA_OUT = data;
end

// Clocked process for updating data
always @(posedge CLK) begin
    data <= data_next;
end

// Combinational process for determining data_next
always @(*) begin
    if (CL)
        data_next = {size{1'b0}}; // Clear to 0
    else if (LD)
        data_next = DATA_IN;      // Load DATA_IN
    else if (INC)
        data_next = data + 1;     // Increment
    else if (DEC)
        data_next = data - 1;     // Decrement
    else
        data_next = data;        // Hold current value
end

endmodule
