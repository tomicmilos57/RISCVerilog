module memory_top(
  input          i_clk,
  input [31:0]   i_bus_data,
  input [31:0]   i_bus_address,
  input          i_bus_DV,
  input [2:0]    i_bhw,
  input          i_write_notread,
  output [31:0]  o_bus_data,
  output         o_bus_DV
);

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Global wires and regs
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

// input registres

reg [7:0]  r_mdr [3:0]; // Memory Data Register
reg [31:0]   r_mar; // Memory Address Register
reg [2:0]   r_bhw; // Byte-Half-Word
reg         r_write; // Write/Not_Read
reg         r_send = 1'b0;
reg [1:0]   r_counter;

wire [31:0]   w_mar; // Memory Address Register
wire         w_write; // Write/Not_Read

assign o_bus_data = {r_mdr[3], r_mdr[2], r_mdr[1], r_mdr[0]};
assign o_bus_DV = r_send;
assign w_mar = r_mar;
assign w_write = r_write;

// Bootloader wires and regs
wire w_bootloader_DV;
wire w_bootloader_receive;
wire [7:0] w_bootloader_data_byte;

wire [7:0] w_read_data; //This register holds data read from submodule that is currently selected
assign w_read_data = (w_bootloader_receive & w_bootloader_DV) ? w_bootloader_data_byte
                      : 8'h00;

wire w_global_receive;
assign w_global_receive = w_bootloader_receive; // All submodule receive signals OR-ed

// submodule interface wires and regs
wire[7:0]    w_data_to_submodule; // global data to submodule
assign w_data_to_submodule = (r_bhw == 3'b001) ? r_mdr[0]   :
                             (r_bhw == 3'b010) ? r_mdr[1]  :
                             (r_bhw == 3'b011) ? r_mdr[2] :
                             (r_bhw == 3'b100) ? r_mdr[3] :
                             8'h00;

reg    r_request;  // global request to submodule

reg status = 1'b0;
localparam integer WAITING = 1'b0;
localparam integer FETCHING = 1'b1;

reg sub_status = 1'b0;
localparam integer TOSEND = 1'b0;
localparam integer WAITINGFORRESPONSE = 1'b1;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Memory Map
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

memory_map memory_map(.i_address(w_mar), .o_bootloader_DV(w_bootloader_DV));

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Cache/Bootloader Fast Memory
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

cache8KB #(.DATA_WIDTH(8), .ADDR_WIDTH(10)) bootloader(.i_clk(i_clk),
  .i_data(w_data_to_submodule), .i_address(w_mar[9:0]),
  .i_write(w_write), .i_request(w_bootloader_DV & r_request), .o_data(w_bootloader_data_byte),
  .o_data_DV(w_bootloader_receive));
// block_ram #(.DATA_WIDTH(8), .ADDR_WIDTH(10)) BRAM(.clk(i_clk), .we(w_write),
//   .addr(w_mar[9:0]), .din(w_data_to_submodule), .dout(w_bootloader_data_byte));
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Sequential Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

always @(posedge i_clk) begin
  r_request <= 1'b0;
  r_send <= 1'b0;
  if(status == WAITING && i_bus_DV) begin
    r_mdr[0] <= i_bus_data[7:0];
    r_mdr[1] <= i_bus_data[15:8];
    r_mdr[2] <= i_bus_data[23:16];
    r_mdr[3] <= i_bus_data[31:24];
    r_mar <= i_bus_address;
    r_bhw <= i_bhw;
    r_write <= i_write_notread;
    status <= FETCHING;
    r_counter <= 2'b00;
  end
  else if(status == FETCHING && r_bhw != 3'b000) begin
    if(sub_status == TOSEND) begin
      r_request <= 1'b1;
      sub_status <= WAITINGFORRESPONSE;
    end
    else if(sub_status == WAITINGFORRESPONSE && w_global_receive) begin
      r_mar <= r_mar + 1;
      r_counter <= r_counter + 1;
      sub_status <= TOSEND;
      r_bhw = r_bhw - 1; // It is important that this is Blocking assignment
      r_mdr[r_counter] <= w_read_data;
      if(r_bhw == 3'b000) begin
        r_send <= 1'b1;
        status <= WAITING;
      end
    end
  end

end

endmodule

