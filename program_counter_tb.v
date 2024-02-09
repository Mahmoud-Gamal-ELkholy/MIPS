module program_counter_tb();
reg clk ;
reg [31:0] PC_in ;
wire [31:0] PC_out ;

program_counter tb (.clk (clk), 
                    .PC_in(PC_in),
                    .PC_out(PC_out) );

localparam T = 10 ;
always begin
clk = 0 ; #(T/2) ;
clk = 1 ; #(T/2) ;
end

initial begin
    
    PC_in = 32'b1010_0010_1100_1010_0101_1110_0010_1011 ;

#32 PC_in = 32'b1010_1010_1100_1110_0101_1110_0010_1111 ;
#50 $stop ;

end
endmodule