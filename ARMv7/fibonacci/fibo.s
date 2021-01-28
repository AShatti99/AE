        .data
fmt:    .string "Fibo(4) = %d\n"
        .text
        .global main

main:   push {lr}
        mov r0, #4
        bl fibo
        mov r1, r0
        ldr r0, =fmt
        bl printf
        pop {lr}
        bx lr


fibo:   cmp r0, #1
        movle pc, lr
        sub r0, r0, #1
        push {r0, lr}
        bl fibo
        pop {r1}
        push {r0}
        sub r0, r1, #1
        bl fibo
        pop {r1}
        add r0, r0, r1
        pop {pc}
