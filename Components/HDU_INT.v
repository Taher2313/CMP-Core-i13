module HDU_INT (
clk,
    i_instruction,
    o_int,
);
input clk;
input [31:0] i_instruction;
output reg o_int ;

always @(negedge clk) begin
    
    // output signal
    o_int = 1'b0;

    // if INT 
    if (i_instruction[31:25] == 7'b1111110) o_int <= 1'b1;
    
end

endmodule //HDU_INT
