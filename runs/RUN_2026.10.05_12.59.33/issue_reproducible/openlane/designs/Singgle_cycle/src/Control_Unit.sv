
module Control_Unit (
    input  logic [6:0] instruction,
    output logic       Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
    output logic [1:0] ALUOp
);
    always_comb begin
        case (instruction)
            7'b0110011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b00100010; // R-type
            7'b0000011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b11110000; // Load
            7'b0100011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b10001000; // Store
            7'b1100011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b00000101; // Branch
            7'b0010011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b10100000; // I-type (addi)
            default    : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = '0;
        endcase
    end
endmodule