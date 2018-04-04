
default: all

all: hw32 hw64 hwx32
	ls -l $^

runtest: all
	./hw32
	./hw64
	./hwx32 || echo "Failed to execute $_"

hw32: hw32.s
	as --32 -c hw32.s -o hw32.o
	ld -melf_i386 -o hw32 hw32.o ; strip hw32

hw64: hw64.s
	as --64 -c hw64.s -o hw64.o
	ld -o hw64 hw64.o ; strip hw64

hwx32: hwx32.s
	as --x32 -c hwx32.s -o hwx32.o
	ld -melf32_x86_64 -o hwx32 hwx32.o ; strip hwx32

clean:
	rm -f *.o *~ hw32 hw64 hwx32

container:
	sudo docker build -t cwedgwood/hw . | cat
	sudo docker images cwedgwood/hw

.PHONY: default all runtest clean
