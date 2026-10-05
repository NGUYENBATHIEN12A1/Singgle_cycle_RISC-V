set env CARRY_SELECT_ADDER_MAP pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/csa_map.v
set env CLOCK_PERIOD 20.0
set env DESIGN_NAME top
set env FULL_ADDER_MAP pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/fa_map.v
set env LIB_SYNTH ./tmp/synthesis/trimmed.lib
set env LIB_SYNTH_COMPLETE_NO_PG ./tmp/synthesis/1-sky130_fd_sc_hd__tt_025C_1v80.no_pg.lib
set env LIB_SYNTH_NO_PG ./tmp/synthesis/1-trimmed.no_pg.lib
set env MAX_FANOUT_CONSTRAINT 10
set env MAX_TRANSITION_CONSTRAINT 0.75
set env OUTPUT_CAP_LOAD 33.442
set env PACKAGED_SCRIPT_0 openlane/scripts/yosys/synth.tcl
set env PACKAGED_SCRIPT_1 ./tmp/synthesis/synthesis.sdc
set env RIPPLE_CARRY_ADDER_MAP pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/rca_map.v
set env SAVE_NETLIST ./results/synthesis/top.v
set env SYNTH_ADDER_TYPE YOSYS
set env SYNTH_BUFFERING 1
set env SYNTH_BUFFER_DIRECT_WIRES 1
set env SYNTH_DRIVING_CELL sky130_fd_sc_hd__inv_2
set env SYNTH_EXTRA_MAPPING_FILE 
set env SYNTH_LATCH_MAP pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/latch_map.v
set env SYNTH_MIN_BUF_PORT sky130_fd_sc_hd__buf_2 A X
set env SYNTH_NO_FLAT 0
set env SYNTH_READ_BLACKBOX_LIB 0
set env SYNTH_SHARE_RESOURCES 1
set env SYNTH_SIZING 0
set env SYNTH_SPLITNETS 1
set env SYNTH_STRATEGY AREA 0
set env SYNTH_TIEHI_PORT sky130_fd_sc_hd__conb_1 HI
set env SYNTH_TIELO_PORT sky130_fd_sc_hd__conb_1 LO
set env TRISTATE_BUFFER_MAP pdk/sky130A/libs.tech/openlane/sky130_fd_sc_hd/tribuff_map.v
set env VERILOG_FILES openlane/designs/Singgle_cycle/src/Adder.sv openlane/designs/Singgle_cycle/src/ALU_Control.sv openlane/designs/Singgle_cycle/src/ALU_unit.sv openlane/designs/Singgle_cycle/src/Control_Unit.sv openlane/designs/Singgle_cycle/src/Data_Memory.sv openlane/designs/Singgle_cycle/src/ImmGen.sv openlane/designs/Singgle_cycle/src/Instruction_Mem.sv openlane/designs/Singgle_cycle/src/Mux2to1.sv openlane/designs/Singgle_cycle/src/PCplus4.sv openlane/designs/Singgle_cycle/src/Program_Counter.sv openlane/designs/Singgle_cycle/src/Reg_file.sv openlane/designs/Singgle_cycle/src/tb_top.sv openlane/designs/Singgle_cycle/src/top.sv
set env synth_report_prefix ./reports/synthesis/1-synthesis
set env synthesis_results ./results/synthesis
set env synthesis_tmpfiles ./tmp/synthesis