module register_file
(
    input clk , WE3 , reset ,
    input [4:0] A1 , A2 , A3 ,
    input [31:0] WD3 , 
    output  [31:0] RD1 , RD2 
      );       
reg [31:0] reg_file [0:63] ;
integer i ;
always @ (posedge clk , negedge reset)
begin 
if(reset) begin
  if(WE3)
      reg_file[A3] <= WD3 ;  
      end 
else
for(i=0; i<31; i=i+1) 
   reg_file [i] <= 0; 
      end

assign RD1 = (A1!=0)? reg_file[A1] : 0 ; 
assign RD2 = (A2!=0)? reg_file[A2] : 0 ; 

endmodule

