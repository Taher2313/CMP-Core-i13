vsim -gui work.processor
add wave -position insertpoint sim:/processor/*
add wave -position insertpoint  \

# load Reg File incremental
mem load -skip 0 -filltype inc -filldata 1 -fillradix hexadecimal /processor/decodeObj/u1/array_reg
mem load -skip 0 -filltype value -filldata 0 -fillradix binary /processor/fetchObj/instMem/RAM

#NOP
# mem load -filltype value -filldata 1101000001010011 -fillradix binary /processor/fetchObj/instMem/RAM(1)

#mov
#mem load -filltype value -filldata 0010101001010011 -fillradix binary /processor/fetchObj/instMem/RAM(1)


mem load -filltype value -filldata 0011000001000000 -fillradix binary /processor/fetchObj/instMem/RAM(1)        
mem load -filltype value -filldata 0011000010000000 -fillradix binary /processor/fetchObj/instMem/RAM(2)        
mem load -filltype value -filldata 0011000011000000 -fillradix binary /processor/fetchObj/instMem/RAM(3)
mem load -filltype value -filldata 0011000100000000 -fillradix binary /processor/fetchObj/instMem/RAM(4) 
mem load -filltype value -filldata 0011001000001010 -fillradix binary /processor/fetchObj/instMem/RAM(5) 
mem load -filltype value -filldata 1101000101101101 -fillradix binary /processor/fetchObj/instMem/RAM(6)        
mem load -filltype value -filldata 0010101101011000 -fillradix binary /processor/fetchObj/instMem/RAM(7)        
mem load -filltype value -filldata 0000001100001100 -fillradix binary /processor/fetchObj/instMem/RAM(8)        
mem load -filltype value -filldata 1101000101101101 -fillradix binary /processor/fetchObj/instMem/RAM(9)        
mem load -filltype value -filldata 1101000101101101 -fillradix binary /processor/fetchObj/instMem/RAM(10)        
mem load -filltype value -filldata 0001001110101100 -fillradix binary /processor/fetchObj/instMem/RAM(11)        
mem load -filltype value -filldata 0001101100111100 -fillradix binary /processor/fetchObj/instMem/RAM(12)        
mem load -filltype value -filldata 1111111111111111 -fillradix binary /processor/fetchObj/instMem/RAM(13)        
mem load -filltype value -filldata 0100000010010000 -fillradix binary /processor/fetchObj/instMem/RAM(14)        
mem load -filltype value -filldata 1101000101101101 -fillradix binary /processor/fetchObj/instMem/RAM(15)        
mem load -filltype value -filldata 1101000101101101 -fillradix binary /processor/fetchObj/instMem/RAM(16)       
mem load -filltype value -filldata 1101000101101101 -fillradix binary /processor/fetchObj/instMem/RAM(17)       
mem load -filltype value -filldata 0000001010001010 -fillradix binary /processor/fetchObj/instMem/RAM(18)    
 

# clock with 100ps period 
force -freeze sim:/processor/clk 0 0, 1 {50 ps} -r 100
# NOP
# 1101000101101101

# load Reg File
mem load -skip 0 -filltype value -filldata 0 -fillradix unsigned /processor/decodeObj/u1/array_reg
force -freeze sim:/processor/in 101 0
run
run
force -freeze sim:/processor/in 16'h0019 0
run
force -freeze sim:/processor/in 16'hffff 0
run
force -freeze sim:/processor/in 16'hf320 0
run