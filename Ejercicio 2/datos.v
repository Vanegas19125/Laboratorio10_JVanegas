module Acumulator(input wire [3:0] D,input wire load, reset, clk, output reg[3:0] Q );

    always @(posedge clk, posedge reset) begin
        if (reset) Q = 0; 
        else if(load) begin 
            Q <= D;
        end
    end
endmodule

module ALU(input wire[3:0] A,B,input [2:0] control , output wire [3:0] out, output wire C, Z );
    reg[4:0] resultado; 
    assign Z = ~(resultado[0] | resultado[1] | resultado[2] | resultado[3]); 
    assign out = resultado[4:0]; 
    assign C = resultado[4] ;
    always @ (A,B,control) begin  
        case(control)
            3'b000: resultado <= A; 
            3'b001: resultado <= A -B;   
            3'b010: resultado <= B; 
            3'b011: resultado <= A + B;
            3'b100: resultado <= ~(A|B); 
            default: resultado <= 0; 
        endcase
    end
endmodule

module Procesamiento(input wire[3:0] dataIn,input wire[2:0] control,
                      input wire  enableOutALU, loadAcu, reset, clk, output wire[3:0] dataOut, output wire C,Z);

    wire [3:0] data; 
    wire [3:0] acuOut; 
    
    Triestate busDriverOut(data,enableOutALU,dataOut);
    Acumulator acu(data,loadAcu,reset,clk,acuOut);
    ALU aritmetica(acuOut,dataIn,control,data,C,Z);
endmodule