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
mem load -filltype value -filldata { } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(1)
# .ORG 2 
mem load -filltype value -filldata { } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(3)
# .ORG 4 
mem load -filltype value -filldata { } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(5)
# .ORG 6 
mem load -filltype value -filldata { } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(7)
# .ORG 8 
mem load -filltype value -filldata { } -fillradix hexadecimal /processor/fetchObj/instMem/RAM(9)

# start Instruction  after ( [.ORG 0]  ) 
mem load -filltype value -filldata  -fillradix binary /processor/fetchObj/instMem/RAM()    


# reset 
force -freeze sim:/processor/rst 1 0
run 
force -freeze sim:/processor/rst 0 0

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