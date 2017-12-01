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
	ldr r4, addr_of_oAddend1len
	ldr r3, [r1]			@param 1 in r3
	mov r5, #5
	str r5, [r1]
	@mov r4, #0
	@ldr r4, addr_of_oAddend1len
	@ldr r4, [r4]
	@ldr r5, addr_of_oAddend1len
	@add r7, r4, #5
	@str r7, [r5]
	mov r0, #0			@trigger overflow
        pop {lr}
        bx lr

addr_of_oAddend1len: .word oAddend1len
addr_of_oAddend2len: .word oAddend2len
addr_of_oSumlen: .word oSumlen
addr_of_oAddend1arr: .word oAddend1arr
addr_of_oAddend2arr: .word oAddend2arr
addr_of_oSumarr: .word oSumarr


