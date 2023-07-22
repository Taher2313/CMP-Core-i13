// +FHDR------------------------------------------------------------------------
// FILE NAME : ALU.v
// DEPARTMENT : Computer engineering, Cairo university
// AUTHOR : Ziad Atef
// -----------------------------------------------------------------------------
// RELEASE HISTORY
// VERSION DATE AUTHOR DESCRIPTION
// 1.0   17-12-2021 ziad initial version
// 1.0.1 23-12-2021 ziad added set c to the operations
// -----------------------------------------------------------------------------
// PURPOSE : perform all the arithmatic and logic operations.
// -----------------------------------------------------------------------------
// PARAMETERS
// PARAM NAME RANGE : DESCRIPTION : DEFAULT : UNITS
// N/A
// -----------------------------------------------------------------------------
// REUSE ISSUES () this is just illustration and will be modified
// Reset Strategy : Asynchronous, active low system level reset
// Clock Domains : core_32m_clk, system_clk
// Critical Timing : N/A
// Test Features : Prescaler is bypassed when scan_mode is asserted
// Asynchronous I/F : reset_b
// Scan Methodology : Mux-D
// Instantiations : N/A
// Synthesizable : Y
// Other : uses synthesis directive to infer a mux to
// avoid glitching clock_out and clock_out_b
// -FHDR------------------------------------------------------------------------
module ALU(
 operand1,
 operand2,
 operation,
 flags_in,
 result, 
 flags_out
 );
input[15:0] operand1;  // value of the first register coming from register file
input[15:0] operand2;  // value of the second register coming from register file
input[2:0] operation;  // operation to be done on the operands
input[3:0] flags_in; // 0 ==> zero flag // 1 ==> negative flage // 2 ==> carry flag
output reg [15:0] result;   // result of the operation
output reg [3:0] flags_out; // 0 ==> zero flag // 1 ==> negative flage // 2 ==> carry flag



always @(operand1 or operand2 or operation)
begin: alu_op
    flags_out  = flags_in;
    case (operation)  
        3'b000 :  //addition
            begin
                { flags_out[2],result } = operand1 + operand2; 

                if (result[15] == 1)
                    flags_out[1] = 1'b1;  
                else 
                     flags_out[1] = 1'b0;  
                     
                if (result == 0)
                    flags_out[0] = 1'b1; 
                else
                    flags_out[0] = 1'b0; 
            end    
        3'b001 :  //set c
            begin
                flags_out[2] = 1'b1;                                   
                result = 0;               
            end
        3'b010 : //subtraction
            begin
                result = operand1 - operand2; 

                if (operand2 > operand1)
                    flags_out[2] = 1'b1; 
                else
                    flags_out[2] = 1'b0; 

                if (result[15] == 1)
                    flags_out[1] = 1'b1;  
                else 
                     flags_out[1] = 1'b0;

                if (result == 0)
                    flags_out[0] = 1'b1; 
                else
                    flags_out[0] = 1'b0;  
            end    
        3'b011 :  //bit-wise and
            begin
                result = operand1 & operand2;

                if (result[15] == 1)
                    flags_out[1] = 1'b1;  
                else 
                     flags_out[1] = 1'b0; 

                if (result == 0)
                    flags_out[0] = 1'b1; 
                else
                    flags_out[0] = 1'b0; 
            end   
        3'b100 :  //complment(not)
            begin            
                result = ~operand1;

                if (result[15] == 1)
                    flags_out[1] = 1'b1;  
                else 
                     flags_out[1] = 1'b0; 

                if (result == 0)
                    flags_out[0] = 1'b1; 
                else
                    flags_out[0] = 1'b0;  
            end
        3'b101 :    result = operand1;           //pass first operand
        3'b110 :    result = operand2;           //pass second operand
        3'b111 :    result = {16{1'b0}};         //none of the above cases                          
    endcase 
/*
    //addition
    if ( operation == 3'b000 )
	    { flags_out[0],result } <= operand1 + operand2;
    //set c
    else if ( operation == 3'b001 )
        flags_out[0] <= 1'b1;
    //subtraction
    else if ( operation == 3'b010 )
        result <= operand1 - operand2;
    //bit-wise and
    else if ( operation == 3'b011 )
        result <= operand1 & operand2;
    //complment(not)
    else if ( operation == 3'b100 )
        result <= ~operand1;
    //pass first operand
    else if ( operation == 3'b101 )
        result <= operand1;
    //pass second operand
    else if ( operation == 3'b110 )
        result <= operand2;
//    else if ( operation == 3'b111 )
*/
end // alu_op
endmodule // ALU