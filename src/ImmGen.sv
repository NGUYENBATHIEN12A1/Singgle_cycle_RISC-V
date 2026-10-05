module ImmGen (
    input  logic [6:0]  Opcode,
    input  logic [31:0] instruction,
    output logic [31:0] ImmExt
);
    // Khai báo các biến trung gian chứa giá trị sinh ra cho từng loại lệnh
    logic [31:0] imm_I, imm_S, imm_B, imm_U, imm_J;

    // Thực hiện cắt nối bit bên ngoài khối always_* thông qua assign
    assign imm_I = {{20{instruction[31]}}, instruction[31:20]};
    assign imm_S = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
    assign imm_B = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
    assign imm_U = {instruction[31:12], 12'b0};
    assign imm_J = {{12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0};

    always_comb begin 
        case (Opcode)
            7'b0000011, 7'b0010011, 7'b1100111: ImmExt = imm_I; // I-type
            7'b0100011: ImmExt = imm_S;                         // S-type 
            7'b1100011: ImmExt = imm_B;                         // B-type (Branch)
            7'b0110111, 7'b0010111: ImmExt = imm_U;             // U-type
            7'b1101111: ImmExt = imm_J;                         // J-type (JAL)
            default: ImmExt = 32'd0;
        endcase
    end
endmodule