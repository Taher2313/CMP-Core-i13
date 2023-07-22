`timescale 10ns / 1ns
module instMemTB;
// Inputs
    reg [31:0] address; 
// Outputs
    wire [31:0] data_out ;
// Instantiate the Unit Under Test (UUT)
INST_MEM uut(
    .address(address),
    .data_out(data_out)
);
// Initialize Inputs
    initial begin
        address=5;
        #10
        address=15;
        #10
        address=25;
        #10
        address=55;
        #10
        address=60;
        #10
        address=21;
        #10
        address=0;
    end
endmodule

