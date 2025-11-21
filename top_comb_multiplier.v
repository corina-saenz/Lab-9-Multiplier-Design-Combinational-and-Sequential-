`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 01:25:45 PM
// Design Name: 
// Module Name: top_comb_multiplier
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

module top_comb_multiplier (
    input  wire [7:0]  sw,   // A=sw[3:0], B=sw[7:4]
    output wire [7:0]  led   // product low 8 bits
);
    wire [7:0] P;

    comb_multiplier #(.W(4)) u_mul (.A(sw[3:0]), .B(sw[7:4]), .P(P));
    assign led = P;
endmodule
