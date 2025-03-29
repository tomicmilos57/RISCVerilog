module ps2_interface(
  input i_ps2_data,
  input i_ps2_clk,
  input [7:0] i_data,
  input [11:0] i_address,
  input i_clk,
  input i_request,
  input i_write,
  output [7:0] o_data,
  output o_data_DV
);

  wire [7:0] w_code;
  wire w_ncode;
  reg [7:0] r_control = 8'b0;
  reg r_break = 1'b0;
  reg r_o_data_DV = 1'b0;

  localparam Break = 8'hf0, W = 8'h1d, A = 8'h1c, S = 8'h1b, D = 8'h23,
    Space = 8'h29, Esc = 8'h76, Ctrl = 8'h14, Shift = 8'h12;

  assign o_data = r_control;
  assign o_data_DV = r_o_data_DV;

  ps2 keyboard(.i_ps2_clk(i_ps2_clk),.i_ps2_data(i_ps2_data),.i_clk(i_clk),.i_spa(1'b1),
    .o_cap(w_ncode),.o_dap(w_code));

  always @(posedge i_clk) begin
    r_o_data_DV <= 1'b0;
    if (i_request) begin
      r_o_data_DV <= 1'b1;
    end
    if (w_ncode) begin
      case(w_code)
        Break: begin
          r_break <= 1'b1;
        end
        W: begin
          if(r_break) begin
            r_control[2] <= 1'b0;
            r_break <= 1'b0;
          end
          else r_control[2] <= 1'b1;
        end
        A: begin
          if(r_break) begin
            r_control[3] <= 1'b0;
            r_break <= 1'b0;
          end
          else r_control[3] <= 1'b1;
        end
        S: begin
          if(r_break) begin
            r_control[4] <= 1'b0;
            r_break <= 1'b0;
          end
          else r_control[4] <= 1'b1;
        end
        D: begin
          if(r_break) begin
            r_control[5] <= 1'b0;
            r_break <= 1'b0;
          end
          else r_control[5] <= 1'b1;
        end
        Space: begin
          if(r_break) begin
            r_control[6] <= 1'b0;
            r_break <= 1'b0;
          end
          else r_control[6] <= 1'b1;
        end
        Esc: begin
          if(r_break) begin
            r_control[7] <= 1'b0;
            r_break <= 1'b0;
          end
          else r_control[7] <= 1'b1;
        end
        Ctrl: begin
          if(r_break) begin
            r_control[0] <= 1'b0;
            r_break <= 1'b0;
          end
          else r_control[0] <= 1'b1;
        end
        Shift: begin
          if(r_break) begin
            r_control[1] <= 1'b0;
            r_break <= 1'b0;
          end
          else r_control[1] <= 1'b1;
        end
        default:;
      endcase
    end
  end

endmodule

