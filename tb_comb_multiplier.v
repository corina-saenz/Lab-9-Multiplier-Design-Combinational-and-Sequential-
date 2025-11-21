`timescale 1ns/1ps
module tb_comb_multiplier;
    localparam W = 4;

    reg  [W-1:0]   A, B;
    wire [2*W-1:0] P;

    comb_multiplier #(.W(W)) dut (.A(A), .B(B), .P(P));

    initial begin
        A=0; B=0; #10;
        A=4'd3; B=4'd5;  #10;  // 15
        A=4'd7; B=4'd7;  #10;  // 49
        A=4'd15;B=4'd15; #10;  // 225
        A=4'd9; B=4'd2;  #10;  // 18
        #10 $finish;
    end
endmodule
