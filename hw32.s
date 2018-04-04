
	.globl _start
.text
_start:
	// write
	mov $4, %eax			# SYS_WRITE
	mov $1, %ebx			# stdout
	mov $out, %ecx
	mov $13, %edx
	int $0x80

	// exit
	mov %ebx, %eax			# SYS_EXIT
	xor %ebx, %ebx
	int $0x80

out: 	.ascii "hello world!\n"
