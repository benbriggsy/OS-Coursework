@bigintadd.s
.extern printf

.data
	hello: .asciz " %d,"
	oAddend1len: .word 0
	oAddend2len: .word 0
	oSumlen: .word 0
        oAddend1arr: .word 0
        oAddend2arr: .word 0
        oSumarr: .word 0
.text

.global BigInt_add

BigInt_add:
	push {lr}
	mov r3, #10 @[r0]
	mov r4, #5 @[r1]
        bl BigI
	afterLarger:
		@ldr r0, =hello
		@mov r1, r10
		@bl printf	@print larger length thats returned
		mov r7, #0	@i = 0
		mov r11, #0	@uiCarry = 0
		b end
		for:
			cmp r7, r10	@i < iSumLength
			bge end
			mov r3, r11	@uisum = uicarry
        		mov r11, #0	@uicarry = 0
			@ldr r5, [r0]
			@ldr r4, [r5, r7, LSL #2]
			@ldr r4, [r4]
			@add r3, r3, r4	@uiSum += oAddend1->auiDigits[i];
                        @ldr r5, [r1]
                        @ldr r4, [r5, r7, LSL #2]
			@ldr r4, [r4]
			@add r3, r3, r4  @uiSum += oAddend1->auiDigits[i];
                        @ldr r5, [r2]
			@ldr r4, [r5, r7, LSL #2] 	@pointer to a[i]
       			@str r3, [r4]
			add r7, r7, #1
			b for
BigInt_larger:
	cmp r4, r3
	ble length1IsGreater
	mov r10, r4	@return param 2
	b afterLarger
length1IsGreater:
	mov r10, r3	@return param 1
	b afterLarger
end:
	@ldr r0, =hello
        @mov r1, r10
        @bl printf       @print iSumLength
	@ldr r3, =oSumlen @ load address iSumLength
	@str r10, [r2]		@store r10 (#1) to iSumLength
	mov r0, #0		@trigger overflow 
        pop {lr}
        bx lr

addr_of_oAddend1len: .word oAddend1len
addr_of_oAddend2len: .word oAddend2len
addr_of_oSumlen: .word oSumlen
addr_of_oAddend1arr: .word oAddend1arr
addr_of_oAddend2arr: .word oAddend2arr
addr_of_oSumarr: .word oSumarr


