module controller(
   input [5:0] op , Funct,
   output MemtoReg , MemWrite , Branch , ALUSrc , RegDst , RegWrite , Jump ,
   output [2:0] ALU_ctrl 
      );
wire [1:0]ALUop ;
Main_decoder main_decoder(.opcode(op),
                          .ALUop(ALUop),
                          .MemtoReg(MemtoReg) , 
                          .MemWrite(MemWrite) , 
                          .Branch(Branch) , 
                          .ALUSrc(ALUSrc) , 
                          .RegDst(RegDst) , 
                          .RegWrite(RegWrite) , 
                          .Jump(Jump) );   
              
ALU_DEC  alu_dec (.ALUop(ALUop),
                  .Funct(Funct),
                  .ALU_ctrl(ALU_ctrl));
endmodule
