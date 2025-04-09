module CSR_file (
    input i_clk,
    input [31:0] i_data,
    input [11:0] i_select,
    input i_load,

    output [31:0] o_mhartid,
    output [31:0] o_mstatus,
    output [31:0] o_mepc,
    output [31:0] o_sstatus,
    output [31:0] o_sip,
    output [31:0] o_sie,
    output [31:0] o_mie,
    output [31:0] o_sepc,
    output [31:0] o_medeleg,
    output [31:0] o_mideleg,
    output [31:0] o_stvec,
    output [31:0] o_mtvec,
    output [31:0] o_satp,
    output [31:0] o_scause,
    output [31:0] o_stval,
    output [31:0] o_mcounteren,
    output [31:0] o_time,
    output [31:0] o_sscratch,
    output [31:0] o_mscratch
);

  reg [31:0] r_mhartid = 32'h00000000;
  reg [31:0] r_mstatus = 32'h00000000;
  reg [31:0] r_mepc = 32'h00000000;
  reg [31:0] r_sstatus = 32'h00000000;
  reg [31:0] r_sip = 32'h00000000;
  reg [31:0] r_sie = 32'h00000000;
  reg [31:0] r_mie = 32'h00000000;
  reg [31:0] r_sepc = 32'h00000000;
  reg [31:0] r_medeleg = 32'h00000000;
  reg [31:0] r_mideleg = 32'h00000000;
  reg [31:0] r_stvec = 32'h00000000;
  reg [31:0] r_mtvec = 32'h00000000;
  reg [31:0] r_satp = 32'h00000000;
  reg [31:0] r_scause = 32'h00000000;
  reg [31:0] r_stval = 32'h00000000;
  reg [31:0] r_mcounteren = 32'h00000000;
  reg [31:0] r_time = 32'h00000000;
  reg [31:0] r_sscratch = 32'h00000000;
  reg [31:0] r_mscratch = 32'h00000000;

  always @(posedge i_clk) begin
    if (i_load) begin
      case (i_IR)
        12'hF14: r_mhartid <= i_data;
        12'h300: r_mstatus <= i_data;
        12'h341: r_mepc <= i_data;
        12'h100: r_sstatus <= i_data;
        12'h144: r_sip <= i_data;
        12'h104: r_sie <= i_data;
        12'h304: r_mie <= i_data;
        12'h141: r_sepc <= i_data;
        12'h302: r_medeleg <= i_data;
        12'h303: r_mideleg <= i_data;
        12'h105: r_stvec <= i_data;
        12'h305: r_mtvec <= i_data;
        12'h180: r_satp <= i_data;
        12'h142: r_scause <= i_data;
        12'h143: r_stval <= i_data;
        12'h306: r_mcounteren <= i_data;
        12'hC01: r_time <= i_data;
        12'h140: r_sscratch <= i_data;
        12'h340: r_mscratch <= i_data;
        default: ;
      endcase
    end
  end

  assign o_mhartid    = r_mhartid;
  assign o_mstatus    = r_mstatus;
  assign o_mepc       = r_mepc;
  assign o_sstatus    = r_sstatus;
  assign o_sip        = r_sip;
  assign o_sie        = r_sie;
  assign o_mie        = r_mie;
  assign o_sepc       = r_sepc;
  assign o_medeleg    = r_medeleg;
  assign o_mideleg    = r_mideleg;
  assign o_stvec      = r_stvec;
  assign o_mtvec      = r_mtvec;
  assign o_satp       = r_satp;
  assign o_scause     = r_scause;
  assign o_stval      = r_stval;
  assign o_mcounteren = r_mcounteren;
  assign o_time       = r_time;
  assign o_sscratch   = r_sscratch;
  assign o_mscratch   = r_mscratch;

endmodule
