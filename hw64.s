
.global _start

.text
_start:
	// write
	movq $1, %rax
	movq $1, %rdi
	movq $out, %rsi
	movq $13, %rdx
	syscall

	// exit
	movq $60, %rax
	movq $0, %rdi
	syscall

//.data
out: 	.ascii "hello world!\n"
