module MUX_Gen 
#(parameter N = 32)
(
  input [N-1:0] x , y ,
  input ctrl ,
  output [N-1:0]z 
    );
    assign z = ctrl ? y : x ;
endmodule
