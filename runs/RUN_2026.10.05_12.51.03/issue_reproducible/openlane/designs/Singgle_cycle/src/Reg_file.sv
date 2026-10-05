module Reg_file (
    input  logic        clk, rst, Reg_write,
    input  logic [4:0]  rs1, rs2, rd,
    input  logic [31:0] write_data,
    output logic [31:0] read_data1, read_data2
);
    logic [31:0] Registers [0:31];
    integer i;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1) begin
                Registers[i] <= 32'd0;
            end
        end 
        else if (Reg_write && (rd != 5'b0)) begin
            Registers[rd] <= write_data;
        end 
    end

    assign read_data1 = (rs1 == 5'b0) ? 32'd0 : Registers[rs1];
    assign read_data2 = (rs2 == 5'b0) ? 32'd0 : Registers[rs2];
endmodule