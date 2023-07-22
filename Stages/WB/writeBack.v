module writeBack(
    input sel,
    input [31:0] memData,
    input [15:0] aluData,

    output reg [15:0] writeBackData
);
    always @(*) begin
        if (sel) 
            writeBackData = aluData;
        else 
            writeBackData = memData[15:0];
    end
endmodule