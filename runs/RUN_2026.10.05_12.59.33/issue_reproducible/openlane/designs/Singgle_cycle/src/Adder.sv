
module Adder #(
    parameter int WIDTH = 32
) (
    input  logic [WIDTH-1:0] in_1, in_2,
    output logic [WIDTH-1:0] Sum_out
);
    assign Sum_out = in_1 + in_2;
endmodule