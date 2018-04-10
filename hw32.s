
	.globl _start
.text
_start:
	// write
	mov $4, %eax			# SYS_WRITE
	mov $1, %ebx			# stdout
	mov $out, %ecx
	mov $len, %edx
	int $0x80

	// exit
	mov %ebx, %eax			# SYS_EXIT
	xor %ebx, %ebx
	int $0x80

out: 	.ascii "hw32 says \"Hello World!\"\n"
outend:	.equ len, outend-out
