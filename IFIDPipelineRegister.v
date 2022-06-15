`timescale 1ns / 1ps

module IFIDPipelineRegister(input [31:0] instOut, input clock, output reg [31:0] dinstOut, output reg [4:0] rs, output reg [4:0] rt);
    always @ (posedge clock) begin
        dinstOut = instOut;
        rs = dinstOut[25:21];
        rt = dinstOut[20:16];
    end
endmodule