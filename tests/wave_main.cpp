// tb_inv.cpp
#include "Vinv.h"            // Verilatorで生成されるトップモジュールのヘッダ
#include "verilated.h"       // Verilator共通ヘッダ
#include "verilated_vcd_c.h" // VCDダンプ用ヘッダ

int main(int argc, char** argv) {
    // Verilator初期化
    Verilated::commandArgs(argc, argv);

    // 波形トレースを有効にするために、トップモジュールの生成前に呼び出す
    Verilated::traceEverOn(true);

    // DUT（デバイス・アンダー・テスト）のインスタンス生成
    Vinv* top = new Vinv;

    // VCDダンプの設定
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);       // トレースレベルの設定（任意）
    tfp->open("waveform.vcd"); // 出力先VCDファイル名

    // シミュレーションの実行
    const int sim_time_max =
        100; // シミュレーション終了時間（単位は任意、ここでは整数で10単位刻み）
    for (int sim_time = 0; sim_time < sim_time_max; sim_time += 10) {
        // シミュレーション時間に応じた入力パターンを設定
        if (sim_time == 0) {
            top->a = 0x0; // 4'b0000
        } else if (sim_time == 10) {
            top->a = 0xA; // 4'b1010
        } else if (sim_time == 20) {
            top->a = 0x5; // 4'b0101
        } else if (sim_time == 30) {
            top->a = 0xF; // 4'b1111
        }

        top->eval();         // DUTの評価
        tfp->dump(sim_time); // 現在のシミュレーション時刻で波形をダンプ
    }

    // シミュレーション終了処理
    tfp->close();
    delete top;

    return 0;
}

