module alu(i_clk, i_instruction, i_IR, i_A, i_B, i_PC, o_load_regfile,
  o_aluout, o_jump_address, o_jump_DV);

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Ports
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

input i_clk;
input [31:0] i_instruction;
input [31:0] i_IR;
input [31:0] i_A;
input [31:0] i_B;
input [31:0] i_PC;
output [31:0] o_aluout;
output [31:0] o_jump_address;
output o_load_regfile;
output reg o_jump_DV;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Combinational Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

reg signed [31:0] r_result = 32'd0;
assign o_aluout = r_result;

wire signed [11:0] w_immed = i_IR[31:20];
wire signed [31:0] w_se_immed = { {20{i_IR[31]}}, i_IR[31:20] };
wire signed [31:0] w_se_immedLUI = { i_IR[31:12], {12{1'd0}}};

wire [31:0] w_branch_offset;
assign w_branch_offset = { {20{i_IR[31]}}, i_IR[31], i_IR[7], i_IR[30:25], i_IR[11:8], 1'b0 };

wire [31:0] w_jal_offset;
assign w_jal_offset = { {12{i_IR[31]}}, i_IR[31], i_IR[19:12], i_IR[20], i_IR[30:21], 1'b0 };

reg signed [31:0] r_address = 32'd0;
assign o_jump_address = r_address;

reg r_load_regfile = 1'd0;
assign o_load_regfile = r_load_regfile;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Sequential Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

always @(posedge i_clk)begin
  o_jump_DV <= 1'd0;
  r_load_regfile <= 1'd0;
  case (i_instruction)
    32'd0: begin r_result <= i_A + i_B; r_load_regfile <= 1'd1; end// ADD
    32'd1: begin r_result <= i_A - i_B; r_load_regfile <= 1'd1; end// SUB
    32'd2: begin r_result <= i_A << i_B[4:0]; r_load_regfile <= 1'd1; end// SLL
    32'd3: begin               // SLT
      if($signed(i_A) < $signed(i_B))begin
        r_result <= 32'd1;
      end
      else begin
        r_result <= 32'd0;
      end
        r_load_regfile <= 1'd1;
    end
    32'd4:  begin               // SLTU
      if($unsigned(i_A) < $unsigned(i_B))begin
        r_result <= 32'd1;
      end
      else begin
        r_result <= 32'd0;
     end
        r_load_regfile <= 1'd1;
    end// SLTU
    32'd5: begin r_result <= i_A ^ i_B; r_load_regfile <= 1'd1; end// XOR
    32'd6: begin r_result <= i_A >> i_B[4:0]; r_load_regfile <= 1'd1; end// SRL
    32'd7: begin r_result <= i_A >>> i_B[4:0]; r_load_regfile <= 1'd1; end// SRA
    32'd8: begin r_result <= i_A | i_B; r_load_regfile <= 1'd1; end// OR
    32'd9: begin r_result <= i_A & i_B; r_load_regfile <= 1'd1; end// AND
    32'd10:begin r_result <= i_A * i_B; r_load_regfile <= 1'd1; end// MUL
    32'd11:begin r_result <= i_A * i_B; r_load_regfile <= 1'd1; end// MULH
    32'd12:begin r_result <= i_A * i_B; r_load_regfile <= 1'd1; end// MULHS
    32'd13:begin r_result <= i_A * i_B; r_load_regfile <= 1'd1; end// MULHU
    32'd14:begin r_result <= i_A / i_B; r_load_regfile <= 1'd1; end// DIV
    32'd15:begin r_result <= i_A / i_B; r_load_regfile <= 1'd1; end// DIVU
    32'd16:begin r_result <= i_A % i_B; r_load_regfile <= 1'd1; end// REM
    32'd17:begin r_result <= i_A % i_B; r_load_regfile <= 1'd1; end// REMU
    32'd18:begin r_result <= i_A + w_se_immed;end// ADDI
    32'd19: begin               // SLTI
      if($signed(i_A) < $signed(w_se_immed))begin
        r_result <= 32'd1;
      end
      else begin
        r_result <= 32'd0;
      end
        r_load_regfile <= 1'd1;
    end
    32'd20: begin               // SLTIU
      if($unsigned(i_A) < $unsigned(w_se_immed))begin
        r_result <= 32'd1;
      end
      else begin
        r_result <= 32'd0;
      end
        r_load_regfile <= 1'd1;
    end
    32'd21: begin r_result <= i_A ^ w_se_immed; end// XORI
    32'd22: begin r_result <= i_A | w_se_immed; end// ORI
    32'd23: begin r_result <= i_A & w_se_immed; end// ANDI
    32'd24: begin r_result <= i_A << w_immed[4:0]; end// SLLI
    32'd25: begin r_result <= i_A >> w_immed[4:0]; end// SRLI
    32'd26: begin r_result <= i_A >>> w_immed[4:0]; end// SRAI
    32'd27: ;// LB
    32'd28: ;// LH
    32'd29: ;// LW
    32'd30: ;// LBU
    32'd31: ;// LHU
    32'd32: ;// SB
    32'd33: ;// SH
    32'd34: ;// SW
    32'd35: begin
      if(i_A == i_B) begin// BEQ
        o_jump_DV <= 1'd1;
        r_address <= w_branch_offset + i_PC;
      end
    end
    32'd36: begin
      if(i_A != i_B) begin// BNE
        o_jump_DV <= 1'd1;
        r_address <= w_branch_offset + i_PC;
      end
    end
    32'd37: begin// BLT
      if($signed(i_A) < $signed(i_B))begin
        o_jump_DV <= 1'd1;
        r_address <= w_branch_offset + i_PC;
      end
    end
    32'd38: begin
      if($signed(i_A) >= $signed(i_B)) begin
        o_jump_DV <= 1'd1;
        r_address <= w_branch_offset + i_PC;
      end
    end// BGE
    32'd39: begin
      if($unsigned(i_A) < $unsigned(i_B)) begin
        o_jump_DV <= 1'd1;
        r_address <= w_branch_offset + i_PC;
      end
    end// BLTU
    32'd40: begin
      if($unsigned(i_A) >= $unsigned(i_B)) begin
        o_jump_DV <= 1'd1;
        r_address <= w_branch_offset + i_PC;
      end
    end// BGEU
    32'd41: begin
      o_jump_DV <= 1'd1;
      r_address <= w_jal_offset + i_PC;
      r_result <= i_PC + 4;
      r_load_regfile <= 1'd1;
    end// JAL
    32'd42: begin
      o_jump_DV <= 1'd1;
      r_address <= w_jal_offset + i_PC;
      r_result <= i_PC + 32'd4;
      r_load_regfile <= 1'd1;
    end// JALR
    32'd43: begin r_result <= w_se_immedLUI; r_load_regfile <= 1'd1; end// LUI
    32'd44: begin r_result <= i_PC + w_se_immedLUI; r_load_regfile <= 1'd1; end// AUIPC
    default: ;
  endcase
end
endmodule

