module ALU_TB ;

reg [15:0] operand1;  // value of the first register coming from register file
reg[15:0] operand2;  // value of the second register coming from register file
reg[2:0] operation;  // operation to be done on the operands
reg[3:0] flags_in; // 0 ==> zero flag // 1 ==> negative flage // 2 ==> carry flag
wire [15:0] result;   // result of the operation
wire [3:0] flags_out; // 0 ==> zero flag // 1 ==> negative flage // 2 ==> carry flag

//  operand1,
//  operand2,
//  operation,
//  flags_in,
//  result, 
//  flags_out


ALU alu(.operand1(operand1), .operand2(operand2), .operation(operation), .flags_in(flags_in), .result(result), .flags_out(flags_out));

initial begin
    operand1  = 16'h0ffe;
    operand2  = 16'h0000;
    operation = 3'b000;
    flags_in  = 4'b0000;

    #10
    operand1  = 16'hffff;
    operand2  = 16'h0000;
    operation = 3'b000;
    flags_in  = flags_out;

    #10
    operand1  = 16'hffff;
    operand2  = 16'hffff;
    operation = 3'b000;
    flags_in  = flags_out;
    
    #10
    operand1  = 16'h0000;
    operand2  = 16'h0000;
    operation = 3'b000;
    flags_in  = flags_out;

    #10
    operand1  = 16'hffff;
    operand2  = 16'hffff;
    operation = 3'b010;
    flags_in  = flags_out;

    #10
    operand1  = 16'hffff;
    operand2  = 16'h0001;
    operation = 3'b010;
    flags_in  = flags_out;

    #10
    operand1  = 16'h0ffe;
    operand2  = 16'h0fff;
    operation = 3'b010;
    flags_in  = flags_out;

end
endmodule //ALU_TB
