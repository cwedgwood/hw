
default: all

all: hw32 hw64 hwx32
	ls -l $^

runtest: all
	./hw32
	./hw64
	./hwx32 || echo "Failed to execute $_"

# 3 explicit rules because we have 3 different arch's so a given .s.o
# style rule wouldn't work

hw32: hw32.s
	as --32 -c $^ -o $@.o
	ld -s -melf_i386 -o $@ $@.o

hw64: hw64.s
	as --64 -c $^ -o $@.o
	ld -s -melf_x86_64 -o $@ $@.o

hwx32: hwx32.s
	as --x32 -c $^ -o $@.o
	ld -s -melf32_x86_64 -o $@ $@.o

clean:
	rm -f *.o *~ hw32 hw64 hwx32

container:
	sudo docker build -t cwedgwood/hw . | cat
	sudo docker images cwedgwood/hw

.PHONY: default all runtest clean container
