`timescale 1ns / 1ps

module ProgramCounter(input [31:0] nextPC, input clock, output reg [31:0] pc);
    initial
            pc = 32'b00000000000000000000000001100100;
    always @ (posedge clock) begin
            pc = nextPC;
    end
endmodule