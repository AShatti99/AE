        .text
        .global main

main:   push {lr}
        mov r0, #3
        mov r1, #10
        bl list
        bl check
        pop {lr}
        bx lr
