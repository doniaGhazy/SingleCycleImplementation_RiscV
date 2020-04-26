`timescale 1ns / 1ps
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 03/10/2020 08:57:57 AM
// Module Name: SingleCycle
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: This is the single cycle full processor with all the modules.
// Change History:
//                  Last Date Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
module SingleCycle(input clk ,rst);//, clkSSD, input [1:0] ledSel,
 //input [3:0] ssdSel, output reg [15:0] LEDs,
 //output [3:0] Anode,output [6:0] LED_out  );
reg [12:0] SSDoutput;


wire [31:0] AdderOutput1;
wire [31:0] AdderOutput2;

wire [31:0] PCin, PCout;
wire [31:0] InstructionMemoryOutput;

wire [31:0] rd;
wire [31:0] rdInput;
wire [1:0] Branch; 
wire MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ENCALL;
wire [2:0] ALUOp;
wire [31:0] rs1;
wire [31:0] rs2;

wire [31:0] ImmediateGeneratorOutput;
wire [3:0] ALUcontrolOutputSelector;

                                    
 wire [1:0] OutputSelector;         
                                    
 wire [31:0] inputMuxPc;            
                                    
 wire [31:0] ReadDataFromDataMem;   
                                    
 wire[31:0] ALUResult;              
 wire zeroflag;                     
 wire cf,zf,vf,sf;                  
wire [31:0] ALUinput2;             


 ProgramCounter pc (1, clk ,rst, PCin, PCout);
                                    

InstMemMod instructionmemory ( PCout [15:0], InstructionMemoryOutput);


rdMux writeback (InstructionMemoryOutput [6:2], rd , AdderOutput2, AdderOutput1, ImmediateGeneratorOutput, rdInput);



ControlUnit controlunit ( InstructionMemoryOutput [6:2],
Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, ENCALL);








RegisterFile processorregfile (InstructionMemoryOutput [19:15], 
InstructionMemoryOutput [24:20], InstructionMemoryOutput [11:7],
rdInput,RegWrite ,rs1,rs2, clk, rst);


rv32_ImmGen immediat ( InstructionMemoryOutput, ImmediateGeneratorOutput);






wire [31:0] OffsetAdderInput2;
NbitShift shiftingimmgen (ImmediateGeneratorOutput,  OffsetAdderInput2);








ALUControl processorALUcontrol (ALUOp, InstructionMemoryOutput[14:12],
 InstructionMemoryOutput[30], ALUcontrolOutputSelector);
 
 
 
 
 
 


NMultiplex mux (rs2, ImmediateGeneratorOutput, ALUSrc, ALUinput2);





prv32_ALU nbitALU (rs1, ALUinput2, rs2 [4:0], ALUResult, cf, zf, vf, sf, ALUcontrolOutputSelector);

wire [7:0] dataaddr;
assign dataaddr =  ALUResult [7:0];

DataMem DataMemory (clk,MemRead, 
MemWrite, InstructionMemoryOutput[14:12],dataaddr , rs2,  ReadDataFromDataMem);



NMultiplex mux2 ( ALUResult,ReadDataFromDataMem,MemtoReg,rd);




BranchSelector branching (Branch, InstructionMemoryOutput[14:12], cf, zf, vf, sf, OutputSelector );








//RCANew PCadding4 (4, PCout,  AdderOutput1);

assign AdderOutput1= PCout + 4;



//RCANew PCaddingOffset (  OffsetAdderInput2 ,PCout, AdderOutput2);
assign AdderOutput2= OffsetAdderInput2 + PCout;

BranchMux branchmux (AdderOutput1, AdderOutput2, ALUResult, OutputSelector,inputMuxPc );



NMultiplex muxPC (inputMuxPc, PCout, ENCALL, PCin );

endmodule
