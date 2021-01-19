        .text
        .global main

main:   push {lr}
        mov r0, #16       @ lista lunga 16
        mov r1, #8        @ elementi compresi tra [0,8]
        bl list           @ alloca lista
        mov r4, r0        @ ricorda indirizzo lista
        bl print          @ stampa
        mov r0, r4        @ r0 = indirizzo lista
        bl subst          @ modifica lista
        mov r0, r4        @ r0 = indirizzo lista
        bl print          @ stampa
        pop {lr}
        bx lr
