@ mywc.s
.data
        numberOut: .asciz "%d "
        result: .asciz "%c"
.text
        .equ newline, '\n'
        .equ space, ' '
        .global main
        .extern printf
        .extern getchar
main:
        push {lr}
        mov r7, #0      @init r7 for charCount
        mov r8, #0      @init r8 for wordCount
        mov r9, #0      @init r9 for lineCount
        mov r10, #0     @init r10 for flag
while:
        bl getchar
        add r0, #1
        cmp r0, #0              @if getchar returns EOF
        beq end                 @go to end
        sub r0, #1
        mov r2, r0
        add r7, #1              @charCount++
        ldr r11, =space
        cmp r2, r11
        beq incWord             @if  getchar returned ' '
        ldr r11, =newline
        cmp r2, r11
        beq incLine             @if getchar returned '\n'
        mov r10, #0             @else flag = 0
        b while
        incWord:
                cmp r10, #0     @if flag == 0
                beq incWordFlag
                b while
        incLine:
                add r8, #1      @wordCount++
                add r9, #1      @lineCount++
                b while
        incWordFlag:
                add r8, #1      @wordCount++
                mov r10, #1     @flag == 1
                b while
        end:
        ldr r0, =numberOut      @r0 = "%d "
        mov r1, r7              @r1 = , charCount
        bl printf               @printf(r0 r1)
        ldr r0, =numberOut
        mov r1, r8
        bl printf
        ldr r0, =numberOut
        mov r1, r9
        bl printf
        bl getchar              @consume EOF
        pop {lr}
        bx lr
