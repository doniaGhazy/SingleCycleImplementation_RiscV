`timescale 1ns / 1ps
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
// Create Date: 02/25/2020 01:14:29 PM
// Module Name: RegisterFile
// Project Name: Milestone #2
// Author:  Yasmin Elwazir  900161056
//          Donia Ghazy     900172124
//          Yousef Elwazir  900161060
// Description: In this module we receive the Rd, Rs1, Rs2, Write data, and output the read data 1 and read data 2.
// Change History:
//                  Last Modified 19/04/2020
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------ 

/*

module RegisterFile #(parameter N=32)(input [4:0] ReadReg1, 
input [4:0] ReadReg2, input [4:0] WriteReg,
 input [N-1:0] WriteData, input RegWrite, output[N-1:0] Readdata1, 
 output [N-1:0] Readdata2,
input clk, rst );
wire [N-1:0] registercontent[31:0];

reg [31:0] load;
genvar i;
always @(*) begin
 load =0;
if (RegWrite==1 & WriteReg !=0 )
    load[WriteReg] = 1'b1;

end


generate
for ( i = 0; i< 32; i=i+1)
    NbitRegister #(32) nv1 ( load[i],clk,rst, WriteData, registercontent[i]);
endgenerate
    

assign Readdata1= registercontent[ReadReg1];
assign Readdata2=registercontent[ReadReg2];



endmodule
 */



module RegisterFile#(parameter n=32)(input [4:0] Read_reg1, [4:0] Read_reg2, input [4:0] Write_reg,
input [n-1:0] Write_data, input RegWrite, output [n-1:0] Read_data1, [n-1:0] Read_data2, input clk, rst);

wire [n-1:0] Q[n-1:0];
reg [n-1:0] w;
genvar i;
assign Q[0]=0;
generate
begin 
for (i=1; i<n; i=i+1) 
begin // begin for 
always@(*)
begin
if(RegWrite)
if(i==Write_reg)
w[i]=1;
else
w[i]=0;
end
nbit_reg hk( clk, Write_data,  w[i],  Q[i],  rst);


end //end for 
end
endgenerate

assign Read_data1= Q[Read_reg1]; 
assign Read_data2= Q[Read_reg2]; 

endmodule 


module nbit_reg #(parameter N=32)(input clk, input [N-1:0]D, input load, output [N-1:0]Q, input rst);
wire [N-1:0]Y;
genvar i;
generate
for(i=0; i<N; i=i+1)
begin
mux fvg(Q[i], D[i], load, Y[i]);
DFlipFlop jbh(clk, rst, Y[i], Q[i]);
end
endgenerate
endmodule

module DFlipFlop
 (input clk, input rst, input D, output reg Q);
 always @ (posedge clk or posedge rst)
 if (!rst) begin
 Q <= 1'b0;
 end else begin
 Q <= D;
 end
endmodule 
module mux (input a, b, s, output y);
assign y=(s==0)?a:b;
endmodule

