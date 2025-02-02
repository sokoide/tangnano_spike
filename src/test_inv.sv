// tb.sv
module tb;
  // テスト用信号の宣言
  logic [3:0] a;
  logic [3:0] y;

  // DUT (Device Under Test) のインスタンス化
  inv dut (
    .a(a),
    .b(y)
  );

  // シミュレーション開始時の初期ブロック
  initial begin
    $display("* Test started.");
    // テストケース1: a = 0 の場合、y は 1 になるはず
    a = 0;
    #5;  // 少し待つ（伝搬遅延を考慮）
	// 4bit hex, 0xF
    assert(y == 4'hF)
      else $fatal(1, "Assertion failed: for a = 0, expected y = 0xF, but got y = %0d", y);

    // テストケース2: a = 0xA の場合、y は 5 になるはず
	// 4bit hex, 0XA
    a = 4'hA;
    #5;
    assert(y == 5)
      else $fatal(1, "Assertion failed: for a = 0xA, expected y = 5, but got y = %0d", y);

    $display("* All tests passed.");
    $finish;
  end

endmodule

