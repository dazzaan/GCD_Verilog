module CNTRL(start,eq,lt,gt,clock,loada,loadb,loadp,clearp,sel1,sel2,selb,done);
input start,eq,lt,gt,clock;
output reg loada,loadb,loadp,clearp,sel1,sel2,selb,done;
reg [2:0] state;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;
always @(negedge clock) 
begin
case (state)
s0:if (start) state<=s1;
s1:state<=s2;
s2:if(lt) state<=s3;
   else if (gt) state<=s4;
	else if (eq) state<=s5;
s3:if(lt) state<=s3;
   else if (gt) state<=s4;
	else if (eq) state<=s5;
s4:if(lt) state<=s3;
   else if (gt) state<=s4;
	else if (eq) state<=s5;
s5:state<=s5;
   default:state<=s0;
endcase
end
always@(state) begin
case (state)
    s0: begin
        loada<=0; loadb<=0; loadp<=0; clearp<=1; sel1<=0; sel2<=0; selb<=1; done<=0;
    end
    s1: begin
        loada<=1; clearp<=0;
    end
    s2: begin
        loada<=0; loadb<=1;
    end
    s3: begin
        loada<=0; loadp<=1; sel1<=0; sel2<=1; selb<=0;
		  loadb<=1;
    end
    s4: begin
        loadb<=0; loadp<=1; sel1<=1; sel2<=0; selb<=0;
		  loada<=1;
    end
    s5: begin
        loada<=0; loadb<=0; loadp<=0; done<=1;
    end
    default: begin
        loada<=0; loadb<=0; loadp<=0; clearp<=1; sel1<=0; sel2<=0; selb<=1; done<=0;
    end
endcase
end
endmodule



