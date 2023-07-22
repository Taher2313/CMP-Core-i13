`timescale 10ns / 1ps
module fetch_dec__buff_tb;
// Inputs
    reg clk ,rst , enable;
    reg [31:0] i_pc , i_instruction;
// Outputs
    wire [31:0] o_pc , o_instruction;
// Instantiate the Unit Under Test (UUT)
    fetch_dec_buf uut (
        // .rst(rst),
        .clk(clk),  .enable(enable),
        .i_pc(i_pc), 
        .i_instruction(i_instruction),
        .o_pc(o_pc),
        .o_instruction(o_instruction)
    );
// Initialize Inputs
    initial begin
        enable = 0;
        clk = 0;
        // rst = 0;
        i_pc=0;
        i_instruction=0;
    end
    always
        #50 clk=~clk;

    always begin
        i_pc =5;
        i_instruction=10;
        enable=1;
        #60
        i_pc =20;
        i_instruction=30;
        #110
        i_pc =5;
        i_instruction=10;
        enable=1;
        #160
        i_pc =5;
        i_instruction=10;
        enable=1;
        #210
        i_pc =55;
        i_instruction=67;
        enable=0;
        #260
        i_pc =7;
        i_instruction=9;
        #310
        enable=1;
        i_pc =99;
        i_instruction=199;    
    end
    // always  begin
    //   #1000 rst=1;
    // end
    
endmodule
