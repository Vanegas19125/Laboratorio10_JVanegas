module Triestate(input [3:0] in,input wire enable, output wire [3:0] y );
    assign y[0] = (enable ? in[0] : 1'bz );
    assign y[1] = (enable ? in[1] : 1'bz );
    assign y[2] = (enable ? in[2] : 1'bz );
    assign y[3] = (enable ? in[3] : 1'bz );
endmodule