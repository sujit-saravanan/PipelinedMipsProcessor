`timescale 1ns / 1ps

module Datapath(input clock, output wire [4:0] rs, output wire [4:0] rt, output wire [31:0] wbData, output wire [31:0] qa, output wire [31:0] qb, output wire wwreg, output wire wm2reg, output wire [4:0] wdestReg, output wire [31:0] wr, output wire [31:0] wdo);    
    
    wire [31:0] nextPC;
    
    wire [31:0] instOut;
    
    wire wreg;
    wire m2reg;
    wire wmem;
    wire [3:0] aluc;
    wire aluimm;
    wire regrt;
    
    wire [4:0] destReg;

    
    wire [31:0] imm32;
    
    wire [31:0] b;
    wire [31:0] mdo;    
    
    wire not_clk;
    wire [31:0] r;
    
    wire [31:0] pc;
    wire [31:0] dinstOut;
    wire ewreg;
    wire em2reg;
    wire ewmem;
    wire [3:0] ealuc;
    wire ealuimm;
    wire [4:0] edestReg;
    wire [31:0] eqa;
    wire [31:0] eqb;
    wire [31:0] eimm32;
    wire mwreg;
    wire mm2reg;
    wire [4:0] mdestReg;
    wire [31:0] mr;
    wire [31:0] mqb;

    wire [1:0] fwda;
    wire [1:0]  fwdb;
    wire [31:0] fwa;
    wire [31:0] fwb;
    
    ProgramCounter           program_Counter            (nextPC, clock, pc);
    
    InstructionMemory        instruction_memory         (pc, instOut);
    PcAdder                  pc_adder                   (pc, nextPC);
    
    IFIDPipelineRegister     ifid_pipeline_register     (instOut, clock, dinstOut, rs, rt);
    
    ControlUnit              control_unit               (dinstOut[31:26], dinstOut[5:0], dinstOut[25:21], dinstOut[20:16], mdestReg, edestReg, wreg, m2reg, wmem, aluc, aluimm, regrt, fwdb, fwda);
    RegrtMultiplexer         regrt_multiplexer          (dinstOut[20:16], dinstOut[15:11], regrt, destReg);
    fwrega                   fwrega                     (qa, r, mr, mdo, fwda, fwa);
    fwregb                   fwregb                     (qb, r, mr, mdo, fwdb, fwb);
    ImmediateExtender        immediate_extender         (dinstOut[15:0], imm32);
    
    IDEXEPipelineRegister    idexe_pipeline_register    (wreg, m2reg, wmem, aluc, aluimm, destReg, fwa, fwb, imm32, clock, ewreg, em2reg, ewmem, ealuc, ealuimm, edestReg, eqa, eqb, eimm32);
        
    ALUMux                   alu_mux                    (eqb, eimm32, ealuimm, b);
    ALU                      alu                        (eqa, b, ealuc, r);
    
    EXEMEMPipelineRegister   exemem_pipeline_register   (ewreg, em2reg, ewmem, edestReg, r, eqb, clock, mwreg, mm2reg, mwmem, mdestReg, mr, mqb);
    
    DataMemory               data_memory                (mr, mqb, mwmem, clock, mdo);
    
    MEMWBPipelineRegister    memwb_pipeline_register    (mwreg, mm2reg, mdestReg, mr, mdo, clock, wwreg, wm2reg, wdestReg, wr, wdo);
    
    WbMux                    wb_mux                     (wr, wdo, wm2reg, wbData);
    RegisterFile             register_file              (dinstOut[25:21], dinstOut[20:16], wdestReg, wbData, wwreg, clock, qa, qb);
    
    
endmodule