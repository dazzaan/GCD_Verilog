module CMP(Aout,Bout,lt,gt,eq);
    input [15:0] Aout,Bout;
    output lt,gt,eq;

    assign lt=Aout<Bout;
    assign gt=Aout>Bout;
    assign eq=Aout==Bout;

endmodule

