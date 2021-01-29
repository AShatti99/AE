        .text
        .global main

main:   push {lr}
        mov r0, #10     @ lista lunga 10
        mov r1, #10     @ elementi tra [0,9]
        bl list
        bl max
        bl print
        pop {lr}
        bx lr
