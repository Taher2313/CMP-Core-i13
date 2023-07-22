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
mem load -filltype value -filldata {0100 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(1)
# .ORG 2 
mem load -filltype value -filldata {0100 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(3)
# .ORG 4 
mem load -filltype value -filldata {0150 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(5)
# .ORG 6 
mem load -filltype value -filldata {0200 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(7)
# .ORG 8 
mem load -filltype value -filldata {0250 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(9)

# start Instruction  after ( [.ORG 0] + 1 ) 
# IN R1 , IN R2 , IN R3 , IN R4
mem load -filltype value -filldata 0011000001000000 -fillradix binary /processor/fetchObj/instMem/RAM(256)        
mem load -filltype value -filldata 0011000010000000 -fillradix binary /processor/fetchObj/instMem/RAM(257)        
mem load -filltype value -filldata 0011000011000000 -fillradix binary /processor/fetchObj/instMem/RAM(258)
mem load -filltype value -filldata 0011000100000000 -fillradix binary /processor/fetchObj/instMem/RAM(259) 
# mov R5 , R3
mem load -filltype value -filldata 0010101101011000 -fillradix binary /processor/fetchObj/instMem/RAM(260)  
# ADD R4 , R1 , R4
mem load -filltype value -filldata 0000001100001100 -fillradix binary /processor/fetchObj/instMem/RAM(261)  
#SUB R6,R5,R4
mem load -filltype value -filldata 0001001110101100 -fillradix binary /processor/fetchObj/instMem/RAM(262)   
#AND R4,R7,R4
mem load -filltype value -filldata 0001101100111100 -fillradix binary /processor/fetchObj/instMem/RAM(263) 
#IADD R2,R2,FFFF
mem load -filltype value -filldata 0100000010010000 -fillradix binary /processor/fetchObj/instMem/RAM(264)  
mem load -filltype value -filldata 1111111111111111 -fillradix binary /processor/fetchObj/instMem/RAM(265)        
#ADD R2,R1,R2
mem load -filltype value -filldata 0000001010001010 -fillradix binary /processor/fetchObj/instMem/RAM(266) 


# reset 
force -freeze sim:/processor/rst 1 0
run 
force -freeze sim:/processor/rst 0 0
run
force -freeze sim:/processor/in 16'h5 0
run
force -freeze sim:/processor/in 16'h0019 0
run
force -freeze sim:/processor/in 16'hffff 0
run
force -freeze sim:/processor/in 16'hf320 0
run