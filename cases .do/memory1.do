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





# start Instruction  after ( [.ORG 0]  ) 
#--------------------------------------------------------------start of instruction -----------------------------
# IN R2  
mem load -filltype value -filldata 0011000010000000 -fillradix binary /processor/fetchObj/instMem/RAM(768)    

# IN R3   
mem load -filltype value -filldata 0011000011000000 -fillradix binary /processor/fetchObj/instMem/RAM(769)    

# IN R4
mem load -filltype value -filldata 0011000100000000 -fillradix binary /processor/fetchObj/instMem/RAM(770)    

# LDM R1 , 5
mem load -filltype value -filldata 0110101001000000 -fillradix binary /processor/fetchObj/instMem/RAM(771)
mem load -filltype value -filldata {5} -fillradix hexadecimal /processor/fetchObj/instMem/RAM(772)      

# NOP   
mem load -filltype value -filldata 1101000000000000 -fillradix binary /processor/fetchObj/instMem/RAM(773) 

# NOP   
mem load -filltype value -filldata 1101000000000000 -fillradix binary /processor/fetchObj/instMem/RAM(774)   

# push R1
mem load -filltype value -filldata 1110010000001000 -fillradix binary /processor/fetchObj/instMem/RAM(775)    

# push R2 
mem load -filltype value -filldata 1110010000010000 -fillradix binary /processor/fetchObj/instMem/RAM(776)    

# pop R1
mem load -filltype value -filldata 1110101001000000 -fillradix binary /processor/fetchObj/instMem/RAM(777)    

# pop R2
mem load -filltype value -filldata 1110101010000000 -fillradix binary /processor/fetchObj/instMem/RAM(778)    

# in R5
mem load -filltype value -filldata 0011000101000000 -fillradix binary /processor/fetchObj/instMem/RAM(779)    

# NOP   
mem load -filltype value -filldata 1101000000000000 -fillradix binary /processor/fetchObj/instMem/RAM(780) 

# NOP   
mem load -filltype value -filldata 1101000000000000 -fillradix binary /processor/fetchObj/instMem/RAM(781)

# std R2 , 200(R5)
mem load -filltype value -filldata 0100011000010101 -fillradix binary /processor/fetchObj/instMem/RAM(782)    
mem load -filltype value -filldata {200} -fillradix hexadecimal /processor/fetchObj/instMem/RAM(783)    

# std R1 , 201(R5)
mem load -filltype value -filldata 0100011000001101 -fillradix binary /processor/fetchObj/instMem/RAM(784)    
mem load -filltype value -filldata {201} -fillradix hexadecimal /processor/fetchObj/instMem/RAM(785)  


# LDD R3 , 201(R5)
mem load -filltype value -filldata 0100010011101000 -fillradix binary /processor/fetchObj/instMem/RAM(786) 
mem load -filltype value -filldata {201} -fillradix hexadecimal /processor/fetchObj/instMem/RAM(787)    


# LDD R4 , 200(R5)
mem load -filltype value -filldata 0100010100101000 -fillradix binary /processor/fetchObj/instMem/RAM(788) 
mem load -filltype value -filldata {200} -fillradix hexadecimal /processor/fetchObj/instMem/RAM(789)        


# pop R3  --> Exception 
mem load -filltype value -filldata 1110101011000000 -fillradix binary /processor/fetchObj/instMem/RAM(790)    


# add R1 , R2 , R3 
mem load -filltype value -filldata 0000001001010011 -fillradix binary /processor/fetchObj/instMem/RAM(791)    


# reset 
force -freeze sim:/processor/rst 1 0
run 
force -freeze sim:/processor/rst 0 0
run
force -freeze sim:/processor/in 16'h19 0
run
force -freeze sim:/processor/in 16'hffff 0
run
force -freeze sim:/processor/in 16'hf320 0
run
force -freeze sim:/processor/in 16'h10 0