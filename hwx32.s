
out: 	.ascii "hello world!\n"

	.globl _start
.text
_start:
	// write
	movl $1, %eax			# SYS_WRITE
	movq %rax, %rdi			# stdout
	leal out(%rip), %esi
	movl $13, %edx
	syscall

	// exit
	movl $60, %eax			# SYS_EXIT
	xorl %edi, %edi
	syscall
