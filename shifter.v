`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 04/15/2020 02:14:25 PM
// Module Name: shifter
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: Does either shift left logical, shift right logical, or shift right arithmatic based on input type.
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------



module shifter( input  [31:0] a, input  [4:0] shamt, input [1:0] type, output reg [31:0] r );

always @(*) 
begin
case (type)

    2'b00:
        r = a << shamt; //shift left logical
     2'b01:
         r= a >> shamt; // shift right logical
     2'b10:
        r= a >>> shamt; //shift right arithmatic 
    default:
      r=a;  //does nothing
        
 endcase
 end       

endmodule
