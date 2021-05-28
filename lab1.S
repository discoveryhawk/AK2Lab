.global lab1
.syntax unified
#define a #4
#define b #6
#define c #5
// (a+b)/2+c!
lab1:
    push {lr}
    mov r0, a
    mov r1, b
    mov r2, c
    bl var2
    pop {pc}
var2:
    push { r4, r5, lr }
    add r5, r0, r1
    mov r4, #2
    sdiv r5, r4
    mov r0, r2
    bl factorial
    add r0, r5
    pop { r4, r5, pc }

factorial:
    push { r4 }
    mov r4, 1
    .fact_var2:
        mul r4, r0
        subs r0, #1
        bne .fact_var2
    mov r0, r4
    pop { r4 }
    bx lr

