module Contador12bits(input wire  load,enable,clock,reset, input wire [11:0]valueLoad, output reg [11:0] out );


    always @ (posedge clock, posedge reset, posedge load) begin
        if (load) out <= valueLoad;
        else begin
            if (reset) out <= 0;
            else if(enable) out <= out + 1;
    
        end

    end

endmodule