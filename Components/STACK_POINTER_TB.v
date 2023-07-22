`timescale 10ns / 1ns
module STACK_POINTER_TB;

// Inputs:

reg clk;
reg [2:0] Control_Mux;
reg Rst;

// Outputs:
wire [31:0] Output_Signal;

STACK_POINTER uut(.clk(clk), .Control_Mux(Control_Mux), .Rst(Rst), .Output_Signal(Output_Signal));

initial begin
    Rst = 1'b1;
    clk = 1'b1;
    Control_Mux = 3'b000;
    #10

    Rst = 1'b0;
    Control_Mux = 3'b001;
    #10

    Control_Mux = 3'b010;
    #10

    Control_Mux = 3'b011;
    #10

    Control_Mux = 3'b100;
    #10

    Control_Mux = 3'b101;
    #10
    
    Control_Mux = 3'b110;
    #10    

    Control_Mux = 3'b111;
  
    
end
endmodule
