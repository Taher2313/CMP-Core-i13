vsim -gui work.processor
add log -r /*
add wave -position insertpoint sim:/processor/*

# initailize DataMem , InstMem , RegFile 
mem load -skip 0 -filltype value -filldata 0 -fillradix hexadecimal /processor/fetchObj/instMem/RAM
mem load -skip 0 -filltype value -filldata 0 -fillradix hexadecimal /processor/decodeObj/u1/array_reg
mem load -skip 0 -filltype value -filldata 0 -fillradix hexadecimal /processor/MemStageObj/mem1/RAM
# clock
force -freeze sim:/processor/clk 0 0, 1 {50 ps} -r 100


# .ORG 0 
mem load -filltype value -filldata {10 }  -fillradix hexadecimal /processor/fetchObj/instMem/RAM(1)
# .ORG 2 
mem load -filltype value -filldata {400 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(3)
# .ORG 4 
mem load -filltype value -filldata {450 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(5)
# .ORG 6 
mem load -filltype value -filldata {200 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(7)
# .ORG 8 
mem load -filltype value -filldata {250 } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(9)


#-------------------------- .ORG 200  (200 HEX --> 512 dec ) ---------------------------------- 
# and R0 , R0 , R0
mem load -filltype value -filldata 0001101000000000 -fillradix binary /processor/fetchObj/instMem/RAM(512)   
# out R6 
mem load -filltype value -filldata 0011001000110000 -fillradix binary /processor/fetchObj/instMem/RAM(513)
# reti
mem load -filltype value -filldata 1111100000000000  -fillradix binary /processor/fetchObj/instMem/RAM(514)

#-------------------------- .ORG 250  (250 hex -->  592 dec )---------------------------------- 
# Setc
mem load -filltype value -filldata 1100010000000000 -fillradix binary /processor/fetchObj/instMem/RAM(592)   
# and R0 , R0 , R0 
mem load -filltype value -filldata 0001101000000000 -fillradix binary /processor/fetchObj/instMem/RAM(593)
# out R2
mem load -filltype value -filldata 0011001000010000 -fillradix binary /processor/fetchObj/instMem/RAM(594)
# RETI
mem load -filltype value -filldata 1111100000000000 -fillradix binary /processor/fetchObj/instMem/RAM(595)


#-------------------------- .ORG 10  (10 hex -->  16 dec  )---------------------------------- 
# IN R1  
mem load -filltype value -filldata 0011000001000000 -fillradix binary /processor/fetchObj/instMem/RAM(16)    

# IN R2   
mem load -filltype value -filldata 0011000010000000 -fillradix binary /processor/fetchObj/instMem/RAM(17)    

# IN R3
mem load -filltype value -filldata 0011000011000000 -fillradix binary /processor/fetchObj/instMem/RAM(18)    

# IN R4
mem load -filltype value -filldata 0011000100000000 -fillradix binary /processor/fetchObj/instMem/RAM(19)    

# push R4
mem load -filltype value -filldata 1110010100000000 -fillradix binary /processor/fetchObj/instMem/RAM(20)    

# INT 2
mem load -filltype value -filldata 1111110010000000 -fillradix binary /processor/fetchObj/instMem/RAM(21)    

# JMP R1
mem load -filltype value -filldata 1010111000001000 -fillradix binary /processor/fetchObj/instMem/RAM(22)    

# INC R1
mem load -filltype value -filldata 0000011001001000 -fillradix binary /processor/fetchObj/instMem/RAM(23)    
  

#-------------------------- .ORG 30  (30 hex -->  48 dec  )  ---------------------------------- 
# AND R5 , R1 , R5
mem load -filltype value -filldata 0001101101001101 -fillradix binary /processor/fetchObj/instMem/RAM(48)  

# JZ R2
mem load -filltype value -filldata 1010100000010000 -fillradix binary /processor/fetchObj/instMem/RAM(49)  

# SETC 
mem load -filltype value -filldata 1100010000000000 -fillradix binary /processor/fetchObj/instMem/RAM(50)  


#-------------------------- .ORG 50  (50 hex --> 80 dec ) ---------------------------------- 
# JZ R1
mem load -filltype value -filldata 1010100000001000 -fillradix binary /processor/fetchObj/instMem/RAM(80)  

# JC R3
mem load -filltype value -filldata 1010110000011000 -fillradix binary /processor/fetchObj/instMem/RAM(81)  

# NOT R5
mem load -filltype value -filldata 0010001101101000 -fillradix binary /processor/fetchObj/instMem/RAM(82)  

# INT 0
mem load -filltype value -filldata 1111110000000000 -fillradix binary /processor/fetchObj/instMem/RAM(83)  

# IN R6
mem load -filltype value -filldata 0011000110000000 -fillradix binary /processor/fetchObj/instMem/RAM(84)  

# JN R6
mem load -filltype value -filldata 1010101000110000 -fillradix binary /processor/fetchObj/instMem/RAM(85)  

# INC R1 
mem load -filltype value -filldata 0000011001001000 -fillradix binary /processor/fetchObj/instMem/RAM(86)  


#-------------------------- .ORG 700 ( 700 hex  -->  1792 dec  )---------------------------------- 
# SETC
mem load -filltype value -filldata 1100010000000000 -fillradix binary /processor/fetchObj/instMem/RAM(1792)  

# POP R6
mem load -filltype value -filldata 1110101110000000 -fillradix binary /processor/fetchObj/instMem/RAM(1793)  

# CALL R6
mem load -filltype value -filldata 1111010000110000 -fillradix binary /processor/fetchObj/instMem/RAM(1794)  

# INC R6
mem load -filltype value -filldata 0000011110110000 -fillradix binary /processor/fetchObj/instMem/RAM(1795)  

# NOP
mem load -filltype value -filldata 1101000000000000 -fillradix binary /processor/fetchObj/instMem/RAM(1796)  

# NOP
mem load -filltype value -filldata 1101000000000000 -fillradix binary /processor/fetchObj/instMem/RAM(1797)  


#-------------------------- .ORG 300 ( 300 hex -->   768 )---------------------------------- 
# ADD R6 , R3 , R6
mem load -filltype value -filldata 0000001110011110 -fillradix binary /processor/fetchObj/instMem/RAM(768)  

# ADD R1 , R1 , R2
mem load -filltype value -filldata 0000001001001010 -fillradix binary /processor/fetchObj/instMem/RAM(769)  

# RET
mem load -filltype value -filldata 1111100000000000 -fillradix binary /processor/fetchObj/instMem/RAM(770)  

# SETC 
mem load -filltype value -filldata 1100010000000000 -fillradix binary /processor/fetchObj/instMem/RAM(771)  

#-------------------------- .ORG 500 ( 500 hex -->  1280  dec ) ---------------------------------- 
# NOP
mem load -filltype value -filldata 1101000000000000 -fillradix binary /processor/fetchObj/instMem/RAM(1280)  

# NOP 
mem load -filltype value -filldata 1101000000000000 -fillradix binary /processor/fetchObj/instMem/RAM(1280)  



# ----------------------------------------------------------   RESET AND IN -----------------------
 
force -freeze sim:/processor/rst 1 0
run 
force -freeze sim:/processor/rst 0 0
run
force -freeze sim:/processor/in 16'h30 0
run
force -freeze sim:/processor/in 16'h50 0
run 
force -freeze sim:/processor/in 16'h100 0
run
force -freeze sim:/processor/in 16'h300 0
run

