module sub_operation #(
    parameter DATA_WIDTH = 32,
    parameter OPCODE_LENGTH = 4
    ) (
    input logic [DATA_WIDTH-1:0]    SrcA,       // Registrador Rs1
    input logic [DATA_WIDTH-1:0]    SrcB,       // Registrador Rs2
    output logic [DATA_WIDTH-1:0]   Rd          // Registrador de destino
    );

    // Sinal de controle da ALU para a opera��o de Subtra��o
    logic [OPCODE_LENGTH-1:0] ALUControl;
    logic [DATA_WIDTH-1:0] ALUResult;  // Resultado da ALU

    // Configurando a ALU para realizar a opera��o SUB
    assign ALUControl = 4'b0110; // C�digo de controle para SUB (Subtra��o)

    // Instanciando a ALU
    alu #(
        .DATA_WIDTH(DATA_WIDTH),
        .OPCODE_LENGTH(OPCODE_LENGTH)
    ) alu_inst (
        .SrcA(SrcA),
        .SrcB(SrcB),
        .Operation(ALUControl),
        .ALUResult(ALUResult)
    );

    // O resultado da opera��o SUB � armazenado no registrador de destino
    assign Rd = ALUResult;

endmodule

