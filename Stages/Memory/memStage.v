module memStage(
    input  clk , 
    input  i_isStack, i_reset, i_isPushPc,
    input  i_memRead, i_memWrite, i_en32,
    input  [1:0]  i_wb, 
    input  [15:0] i_aluData,
    input  [31:0] i_pc,  
    input  [31:0] i_instruction,   // refers to instruction come from buffer (name as x in pdf)
    input  [31:0] prev_SP,
    input  [2:0] SP_select,
    input  is_Prev_SP,
    input reset_epc,
    input [3:0]in_flags,

    output wire[1:0] changeEPC,
    output reg [1 :0] o_wb,
    output [15:0] o_aluData,
    output [31:0] o_memData,
    output [31:0] new_SP
    // output  reg [19:0] o_hazardUnit
);
    reg  [31:0]  address;
    reg  [31:0]  writeData;
    reg [31:0] EPC;
    wire  [31:0]  SP_out;

    assign new_SP = SP_out;
    // always @(posedge clk) begin
    STACK_POINTER SP (.clk(clk) , .Control_Mux(SP_select) , .Rst(i_reset),.Output_Signal(SP_out));

    always @(*) begin

        if (reset_epc) begin 
            EPC = 0;
        end

        if (changeEPC != 2'b00) begin 
            EPC = i_pc;
        end

        if(i_isStack) begin
            address = (is_Prev_SP) ? prev_SP : SP_out;
        end
        else begin
            address ={16'b0,i_aluData};
        end
        // o_hazardUnit = address;
        if(i_isPushPc) begin
          writeData = ((i_pc + 1) | {in_flags , 28'd0} );
        end
        else begin
          writeData = i_instruction;
        end        
        if(i_reset) begin
            o_wb = 0;
        end 
        else begin
            o_wb = i_wb;    
        end
    end
    DATA_MEM mem1(
        .clk(clk),
        .i_memRead(i_memRead),
        .i_memWrite(i_memWrite),
        .i_en32(i_en32),
        .i_address(address),
        .i_data_in(writeData),
        .i_isStack(i_isStack),
        .o_data_out(o_memData)
    );

    
    HDU_EXCEPTIONS hduExceptions(
        .i_address(address),
        .o_changeEPC(changeEPC),
        .mem_write(i_memWrite),
        .clk(clk),
        .mem_read(i_memRead)
    );
    assign o_aluData = i_aluData ; 
endmodule