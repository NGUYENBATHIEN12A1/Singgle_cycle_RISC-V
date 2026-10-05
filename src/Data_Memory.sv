module Data_Memory (
    input  logic        clk, reset, MemWrite, MemRead,
    input  logic [31:0] address, Write_data,
    output logic [31:0] MemData_out
);
    logic [31:0] D_Memory [0:63];
    integer i;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 64; i = i + 1) begin
                D_Memory[i] <= 32'd0;
            end
        end
        else if (MemWrite) begin
            D_Memory[address[7:2]] <= Write_data;
        end
    end

    assign MemData_out = MemRead ? D_Memory[address[7:2]] : 32'd0;
endmodule