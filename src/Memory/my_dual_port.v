// A parameterized, inferable, true dual-port, dual-clock block RAM in Verilog.

module my_dual_port #(
    parameter DATA = 72,
    parameter ADDR = 10,
    parameter init_file = ""
) (
    // Port A
    input  wire            a_clk,
    input  wire            a_wr,
    input  wire [ADDR-1:0] a_addr,
    input  wire [DATA-1:0] a_din,
    output reg  [DATA-1:0] a_dout,

    // Port B
    input  wire            b_clk,
    input  wire            b_wr,
    input  wire [ADDR-1:0] b_addr,
    input  wire [DATA-1:0] b_din,
    output reg  [DATA-1:0] b_dout
);

  // Shared memory
  reg [DATA-1:0] mem[(2**ADDR)-1:0];
    integer i;
    initial begin
        if (init_file != "") begin
            $readmemh(init_file, mem);  // Load from .mif (hex format)
        end
        else begin
            for (i = 0; i < (2**ADDR); i = i + 1) begin
                mem[i] = {DATA{1'b0}};  // Fill with zeros
            end
        end
    end
  // Port A
  always @(posedge a_clk) begin
    a_dout <= mem[a_addr];
    if (a_wr) begin
      a_dout      <= a_din;
      mem[a_addr] <= a_din;
    end
  end

  // Port B
  always @(posedge b_clk) begin
    b_dout <= mem[b_addr];
    if (b_wr) begin
      b_dout      <= b_din;
      mem[b_addr] <= b_din;
    end
  end

endmodule
