`timescale 1ns / 1ps

module IDEXEPipelineRegister(input wreg, input m2reg, input wmem, input [3:0] aluc, input aluimm, input [4:0] destReg, input [31:0] qa, input [31:0] qb, input [31:0] imm32, input clock, output reg ewreg, output reg em2reg, output reg ewmem, output reg [3:0] ealuc, output reg ealuimm, output reg [4:0] edestReg, output reg [31:0] eqa, output reg [31:0] eqb, output reg [31:0] eimm32);
    always @ (posedge clock) begin
        ewreg = wreg;
        em2reg = m2reg;
        ewmem = wmem;
        ealuc[3:0] = aluc[3:0];
        ealuimm = aluimm;
        edestReg[4:0] = destReg[4:0];
        eqa[31:0] = qa[31:0];
        eqb[31:0] = qb[31:0];
        eimm32[31:0] = imm32[31:0];
    end
endmodule