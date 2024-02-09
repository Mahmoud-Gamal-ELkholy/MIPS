module Main_decoder(
  input [5:0] opcode ,
  output reg [1:0]ALUop ,
  output reg MemtoReg , MemWrite , Branch , ALUSrc , 
         RegDst , RegWrite , Jump
    );
always @*
begin
case(opcode)
  6'b000000 : begin             //R-type
              MemtoReg = 1'b0 ;
              MemWrite = 1'b0 ;  
              Branch = 1'b0 ;
              ALUSrc = 1'b0 ; 
              RegDst = 1'b1 ;
              RegWrite = 1'b1 ;
              ALUop = 2'b10 ;
              Jump = 0;
              end
  6'b100011 : begin            //lw
              MemtoReg = 1'b1 ; 
              MemWrite = 1'b0 ; 
              Branch = 1'b0 ;   
              ALUSrc = 1'b1 ;   
              RegDst = 1'b0 ;   
              RegWrite = 1'b1 ; 
              ALUop = 2'b00 ;   
              Jump = 0;
              end               
 6'b101011 : begin            //sw
              MemtoReg = 1'bx ; 
              MemWrite = 1'b1 ; 
              Branch = 1'b0 ;   
              ALUSrc = 1'b1 ;   
              RegDst = 1'bx ;   
              RegWrite = 1'b0 ; 
              ALUop = 2'b00 ;   
              Jump = 0;
              end    
 6'b000100 : begin            //beq
              MemtoReg = 1'bx ; 
              MemWrite = 1'b0 ; 
              Branch = 1'b1 ;   
              ALUSrc = 1'b0 ;   
              RegDst = 1'bx ;   
              RegWrite = 1'b0; 
              ALUop = 2'b01 ;   
              Jump = 0 ;
              end       

6'b001000 : begin            //addi
              MemtoReg = 1'b0 ; 
              MemWrite = 1'b0 ; 
              Branch = 1'b0 ;   
              ALUSrc = 1'b1 ;   
              RegDst = 1'b0 ;   
              RegWrite = 1'b1; 
              ALUop = 2'b00 ;   
              Jump = 0 ;
              end                        
6'b000010 : begin            //jupm
              MemtoReg = 1'bx ; 
              MemWrite = 1'b0 ; 
              Branch = 1'bx ;   
              ALUSrc = 1'bx ;   
              RegDst = 1'bx ;   
              RegWrite = 1'b0; 
              ALUop = 2'bxx ;   
              Jump = 1 ;
              end    endcase


end
endmodule
