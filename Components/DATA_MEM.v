// +FHDR------------------------------------------------------------------------
// FILE NAME : DATA_MEM.v
// DEPARTMENT : Computer engineering, Cairo university
// AUTHOR : Ziad Atef
// -----------------------------------------------------------------------------
// RELEASE HISTORY
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 22-12-2021 ziad initial version
// -----------------------------------------------------------------------------
// PURPOSE : contains stack and heap memories to store variables
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
module DATA_MEM(
    clk,
    i_memRead,
    i_memWrite,
    i_en32,
    i_address,
    i_data_in,
    i_isStack, 
    o_data_out
 );
input clk;
input i_isStack;
input i_memRead;
input i_memWrite;
input i_en32;   
input [31:0] i_address;
input [31:0] i_data_in; 
output reg [31:0] o_data_out;

reg [15:0] RAM [0:2**20];
integer adrs;

always @(posedge clk) begin: data_mem_op
    adrs = i_address;
    if (i_memRead) begin
        if(i_en32) begin
            o_data_out = {RAM[adrs-1],RAM[adrs]};
        end
        else if(i_isStack) begin
            o_data_out = {16'b0,RAM[adrs + 1]};
        end    
        else begin
            o_data_out = {16'b0,RAM[adrs]};
        end
    end
    else begin
        o_data_out = {32{1'bz}};
    end

    if (i_memWrite) begin
        if(i_en32) begin
            {RAM[adrs-1],RAM[adrs]} = i_data_in;
        end
        else begin
            RAM[adrs] = i_data_in[15:0];
        end 
        
    end
end // data_mem_op
endmodule // DATA_MEM
