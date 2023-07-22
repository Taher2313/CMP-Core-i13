quit -sim
vsim -gui work.memStage
# vsim -gui work.memStage 
# Start time: 03:32:03 on Dec 31,2021
# Loading work.memStage
# Loading work.DATA_MEM
# ** Warning: (vsim-3015) [PCDPC] - Port size (32) does not match connection size (20) for port 'data_in'. The port definition is at: D:/00 CMP 23/03 Third year/04 Arc/Project/CMP-core-i1/Components/arc proj/DATA_MEM.v(34).
#    Time: 0 ps  Iteration: 0  Instance: /memStage/mem1 File: D:/00 CMP 23/03 Third year/04 Arc/Project/CMP-core-i1/stages/mem stage/memStage.v Line: 35
mem load -skip {} -filltype inc -filldata 1 -fillradix unsigned /memStage/mem1/RAM
mem load -skip {} -filltype inc -filldata 1 -fillradix unsigned /memStage/mem1/RAM
add wave -position insertpoint  \
sim:/memStage/clk \
sim:/memStage/i_reset \
sim:/memStage/i_wb \
sim:/memStage/i_isStack \
sim:/memStage/i_aluData \
sim:/memStage/i_stackData \
sim:/memStage/i_isPushPc \
sim:/memStage/i_pc \
sim:/memStage/i_instruction \
sim:/memStage/i_memRead \
sim:/memStage/i_memWrite \
sim:/memStage/i_en32 \
sim:/memStage/o_wb \
sim:/memStage/o_aluData \
sim:/memStage/o_memData \
sim:/memStage/address \
sim:/memStage/writeData

force -freeze sim:/memStage/clk 0 0, 1 {50 ps} -r 100

force -freeze sim:/memStage/i_reset 0 0
force -freeze sim:/memStage/i_wb 5 0
force -freeze sim:/memStage/i_isStack 1 0
force -freeze sim:/memStage/i_aluData 10 0
force -freeze sim:/memStage/i_stackData 7 0
force -freeze sim:/memStage/i_isPushPc 1 0
force -freeze sim:/memStage/i_pc 5 0
force -freeze sim:/memStage/i_instruction 7 0
force -freeze sim:/memStage/i_memRead 1 0
force -freeze sim:/memStage/i_memWrite 0 0
force -freeze sim:/memStage/i_en32 1 0
run

force -freeze sim:/memStage/i_reset 1 0
force -freeze sim:/memStage/i_wb 5 0
force -freeze sim:/memStage/i_isStack 0 0
force -freeze sim:/memStage/i_aluData 12 0
force -freeze sim:/memStage/i_stackData 17 0
force -freeze sim:/memStage/i_isPushPc 0 0
force -freeze sim:/memStage/i_pc 9 0
force -freeze sim:/memStage/i_instruction 15 0
run


force -freeze sim:/memStage/i_reset 0 0
force -freeze sim:/memStage/i_wb 3 0
force -freeze sim:/memStage/i_isStack 1 0
force -freeze sim:/memStage/i_aluData 16 0
force -freeze sim:/memStage/i_stackData 26 0
force -freeze sim:/memStage/i_isPushPc 1 0
force -freeze sim:/memStage/i_pc 12 0
force -freeze sim:/memStage/i_instruction 20 0
run

force -freeze sim:/memStage/i_reset 1 0
force -freeze sim:/memStage/i_wb 3 0
force -freeze sim:/memStage/i_isStack 0 0
force -freeze sim:/memStage/i_aluData 22 0
force -freeze sim:/memStage/i_stackData 30 0
force -freeze sim:/memStage/i_isPushPc 0 0
force -freeze sim:/memStage/i_pc 18 0
force -freeze sim:/memStage/i_instruction 31 0
run
run



// ------------- test write to memory ----------------------

force -freeze sim:/memStage/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/memStage/i_reset 0 0
force -freeze sim:/memStage/i_wb 5 0
force -freeze sim:/memStage/i_isStack 1 0
force -freeze sim:/memStage/i_aluData 10 0
force -freeze sim:/memStage/i_stackData 7 0
force -freeze sim:/memStage/i_isPushPc 1 0
force -freeze sim:/memStage/i_pc 5 0
force -freeze sim:/memStage/i_instruction 7 0
force -freeze sim:/memStage/i_memRead 0 0
force -freeze sim:/memStage/i_memWrite 1 0
force -freeze sim:/memStage/i_en32 0 0
run

force -freeze sim:/memStage/i_reset 1 0
force -freeze sim:/memStage/i_wb 5 0
force -freeze sim:/memStage/i_isStack 0 0
force -freeze sim:/memStage/i_aluData 12 0
force -freeze sim:/memStage/i_stackData 17 0
force -freeze sim:/memStage/i_isPushPc 0 0
force -freeze sim:/memStage/i_pc 9 0
force -freeze sim:/memStage/i_instruction 15 0
run


force -freeze sim:/memStage/i_reset 0 0
force -freeze sim:/memStage/i_wb 3 0
force -freeze sim:/memStage/i_isStack 1 0
force -freeze sim:/memStage/i_aluData 16 0
force -freeze sim:/memStage/i_stackData 26 0
force -freeze sim:/memStage/i_isPushPc 1 0
force -freeze sim:/memStage/i_pc 12 0
force -freeze sim:/memStage/i_instruction 20 0
run

force -freeze sim:/memStage/i_reset 1 0
force -freeze sim:/memStage/i_wb 3 0
force -freeze sim:/memStage/i_isStack 0 0
force -freeze sim:/memStage/i_aluData 22 0
force -freeze sim:/memStage/i_stackData 30 0
force -freeze sim:/memStage/i_isPushPc 0 0
force -freeze sim:/memStage/i_pc 18 0
force -freeze sim:/memStage/i_instruction 31 0
run