module load_store (
  input wire        i_clk,
  input wire [31:0] i_instruction,
  input wire [31:0] i_regout1,
  input wire [31:0] i_regout2,
  input wire [31:0] i_PC,
  input wire [31:0] i_IR,
  input wire [31:0] i_state,
  input wire        i_input_bus_DV,
  input wire [31:0] i_input_bus_data,
  input wire        i_start_fetch,

  output reg [2:0]  o_bhw = 3'd0,
  output reg [31:0] o_bus_address = 32'd0,
  output reg [31:0] o_bus_data = 32'd0,
  output reg        o_bus_DV = 1'd0,
  output reg        o_write_notread = 1'd0,

  output reg [31:0] o_loaded_value = 32'd0,
  output reg        o_loaded_value_DV = 1'd0,

  output reg [31:0] o_IR_value = 32'd0,
  output reg        o_IR_DV = 1'd0,

  output            o_ld_st_finnished,
  output            o_amo_finnished
);

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Combinational Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

wire signed [31:0] w_se_load_offset = { {20{i_IR[31]}}, i_IR[31:20] };
wire signed [31:0] w_se_store_offset = { {20{i_IR[31]}}, i_IR[31:25], i_IR[11:7]};

reg r_local_state = 1'b0;
reg r_first_fetch = 1'b1;

localparam integer READY = 1'b0;
localparam integer WAITING = 1'b1;

integer integer_number_of_fetch = 32'd0; //ONLY FOR SIMULATION

assign o_ld_st_finnished = (i_instruction >= 32'd27 & i_instruction <= 32'd34) & i_state == 32'd1 &
  r_local_state == WAITING & i_input_bus_DV == 1'b1;

//AMOSWAP
localparam integer AMO_READY_LOAD = 32'd0;
localparam integer AMO_WAITING_LOAD = 32'd1;
localparam integer AMO_READY_WRITE = 32'd2;
localparam integer AMO_WAITING_WRITE = 32'd3;
localparam integer AMO_STANDBY = 32'd4;
localparam integer AMO_STANDBY2 = 32'd5;

reg [31:0] r_amo_local_state = 32'b0;
reg [31:0] r_amo_address = 32'b0;
reg [31:0] r_amo_value = 32'b0;
reg r_amo_finnished = 1'b0;
assign o_amo_finnished = r_amo_finnished;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Sequential Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

localparam OPCODE_LB     = 32'd27;
localparam OPCODE_LH     = 32'd28;
localparam OPCODE_LW     = 32'd29;
localparam OPCODE_LBU    = 32'd30;
localparam OPCODE_LHU    = 32'd31;
localparam OPCODE_SB     = 32'd32;
localparam OPCODE_SH     = 32'd33;
localparam OPCODE_SW     = 32'd34;
localparam OPCODE_AMOSWAP= 32'd60;

always @(posedge i_clk) begin
  // Default resets
  o_bus_DV           <= 1'b0;
  o_loaded_value_DV  <= 1'b0;
  o_IR_DV            <= 1'b0;
  r_amo_finnished    <= 1'b0;

  // === FETCH PHASE ===
  if (i_state == 32'b0) begin
    if (r_local_state == READY && (i_start_fetch || r_first_fetch)) begin
      r_first_fetch <= 1'b0;
      integer_number_of_fetch <= integer_number_of_fetch + 32'd1;
      start_bus_read(3'b100, i_PC);
      r_local_state <= WAITING;
    end
    else if (r_local_state == WAITING && i_input_bus_DV) begin
      o_IR_value <= i_input_bus_data;
      o_IR_DV <= 1'b1;
      r_local_state <= READY;
    end
  end

  // === EXECUTE PHASE ===
  else begin
    case (i_instruction)

      OPCODE_LB: begin
        if (r_local_state == READY) begin
          start_bus_read(3'b001, i_regout1 + w_se_load_offset);
          r_local_state <= WAITING;
        end
        else if (r_local_state == WAITING && i_input_bus_DV)begin
          o_loaded_value <= complete_bus_read(i_input_bus_data, 1'b1, 2'b00);
          o_loaded_value_DV <= 1'b1;
          r_local_state <= READY;
        end
      end

      OPCODE_LH: begin
        if (r_local_state == READY) begin
          start_bus_read(3'b010, i_regout1 + w_se_load_offset);
          r_local_state <= WAITING;
        end
        else if (r_local_state == WAITING && i_input_bus_DV)begin
          o_loaded_value <= complete_bus_read(i_input_bus_data, 1'b1, 2'b01);
          o_loaded_value_DV <= 1'b1;
          r_local_state <= READY;
        end
      end

      OPCODE_LW: begin
        if (r_local_state == READY) begin
          start_bus_read(3'b100, $signed(i_regout1) + $signed(w_se_load_offset));
          r_local_state <= WAITING;
        end
        else if (r_local_state == WAITING && i_input_bus_DV) begin
          o_loaded_value <= i_input_bus_data;
          o_loaded_value_DV <= 1'b1;
          r_local_state <= READY;
        end
      end

      OPCODE_LBU: begin
        if (r_local_state == READY) begin
          start_bus_read(3'b001, i_regout1 + w_se_load_offset);
          r_local_state <= WAITING;
        end
        else if (r_local_state == WAITING && i_input_bus_DV)begin
          o_loaded_value <= complete_bus_read(i_input_bus_data, 1'b0, 2'b00);
          o_loaded_value_DV <= 1'b1;
          r_local_state <= READY;
        end
      end

      OPCODE_LHU: begin
        if (r_local_state == READY)begin
          start_bus_read(3'b010, i_regout1 + w_se_load_offset);
          r_local_state <= WAITING;
        end
        else if (r_local_state == WAITING && i_input_bus_DV)begin
          o_loaded_value <= complete_bus_read(i_input_bus_data, 1'b0, 2'b01);
          o_loaded_value_DV <= 1'b1;
          r_local_state <= READY;
        end
      end

      OPCODE_SB: begin
        if (r_local_state == READY)begin
          start_bus_write(3'b001, i_regout1 + w_se_store_offset, {24'b0, i_regout2[7:0]});
          r_local_state <= WAITING;
        end
        else if (r_local_state == WAITING && i_input_bus_DV)
          r_local_state <= READY;
      end

      OPCODE_SH: begin
        if (r_local_state == READY)begin
          start_bus_write(3'b010, i_regout1 + w_se_store_offset, {16'b0, i_regout2[15:0]});
          r_local_state <= WAITING;
        end
        else if (r_local_state == WAITING && i_input_bus_DV)
          r_local_state <= READY;
      end

      OPCODE_SW: begin
        if (r_local_state == READY)begin
          start_bus_write(3'b100, i_regout1 + w_se_store_offset, i_regout2);
          r_local_state <= WAITING;
        end
        else if (r_local_state == WAITING && i_input_bus_DV)
          r_local_state <= READY;
      end

      OPCODE_AMOSWAP: begin
        // Load phase
        if (r_amo_local_state == AMO_READY_LOAD) begin
          r_amo_address <= i_regout1;
          r_amo_value <= i_regout2;
          start_bus_read(3'b100, i_regout1);
          r_amo_local_state <= AMO_WAITING_LOAD;
        end
        else if (r_amo_local_state == AMO_WAITING_LOAD && i_input_bus_DV) begin
          o_loaded_value <= i_input_bus_data;
          o_loaded_value_DV <= 1'b1;
          r_amo_local_state <= AMO_READY_WRITE;
        end

        // Store phase
        if (r_amo_local_state == AMO_READY_WRITE) begin
          start_bus_write(3'b100, r_amo_address, r_amo_value);
          r_amo_local_state <= AMO_WAITING_WRITE;
        end
        else if (r_amo_local_state == AMO_WAITING_WRITE && i_input_bus_DV) begin
          r_amo_local_state <= AMO_STANDBY;
          r_amo_finnished <= 1'b1;
        end

        if (r_amo_local_state == AMO_STANDBY)
          r_amo_local_state <= AMO_READY_LOAD;

      end

      default: ;
    endcase
  end
end

// Tasks
task start_bus_read(input [2:0] bhw, input [31:0] addr);
begin
  o_bhw <= bhw;
  o_bus_address <= addr;
  o_write_notread <= 1'b0;
  o_bus_DV <= 1'b1;
end
endtask

function [31:0] complete_bus_read;
  input [31:0] data;
  input sign_extend;
  input [1:0] size;
  begin
    case (size)
      2'b00: complete_bus_read = sign_extend ? { {24{data[7]}}, data[7:0] } : { 24'b0, data[7:0] };
      2'b01: complete_bus_read = sign_extend ? { {16{data[15]}}, data[15:0] } : { 16'b0, data[15:0] };
      default: complete_bus_read = data;
    endcase
  end
endfunction

task start_bus_write(input [2:0] bhw, input [31:0] addr, input [31:0] data);
begin
  o_bhw <= bhw;
  o_bus_address <= addr;
  o_bus_data <= data;
  o_write_notread <= 1'b1;
  o_bus_DV <= 1'b1;
end
endtask

endmodule

