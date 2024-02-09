module instruction_memory (
   input [31:0] A,
   output [31:0] RD);
reg [31:0] imem[63:0];

initial
begin
$readmemh ("F:/Verilog_Vivado_projects/ProjectVivado/MIPS/memfile.txt",imem);
end

assign RD = imem[A >> 2]; 
endmodule


