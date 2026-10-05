module PCplus4 (
    input  logic [31:0] fromPC,
    output logic [31:0] NextoPC
);
    assign NextoPC = fromPC + 32'd4;
endmodule