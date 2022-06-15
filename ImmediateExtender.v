`timescale 1ns / 1ps

module ImmediateExtender(input [15:0] imm, output reg [31:0] imm32);
    always @ (*) begin
        imm32 [31:0] = {{16{imm[15]}}, imm[15:0]};
    end
endmodule