`timescale 1ns / 1ps
module fwregb(input [31:0] qb, input [31:0] r, input [31:0] mr, input [31:0] mdo, input [1:0] fwdb, output reg [31:0] fwb);
    always @(*) begin
        case (fwdb)
            2'b00: begin
                fwb = qb;
            end
            2'b01: begin
                fwb = r;
            end
            2'b10: begin
                fwb = mr;
            end
            2'b11: begin
                fwb = mdo;
            end
        endcase
    end
endmodule