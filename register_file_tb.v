module register_file_tb();
localparam N = 32 ;
reg clk , reset_n , WE3 ;
reg [4:0] A1 , A2 , A3 ;
reg [N-1:0] WD3 ;
wire [N-1:0] RD1 , RD2 ;

register_file  #(.N(N))TB(.clk(clk),
                          .WE3(WE3),
                          .A1(A1),
                          .A2(A2),
                          .A3(A3),
                          .WD3(WD3),
                          .RD1(RD1),
                          .RD2(RD2));

localparam T = 10 ;
always begin 
  clk = 0 ; #(T/2) ;
  clk = 1 ; #(T/2) ;
end

initial begin
     reset_n = 0 ;  WE3 = 0 ;
#5   reset_n = 1 ;  WE3 = 1 ;
#6   WD3 = 32'b1010_1011_1101_0010_1010_1011_1101_0000 ; A3 = 5'b00000 ; #10
     WD3 = 32'b1010_1011_1111_0010_1010_1011_1101_0001 ; A3 = 5'b00001 ; #10
     WD3 = 32'b1010_1011_1111_0010_1010_1011_1101_0010 ; A3 = 5'b00010 ; #10
     WD3 = 32'b1010_1011_1111_0010_1010_1011_1101_0011 ; A3 = 5'b00011 ; #10
#10  WE3 = 0 ;   
#30  A1 = 5'b00000 ;   
     A2 = 5'b00001 ;
#12  A1 = 5'b00010 ;   
     A2 = 5'b00011 ;
     #30 reset_n = 0 ;
#100 $stop ;     
 end

endmodule
