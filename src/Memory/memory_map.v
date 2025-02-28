module memory_map (
    input wire [31:0] i_address,       // Input address (13-bit wide)
    output wire o_bootloader_DV       // Output: Bootloader Data Valid signal
);

assign o_bootloader_DV = (i_address < 32'h00002000);

endmodule

