`timescale 1ns / 1ps

module fwrega(input [31:0] qa, input [31:0] r, input [31:0] mr, input [31:0] mdo, input [1:0] fwda, output reg [31:0] fwa);
    always @(*) begin
        case (fwda)
            2'b00: begin
                fwa = qa;
            end
            2'b01: begin
                fwa = r;
            end
            2'b10: begin
                fwa = mr;
            end
            2'b11: begin
                fwa = mdo;
            end
        endcase
    end
endmodule