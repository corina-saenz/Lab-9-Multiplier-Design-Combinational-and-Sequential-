`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 01:25:45 PM
// Design Name: 
// Module Name: comb_multiplier
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

module comb_multiplier #(
    parameter W = 4
)(
    input  wire [W-1:0]   A,
    input  wire [W-1:0]   B,
    output wire [2*W-1:0] P
);
    assign P = A * B; 
endmodule
