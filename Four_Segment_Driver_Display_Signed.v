`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 02/11/2020 01:01:00 PM
// Module Name: Four_Segment_Driver_Display_Signed
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: 7-segment display configuration
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------



module Four_Segment_Driver_Display_Signed( 
 input clk,     input [12:0] num,     output reg [3:0] Anode,      output reg [6:0] LED_out    ); 
        reg [3:0] LED_BCD;   
 reg [19:0] refresh_counter = 0; // 20-bit counter    
wire [1:0] LED_activating_counter;  
wire [3:0]  Hundreds, Tens, Ones;

   always @(posedge clk)      
 begin          
 refresh_counter <= refresh_counter + 1;  
     end      
   assign LED_activating_counter = refresh_counter[19:18]; 
   
   wire msb;
   reg [7:0] newnumber;
   assign msb = num[7];
   
   
   always @(*) begin
   if (msb == 1)
     newnumber = ~num +1;
    else 
     newnumber=num;
  end
  BCD_NEW jhtg(newnumber,  Hundreds, Tens,Ones);
  
   always @(*)      
 begin        
  case(LED_activating_counter)      
    2'b00: begin             
Anode = 4'b0111;             
if (msb == 1) begin
LED_BCD=11;
  end else begin
  LED_BCD=10;
         end
     end        
  2'b01: begin           
  Anode = 4'b1011;           
   LED_BCD = Hundreds;         
      end        
  2'b10: begin           
  Anode = 4'b1101;             
 LED_BCD = Tens;              
   end         
 2'b11: begin         
    Anode = 4'b1110;         
     LED_BCD =Ones;    
            end     
     endcase  
     end 
 
    always @(*)     
   begin          
 case(LED_BCD)      
     4'b0000: LED_out = 7'b0000001; // "0"      
     4'b0001: LED_out = 7'b1001111; // "1"        
    4'b0010: LED_out = 7'b0010010; // "2"         
   4'b0011: LED_out = 7'b0000110; // "3"      
      4'b0100: LED_out = 7'b1001100; // "4"      
      4'b0101: LED_out = 7'b0100100; // "5"     
       4'b0110: LED_out = 7'b0100000; // "6"      
      4'b0111: LED_out = 7'b0001111; // "7"      
      4'b1000: LED_out = 7'b0000000; // "8"      
     4'b1001: LED_out = 7'b0000100; // "9"  
     4'b1011:LED_out = 7'b1111110;//"-"
     4'b1010:LED_out = 7'b0000001;//"positive"     
     default: LED_out = 7'b0000001; // "0"      
     endcase    
    end  
    endmodule 
