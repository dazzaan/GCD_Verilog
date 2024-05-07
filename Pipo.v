module Pipo (val,load,clock,Bus);
    input [15:0] Bus;
    input load,clock ; 
    output reg[15:0] val;
	 
always@(posedge clock)
  if (load) 
    val=Bus;
endmodule














