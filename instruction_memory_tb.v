module instruction_memory_tb();
reg [31:0] A ;
wire [31:0] RD ;

instruction_memory TB (.A(A),
                       .RD(RD));


integer i ;
initial begin
for (i=0; i<100; i=i+1)begin
   A = i ;
   #10;
   end
end

initial begin
#1000 $stop ;
end

endmodule

