module Fetch(input wire[7:0] D,input wire enabled, reset, clk, output reg[3:0] instr, operand);

    always @ (posedge clk, posedge reset) begin
        
        if (reset) begin  
            instr <= 0;  
            operand <= 0;
        end
        else if (enabled) begin 
            instr <= D[7:4];
            operand <= D[3:0];
        end
    end
endmodule

module ModuloInstruccion(input wire [11:0] valueLoad, input load, reset, enableCounter, enableFetch, clk,
                         output wire [3:0] instr, operand, output wire [7:0] programByte);
    wire [11:0] valueCounter; //valor del contador
    
    Contador12bits programCounter(load ,enableCounter, clk, reset, valueLoad, valueCounter);  
    Memory rom(valueCounter, programByte); 
    Fetch   fetch(programByte, enableFetch, reset, clk, instr , operand); 

endmodule