module data_memory(
    input [31:0] A , WD,
    input WE ,  clk ,
    output [31:0]RD
       );
       reg [31:0] dmem [0 : 2**32 - 1];

always @ (posedge clk)
begin
 if (WE)
  dmem[A]<= WD ;
 end
 

assign RD = ~WE ? dmem[A] : 32'b0 ;
endmodule
