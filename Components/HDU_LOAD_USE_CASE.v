module HDU_LOAD_USE_CASE (
    i_Rsrc1,
    i_Rsrc2,
    i_Rdst,
    i_memRead,
    o_control_unit
);

input [2:0] i_Rsrc1;
input [2:0] i_Rsrc2;
input [2:0] i_Rdst;
input i_memRead; // read data into Rdst 
output reg o_control_unit;

always @(*) begin
    
    o_control_unit = 1'b0;    
    if (((i_Rsrc1 == i_Rdst ) || (i_Rsrc2 == i_Rdst)) && i_memRead) o_control_unit = 1'b1;   

end

endmodule //HDU_LOAD_USE_CASE
