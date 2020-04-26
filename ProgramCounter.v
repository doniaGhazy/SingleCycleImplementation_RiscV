`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 03/10/2020 09:00:09 AM
// Module Name: ProgramCounter
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: This is the PC before the instruction memory
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------



module ProgramCounter( input load, clk, rst,input [31:0] inputPC, output [31:0] outputPC

    );
    
    
    NbitRegister #(32) u1 (load,clk,rst,inputPC,outputPC);
  //  nbit_reg hk( clk, Write_data,  w[i],  Q[i],  rst);

endmodule
