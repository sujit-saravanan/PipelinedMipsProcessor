`timescale 1ns / 1ps

module testbench();
    reg clk_tb;
    
    wire [4:0] rs;
    wire [4:0] rt;
    wire [31:0] wbData;
    wire [31:0] qa;
    wire [31:0] qb;
    wire wwreg;
    wire wm2reg;
    wire [4:0] wdestReg;
    wire [31:0] wr;
    wire [31:0] wdo;

    initial begin
        clk_tb = 0;
    end
    Datapath datapath_tb(clk_tb, rs, rt, wbData, qa, qb, wwreg, wm2reg, wdestReg, wr, wdo);
    
    
    
    always begin
        #5
        clk_tb = ~clk_tb;
    end
    
endmodule