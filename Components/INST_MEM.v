// +FHDR------------------------------------------------------------------------
// FILE NAME : INST_MEM.v
// DEPARTMENT : Computer engineering, Cairo university
// AUTHOR : Ziad Atef
// -----------------------------------------------------------------------------
// RELEASE HISTORY
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 22-12-2021 ziad initial version
// -----------------------------------------------------------------------------
// PURPOSE : stores program instructions to be used
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
module INST_MEM(
    address,
    data_out
 );
    input [31:0] address;
    output reg [31:0] data_out;

    reg [15:0] RAM [0:2**20];
    integer adrs;
   always @(address) begin
      adrs = address;
      data_out = {RAM[adrs],RAM[adrs+1]};
   end
endmodule // INST_MEM
