vsim -gui work.processor
add log -r /*
add wave -position insertpoint sim:/processor/*
add wave -position insertpoint  \
sim:/processor/ExcecuteObj/data1_val \
sim:/processor/ExcecuteObj/data2_val \
sim:/processor/ExcecuteObj/data1 \
sim:/processor/ExcecuteObj/data2


# load Reg File incremental
mem load -skip 0 -filltype inc -filldata 1 -fillradix hexadecimal /processor/decodeObj/u1/array_reg
mem load -skip 0 -filltype value -filldata 0 -fillradix binary /processor/fetchObj/instMem/RAM
mem load -skip 0 -filltype inc -filldata 0 -fillradix hexadecimal /processor/MemStageObj/mem1/RAM
mem load -skip 0 -filltype inc -filldata 0 -fillradix hexadecimal /processor/MemStageObj/mem1/RAM
# clock with 100ps period 
force -freeze sim:/processor/clk 0 0, 1 {50 ps} -r 100

# LDD Rdst, Rsrc1 --> R[Rdst] = M[ imm +R[Rsrc1]] Rdst =2 , Rsrc1=2, imm = 10 , 
mem load -filltype value -filldata 0000000000001010 -fillradix binary /processor/fetchObj/instMem/RAM(0)  
mem load -filltype value -filldata 0100010011001000 -fillradix binary /processor/fetchObj/instMem/RAM(1)


# LDM --> R[Rdst] = M[imm] Rdst =2 , imm = 15
#mem load -filltype value -filldata 0000000000001111 -fillradix binary /processor/fetchObj/instMem/RAM(0)  
#mem load -filltype value -filldata 0110101011001111 -fillradix binary /processor/fetchObj/instMem/RAM(1)  
#NOP
# mem load -filltype value -filldata 1101000001010011 -fillradix binary /processor/fetchObj/instMem/RAM(1)
#mov
#mem load -filltype value -filldata 0010101001010011 -fillradix binary /processor/fetchObj/instMem/RAM(1)






# first test case
#mem load -filltype value -filldata 0010101101011000 -fillradix binary /processor/fetchObj/instMem/RAM(1)        
#mem load -filltype value -filldata 0000001100001100 -fillradix binary /processor/fetchObj/instMem/RAM(2)        
#mem load -filltype value -filldata 1101000101101101 -fillradix binary /processor/fetchObj/instMem/RAM(3)        
#mem load -filltype value -filldata 1101000101101101 -fillradix binary /processor/fetchObj/instMem/RAM(4)        
#mem load -filltype value -filldata 0001001110101100 -fillradix binary /processor/fetchObj/instMem/RAM(5)        
#mem load -filltype value -filldata 0001101100111100 -fillradix binary /processor/fetchObj/instMem/RAM(6)        
#mem load -filltype value -filldata 1111111111111111 -fillradix binary /processor/fetchObj/instMem/RAM(7)        
#mem load -filltype value -filldata 0100000010010000 -fillradix binary /processor/fetchObj/instMem/RAM(8)        
#mem load -filltype value -filldata 1101000101101101 -fillradix binary /processor/fetchObj/instMem/RAM(9)        
#mem load -filltype value -filldata 1101000101101101 -fillradix binary /processor/fetchObj/instMem/RAM(10)       
#mem load -filltype value -filldata 1101000101101101 -fillradix binary /processor/fetchObj/instMem/RAM(11)       
#mem load -filltype value -filldata 0000001010001010 -fillradix binary /processor/fetchObj/instMem/RAM(12)       
# NOP
# 1101000101101101
#mov r3 , r5 
#0010101101011000
#add r4 , r1 ,r4
#0000001100001100
#
# sub r6 , r5 , r4
#0001001110101100
#
#and r4 , r7 , r4
#0001101100111100
#
# iadd r2 , r2 , ffff
#1111111111111111
#0100000010010000
#
# add r2 , r1 , r2
#0000001010001010
#
# load Reg File
#mem load -skip 0 -filltype value -filldata 0 -fillradix unsigned /processor/decodeObj/u1/array_reg
#mem load -filltype value -filldata 5 -fillradix decimal /processor/decodeObj/u1/array_reg(1)
#mem load -filltype value -filldata 25 -fillradix decimal /processor/decodeObj/u1/array_reg(2)
#mem load -filltype value -filldata 65535 -fillradix decimal /processor/decodeObj/u1/array_reg(3)
#mem load -filltype value -filldata 62240 -fillradix unsigned /processor/decodeObj/u1/array_reg(4)