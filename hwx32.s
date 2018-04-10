
	.globl _start
.text
_start:
	// write
	mov $1, %eax			# SYS_WRITE
	mov %rax, %rdi			# stdout
	lea out(%rip), %esi
	mov $len, %edx
	syscall

	// exit
	mov $60, %eax			# SYS_EXIT
	xor %edi, %edi
	syscall

out: 	.ascii "hwx32 says \"Hello World!\"\n"
outend:	.equ len, outend-out
