
	.globl _start
.text
_start:
	// write
	mov $1, %rax			# SYS_WRITE
	mov %rax, %rdi			# stdout
	lea out(%rip), %rsi
	mov $len, %rdx
	syscall

	// exit
	mov $60, %rax			# SYS_EXIT
	xor %rdi, %rdi
	syscall

out: 	.ascii "Hello World!\n"
outend:	.equ len, outend-out
