
.global _start

.text
_start:
	// write
	movl $1, %eax			# SYS_WRITE
	movq $1, %rdi			# stdout
	leal out(%rip), %esi
	movl $13, %edx
	syscall

	// exit
	movl $60, %eax			# SYS_EXIT
	movl $0, %edi
	syscall

//.data
out: 	.ascii "hello world!\n"
