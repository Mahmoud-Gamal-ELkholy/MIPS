module MIPS(
  input clk , reset ,
  output [31:0] inst_out , RD 
    );
    
wire MemWrite , RegWrite , RegDst , ALUSrc, 
     MemtoReg , Branch , PCSrc , zero , jump ;
wire [2:0] ALU_ctrl  ;
wire [31:0]ALUOut , writedata , PC ;
wire [31:0]Instruction ,ALUResult  ;
assign PCSrc = zero & Branch ;

DATA_PATH datapath(.clk(clk),
                   .reset(reset),
                   .PCSrc(PCSrc) , 
                   .RegDst(RegDst) , 
                   .ALUSrc(ALUSrc) ,
                   .MemtoReg(MemtoReg) , 
                   .RegWrite(RegWrite) ,
                   .jump(jump), 
                   .ALU_ctrl(ALU_ctrl),
                   .inst_out(inst_out),
                   .RD(RD) ,
                   .zero(zero),
                   .PC_out(PC) ,
                   .RD2 (writedata),
                   .ALUResult(ALUResult) );  

data_memory  dmem (.A(ALUResult),
                   .WD(writedata),
                   .clk(clk),
                   .WE(MemWrite),
                   .RD(RD));
                   
instruction_memory imem (.A(PC),
                         .RD(inst_out));
                    
controller ctrl (.op(inst_out[31:26]) ,
                 .Funct(inst_out[5:0]),
                 .MemtoReg(MemtoReg),
                 .MemWrite(MemWrite) , 
                 .Branch(Branch) , 
                 .ALUSrc(ALUSrc) , 
                 .RegDst(RegDst) , 
                 .RegWrite(RegWrite) , 
                 .Jump(jump) ,
                 .ALU_ctrl(ALU_ctrl));
                    


endmodule
