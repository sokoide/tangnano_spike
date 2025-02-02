module top(
    input logic [3:0] a,
    output logic [3:0] y
);

    inv inv_instance (
        .a(a),
        .y(y)
    );
    
endmodule