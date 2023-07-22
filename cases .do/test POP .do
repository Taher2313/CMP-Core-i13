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

# LOAD REG FILE INCREMENTAL
mem load -skip 0 -filltype inc -filldata 1 -fillradix hexadecimal /processor/decodeObj/u1/array_reg
# .ORG 0 
mem load -filltype value -filldata {300 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(1)
# .ORG 2 
mem load -filltype value -filldata {100 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(3)
# .ORG 4 
mem load -filltype value -filldata {150 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(5)
# .ORG 6 
mem load -filltype value -filldata {200 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(7)
# .ORG 8 
mem load -filltype value -filldata {250 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(9)

# out R1
mem load -filltype value -filldata 0011001000001000 -fillradix binary /processor/fetchObj/instMem/RAM(256)   
# HLT
mem load -filltype value -filldata 1100001000000000 -fillradix binary /processor/fetchObj/instMem/RAM(257)

# inc R1
mem load -filltype value -filldata 0011000001000000 -fillradix binary /processor/fetchObj/instMem/RAM(336)   
# out R1
mem load -filltype value -filldata 0011001000001000 -fillradix binary /processor/fetchObj/instMem/RAM(337)   
# HLT
mem load -filltype value -filldata 1100001000000000 -fillradix binary /processor/fetchObj/instMem/RAM(338)


# -----------------------------------------------------------------------------------------------------
# push R1
mem load -filltype value -filldata 1110010000010000 -fillradix binary /processor/fetchObj/instMem/RAM(768)    


# NOP   
#mem load -filltype value -filldata 1101000000000000 -fillradix binary /processor/fetchObj/instMem/RAM(769)   


# pop R1
mem load -filltype value -filldata 1110101001000000 -fillradix binary /processor/fetchObj/instMem/RAM(769)  


# reset 
force -freeze sim:/processor/rst 1 0
run 
force -freeze sim:/processor/rst 0 0