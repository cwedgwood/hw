
out: 	.ascii "hello world!\n"

	.globl _start
.text
_start:
	// write
	movq $1, %rax			# SYS_WRITE
	movq %rax, %rdi			# stdout
	movq $out, %rsi
	movq $13, %rdx
	syscall

	// exit
	movq $60, %rax			# SYS_EXIT
	xor %rdi, %rdi
	syscall

