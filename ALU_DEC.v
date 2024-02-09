module ALU_DEC(
    input [1:0] ALUop ,
    input [5:0] Funct ,
    output reg [2:0]ALU_ctrl
      );

always @*
  begin
    case (ALUop)
     2'b00 : ALU_ctrl = 3'b010 ;
     2'b01 : ALU_ctrl = 3'b110 ;
     default : case (Funct)
                 6'b100000 : ALU_ctrl = 3'b010 ;   //add
                 6'b100010 : ALU_ctrl = 3'b110 ;   //sub
                 6'b100100 : ALU_ctrl = 3'b000 ;   //and
                 6'b100101 : ALU_ctrl = 3'b001 ;   //or
                 6'b101010 : ALU_ctrl = 3'b111 ;   //slt
                 default   : ALU_ctrl = 3'bxxx ; 
               endcase          
    endcase
end
endmodule
