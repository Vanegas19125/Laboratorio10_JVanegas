 module testbench();
    reg[3:0] dataIn;
    reg[2:0] control;
    reg  enableOutALU, loadAcu, reset, clk;
    wire[3:0] dataOut;
    wire C,Z;
    Procesamiento process(dataIn, control, enableOutALU, loadAcu, reset, clk, dataOut,C,Z);

    always #1 clk = ~clk;

    initial clk = 0;
    
    initial begin
        reset=0; loadAcu=0; enableOutALU=0; control=0; dataIn = 0;
        #1 reset=1;
        #1 reset=0;
        #2 dataIn=15;
        #2 enableOutALU=1;
        #2 control = 3;
        #1 loadAcu = 1;
        #1 loadAcu = 0; 
        #4  dataIn=6;
        #2  control = 1; 
        #1  loadAcu = 1;
        #1  loadAcu = 0;
        #2  control = 2; 
        #1  loadAcu  = 1;
        #1  loadAcu = 0; 
        #2  enableOutALU = 0; 
        #2  enableOutALU = 1; 
        #2  dataIn = 10;
        #1  loadAcu = 1; 
        #1  loadAcu = 0; 
        #2  control = 4; 
        #2  dataIn = 8;
        #4 $finish;
    end
    initial begin
        $dumpfile("datos_tb.vcd");
        $dumpvars(0,testbench);
    end
 endmodule