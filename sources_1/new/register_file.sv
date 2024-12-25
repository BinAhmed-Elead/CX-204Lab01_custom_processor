`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 12:38:43 PM
// Design Name: 
// Module Name: NbitsNRegisterFile
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


module register_file #(parameter REGF_WIDTH=16)(
        input clk,
        input rst_n,
        input [1:0] rs1,
        input [1:0] rs2,
        input [1:0] rd,
        input [REGF_WIDTH-1:0] data_in,
        output  [REGF_WIDTH-1:0] op1,
        output  [REGF_WIDTH-1:0] op2
    );
    
        logic [REGF_WIDTH-1:0] data [3:0];
        assign op1 = data[rs1];
        assign op2 = data[rs2];
        always@(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
                data[0] <= 0;
                data[1] <=  0;
                data[2] <= 1;
                data[3] <= 0;
        end else begin
        // Case statement for rd
            case (rd)
                2'b00: data[0] <= data_in;
                2'b01: data[1] <= data_in;
                2'b10: data[2] <= data_in;
                2'b11: data[3] <= data_in;
                default: ; // Optional: Handle invalid cases if necessary
            endcase
    
//        // Case statement for rs1
//            case (rs1)
//                2'b00: op1 = data[0];
//                2'b01: op1 = data[1];
//                2'b10: op1 = data[2];
//                2'b11: op1 = data[3];
//                default: ; // Optional: Handle invalid cases if necessary
//            endcase
//        // Case statement for rs2
//            case (rs2)
//                2'b00: op2 <= data[0];
//                2'b01: op2 <= data[1];
//                2'b10: op2 <= data[2];
//                2'b11: op2 <= data[3];
//                default: ; // Optional: Handle invalid cases if necessary
//            endcase
        end
    end
endmodule
