vsim -gui work.fetch

add wave -position insertpoint  \
sim:/fetch/clk \
sim:/fetch/pc_select \
sim:/fetch/pc_place \
sim:/fetch/index \
sim:/fetch/IVT \
sim:/fetch/ret \
sim:/fetch/reset \
sim:/fetch/call \
sim:/fetch/instruction \
sim:/fetch/new_pc \
sim:/fetch/tempPc


force -freeze sim:/fetch/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/fetch/index 3 0
force -freeze sim:/fetch/IVT 12 0
force -freeze sim:/fetch/ret 27 0
force -freeze sim:/fetch/reset 57 0
force -freeze sim:/fetch/call 33 0
mem load -skip 0 -filltype inc -filldata 1 -fillradix unsigned /fetch/instMem/RAM
mem load -skip 0 -filltype inc -filldata 1 -fillradix unsigned /fetch/instMem/RAM
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/fetch/pc_place 1 0
run
force -freeze sim:/fetch/pc_place 2 0
run
force -freeze sim:/fetch/pc_place 3 0
run
force -freeze sim:/fetch/pc_place 4 0
run
force -freeze sim:/fetch/pc_place 5 0
run
force -freeze sim:/fetch/pc_place 6 0
run
force -freeze sim:/fetch/pc_place 7 0
run
force -freeze sim:/fetch/pc_place 8 0
run
force -freeze sim:/fetch/pc_place 9 0
run
run