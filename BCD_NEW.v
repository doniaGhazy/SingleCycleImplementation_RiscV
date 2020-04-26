//////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Module Name: BCD_NEW
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: Not needed (we did not use this module)
// Change History:
//                     Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------

 module BCD_NEW(input [12:0] binary,  output reg [3:0] Hundreds, output reg [3:0] Tens, output reg [3:0] Ones ); 
integer i;
always @(binary)
 begin 
//initialization  

Hundreds = 4'd0;  
Tens = 4'd0;  
Ones = 4'd0; 
for (i = 12; i >= 0 ; i = i-1 ) 
begin   

if(Hundreds >= 5 )   
Hundreds = Hundreds + 3 ;  
if (Tens >= 5 )   
Tens = Tens + 3;  
 if (Ones >= 5)    
Ones = Ones +3; 
//shift left one  


Hundreds = Hundreds << 1;  
Hundreds [0] = Tens [3];  
Tens = Tens << 1; 
 Tens [0] = Ones[3];  
Ones = Ones << 1;  
Ones[0] = binary[i]; 
end 
end
endmodule