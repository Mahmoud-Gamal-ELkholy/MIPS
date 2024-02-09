module controller_tb();
reg [5:0] op , Funct ;
wire  MemtoReg , MemWrite , Branch , ALUSrc , RegDst , RegWrite , Jump ; 
wire [2:0] ALU_ctrl ;

controller TB (.op(op),
               .Funct(Funct),
               .MemtoReg(MemtoReg) , 
               .MemWrite(MemWrite) , 
               .Branch(Branch) , 
               .ALUSrc(ALUSrc) , 
               .RegDst(RegDst) , 
               .RegWrite(RegWrite) , 
               .Jump(Jump),
               .ALU_ctrl(ALU_ctrl) );
               
initial begin
     op = 6'b000_000 ; Funct = 6'b100000 ;
#10  op = 6'b100_011 ; Funct = 6'b100000 ;
#10  op = 6'b000_000 ; Funct = 6'b100100 ;
#20 ; $stop ;
end
endmodule
