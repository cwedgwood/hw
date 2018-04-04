
out: 	.ascii "hello world!\n"

	.globl _start
.text
_start:
	// write
	movl $4, %eax			# SYS_WRITE
	movl $1, %ebx
	movl $out, %ecx
	movl $13, %edx
	int $0x80

	// exit
	movl %ebx, %eax			# SYS_EXIT
	xorl %ebx, %ebx
	int $0x80
