`timescale 1ns / 1ps

module imm_Gen (
    input logic [31:0] inst_code,  // C�digo da instru��o
    output logic [31:0] Imm_out    // Imediato gerado
);

  always_comb begin
    case (inst_code[6:0])
      7'b1100011:  // B-type
        Imm_out = {
          inst_code[31] ? 19'h7FFFF : 19'b0,
          inst_code[31],
          inst_code[7],
          inst_code[30:25],
          inst_code[11:8],
          1'b0
        };
      7'b1101111:  // JAL
        Imm_out = {
          inst_code[31] ? 12'hFFF : 12'b0,
          inst_code[19:12],
          inst_code[20],
          inst_code[30:21],
          1'b0
        };
      7'b1100111:  // JALR
        Imm_out = {inst_code[31] ? 20'hFFFFF : 20'b0, inst_code[31:20]};
      default: Imm_out = 32'b0;
    endcase
  end

endmodule

