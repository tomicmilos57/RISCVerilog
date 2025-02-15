module alu(i_clk, i_instruction, i_IR, i_A, i_B, o_aluout, o_offset, o_jump_DV);

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Ports
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

input i_clk;
input [31:0] i_instruction;
input [31:0] i_IR;
input [31:0] i_A;
input [31:0] i_B;
output [31:0] o_aluout;
output reg [31:0] o_offset;
output o_jump_DV;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Combinational Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

reg signed [31:0] r_result;
assign o_aluout = r_result;

wire [11:0] w_immed = i_IR[31:20];
wire [31:0] w_se_immed = { {20{i_IR[31]}}, i_IR[31:20] };

wire w_jal_offset;
assign w_branch_offset = { {20{i_IR[31]}}, i_IR[31], i_IR[7], i_IR[30:25], i_IR[11:8], 1'b0 } << 1;

wire w_jal_offset;
assign w_jal_offset = { {12{instruction[31]}}, instruction[31], instruction[19:12],
  instruction[20], instruction[30:21], 1'b0 } << 1;

// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
//  Sequential Logic
// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

always @(posedge i_clk)begin
  o_jump_DV <= 0;
  case (i_instruction)
    32'd0:  r_result <= i_A + i_B;// ADD
    32'd1:  r_result <= i_A - i_B;// SUB
    32'd2:  r_result <= i_A << i_B[4:0];// SLL
    32'd3:  begin               // SLT
      if($signed(i_A) < $signed(i_B))begin
        r_result <= 32'd1;
      end
      else begin
        r_result <= 32'd0;
      end
    end
    32'd4:  begin               // SLTU
      if($usigned(i_A) < $usigned(i_B))begin
        r_result <= 32'd1;
      end
      else begin
        r_result <= 32'd0;
      end
    end// SLTU
    32'd5:  r_result <= i_A ^ i_B;// XOR
    32'd6:  r_result <= i_A >> i_B[4:0];// SRL
    32'd7:  r_result <= i_A >>> i_B[4:0];// SRA
    32'd8:  r_result <= i_A | i_B;// OR
    32'd9:  r_result <= i_A & i_B;// AND
    32'd10: r_result <= i_A * i_B;// MUL
    32'd11: r_result <= i_A * i_B;// MULH
    32'd12: r_result <= i_A * i_B;// MULHS
    32'd13: r_result <= i_A * i_B;// MULHU
    32'd14: r_result <= i_A / i_B;// DIV
    32'd15: r_result <= i_A / i_B;// DIVU
    32'd16: r_result <= i_A % i_B;// REM
    32'd17: r_result <= i_A % i_B;// REMU
    32'd18: r_result <= i_A + w_se_immed;// ADDI
    32'd19: begin               // SLTI
      if($signed(i_A) < $signed(w_se_immed))begin
        r_result <= 32'd1;
      end
      else begin
        r_result <= 32'd0;
      end
    end
    32'd20: begin               // SLTIU
      if($usigned(i_A) < $usigned(w_se_immed))begin
        r_result <= 32'd1;
      end
      else begin
        r_result <= 32'd0;
      end
    end
    32'd21: r_result <= i_A ^ w_se_immed;// XORI
    32'd22: r_result <= i_A | w_se_immed;// ORI
    32'd23: r_result <= i_A & w_se_immed;// ANDI
    32'd24: r_result <= i_A << w_immed[4:0];// SLLI
    32'd25: r_result <= i_A >> w_immed[4:0];// SRLI
    32'd26: r_result <= i_A >>> w_immed[4:0];// SRAI
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
        o_jump_DV <= 1;
        o_offset <= w_branch_offset;
      end
    end
    32'd36: begin
      if(i_A != i_B) begin// BNE
        o_jump_DV <= 1;
        o_offset <= w_branch_offset;
      end
    end
    32'd37: begin// BLT
      if($signed(i_A) < $signed(i_B))begin
        o_jump_DV <= 1;
        o_offset <= w_branch_offset;
      end
    end
    32'd38: begin
      if($signed(i_A) >= $signed(i_B)) begin
        o_jump_DV <= 1;
        o_offset <= w_branch_offset;
      end
    end// BGE
    32'd39: begin
      if($usigned(i_A) < $usigned(i_B)) begin
        o_jump_DV <= 1;
        o_offset <= w_branch_offset;
      end
    end// BLTU
    32'd40: begin
      if($usigned(i_A) >= $usigned(i_B)) begin
        o_jump_DV <= 1;
        o_offset <= w_branch_offset;
      end
    end// BGEU
    32'd41: begin
      o_jump_DV <= 1;
      o_offset <= w_jal_offset;
    end// JAL
    32'd42: begin
      o_jump_DV <= 1;
      o_offset <= w_jal_offset;
    end// JALR
    32'd43: decoded_output = 8'h2B;// LUI
    32'd44: decoded_output = 8'h2C;// AUIPC
    default: decoded_output = 8'hFF;
  endcase
end
endmodule

