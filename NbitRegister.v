`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 02/18/2020 11:36:14 AM
// Module Name: NbitRegister
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: Creates Registers using DFlipFlop and Multiplexer
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------



module NbitRegister #(parameter N=32) (input load,clk, rst, input [N-1:0] D, output [N-1:0] Q );
wire [N-1:0] inputD;
genvar i;
generate 
for (i =0; i< N; i=i+1) begin
    Multiplexer mux ( Q[i],D[i] , load, inputD[i]);
    DFlipFlop dff(clk, rst, inputD[i], Q[i]);
    end
    endgenerate
endmodule
