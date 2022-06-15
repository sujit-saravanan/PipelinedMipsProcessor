`timescale 1ns / 1ps

module RegrtMultiplexer([4:0] rt, [4:0] rd, input regrt, output reg [4:0] destReg);
    always @ (*) begin
            destReg = rd;
        if(regrt == 1)
                destReg = rt;
    end
endmodule

