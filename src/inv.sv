module inv(input logic [3:0] a,
    output logic [3:0] b);
    // assign b = ~a;
    always_comb begin
        b = ~a;
    end
endmodule
