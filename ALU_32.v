module ALU_32(
  input [31:0] SrcA , SrcB ,
  input [2:0] ALU_ctrl ,
  output zero ,
  output reg [31:0]ALUResult
     );
always @(*)
  begin
    case(ALU_ctrl)
        3'b000 : ALUResult = SrcA & SrcB ;
        3'b001 : ALUResult = SrcA | SrcB ;
        3'b010 : ALUResult = SrcA + SrcB ;
        //3'b011 : ALUResult = SrcA & SrcB ;
        3'b100 : ALUResult = SrcA & ~SrcB ;
        3'b101 : ALUResult = SrcA | ~SrcB ;
        3'b110 : ALUResult = SrcA - SrcB ;
        3'b111 : ALUResult = (SrcA < SrcB)? 1 : 0  ; // SLT
    endcase
end  
assign zero = ((SrcA - SrcB)==0)? 1:0 ;   
endmodule
