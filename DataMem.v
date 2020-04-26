`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 03/03/2020 12:06:52 PM
// Module Name: DataMem
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: The Data Memory which takes the MemRead, the Memwrite , data in (write data) and the addr.
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------

module DataMem  
(input clk, input MemRead, input MemWrite, input [2:0] func3,     
input [7:0] addr, input [31:0] data_in, output reg [31:0] data_out);

reg [7:0] mem [0:63];
wire [7:0] val ;
assign val = mem[addr];

        

always @(*)
    begin          
      if (MemRead)//LOAD
          begin
      if(func3 == 3'b000) //LB
        data_out={{24{mem[addr][7]}},mem[addr]};
      else if (func3 == 3'b001) //LH
        data_out={{16{mem[addr+1][7]}},mem[addr+1],mem[addr]};
      else if (func3 == 3'b010) //LW
        data_out={mem[addr+3],mem[addr+2],mem[addr+1],mem[addr]};
       else if (func3 == 3'b101) //LHU
        data_out = {16'b0,mem[addr+1],mem[addr]}; 
       else if (func3 ==3'b100) //LBU
        data_out = {24'b0, mem[addr]};
          end 
     else if(MemRead==0)
         data_out=0;    
      end
       
 always @(posedge clk)
  begin
            if (MemWrite) //Store
          begin
            if(func3 == 3'b000) //SB
               mem[addr]<=data_in[7:0];
            else if (func3 == 3'b001) //SH
           begin
               mem[addr]<=data_in[7:0];
               mem[addr+1]<=data_in[15:8];
           end
             else if (func3 == 3'b010) //SW
           begin
               mem[addr]<=data_in[7:0];
               mem[addr+1]<=data_in[15:8];
               mem[addr+2]<=data_in[23:16];
               mem[addr+3]<=data_in[31:24];
           end
           end
  
          end
    
       integer i;
      initial begin
              for (i=0; i<64; i=i+1)
               begin
               mem[i]=8'd0;
                 end      
            mem[0]= 8'd5;
            mem[1]=8'd2;
            mem[2]=8'd0;
     
            mem[3]=8'd2;
               
        end
endmodule

