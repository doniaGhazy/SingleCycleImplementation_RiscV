`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 04/15/2020 05:15:38 PM
// Module Name: BranchSelector
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: The Branch selector gets the branch using the ALU flags in order to know what the output will be.
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------


`include "define.v"
//branch  01
// Jump 10
// PC+4

module BranchSelector( input [1:0] branch, input [2:0] func3, input cf, zf, vf, sf, output reg [1:0] OutputSelector);
always @(*)
begin 
case (branch) 

0: 
    OutputSelector= 0;
1: 
begin 
case (func3) 
`BR_BEQ: 
    if (zf == 1) 
           OutputSelector = 1; 
    else 
           OutputSelector =0;
`BR_BNE:
    if(zf==0)
           OutputSelector = 1; 
    else 
           OutputSelector =0;
`BR_BLT: 
    if(sf != vf)
           OutputSelector = 1; 
    else 
           OutputSelector =0;
`BR_BGE:
    if(sf==vf)
           OutputSelector = 1; 
    else 
           OutputSelector =0;
`BR_BLTU:
    if(cf !=1)
           OutputSelector = 1; 
    else 
           OutputSelector =0;
`BR_BGEU:
    if(cf ==1)
           OutputSelector = 1; 
else 
           OutputSelector =0;
default: 
           OutputSelector =0;
endcase
end
2: 
           OutputSelector= 2;
default:
           OutputSelector=0;
endcase 
end 
endmodule
