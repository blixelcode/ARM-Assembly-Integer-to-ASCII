.global _start

.data
	num:	.asciz	"00000000000"

.text

_start:
	mov		r0, #1234
	ldr		r1, =num
	bl		itoa

exit:
	mov		r0, #0
	mov		r7, #1
	svc		0

.end
