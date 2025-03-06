module memory_map (
    input wire [31:0] i_address,
    output wire o_bootloader_DV,
    output wire o_sdram_DV
);

assign o_bootloader_DV = (i_address < 32'h00002000); //8kB

assign o_sdram_DV = (i_address > 32'h10000000); //8kB

endmodule

