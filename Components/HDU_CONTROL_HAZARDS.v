module HDU_CONTROL_HAZARDS (
    i_EX, 
    i_flags,
    o_control_unit
    
);

input [2:0]   i_EX; // 3 bits to detect which case in the list below
input [3:0]   i_flags; // 0 ==> zero flag // 1 ==> negative flage // 2 ==> carry flag
output reg    o_control_unit;

// Not any of these instructions  case 0

// JZ Rdst          case 1
// JN Rdst          case 2
// JC Rdst          case 3

// JMP Rdst         case 4
// CALL Rdst        case 4
// RET              case 4
// INT index        case 4
// RTI              case 4

always @(*) begin
    
    o_control_unit = 1'b0;   
    case (i_EX)
        3'b001:
            begin
                if (i_flags[0] == 1)
                    o_control_unit = 1'b1; 
            end
        3'b010:
            begin
                if (i_flags[1] == 1)
                    o_control_unit = 1'b1; 
            end
        3'b011:
            begin
                if (i_flags[2] == 1)
                    o_control_unit = 1'b1; 
            end
        3'b100: o_control_unit = 1'b1; 
        default : o_control_unit = 1'b0; 
    endcase
end


endmodule //HDU_CONTROL_HAZARDS
