module Data_path(data_in,clock,loada,loadb,loadp,clearp,sel1,sel2,selb,lt,gt,eq);
input [15:0] data_in;
input clock,loada,loadb,loadp,clearp,sel1,sel2,selb;
wire [15:0] aout,bout,X,Y,Bus,P;
output lt,gt,eq;
Pipo A (aout,loada,clock,Bus);
Pipo B (bout,loadb,clock,Bus);
MUX21 t(X,aout,bout,sel1);
MUX21 s(Y,aout,bout,sel2);
CMP AB (aout,bout,lt,gt,eq);
SBTRT A_B (X,Y,P,loadp,clearp);
MUX21 q (Bus,data_in,P,selb);
endmodule
