`timescale 10ns / 1ns
module fetch_tb;
// Inputs
    reg  clk; 
    reg [1:0] pc_select ;
    reg [3:0] pc_place ;
    reg [2:0] index ;
    reg [31:0] IVT , ret , reset ;
    reg [15:0] call ;
// Outputs
    wire [31:0] new_pc , instruction ; 
    // wire intFlag      ;
// Instantiate the Unit Under Test (UUT)
fetch uut(
    .clk(clk),
    .pc_select(pc_select),
    .pc_place(pc_place),
    .index(index),
    .IVT(IVT),
    .ret(ret),
    .reset(reset),
    .call(call),
    .new_pc(new_pc) , 
    .instruction(instruction)
    // ,.intFlag(intFlag)
);
// Initialize Inputs
    initial begin
        clk=0;
        index=3;
        IVT =12 ;
        ret= 27; 
        call = 33;
        reset = 57;
        pc_select=0;

        #10
        pc_place = 1;
        #100
        pc_place = 2;
        #100
        pc_place= 3;
        #100
        pc_place= 4;    
        #100
        pc_place= 5;    
        #100
        pc_place= 6;    
        #100
        pc_place= 7;    
        #100
        pc_place= 8;
        #100
        pc_place=0;
        pc_select=0;
        #100
        pc_select=1;
        #100
        pc_select=2;
    end
    always
        #50 clk=~clk;    
endmodule

