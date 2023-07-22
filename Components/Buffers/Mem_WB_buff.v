module Mem_WB_buff     
    #( parameter    
        WbSize  = 2
    )(
    input rst, 
    input  clk,enable,

    input  [WbSize-1 :0 ] i_WB,
    input  [31:0] i_MemData ,
    input  [15:0] i_alu,
    input  [2:0 ] i_Rdst, 
    input [31:0] i_SP,
    input [1:0] i_changeEPC,
    
    output reg [WbSize-1 :0 ] o_WB,
    output reg [31:0] o_MemData ,
    output reg [15:0] o_alu,
    output reg [ 2:0] o_Rdst ,
    output reg  [31:0] o_SP,
    output reg [1:0] o_changeEPC
);
    always @(negedge clk) begin
        if(rst == 1'b1) begin
            o_WB       <=  0;
            o_MemData  <=  0;
            o_alu      <=  0;
            o_Rdst     <=  0;
            o_SP       <=  0;
            o_changeEPC <= 0;
        end
        else if(enable == 1'b1) begin
            o_WB       <=  i_WB;
            o_MemData  <=  i_MemData;
            o_alu      <=  i_alu;
            o_Rdst     <=  i_Rdst;
            o_SP       <= i_SP;
            o_changeEPC <= i_changeEPC;
        end
    end
endmodule
