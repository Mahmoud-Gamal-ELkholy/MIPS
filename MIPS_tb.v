module MIPS_tb();
reg clk , reset ;
wire [31:0] inst_out , RD ;

MIPS  TB (.clk(clk),
          .reset(reset),
          .inst_out(inst_out),
          .RD(RD));
          
localparam T = 10 ;
always begin
clk = 0 ; #(T/2) ;
clk = 1 ; #(T/2) ;
end

initial begin
    reset = 0 ;
#12 reset = 1 ;
#160 $stop ;  
end
endmodule
