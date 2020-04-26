`timescale 1ns / 1ps
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 02/18/2020 01:13:04 PM
// Module Name: NbitShift
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: Does an N bit shift to the input
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------



module NbitShift #(parameter N=32 ) ( input [N-1:0] A, output [N-1:0] B);

assign B = {A[N-2:0] , 1'b0};

endmodule
