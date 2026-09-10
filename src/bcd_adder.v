`timescale 1ns / 1ps

module bcd_adder (
    input  [3:0] a_bcd,
    input  [3:0] b_bcd,
    input        c_in,

    output [3:0] sum_bcd,
    output       c_out
);

    // 5bit temporary result
    wire [4:0] binary_sum;

    // to find if corretion is required
    wire correction;

    // final o/p
    wire [4:0] corrected_sum;


    assign binary_sum = a_bcd + b_bcd + c_in;

    //bcd correction logic
        assign correction =
                    binary_sum[4] |
                   (binary_sum[3] &
                   (binary_sum[2] | binary_sum[1]));
-
    // 3. Add 6 (0110) when correction is required

    assign corrected_sum =
                    binary_sum +
                    (correction ? 5'b00110 : 5'b00000);


    //Fnal o/p assignment

    assign sum_bcd = corrected_sum[3:0];

    assign c_out = corrected_sum[4];

endmodule 
