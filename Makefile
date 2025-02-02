SRC=src/inv.sv
TEST=src/tb_inv.sv

TESTMAIN_TB=tests/tb_main.cpp
TESTMAIN_WAVE=tests/wave_main.cpp

TESTBIN=Vinv
TESTMAK=$(TESTBIN).mk

.PHONY: testbin generate clean run wave


testbin: generate
	make -j -C obj_dir -f Vinv.mk $(TESTBIN)

generate: $(TESTMAIN_TB) $(TESTMAIN_WAVE)
	@if [ "$(TB)" = "1" ]; then \
		verilator --cc $(SRC) $(TEST) --assert --timing --exe $(TESTMAIN_TB); \
	else \
		verilator -Wall --trace -cc $(SRC) --exe $(TESTMAIN_WAVE); \
	fi

clean:
	rm -rf obj_dir waveform.vcd

run: testbin
	./obj_dir/$(TESTBIN)

wave: run
	gtkwave ./waveform.vcd


