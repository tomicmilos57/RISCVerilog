module sd_card_mem (
    input wire i_clk,
    input wire [7:0] i_data,
    input wire [11:0] i_address,
    input wire i_write,
    input wire i_request,
    output wire [7:0] o_data,
    output reg o_data_DV,

    inout  SD_DAT0,
    inout  SD_DAT3,
    inout  SD_CMD,
    output SD_CLK,
    input  SD_WP_N
);

  //Memory Wires
  wire w_wr = i_write && i_request && i_address < 512;
  wire [7:0] w_data_mem;
  //Memory Wires

  //SDCARD WIRES
  reg [31:0] r_sd_card_address = 32'h00;  //512, 513, 514, 515
  wire [31:0] w_sd_card_address = r_sd_card_address;

  reg [7:0] r_sd_card_control = 8'h00;  //516
  wire [7:0] w_sd_card_control = r_sd_card_control;

  wire [7:0] w_data_from_mem_to_sd;
  wire [7:0] w_data_from_sd_to_mem;
  wire [31:0] w_addr_from_sd_to_mem;

  wire [7:0] o_statusreg;
  wire o_write_statusreg;

  wire o_sd_wr_nrd;
  wire o_req;
  //SDCARD WIRES

  assign o_data = (i_address < 512)  ? w_data_mem :
                (i_address == 512) ? r_sd_card_address[7:0] :
                (i_address == 513) ? r_sd_card_address[15:8] :
                (i_address == 514) ? r_sd_card_address[23:16] :
                (i_address == 515) ? r_sd_card_address[31:24] :
                (i_address == 516) ? r_sd_card_control :
                8'b0;


  always @(posedge SD_CLK) begin
    if (o_write_statusreg) begin
      r_sd_card_control <= 0;
    end
  end

  always @(posedge i_clk) begin
    o_data_DV <= 1'b0;

    if (i_request) begin
      o_data_DV <= 1'b1;

      if (i_write) begin
        case (i_address)
          512: r_sd_card_address[7:0]   <= i_data;
          513: r_sd_card_address[15:8]  <= i_data;
          514: r_sd_card_address[23:16] <= i_data;
          515: r_sd_card_address[31:24] <= i_data;
          516: r_sd_card_control        <= i_data;
          default:;
        endcase
      end
    end
  end

  sd_card_controller m_sd_card (  //0-511
    .i_clk(i_clk),
    .i_addr(w_sd_card_address),
    .i_controlreg(w_sd_card_control),
    .i_data(w_data_from_mem_to_sd),
    .o_statusreg(o_statusreg),
    .o_write_statusreg(o_write_statusreg),
    .o_data(w_data_from_sd_to_mem),
    .o_addr(w_addr_from_sd_to_mem),
    .o_wr_nrd(o_sd_wr_nrd),
    .o_req(o_req),

    .io_SD_DAT0_DO(SD_DAT0),
    .io_SD_DAT3_nCS(SD_DAT3),
    .io_SD_CMD_DI(SD_CMD),
    .o_SD_CLK(SD_CLK),
    .i_SD_WP_N(SD_WP_N)
  );


  altsyncram altsyncram_component (
    .address_a     (w_addr_from_sd_to_mem[8:0]),  // Address input
    .clock0        (i_clk),                       // Input clock
    .data_a        (w_data_from_sd_to_mem),       // Data input
    .wren_a        (o_sd_wr_nrd),                 // Write enable
    .q_a           (w_data_from_mem_to_sd),       // Data output (connected to a wire)
    .clocken0      (1'b1),                        // Clock enable for port A (always enabled)
    .byteena_a     (1'b1),                        // Byte enable for port A (always enabled)
    .rden_a        (1'b1),                        // Read enable for port A (always enabled)

    .clock1        (i_clk),                       // Output clock
    .data_b        (i_data),                      // Unused data input for port B
    .address_b     (i_address[8:0]),              // Unused address input for port B
    .wren_b        (w_wr),                        // Unused write enable for port B
    .q_b           (w_data_mem),                  // Unused data output for port B
    .clocken1      (1'b1),                        // Unused clock enable for port B
    .byteena_b     (1'b1),                        // Unused byte enable for port B
    .rden_b        (1'b1),                        // Unused read enable for port B

    .clocken2      (1'b0),                        // Unused clock enable
    .clocken3      (1'b0),                        // Unused clock enable
    .aclr0         (1'b0),                        // Unused asynchronous clear for port A
    .aclr1         (1'b0),                        // Unused asynchronous clear for port B
    .addressstall_a(1'b0),                        // Unused address stall for port A
    .addressstall_b(1'b0),                        // Unused address stall for port B
    .eccstatus     ()                             // Unused ECC status
  );

  defparam altsyncram_component.clock_enable_input_a = "BYPASS";
  defparam altsyncram_component.clock_enable_output_a = "BYPASS";
  defparam altsyncram_component.power_up_uninitialized = "FALSE";
  defparam altsyncram_component.intended_device_family = "Cyclone III";
  defparam altsyncram_component.lpm_type = "altsyncram";
  defparam altsyncram_component.operation_mode = "DUAL_PORT";
  defparam altsyncram_component.outdata_aclr_a = "NONE";
  defparam altsyncram_component.outdata_reg_a = "CLOCK0";
  defparam altsyncram_component.outdata_reg_b = "CLOCK1";
  defparam altsyncram_component.power_up_uninitialized = "FALSE";
  defparam altsyncram_component.read_during_write_mode_port_a = "NEW_DATA_NO_NBE_READ";
  defparam altsyncram_component.widthad_a = 9;
  defparam altsyncram_component.width_a = 8;
  defparam altsyncram_component.widthad_b = 9;
  defparam altsyncram_component.width_b = 8;
  defparam altsyncram_component.width_byteena_a = 1;




  endmodule
