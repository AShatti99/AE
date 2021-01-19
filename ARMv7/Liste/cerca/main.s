        .text
        .global main

main:   push {lr}
        mov r0, #6      @ lista di 6 elementi
        mov r1, #10     @ compresi tra [0,10]
        bl list         @ alloca lista
        mov r2, #7      @ elemento da cercare
        bl find
        bl print
        pop {lr}
        bx lr
