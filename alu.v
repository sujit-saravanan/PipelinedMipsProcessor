`timescale 1ns / 1ps

module ALU(input [31:0] eqa, input [31:0] b, input [3:0] ealuc, output reg [31:0] r);
    always @(*) begin
        case (ealuc)
            0:  r<= eqa + b;
            1:  r<= eqa - b;
            2:  r<= eqa | b;
            3:  r<= eqa ^ b;
            4:  r<= eqa & b;
        endcase
    end
endmodule