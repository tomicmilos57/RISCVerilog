module cache8KB (
  input wire i_clk,
  input wire [7:0] i_data,
  input wire [31:0] i_address,
  input wire i_write,
  input wire i_request,
  output reg [7:0] o_data,
  output reg o_data_DV
);

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Combinational Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

reg [1:0] r_counter = 2'b00;

wire outclock;
altsyncram altsyncram_component (
  .address_a(i_address[12:0]),    // Address input
  .clock0(i_clk),      // Input clock
  .data_a(i_data),         // Data input
  .wren_a(i_write & i_request),         // Write enable
  .clock1(outclock),    // Output clock
  .q_a(o_data)        // Data output
);

// Set the parameters for the RAM
defparam altsyncram_component.clock_enable_input_a = "BYPASS";
defparam altsyncram_component.clock_enable_output_a = "BYPASS";
defparam altsyncram_component.init_file = "../bootloader.mif";
defparam altsyncram_component.intended_device_family = "Cyclone III";
defparam altsyncram_component.lpm_type = "altsyncram";
defparam altsyncram_component.numwords_a = 8192;
defparam altsyncram_component.operation_mode = "SINGLE_PORT";
defparam altsyncram_component.outdata_aclr_a = "NONE";
defparam altsyncram_component.outdata_reg_a = "CLOCK1";
defparam altsyncram_component.power_up_uninitialized = "FALSE";
defparam altsyncram_component.read_during_write_mode_port_a = "NEW_DATA_NO_NBE_READ";
defparam altsyncram_component.widthad_a = 13;
defparam altsyncram_component.width_a = 8;
defparam altsyncram_component.width_byteena_a = 1;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Sequential Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

always @(posedge i_clk) begin
  o_data_DV <= 1'b0;
  case (r_counter)
    2'b00: if(i_request) r_counter <= r_counter + 1;
    2'b01: r_counter <= r_counter + 1;
    2'b10: r_counter <= r_counter + 1;
    2'b11: begin
      r_counter <= 2'b00;
      o_data_DV <= 1'b1;
    end
    default:;
  endcase

end

endmodule

