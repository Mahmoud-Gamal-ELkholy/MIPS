module sign_extend(
  input [15:0] inst ,
  output  [31:0] signimm
    );

assign signimm = {{16{inst[15]}} , inst} ;

endmodule
