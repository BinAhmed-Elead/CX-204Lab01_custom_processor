`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 12:22:23 PM
// Design Name: 
// Module Name: custom_processor
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


module top #(
    parameter IMEM_DEPTH=4,//words
    parameter WIDTH = 16, //bits
    parameter PROG_VALUE=3//value
    )(
    input clk,
    input rst_n,
    output [WIDTH-1:0] alu_result
    );
    
    logic [(IMEM_DEPTH*8)-1:0] address;
    program_counter #(.PROG_VALUE(PROG_VALUE)) program_counter(
    .clk(clk),
    .rst_n(rst_n),
    .en(1'b1),
    .q(address[$clog2(PROG_VALUE)-1:0])
    ); 
    assign address[(IMEM_DEPTH*8)-1:$clog2(PROG_VALUE)] = 0;
    
    logic [7:0] instruction;
    instruction_memory #(.IMEM_DEPTH(IMEM_DEPTH)) instructionMemory (
    .address(address),
    .data_out(instruction)
    );
    
//    logic [3:0] alu_result;
    logic [1:0] opcode;
    assign opcode = instruction[1:0];
    logic [1:0] rs1;
    assign rs1 = instruction[3:2];
    logic [1:0] rs2;
    assign rs2 = instruction[5:4];
    logic [1:0] rd;
    assign rd = instruction[7:6];
    
    logic [WIDTH-1:0] op1;
    logic [WIDTH-1:0] op2; 
     
    register_file #(.REGF_WIDTH(WIDTH)) registerFile(
        .clk(clk),
       .rst_n(rst_n),
       .rs1(rs1),
       .rs2(rs2),
       .rd(rd),
       .data_in(alu_result),
       .op1(op1),
       .op2(op2)
    );
    
    alu #(.ALU_WIDTH(WIDTH))alu(
    .opcode(opcode),
    .op1(op1),
    .op2(op2),
    .alu_result(alu_result)
    );
    
endmodule
