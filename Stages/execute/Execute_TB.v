module Execute_TB;

    reg clk;
    reg flag_src;
    reg data1;
    reg data2;
    reg imm;
    reg[1:0] ALUsrc1;
    reg[1:0] ALUsrc2;
    reg[2:0] ALUoperation;
    reg[3:0] mem_flags;
    reg[3:0] input_flags;
    reg[15:0] imm_val;
    reg[15:0] data1_val;
    reg[15:0] data2_val;
    reg[15:0] prev_ALU;
    reg[15:0] prev_mem;

    wire[15:0]ALU_out;
    wire[3:0] output_flags;

execute ex(.clk(clk), 
           .flag_src(flag_src), 
           .data1(data1), 
           .data2(data2),
           .imm(imm),
           .ALUsrc1(ALUsrc1),
           .ALUsrc2(ALUsrc2),
           .ALUoperation(ALUoperation),
           .mem_flags(mem_flags),
           .input_flags(input_flags),
           .imm_val(imm_val),
           .data1_val(data1_val),
           .data2_val(data2_val),
           .prev_ALU(prev_ALU),
           .prev_mem(prev_mem),
           .ALU_out(ALU_out),
           .output_flags(output_flags));


initial begin

    clk = 0 ;
    flag_src=0 ;
    data1= 1;
    data2= 1 ;
    imm =0 ;
    ALUsrc1 = 0  ;
    ALUsrc2 = 0 ;
    mem_flags= 0 ;
    imm_val= 0;
    prev_ALU= 0;
    prev_mem=0 ;

    data1_val  = 16'h0ffe;
    data2_val  = 16'h0000;
    ALUoperation = 3'b000;
    input_flags  = 4'b0000;

    #10
    data1_val  = 16'hffff;
    data2_val  = 16'h0000;
    ALUoperation = 3'b000;
    input_flags  = output_flags;

    #10
    data1_val  = 16'hffff;
    data2_val  = 16'hffff;
    ALUoperation = 3'b000;
    input_flags  = output_flags;
    
    #10
    data1_val  = 16'h0000;
    data2_val  = 16'h0000;
    ALUoperation = 3'b000;
    input_flags  = output_flags;

    #10
    data1_val  = 16'hffff;
    data2_val  = 16'hffff;
    ALUoperation = 3'b010;
    input_flags  = output_flags;

    #10
    data1_val  = 16'hffff;
    data2_val  = 16'h0001;
    ALUoperation = 3'b010;
    input_flags  = output_flags;

    #10
    data1_val  = 16'h0ffe;
    data2_val  = 16'h0fff;
    ALUoperation = 3'b010;
    input_flags  = output_flags;

end

endmodule //Execute_TB
