# Tang Nano Spike

## About

* A quick `inv` example in System Verilog for GoWin IDE (Tang Nano)
* With a test bench example for Verilator
* With a simulation example for Verilator & Gtkwave


## How to run

### Prereq

* brew install verilator
* clone and build gtkwave at https://github.com/gtkwave/gtkwave

### Test Bench

```bash
make clean;TB=1 make run
```

### Generate Wave

```bash
make clean;TB=0 make wave
```
