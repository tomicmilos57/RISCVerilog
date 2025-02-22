module load_store (
  input wire        i_clk,
  input wire [31:0] i_instruction,
  input wire [31:0] i_regout1,
  input wire [31:0] i_regout2,
  input wire [31:0] i_PC,
  input wire [31:0] i_IR,
  input wire        i_state,
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

  output            o_ld_st_finnished
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

assign o_ld_st_finnished = (i_instruction >= 32'd27 & i_instruction <= 32'd34) & i_state == 1'b1 &
  r_local_state == WAITING & i_input_bus_DV == 1'b1;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Sequential Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

always @(posedge i_clk) begin
  o_bus_DV <= 1'b0;
  o_loaded_value_DV <= 1'b0;
  o_IR_DV <= 1'b0;
  if(i_state == 1'b0)begin //FETCH PHASE

      if(r_local_state == READY & (i_start_fetch | r_first_fetch))begin
        r_first_fetch <= 1'b0;
        integer_number_of_fetch = integer_number_of_fetch + 32'd1;
        o_bhw <= 3'b100;
        o_bus_address <= i_PC;
        o_write_notread <= 1'b0;
        o_bus_DV <= 1'b1;
        r_local_state <= WAITING;
      end

      else if(r_local_state == WAITING)begin
        if(i_input_bus_DV == 1'b1) begin
          o_IR_value <= i_input_bus_data;
          o_IR_DV <= 1'b1;
          r_local_state <= READY;
        end
      end

        // $display("FETCH, ADDR = %h, numOfFetch = %d", i_PC, integer_number_of_fetch);
  end
  else                   //EXECUTE PHASE
  case (i_instruction)

    32'd27: begin

      if(r_local_state == READY)begin
        o_bhw <= 3'b001;
        o_bus_address <= i_regout1 + w_se_load_offset;
        o_write_notread <= 1'b0;
        o_bus_DV <= 1'b1;
        r_local_state <= WAITING;
      end

      else if(r_local_state == WAITING)begin
        if(i_input_bus_DV == 1'b1) begin
          o_loaded_value <= { {24{i_input_bus_data[7]}}, i_input_bus_data[7:0] };
          o_loaded_value_DV <= 1'b1;
          r_local_state <= READY;
        end
      end

    end// LB
    32'd28: begin

      if(r_local_state == READY)begin
        o_bhw <= 3'b010;
        o_bus_address <= i_regout1 + w_se_load_offset;
        o_write_notread <= 1'b0;
        o_bus_DV <= 1'b1;
        r_local_state <= WAITING;
      end

      else if(r_local_state == WAITING)begin
        if(i_input_bus_DV == 1'b1) begin
          o_loaded_value <= { {16{i_input_bus_data[15]}}, i_input_bus_data[15:0] };
          o_loaded_value_DV <= 1'b1;
          r_local_state <= READY;
        end
      end

    end// LH
    32'd29: begin

      if(r_local_state == READY)begin
        o_bhw <= 3'b100;
        o_bus_address <= $signed(i_regout1) + $signed(w_se_load_offset);
        o_write_notread <= 1'b0;
        o_bus_DV <= 1'b1;
        r_local_state <= WAITING;
      end

      else if(r_local_state == WAITING)begin
        if(i_input_bus_DV == 1'b1) begin
          o_loaded_value <= i_input_bus_data;
          o_loaded_value_DV <= 1'b1;
          r_local_state <= READY;
        end
      end

    end// LW
    32'd30: begin

      if(r_local_state == READY)begin
        o_bhw <= 3'b001;
        o_bus_address <= i_regout1 + w_se_load_offset;
        o_write_notread <= 1'b0;
        o_bus_DV <= 1'b1;
        r_local_state <= WAITING;
      end

      else if(r_local_state == WAITING)begin
        if(i_input_bus_DV == 1'b1) begin
          o_loaded_value <= { {24{1'b0}}, i_input_bus_data[7:0] };
          o_loaded_value_DV <= 1'b1;
          r_local_state <= READY;
        end
      end

    end// LBU
    32'd31: begin

      if(r_local_state == READY)begin
        o_bhw <= 3'b010;
        o_bus_address <= i_regout1 + w_se_load_offset;
        o_write_notread <= 1'b0;
        o_bus_DV <= 1'b1;
        r_local_state <= WAITING;
      end

      else if(r_local_state == WAITING)begin
        if(i_input_bus_DV == 1'b1) begin
          o_loaded_value <= { {16{1'b0}}, i_input_bus_data[15:0] };
          o_loaded_value_DV <= 1'b1;
          r_local_state <= READY;
        end
      end

    end// LHU

    32'd32: begin// SB

      if(r_local_state == READY)begin
        o_bhw <= 3'b001;
        o_bus_address <= i_regout1 + w_se_store_offset;
        o_bus_data <= { {24{1'b0}}, i_regout2[7:0] };
        o_write_notread <= 1'b1;
        o_bus_DV <= 1'b1;
        r_local_state <= WAITING;
      end

      else if(r_local_state == WAITING)begin
        if(i_input_bus_DV == 1'b1) begin
          r_local_state <= READY;
        end
      end

    end
    32'd33: begin// SH

      if(r_local_state == READY)begin
        o_bhw <= 3'b010;
        o_bus_address <= i_regout1 + w_se_store_offset;
        o_bus_data <= { {16{1'b0}}, i_regout2[15:0] };
        o_write_notread <= 1'b1;
        o_bus_DV <= 1'b1;
        r_local_state <= WAITING;
      end

      else if(r_local_state == WAITING)begin
        if(i_input_bus_DV == 1'b1) begin
          r_local_state <= READY;
        end
      end

    end
    32'd34: begin// SW

      if(r_local_state == READY)begin
        o_bhw <= 3'b100;
        o_bus_address <= i_regout1 + w_se_store_offset;
        o_bus_data <= i_regout2;
        o_write_notread <= 1'b1;
        o_bus_DV <= 1'b1;
        r_local_state <= WAITING;
      end

      else if(r_local_state == WAITING)begin
        if(i_input_bus_DV == 1'b1) begin
          r_local_state <= READY;
        end
      end

    end

    default: ;
  endcase
  // $display("LoadStr, ADDR = %h, DATA = %h, numOfFetch = %d", i_regout1 + w_se_load_offset,
    // i_regout2, integer_number_of_fetch);
end

endmodule

