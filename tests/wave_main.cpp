// tb_inv.cpp
#include "Vinv.h"            // Top-level module generated by Verilator
#include "verilated.h"       // Verilator header
#include "verilated_vcd_c.h" // For VCD dump

int main(int argc, char** argv) {
    // Initialize Verilator with command-line arguments.
    Verilated::commandArgs(argc, argv);

    // Call it before `new` to enable wave trace
    Verilated::traceEverOn(true);

    // DUT (Device Under Test)
    Vinv* top = new Vinv;

    // VCD dump config
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);       // trace level (optional)
    tfp->open("waveform.vcd"); // output file

    // Run simulation
    const int sim_time_max =
        100; // Simulation end time, integer, in increments of 10
    for (int sim_time = 0; sim_time < sim_time_max; sim_time += 10) {
        if (sim_time == 0) {
            top->a = 0x0; // 4'b0000
        } else if (sim_time == 10) {
            top->a = 0xA; // 4'b1010
        } else if (sim_time == 20) {
            top->a = 0x5; // 4'b0101
        } else if (sim_time == 30) {
            top->a = 0xF; // 4'b1111
        }

        top->eval();         // Evaluate DUT
        tfp->dump(sim_time); // Dump the wave at the current time
    }

    // Close
    tfp->close();
    delete top;

    return 0;
}

