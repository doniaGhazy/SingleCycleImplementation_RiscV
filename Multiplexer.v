`timescale 1ns / 1ps

//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 02/18/2020 11:32:09 AM
// Module Name: Multiplexer
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: Multiplexer to select which input to take
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------ 



module Multiplexer( input A,B,S, output C);
wire temp1,temp2;
    assign temp1 = A&(~S);
    assign temp2= B&S;
    assign C=temp1|temp2;
endmodule
