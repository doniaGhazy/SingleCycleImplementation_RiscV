`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 04/15/2020 05:13:32 PM
// Module Name: BranchMux
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: The Multiplexer after the Branch Selector
// Change History:
//                      Last modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------



module BranchMux( input [31:0] PC4, PCoffset, PCALU, input [1:0] OutputSelector, output reg [31:0] inputMuxPc );

always @(*)
begin
case (OutputSelector)

2'b00:
        inputMuxPc = PC4;
        
2'b01:
        inputMuxPc = PCoffset;
                
 2'b10:
         inputMuxPc = PCALU;
 default:
         inputMuxPc = PC4;


endcase
end
endmodule
