module FORWARDING_UNIT(Rsrc1, Rsrc2,  Rdst_mem, Rdst_wb, WB_mem, WB_wb, exec_sel1, exec_sel2);
input [2:0] Rsrc1;
input [2:0] Rsrc2;
input [2:0] Rdst_mem;
input [2:0] Rdst_wb;
input WB_mem;
input WB_wb;
output wire [1:0] exec_sel1;
output wire [1:0] exec_sel2;

reg [1:0] exec_sel1_temp, exec_sel2_temp;

assign exec_sel1 = exec_sel1_temp;
assign exec_sel2 = exec_sel2_temp;

always @(*) begin
    
    // Initialize select signals to zeros
    {exec_sel1_temp, exec_sel2_temp} = 2'b00;

    // For Rsrc1 
    
    if (WB_wb && (Rsrc1 == Rdst_wb)) exec_sel1_temp = 2'b10;
    if (WB_mem && ( Rsrc1 == Rdst_mem)) exec_sel1_temp = 2'b01;

    // For Rsrc2
    if (WB_wb && (Rsrc2 == Rdst_wb)) exec_sel2_temp = 2'b10;
    if (WB_mem &&(Rsrc2 == Rdst_mem)) exec_sel2_temp = 2'b01;

end
endmodule


