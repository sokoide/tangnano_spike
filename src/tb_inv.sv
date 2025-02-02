module tb_inv();

  // test signals
  logic [3:0] a;
  logic [3:0] y;

  // instanciate DUT (Device Under Test)
  inv dut (
    .a(a),
    .y(y)
  );

  // start simulation
  initial begin
    $display("* Test started.");
    // case 1: a=0 -> y=0xF
    a = 0;
    #5;  // wait (propagation delay considered)
    // 4'hF: 4bit hex, 0xF
    assert(y == 4'hF)
      else $fatal(1, "Assertion failed: for a = 0, expected y = 0xF, but got y = %0d", y);

    // case 2: a=0xA -> y=5
    // 4bit hex, 0XA
    a = 4'hA;
    #5;
    assert(y == 5)
      else $fatal(1, "Assertion failed: for a = 0xA, expected y = 5, but got y = %0d", y);

    $display("* All tests passed.");
    $finish;
  end

endmodule

