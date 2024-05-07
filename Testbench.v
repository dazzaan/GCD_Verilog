`timescale 1ns/ 1ns
module Testbench;
reg [15:0] data_in;
reg clock,start;
wire done;
CNTRL AN(start,eq,lt,gt,clock,loada,loadb,loadp,clearp,sel1,sel2,selb,done);
Data_path BA (data_in,clock,loada,loadb,loadp,clearp,sel1,sel2,selb,lt,gt,eq);

initial begin
start<=1;
data_in<=0;
clock<=0;
end
initial begin
#11 data_in<=169;
#10 data_in<=39;
end

always #5 clock=~clock;

initial begin
$monitor($time,"%d,%d",BA.aout,BA.bout);
#500 $finish;
end
endmodule  