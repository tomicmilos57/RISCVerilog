module memory_map (
    input wire [31:0] i_address,
    output wire o_bootloader_DV,
    output wire o_sdram_DV,
    output wire o_gpu_DV,
    output wire o_ps2_DV,
    output wire o_gpio_DV,
    output wire o_hex_DV,
    output wire o_test_DV
);

assign o_bootloader_DV = (i_address < 32'h00002000); //8kB

assign o_sdram_DV = (i_address >= 32'h10000000 && i_address < 32'h20000000);

assign o_gpu_DV = (i_address >= 32'h20000000 && i_address < 32'h30000000);

assign o_ps2_DV = (i_address >= 32'h30000000 && i_address < 32'h40000000);

assign o_gpio_DV = (i_address >= 32'h40000000 && i_address < 32'h50000000);

assign o_hex_DV = (i_address >= 32'h50000000 && i_address < 32'h60000000);

assign o_test_DV = (i_address >= 32'h60000000 && i_address < 32'h70000000);

endmodule

