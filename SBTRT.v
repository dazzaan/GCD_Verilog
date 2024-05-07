module SBTRT (
    input [15:0] x, y,
    input loadp, clearp,
    output reg [15:0] p
);

always @* begin
    if (clearp)
        p <= 0;
    else if (loadp)
        p <= x - y;
end

endmodule