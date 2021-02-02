        .text
        .global main

main:   push {lr}
        mov r0, #5      @ lista lunga 5
        mov r1, #16     @ numeri compresi tra [0, 15]
        mov r2, r0
        push {r2}       @ mi ricordo la lunghezza della lista
        bl array        @ alloco array
        bl duplicate    @ trovo un eventuale doppione
        pop {r2}
        bl print        @ stampo
        pop {lr}
        bx lr
