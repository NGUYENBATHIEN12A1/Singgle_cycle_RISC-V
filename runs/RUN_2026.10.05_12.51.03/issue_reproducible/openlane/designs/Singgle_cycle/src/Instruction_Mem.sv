
module Instruction_Mem ( 
    input  logic [31:0] read_address,
    output logic [31:0] instruction_out
);
    logic [31:0] Imen [0:63];

    initial begin
        $readmemh("mem.dump", Imen);
    end

    assign instruction_out = Imen[read_address[7:2]];
endmodule