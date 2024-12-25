`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 12:30:49 PM
// Design Name: 
// Module Name: ROM
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


module instruction_memory #(parameter IMEM_DEPTH=4)(
    input [(IMEM_DEPTH*8)-1:0] address,
    output logic [7:0] data_out
    );
    
//    $readmemh("rom_image_hex.mem", test_memory); // For Hexadecimal File
     logic [7:0] data [(IMEM_DEPTH*8)-1:0];
    initial begin 
            $readmemb("/home/binahmed/computer_arc/CX-204-Lab1/support_files/fib_im.mem", data); // For Binary File
    end
     assign data_out = data[address];
endmodule
