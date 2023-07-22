module fetch(
    input clk,
    input [1:0] pc_select ,
    input [3:0] pc_place ,
    input [2:0] index,
    input [31:0] IVT , ret , reset,
    input [15:0] call,

    output [31:0] instruction,  
    output reg [31:0] new_pc ,
    output wire to_CU
    // ,output reg intFlag     
);

    reg [31:0] tempPc = -1;
    HDU_INT u(.i_instruction(instruction) , .o_int(to_CU), .clk(clk));
    always @(posedge clk) begin
    // always @(*) begin
        case (pc_place)
            4'b0000:
                case (pc_select) 
                    4'b00:
                        tempPc = tempPc;
                    4'b01:
                        tempPc = tempPc+1;
                    4'b10:
                        tempPc = tempPc+2;
                    default:
                        tempPc = tempPc + 1; 
                endcase
            4'b0001:     
                tempPc  =  0;
            4'b0010:
                tempPc  =  2;
            4'b0011:
                tempPc  =  4;
            4'b0100:
                tempPc  =  6;
            4'b0101:
                tempPc  = index + instruction;
            4'b0110:
                tempPc  = {4'b0,ret[27:0]};
            4'b0111:
                tempPc  = { {16{1'b0}} , call};
            4'b1000:
                tempPc  = instruction; // zero extend 
            default:
                tempPc = tempPc + 1;
        endcase
        new_pc  = tempPc;
        // intFlag = 1;
    end
    INST_MEM instMem(
        .address(new_pc),
        .data_out(instruction)
    );

endmodule