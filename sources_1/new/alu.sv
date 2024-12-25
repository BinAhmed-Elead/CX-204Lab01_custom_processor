`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 12:24:29 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu #(parameter ALU_WIDTH=16)(
    input [1:0] opcode,
    input [ALU_WIDTH-1:0] op1,
    input [ALU_WIDTH-1:0] op2,
    output logic [ALU_WIDTH-1:0] alu_result
    );
    
    always@(*) begin
        case(opcode)
            2'b00:alu_result = op1+ op2;
            2'b01:alu_result = op1 - op2;
            2'b10:alu_result = op1 & op2;
            2'b11:alu_result = op1 | op2;
             default: alu_result = 0; // Default to zero
        endcase
    end
endmodule
