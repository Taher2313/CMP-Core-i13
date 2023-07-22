vsim -gui work.DATA_MEM
# vsim -gui work.DATA_MEM 
# Start time: 02:38:46 on Dec 31,2021
# Loading work.DATA_MEM
mem load -skip {} -filltype inc -filldata 1 -fillradix hexadecimal /DATA_MEM/RAM
mem load -skip {} -filltype inc -filldata 1 -fillradix hexadecimal /DATA_MEM/RAM
mem load -skip {} -filltype inc -filldata 1 -fillradix hexadecimal /DATA_MEM/RAM
add wave -position insertpoint  \
sim:/DATA_MEM/clk \
sim:/DATA_MEM/i_memRead \
sim:/DATA_MEM/i_memWrite \
sim:/DATA_MEM/i_en32 \
sim:/DATA_MEM/i_address \
sim:/DATA_MEM/i_data_in \
sim:/DATA_MEM/o_data_out \
sim:/DATA_MEM/RAM \
sim:/DATA_MEM/adrs
force -freeze sim:/DATA_MEM/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/DATA_MEM/i_memRead 1 0
force -freeze sim:/DATA_MEM/i_memWrite 0 0
force -freeze sim:/DATA_MEM/i_en32 1 0
force -freeze sim:/DATA_MEM/i_address 0 0
force -freeze sim:/DATA_MEM/i_data_in 7 0
run
force -freeze sim:/DATA_MEM/i_en32 0 0
run
force -freeze sim:/DATA_MEM/i_address 7 0
run
force -freeze sim:/DATA_MEM/i_en32 1 0
force -freeze sim:/DATA_MEM/i_address 17 0
run
force -freeze sim:/DATA_MEM/i_memRead 0 0

force -freeze sim:/DATA_MEM/i_memWrite 1 0
force -freeze sim:/DATA_MEM/i_data_in x\"12345678\" 0
run
force -freeze sim:/DATA_MEM/i_address 7 0
run
force -freeze sim:/DATA_MEM/i_en32 0 0
force -freeze sim:/DATA_MEM/i_address 2 0
force -freeze sim:/DATA_MEM/i_en32 0 0
run