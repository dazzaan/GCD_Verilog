module MUX21(out,A,B,sel);
    input sel;
    input [15:0] A,B;
    output [15:0] out;
	 
    assign out=sel?A:B;
endmodule

