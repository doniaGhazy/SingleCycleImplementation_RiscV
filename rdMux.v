`timescale 1ns / 1ps
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 04/15/2020 04:57:29 PM
// Module Name: rdMux
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: This is our Multiplexer at Rd it selects which rdInput to take based on the OPCODE
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------ 

`include "define.v"


module rdMux(input [4:0] OPCODE, input [31:0] OLDrd , PCimmediate, PC4, immediate, output reg [31:0] rdInput );


always @ (*)
begin
case (OPCODE)
    `OPCODE_LUI: rdInput = immediate;
    `OPCODE_AUIPC: rdInput = PCimmediate;
    `OPCODE_JAL: rdInput = PC4;
    `OPCODE_JALR: rdInput=  PC4;
     default:
        rdInput = OLDrd;


endcase
end
endmodule
