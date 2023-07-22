module STACK_POINTER(
    clk,
    Control_Mux,
    Rst,
    Output_Signal
);
input [2:0] Control_Mux;
input Rst , clk;
output reg[31:0] Output_Signal;

always @(posedge clk) begin
    //RESET
    if (Rst) Output_Signal = 1048575;
    else 
    begin
    case (Control_Mux)
        3'b000  : Output_Signal = Output_Signal ;
        3'b001: Output_Signal = Output_Signal + 2;
        3'b010: Output_Signal = Output_Signal - 2;
        3'b011: Output_Signal = Output_Signal + 1;
        3'b100: Output_Signal = Output_Signal - 1;
        default :Output_Signal = Output_Signal ;
      endcase   
    end
end
endmodule