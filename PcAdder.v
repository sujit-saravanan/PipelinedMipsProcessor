`timescale 1ns / 1ps

module PcAdder(input [31:0] pc, output reg [31:0] nextPc);
    always @ (pc) begin
            nextPc = pc + 32'b00000000000000000000000000000100;
    end
endmodule