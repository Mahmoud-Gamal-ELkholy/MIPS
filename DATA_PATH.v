module DATA_PATH(
   input clk , reset , 
   input PCSrc , RegDst , ALUSrc ,
         MemtoReg , RegWrite ,jump ,
   input [2:0] ALU_ctrl ,
   input [31:0] inst_out , RD ,
   output zero ,  
   output [31:0] PC_out , RD2 , ALUResult
    );
    
wire [31:0]PC_0 , PC_1 , PC_in ;
wire [31:0] PCBranch , PCplus4 ;
wire [31:0] WD3 ;
wire [31:0]SrcA , SrcB ;
wire [4:0]A3 ;
wire [31:0] signimm ;
wire [31:0] shift_out ;
wire [27:0]shift_j ;
assign PC_1 = {PCplus4[31:28] , shift_j};

program_counter PC (.clk(clk),
                    .reset(reset),
                    .PC_in(PC_in),
                    .PC_out(PC_out) );

MUX_Gen   #(32) MUX_PC_1(.x(PC_0),
                         .y(PC_1),
                         .ctrl(jump),
                         .z(PC_in));

MUX_Gen   #(32) MUX_PC_2(.x(PCplus4),
                         .y(PCBranch),
                         .ctrl(PCSrc),
                         .z(PC_0));
                         
adder   add_4 (.x(PC_out),
               .y(4),
               .z(PCplus4));

MUX_Gen  #(5) MUX_A3 (.x(inst_out[20:16]),
                      .y(inst_out[15:11]),
                      .ctrl(RegDst),
                      .z(A3) );

register_file reg_file (.clk(clk),
                        .reset(reset),
                        .WE3(RegWrite),
                        .A1(inst_out[25:21]) , .A2(inst_out[20:16]) , .A3(A3) ,   
                        .WD3(WD3),
                        .RD1(SrcA) , .RD2(RD2) );
                        
MUX_Gen  #(32) MUX_ALU (.x(RD2),
                      .y(signimm),
                      .ctrl(ALUSrc),
                      .z(SrcB) );

ALU_32    ALU (.SrcA(SrcA),
               .SrcB(SrcB),
               .ALUResult(ALUResult),
               .ALU_ctrl(ALU_ctrl),
               .zero(zero) );
               
sign_extend sign_extend (.inst(inst_out[15:0]),
                         .signimm(signimm));

shifter_4 shiftimm (.x(signimm),
                    .y(shift_out) );

adder  PC_Branch (.x(shift_out),
                 .y(PCplus4),
                 .z(PCBranch));
                 
shifter_4  shifter_j (.x(inst_out[25:0]),
                    .y(shift_j)); 

MUX_Gen #(32)MUX_to_regfile (.x(ALUResult),
                             .y(RD),
                             .ctrl(MemtoReg),
                             .z(WD3));
               
endmodule
