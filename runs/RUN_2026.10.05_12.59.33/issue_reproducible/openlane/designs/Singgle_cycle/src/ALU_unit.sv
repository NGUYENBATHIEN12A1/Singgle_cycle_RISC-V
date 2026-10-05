

module ALU_unit (
    input  logic [31:0] A, B,
    input  logic [3:0]  Control_in,
    output logic [31:0] ALU_Result,
    output logic        zero
);
    always_comb begin 
        case (Control_in)
            4'b0000: ALU_Result = A & B;      // AND
            4'b0001: ALU_Result = A | B;      // OR
            4'b0010: ALU_Result = A + B;      // ADD
            4'b0110: ALU_Result = A - B;      // SUB
            default: ALU_Result = '0;
        endcase
        zero = (ALU_Result == '0);
    end
endmodule