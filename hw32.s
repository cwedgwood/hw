
.global _start

.text
_start:
	// write
	movl $4, %eax
	movl $1, %ebx
	movl $out, %ecx
	movl $13, %edx
	int $0x80

	// exit
	movl $1, %eax
	movl $0, %ebx
	int $0x80

//.data
out: 	.ascii "hello world!\n"
