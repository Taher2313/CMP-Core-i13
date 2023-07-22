`timescale 10ns / 1ns
module RegFile_tb;
// Inputs
    reg clk , write_enable ;
    reg [15:0 ] write_data  ;
    reg [7:0]write_address, read_address ;
// Outputs
    wire [15:0] read_data;    
// Instantiate the Unit Under Test (UUT)
reg_file uut(
.clk(clk),
.write_enable(write_enable),
.write_data(write_data),
.write_address(write_address),
.read_address(read_address),
.read_data(read_data)   
);
// Initialize Inputs
    integer i;    
    initial begin
        clk=0;  
        write_enable=1;
        read_address = 0;
        #10
        for (i = 0;i<8 ;i= i+1 ) begin
            write_address= i;
            write_data= i*10;
	    #100
            read_address=i;
        end
        write_enable= 0;
        write_address= 0;
        for (i =0 ;i<8 ;i= i+1 ) begin
            read_address=i;
            write_data=i*5;
            #100
            write_address=i;
        end

        write_enable=1;
        read_address = 0;
        #10
        for (i = 0;i<8 ;i= i+1 ) begin
            write_address= i;
            write_data= i*5;
	    #100
            read_address=i;
        end
    end
    always
        #50 clk=~clk;    
endmodule

