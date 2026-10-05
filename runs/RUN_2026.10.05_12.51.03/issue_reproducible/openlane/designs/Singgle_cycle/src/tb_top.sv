`timescale 1ns / 1ps

module tb_top;
    logic clk;
    logic reset;

    // Instantiate Top Module
    top dut (
        .clk  (clk),
        .reset(reset)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Signals
        clk   = 0;
        reset = 1;

        $dumpfile("top_sim.vcd");
        $dumpvars(0, tb_top);

        // Đã thêm dấu // ở đầu để tạm ẩn dòng này, tránh lỗi Unable to bind
        // $monitor("Time: %0t ns | Reset: %b | PC: %8h | Lệnh: %8h", 
        //          $time, reset, dut.fromPC, dut.instruction);

        // Hold Reset for 20ns
        #20;
        reset = 0;

        // Run simulation for 200ns
        #200;
        $finish;
    end
endmodule