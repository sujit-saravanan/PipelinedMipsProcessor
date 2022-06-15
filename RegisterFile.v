`timescale 1ns / 1ps

module RegisterFile(input[4:0] rs, input[4:0] rt, input[4:0] wdestReg, input[31:0] wbData, input wwreg, input clk, output reg [31:0] qa, output reg [31:0] qb);
    reg [31:0] registers [0:31];
    initial begin
        registers[0]  = 'h00000000;
        registers[1]  = 'hA00000AA;
        registers[2]  = 'h10000011;
        registers[3]  = 'h20000022;
        registers[4]  = 'h30000033;
        registers[5]  = 'h40000044;
        registers[6]  = 'h50000055;
        registers[7]  = 'h60000066;
        registers[8]  = 'h70000077;
        registers[9]  = 'h80000088;
        registers[10] = 'h90000099;
        registers[11] = 32'b0;
        registers[12] = 32'b0;
        registers[13] = 32'b0;
        registers[14] = 32'b0;
        registers[15] = 32'b0;
        registers[16] = 32'b0;
        registers[17] = 32'b0;
        registers[18] = 32'b0;
        registers[19] = 32'b0;
        registers[20] = 32'b0;
        registers[21] = 32'b0;
        registers[22] = 32'b0;
        registers[23] = 32'b0;
        registers[24] = 32'b0;
        registers[25] = 32'b0;
        registers[26] = 32'b0;
        registers[27] = 32'b0;
        registers[28] = 32'b0;
        registers[29] = 32'b0;
        registers[30] = 32'b0;
        registers[31] = 32'b0;
    end
    always @ (*) begin
        qa = registers[rs];
        qb = registers[rt];
    end
    
    always @ (negedge clk) begin
        if (wwreg == 1) begin
            registers[wdestReg] = wbData;
        end
    end
endmodule