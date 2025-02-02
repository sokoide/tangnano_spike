module inv(
    input logic [3:0] a,
    output logic [3:0] y
);

    // if you'd like to use 'assign'
    // assign y = ~a;

    // if you'd like to use 'always_comb'
    always_comb begin
        y = ~a;
    end

endmodule
