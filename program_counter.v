module program_counter
     (input clk ,reset , 
      input [31 : 0] PC_in ,
      output reg [31 : 0]PC_out  );
     
   

always @ (posedge clk , negedge reset)
begin
    if (reset)
       PC_out <= PC_in ;
     else 
       PC_out <= 32'b0 ;       
end  
endmodule
