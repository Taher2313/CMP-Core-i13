module reg_file ( 
    input wire clk,regWrite,
    input wire  [15:0] writeData,
    input wire  [2: 0] Rsrc1,Rsrc2,Rdst,
    output wire [15:0] readData1, readData2
);
    reg [15:0] array_reg [0:7];
    always @(posedge clk) begin
        if(regWrite)
            array_reg[Rdst] = writeData ;
    end
    assign readData1 = array_reg[Rsrc1];
    assign readData2 = array_reg[Rsrc2];
endmodule