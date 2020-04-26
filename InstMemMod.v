`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 03/03/2020 11:31:06 AM
// Module Name: InstMemMod
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: Instruction Memory -> We created the instuctions.mem file which contains our 37 instructions that were added.
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------


module InstMemMod(input [15:0] addr, output [31:0] data_out); 
    reg [7:0] memory [(4*1024)-1:0];    
         parameter HEX_PATH = "./";
  

initial begin
        
       $readmemh("instructions.mem", memory);
       $display("HEREEEE");
       
    end
   ///assign  data_out=32'hAAAAAAAA;
   
    assign data_out = {memory[addr],memory[addr+1],memory[addr+2],memory[addr+3]};
   

     endmodule 
 
