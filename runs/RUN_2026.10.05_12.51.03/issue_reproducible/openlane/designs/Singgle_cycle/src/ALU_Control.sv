

module ALU_Control (
    input  logic [1:0] ALUOp,
    input  logic       fun7,
    input  logic [2:0] fun3,
    output logic [3:0] Control_out
);
    always_comb begin
        case (ALUOp)
            2'b00: Control_out = 4'b0010; // Load/Store (Add)
            2'b01: Control_out = 4'b0110; // Beq (Sub)
            2'b10: begin // R-type
                case (fun3)
                    3'b000:  Control_out = fun7 ? 4'b0110 : 4'b0010; // Sub : Add
                    3'b111:  Control_out = 4'b0000; // And
                    3'b110:  Control_out = 4'b0001; // Or
                    default: Control_out = 4'b0010;
                endcase
            end
            default: Control_out = 4'b0010;
        endcase
    end
endmodule