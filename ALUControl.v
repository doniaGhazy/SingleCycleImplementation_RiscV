`timescale 1ns / 1ps
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 02/25/2020 03:18:35 PM
// Module Name: ALUControl
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: In the ALU Control module it receives the instruction in order to output the ALU selection of every instrction type.
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------



`include "defines.v"
module ALUControl(input[2:0] ALUOp, input [2:0] inst1,
 input inst2, output reg [3:0]ALUSel);
 
 
 always @(*)

begin 
case (ALUOp)

3'b000: //arith_R-type 
   begin 
   case(inst1)
   
`F3_ADD:
        if (inst2 ==0)
            ALUSel = `ALU_ADD; //ADD
         else
            ALUSel = `ALU_SUB; //SUB
            
`F3_SLL:
         ALUSel = `ALU_SLL; //SLL
         
`F3_SLT:
        ALUSel = `ALU_SLT; //SLT
        
`F3_SLTU:
        ALUSel =`ALU_SLTU; //SLTU
      
`F3_XOR:
        ALUSel =`ALU_XOR; //XOR
        
`F3_SRL:
        if (inst2 ==0)
            ALUSel = `ALU_SRL; //SRL
        else
            ALUSel = `ALU_SRA; //SRA
`F3_OR:
            ALUSel = `ALU_OR; //OR
          
 `F3_AND:
             ALUSel = `ALU_AND; //AND
      
       endcase
       end
     
3'b001: //Arith_I type

     case(inst1)
   
 `F3_ADD:
           ALUSel = `ALU_ADD; //ADDI
        
 `F3_SLT:
           ALUSel = `ALU_SLT; //SLTI
           
 `F3_SLTU:
            ALUSel = `ALU_SLTU; //SLTUI
            
 `F3_XOR:
            ALUSel =`ALU_XOR; //XORI
  
 `F3_OR:
            ALUSel = `ALU_OR; //ORI
                       
 `F3_AND:
           ALUSel = `ALU_AND; //ANDI
  
 `F3_SLL:
         ALUSel = `ALU_SLL; //SLLI

 `F3_SRL:
        if (inst2 ==0)
            ALUSel = `ALU_SRL; //SRLI
        else
            ALUSel = `ALU_SRA; //SRAI
       
      
endcase
  //   LUI no alu selc

3'b010: //Store + Load + JALR + AUIPC + JAL
   ALUSel =`ALU_ADD;
 
3'b011: //BEQ, BNE, BLT, BGE, BLTU, BGEU
     ALUSel =`ALU_SUB;
    
default:
         ALUSel =`ALU_PASS;

    



 //inst1 == func3
 //inst2 == inst[30]
 
 /*
 always @ (*)
 begin
 case (ALUOp)

2'b00 : begin
    ALUSel = 4'b0010;
    end
  
2'b01 : begin
    ALUSel = 4'b0110;
    end
    
2'b10 : begin
if (inst1==3'b000)
        if (inst2 == 0)
                 ALUSel = 4'b0010;
        else 
                 ALUSel = 4'b0110; 
else if ( inst1 == 3'b111)
        ALUSel = 4'b0000;
        else
        ALUSel = 4'b0001;                   

 
end




endcase
end
*/
endcase
end
endmodule
