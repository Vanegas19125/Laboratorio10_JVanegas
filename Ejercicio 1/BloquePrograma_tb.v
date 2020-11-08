 module testbench();
    reg [11:0] valueLoad;
    reg load, reset, enableCounter, enableFetch, clk;
    wire [3:0] instr, operand;
    wire [7:0] programByte;    
    ModuloInstruccion mod(valueLoad, load, reset, enableCounter, enableFetch, clk,
                         instr, operand, programByte);
    always #1 clk = ~clk;

    initial clk = 0;
    initial begin
        reset = 0; enableCounter=0; enableFetch = 0; load = 0; valueLoad = 0;
        #1 reset = 1;
        #1 reset = 0;
        #8 enableCounter = 1;
        #2 enableFetch = 1;
        #8 enableFetch = 0; 
        #2 valueLoad = 12'h067;
        #2 load = 1;
        #8 load = 0;
        #2 enableCounter = 0;
        #16 $finish;
    end
    initial begin
        $dumpfile("bloquePrograma_tb.vcd");
        $dumpvars(0,testbench);
    end

 endmodule