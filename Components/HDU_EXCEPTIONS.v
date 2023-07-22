module HDU_EXCEPTIONS (
    i_address,
    mem_read,
    mem_write,
    clk,
    o_changeEPC,
);
input  clk; 
input [31:0] i_address;
input mem_read, mem_write;
output reg [1:0] o_changeEPC;

always @(negedge clk) begin
    
    o_changeEPC = 2'b00;
    if (mem_read || mem_write)
    begin
        if ((i_address[31:0] >= 32'h00100000 )) o_changeEPC = 2'b01;
        else if  (i_address[31:0] > 32'h0000ff00 && i_address[31:0] < 32'h00010000 )  o_changeEPC = 2'b10;
        else o_changeEPC = 2'b00;        
    end
    
end


endmodule //HDU_EXCEPTIONS
