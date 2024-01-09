.global _start

.data
	num:	.asciz	"000000000000000"
	gold1:	.asciz	"You have "
	gold2:	.asciz	" gold pieces.\n"

.text

_start:
	ldr		r1, =gold1
	bl		print

	mov		r0, #101
	ldr		r1, =num
	bl		itoa
	bl		print

	ldr		r1, =gold2
	bl		print

exit:
	mov		r0, #0
	mov		r7, #1
	svc		0

.end
