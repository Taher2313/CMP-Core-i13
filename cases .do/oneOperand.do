vsim -gui work.processor
add log -r /*
add wave -position insertpoint sim:/processor/*

# initailize DataMem , InstMem , RegFile 
mem load -skip 0 -filltype value -filldata 0 -fillradix hexadecimal /processor/fetchObj/instMem/RAM
mem load -skip 0 -filltype value -filldata 0 -fillradix hexadecimal /processor/decodeObj/u1/array_reg
mem load -skip 0 -filltype value -filldata 0 -fillradix hexadecimal /processor/decodeObj/u1/array_reg
mem load -skip 0 -filltype value -filldata 0 -fillradix hexadecimal /processor/MemStageObj/mem1/RAM
# clock
force -freeze sim:/processor/clk 0 0, 1 {50 ps} -r 100


# .ORG 0 
mem load -filltype value -filldata {A1 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(1)
# .ORG 2 
mem load -filltype value -filldata {100 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(3)
# .ORG 4 
mem load -filltype value -filldata {150 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(5)
# .ORG 6 
mem load -filltype value -filldata {200 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(7)
# .ORG 8 
mem load -filltype value -filldata {250 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(9)

# start Instruction  after ( [.ORG 0]  ) 
# SETC  
mem load -filltype value -filldata 1100010000000000 -fillradix binary /processor/fetchObj/instMem/RAM(161)    

# NOP   
mem load -filltype value -filldata 1101000000000000 -fillradix binary /processor/fetchObj/instMem/RAM(162)    

# NOT R1
mem load -filltype value -filldata 0010001001001000 -fillradix binary /processor/fetchObj/instMem/RAM(163)    

# INC R1
mem load -filltype value -filldata 0000011001001000 -fillradix binary /processor/fetchObj/instMem/RAM(164)    

# IN R1
mem load -filltype value -filldata 0011000001000000 -fillradix binary /processor/fetchObj/instMem/RAM(165)    

# IN R2 
mem load -filltype value -filldata 0011000010000000 -fillradix binary /processor/fetchObj/instMem/RAM(166)    

# NOT R2
mem load -filltype value -filldata 0010001010010000 -fillradix binary /processor/fetchObj/instMem/RAM(167)    

# INC R1
mem load -filltype value -filldata 0000011001001000 -fillradix binary /processor/fetchObj/instMem/RAM(168)    

# OUT R1
mem load -filltype value -filldata 0011001000001000 -fillradix binary /processor/fetchObj/instMem/RAM(169)    

# OUT R2
mem load -filltype value -filldata 0011001000010000 -fillradix binary /processor/fetchObj/instMem/RAM(170)    

# HLT
mem load -filltype value -filldata 1100001000000000 -fillradix binary /processor/fetchObj/instMem/RAM(171)    



# reset 
force -freeze sim:/processor/rst 1 0
run 
force -freeze sim:/processor/rst 0 0
run
run
run
run
run
force -freeze sim:/processor/in 16'h5 0
run
force -freeze sim:/processor/in 16'h10 0
# ----------------- in case of in -----------------------
# force -freeze sim:/processor/in 16'h5 0
# run
# run
# force -freeze sim:/processor/in 16'h0019 0
# run
# force -freeze sim:/processor/in 16'hffff 0
# run
# force -freeze sim:/processor/in 16'hf320 0
# run