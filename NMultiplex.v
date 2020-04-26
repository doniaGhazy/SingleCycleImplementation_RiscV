`timescale 1ns / 1ps
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 02/18/2020 01:04:34 PM
// Module Name: NMultiplex
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: N-bit Multiplexer
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------ 



module NMultiplex #(parameter N= 32)(   input [N-1:0] A, input [N-1:0] B, input S, output [N-1:0] C );

genvar i;
generate
for (i =0; i< N; i=i+1) begin
    Multiplexer nmux ( A[i], B[i], S, C[i]);
    end
    endgenerate
endmodule
