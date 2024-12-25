`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:19:10 PM
// Design Name: 
// Module Name: tb_processor
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


module tb_processor;

    parameter width = 16;
    
    logic clk;
    logic rst_n;
    logic [width-1:0] alu_result;
    
    top top(
    .clk(clk),
    .rst_n(rst_n),
    .alu_result(alu_result)
    );
    logic [width-1:0] reg_file [3:0];
    assign reg_file = top.registerFile.data;

    always #5 clk=~clk; 
    integer fd;
    integer i;
    always @(posedge clk)
            begin
                for (i = 0; i < 4; i=i+1) begin
                        $fdisplay(fd,reg_file[i]);
                end
            end
            
    initial begin
        clk=0;
        rst_n=1; #1
        rst_n=0; #1
        rst_n=1; #1;
    end
    initial begin
    // Create a new file
        fd = $fopen("regfile.dump", "w");
        #100;
        $fclose(fd);
    end
endmodule
