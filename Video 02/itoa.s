// Input:
//		r0 MUST contain the integer to be converted.
//		r1 MUST contain the memory address to the variable where
//         we will store out result.
//
// Output:
//		The memory address that r1 points to, will have been updated
//      with the result.
//
.global itoa

itoa:
	push	{r0, r2-r6, lr}

	mov		r2, #1
	mov		r3, #10
	mov		r4, r0

loop1:
	cmp		r4, r3
	udivgt	r4, r4, r3
	mulgt	r2, r3, r2
	bgt		loop1

	mov		r4, r0

loop2:
	cmp		r2, #0
	ble		nullbyte
	udiv	r5, r4, r2
	mul		r6, r2, r5
	sub		r4, r4, r6
	add		r5, #'0'
	strb	r5, [r1], #1
	udiv	r2, r2, r3
	b		loop2

nullbyte:
	mov		r5, #0
	strb	r5, [r1], #1

exit:
	pop		{r0, r2-r6, lr}
	bx		lr

.end
