SRC=src/inv.sv
TEST=src/tb_inv.sv

TESTMAIN_TB=tests/tb_main.cpp
TESTMAIN_WAVE=tests/wave_main.cpp

TESTBIN=Vtb_inv
ifneq ($(TB), 1)
	TESTBIN:=Vinv
endif

.PHONY: testbin generate clean run wave


testbin: generate

generate: $(TESTMAIN_TB) $(TESTMAIN_WAVE)
	@if [ "$(TB)" = "1" ]; then \
		verilator --cc $(SRC) $(TEST) --assert --timing --exe $(TESTMAIN_TB) --top-module tb_inv --build; \
	else \
		verilator -Wall --trace -cc $(SRC) --exe $(TESTMAIN_WAVE) --build; \
	fi

clean:
	rm -rf obj_dir waveform.vcd

run: testbin
	./obj_dir/$(TESTBIN)

wave: run
	gtkwave ./waveform.vcd


