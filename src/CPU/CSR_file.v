module CSR_file (
    input i_clk,
    input [31:0] i_data,
    input [31:0] i_IR,
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
    output [31:0] o_stimecmp,
    output [31:0] o_menvcfg,
    output [31:0] o_pmpcfg0,
    output [31:0] o_pmpaddr0,
    output [31:0] o_satp,
    output [31:0] o_scause,
    output [31:0] o_stval,
    output [31:0] o_mcounteren,
    output [31:0] o_time
);

  reg [31:0] r_mhartid;
  reg [31:0] r_mstatus;
  reg [31:0] r_mepc;
  reg [31:0] r_sstatus;
  reg [31:0] r_sip;
  reg [31:0] r_sie;
  reg [31:0] r_mie;
  reg [31:0] r_sepc;
  reg [31:0] r_medeleg;
  reg [31:0] r_mideleg;
  reg [31:0] r_stvec;
  reg [31:0] r_stimecmp;
  reg [31:0] r_menvcfg;
  reg [31:0] r_pmpcfg0;
  reg [31:0] r_pmpaddr0;
  reg [31:0] r_satp;
  reg [31:0] r_scause;
  reg [31:0] r_stval;
  reg [31:0] r_mcounteren;
  reg [31:0] r_time;

  always @(posedge i_clk) begin
    if (i_load) begin
      case (i_IR[31:20])
        12'hF14: r_mhartid <= i_data;
        12'h300: r_mstatus <= i_data;
        12'h341: r_mepc <= i_data;
        12'h100: r_sstatus <= i_data;
        12'h144: r_sip <  //0x30a CHECK= i_data;
        12'h104: r_sie <= i_data;
        12'h304: r_mie <= i_data;
        12'h141: r_sepc <= i_data;
        12'h302: r_medeleg <= i_data;
        12'h303: r_mideleg <= i_data;
        12'h105: r_stvec <= i_data;
        12'h14D: r_stimecmp <= i_data;
        12'h30A: r_menvcfg <= i_data;
        12'h3A0: r_pmpcfg0 <= i_data;
        12'h3B0: r_pmpaddr0 <= i_data;
        12'h180: r_satp <= i_data;
        12'h142: r_scause <= i_data;
        12'h143: r_stval <= i_data;
        12'h306: r_mcounteren <= i_data;
        12'hC01: r_time <= i_data;
        default: ;  // THROW EXCEPTION
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
  assign o_stimecmp   = r_stimecmp;
  assign o_menvcfg    = r_menvcfg;
  assign o_pmpcfg0    = r_pmpcfg0;
  assign o_pmpaddr0   = r_pmpaddr0;
  assign o_satp       = r_satp;
  assign o_scause     = r_scause;
  assign o_stval      = r_stval;
  assign o_mcounteren = r_mcounteren;
  assign o_time       = r_time;

endmodule
