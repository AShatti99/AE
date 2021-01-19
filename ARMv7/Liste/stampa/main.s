        .text
        .global main

main:   push {lr}
        mov r0, #4      @ lista di 4 elementi
        mov r1, #10     @ compresi tra [0,10]
        bl list         @ alloca lista
        bl print        @ stampa lista
        pop {lr}
        bx lr
