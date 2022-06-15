`timescale 1ns / 1ps

module ControlUnit(input [5:0] op, input [5:0] func, input[4:0] rs, input[4:0] rt, input [4:0] mdestReg, input [4:0] edestReg,
                   output reg wreg, output reg m2reg, output reg wmem, output reg [3:0] aluc, output reg aluimm, output reg regrt, output reg [1:0] fwdb, output reg [1:0] fwda);
    always @(*) begin
        case (op)
            6'b000000: begin
                case(func)
                    6'b100000: begin
                        wreg <= 1'b1;
                        m2reg <= 1'b0;
                        wmem <= 1'b0;
                        aluc <= 4'b0000;
                        aluimm <= 1'b0;
                        regrt = 1'b0;
                    end
                    
                    6'b100010: begin
                        wreg <= 1'b1;
                        m2reg <= 1'b0;
                        wmem <= 1'b0;
                        aluc <= 4'b0001;
                        aluimm <= 1'b0;
                        regrt = 1'b0;
                    end
                    
                    6'b100101: begin
                        wreg <= 1'b1;
                        m2reg <= 1'b0;
                        wmem <= 1'b0;
                        aluc <= 4'b0010;
                        aluimm <= 1'b0;
                        regrt = 1'b0;
                    end
                    
                    6'b100110: begin
                        wreg <= 1'b1;
                        m2reg <= 1'b0;
                        wmem <= 1'b0;
                        aluc <= 4'b0011;
                        aluimm <= 1'b0;
                        regrt = 1'b0;
                    end
                    
                    6'b100100: begin
                        wreg <= 1'b1;
                        m2reg <= 1'b0;
                        wmem <= 1'b0;
                        aluc <= 4'b0100;
                        aluimm <= 1'b0;
                        regrt = 1'b0;
                    end

                endcase
            end
            
            6'b100011: begin
                wreg <= 1'b1;
                m2reg <= 1'b1;
                wmem <= 1'b0;
                aluc <= 4'b0000;
                aluimm <= 1'b1;
                regrt = 1'b1;
            end
        endcase
        fwda = 2'b00;
        fwdb = 2'b00;
        if (rs == edestReg) begin
            fwda = 2'b01;
        end
        if (rt == edestReg) begin
            fwdb = 2'b01;
        end
        
        if (rs == mdestReg) begin
            fwda = 2'b10;
        end
        if (rt == mdestReg) begin
            fwdb = 2'b10;
        end
        
        
        
    end
endmodule