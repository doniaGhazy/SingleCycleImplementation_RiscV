`timescale 1ns / 1ps
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 02/25/2020 02:33:45 PM
// Module Name: ControlUnit
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: In this module the Control Unit takes the instruction 
//                  and will then output the control signal for each type of instruction.
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------

`include "defines.v"

module ControlUnit( input [4:0] inst, output reg [1:0] Branch, output reg MemRead, 
output reg MemtoReg, output reg [2:0] ALUOp, output reg MemWrite, ALUSrc, RegWrite, ENCALL );

always @ (*)
begin
case (inst)

`OPCODE_Arith_R : begin
Branch =2'b00; //PC+4
MemRead = 1'b0;
MemtoReg = 1'b0;
ALUOp = 3'b000;
MemWrite = 1'b0;
ALUSrc = 1'b0;
RegWrite = 1'b1;
ENCALL = 1'b0; //PC+4
end



`OPCODE_Load : begin
Branch = 2'b00;
MemRead = 1'b1;
MemtoReg = 1'b1;
ALUOp = 3'b010;
MemWrite = 1'b0;
ALUSrc = 1'b1;
RegWrite = 1'b1;
ENCALL = 1'b0; //PC+4
end

`OPCODE_Store : begin
Branch = 2'b00 ;
MemRead = 1'b0;
MemtoReg = 1'b0;
ALUOp = 3'b010;
MemWrite = 1'b1;
ALUSrc = 1'b1;
RegWrite = 1'b0;
ENCALL = 1'b0; //PC+4
end



`OPCODE_Branch : begin
Branch = 2'b01;//PC+OFFSET
MemRead = 1'b0;
MemtoReg = 1'b0;
ALUOp = 3'b011;
MemWrite = 1'b0;
ALUSrc = 1'b0;
RegWrite = 1'b0;
ENCALL = 1'b0; //PC+OFFEST
end

//======================================================================================//
`OPCODE_JALR : begin
Branch = 2'b10;
MemRead = 1'b0;
MemtoReg = 1'b0;
ALUOp = 3'b010;
MemWrite = 1'b0;
ALUSrc = 1'b1;
RegWrite = 1'b0;
ENCALL = 1'b0;
end

`OPCODE_JAL : begin
Branch = 2'b10;
MemRead = 1'b0;
MemtoReg = 1'b0;
ALUOp = 3'b010;
MemWrite = 1'b0;
ALUSrc = 1'b1;
RegWrite = 1'b0;
ENCALL = 1'b0;
end

`OPCODE_Arith_I : begin
Branch = 2'b00 ;
MemRead = 1'b0;
MemtoReg = 1'b0;
ALUOp = 3'b001;
MemWrite = 1'b1;
ALUSrc = 1'b1;
RegWrite = 1'b1;
ENCALL = 1'b0; //PC+4
end

`OPCODE_AUIPC : begin
Branch = 0;
MemRead = 1'b0;
MemtoReg = 1'b0;
ALUOp = 3'b010;
MemWrite = 1'b0;
ALUSrc = 1'b1;
RegWrite = 1'b1;
ENCALL = 1'b0; //PC+4
end

`OPCODE_LUI : begin
Branch = 0;
MemRead = 1'b0;
MemtoReg = 1'b0;
ALUOp = 3'b111;
MemWrite = 1'b0;
ALUSrc = 1'b1;
RegWrite = 1'b1;
ENCALL = 1'b0; //PC+4
end

`OPCODE_SYSTEM : begin
Branch = 0;
MemRead = 1'b0;
MemtoReg = 1'b0;
ALUOp = 3'b101;
MemWrite = 1'b0;
ALUSrc = 1'b0;
RegWrite = 1'b0;
ENCALL = 1'b1; //PC
end



//=======================================================================================//

default : begin
Branch =  0;
MemRead = 0;
MemtoReg = 1'b0;
ALUOp = 3'b110;
MemWrite =0;
ALUSrc =  0;
RegWrite =0;
end

endcase
end
endmodule
