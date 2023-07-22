`timescale 10ns / 1ns
module FORWARDING_UNIT_TB;

// Inputs:
reg [2:0] Rsrc1;
reg [2:0] Rsrc2;
reg [2:0] Rdst_mem;
reg [2:0] Rdst_wb;
reg WB_mem;
reg WB_wb;

// Outputs:
wire [1:0] exec_sel1;
wire [1:0] exec_sel2;


FORWARDING_UNIT uut(.Rsrc1(Rsrc1), .Rsrc2(Rsrc2), .Rdst_mem(Rdst_mem), .Rdst_wb(Rdst_wb), .WB_mem(WB_mem), .WB_wb(WB_wb), .exec_sel1(exec_sel1), .exec_sel2(exec_sel2));

initial begin
    Rsrc1 = 3'b000;
    Rsrc2 = 3'b001;
    Rdst_mem = 3'b010;
    Rdst_wb = 3'b011;
    WB_mem = 1'b0;
    WB_wb = 1'b0;

    #10
    Rsrc1 = 3'b000;
    Rsrc2 = 3'b001;
    Rdst_mem = 3'b001;
    Rdst_wb = 3'b011;
    WB_mem = 1'b1;
    WB_wb = 1'b0;

    #10

    Rsrc1 = 3'b000;
    Rsrc2 = 3'b001;
    Rdst_mem = 3'b010;
    Rdst_wb = 3'b000;
    WB_mem = 1'b0;
    WB_wb = 1'b1;

    #10

    Rsrc1 = 3'b000;
    Rsrc2 = 3'b001;
    Rdst_mem = 3'b000;
    Rdst_wb = 3'b000;
    WB_mem = 1'b0;
    WB_wb = 1'b1;



end
endmodule
