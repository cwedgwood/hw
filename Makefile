
eh: container

default: all

all: out/hw32 out/hw64 out/hwx32
	ls -l $^
	ln -v out/hw32 out/run || ln -v out/hw64 out/run || ln -v out/hwx32 out/run

runtest: all
	./hw32
	./hw64
	./hwx32 || "hwx32 failed, check CONFIG_X86_X32 is set"

# 3 explicit rules because we have 3 different arch's so a given .s.o
# style rule wouldn't work

out/hw32: hw32.s
	as --32 -c $^ -o $^.o
	ld -s -melf_i386 -o $@ $^.o

out/hw64: hw64.s
	as --64 -c $^ -o $^.o
	ld -s -melf_x86_64 -o $@ $^.o

out/hwx32: hwx32.s
	as --x32 -c $^ -o $^.o
	ld -s -melf32_x86_64 -o $@ $^.o

clean:
	rm -f *.o *~ hw32 hw64 hwx32 out/*

container:
	sudo docker build --build-arg target=all -t cwedgwood/hw:all . | cat
	sudo docker build --build-arg target=out/hwx32 -t cwedgwood/hw:hwx32 . | cat
	sudo docker build --build-arg target=out/hw64 -t cwedgwood/hw:hw64 . | cat
	sudo docker build --build-arg target=out/hw32 -t cwedgwood/hw:hw32 . | cat
	sudo docker tag cwedgwood/hw:hw32 cwedgwood/hw:latest | cat
	sudo docker images cwedgwood/hw

.PHONY: default all runtest clean container
