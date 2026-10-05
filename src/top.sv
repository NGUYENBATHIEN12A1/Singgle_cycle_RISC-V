module top (
    input  logic        clk,
    input  logic        reset,
    output logic [31:0] PC_out,
    output logic [31:0] Instr_out,
    output logic [31:0] ALU_out,
    output logic [31:0] WriteBack_out
);
    logic [31:0] PC_top, instruction_top, Rd1_top, Rd2_top, ImmExt_top, ALU_B_top;
    logic [31:0] Branch_Addr_top, NextPC_top, PCplus4_top, ALU_Result_top, Mem_data_top, WriteBack_top;
    logic        Regwrite_top, ALUSrc_top, zero_top, branch_top, PCSrc_top, MemtoReg_top, MemWrite_top, MemRead_top;
    logic [1:0]  ALUOp_top;
    logic [3:0]  Control_top;

    Program_Counter PC_inst (
        .clk   (clk),
        .rst   (reset),
        .PC_in (NextPC_top),
        .PC_out(PC_top)
    );

    PCplus4 PC4_inst (
        .fromPC (PC_top),
        .NextoPC(PCplus4_top)
    );

    Instruction_Mem IM_inst (
        .read_address   (PC_top),
        .instruction_out(instruction_top)
    );

    Reg_file RF_inst (
        .clk       (clk),
        .rst       (reset),
        .Reg_write (Regwrite_top),
        .rs1       (instruction_top[19:15]),
        .rs2       (instruction_top[24:20]),
        .rd        (instruction_top[11:7]),
        .write_data(WriteBack_top),
        .read_data1(Rd1_top),
        .read_data2(Rd2_top)
    );

    ImmGen IG_inst (
        .Opcode     (instruction_top[6:0]),
        .instruction(instruction_top),
        .ImmExt     (ImmExt_top)
    );

    Control_Unit CU_inst (
        .instruction(instruction_top[6:0]),
        .Branch     (branch_top),
        .MemRead    (MemRead_top),
        .MemtoReg   (MemtoReg_top),
        .ALUOp      (ALUOp_top),
        .MemWrite   (MemWrite_top),
        .ALUSrc     (ALUSrc_top),
        .RegWrite   (Regwrite_top)
    );

    ALU_Control AC_inst (
        .ALUOp      (ALUOp_top),
        .fun7       (instruction_top[30]),
        .fun3       (instruction_top[14:12]),
        .Control_out(Control_top)
    );

    Mux2to1 ALU_in_Mux (
        .in0(Rd2_top),
        .in1(ImmExt_top),
        .sel(ALUSrc_top),
        .out(ALU_B_top)
    );

    ALU_unit ALU_inst (
        .A          (Rd1_top),
        .B          (ALU_B_top),
        .Control_in (Control_top),
        .ALU_Result (ALU_Result_top),
        .zero       (zero_top)
    );

    Adder Branch_Adder (
        .in_1   (PC_top),
        .in_2   (ImmExt_top),
        .Sum_out(Branch_Addr_top)
    );

    assign PCSrc_top = branch_top & zero_top;

    Mux2to1 PC_Mux (
        .in0(PCplus4_top),
        .in1(Branch_Addr_top),
        .sel(PCSrc_top),
        .out(NextPC_top)
    );

    Data_Memory DM_inst (
        .clk        (clk),
        .reset      (reset),
        .MemWrite   (MemWrite_top),
        .MemRead    (MemRead_top),
        .address    (ALU_Result_top),
        .Write_data (Rd2_top),
        .MemData_out(Mem_data_top)
    );

    Mux2to1 WB_Mux (
        .in0(ALU_Result_top),
        .in1(Mem_data_top),
        .sel(MemtoReg_top),
        .out(WriteBack_top)
    );

    // Output ports so synthesis does not remove the datapath
    assign PC_out        = PC_top;
    assign Instr_out     = instruction_top;
    assign ALU_out       = ALU_Result_top;
    assign WriteBack_out = WriteBack_top;

endmodule