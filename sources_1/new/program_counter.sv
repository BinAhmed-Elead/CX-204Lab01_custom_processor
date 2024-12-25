`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 12:28:34 PM
// Design Name: 
// Module Name: NbitCounter
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


module program_counter #(parameter PROG_VALUE=8)
(
    input clk,
    input rst_n,
    input en,
    output logic [$clog2(PROG_VALUE)-1:0] q
    );
    always@(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            q<=0;
        end
        else if(en) begin
            if(q == PROG_VALUE)
                q <=0;
            else
                q <= q+1;
        end
    end
    
endmodule
