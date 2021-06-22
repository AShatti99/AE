        .text
        .global main

main:   push {lr}
        bl list         @ r0 = puntatore alla lista
        push {r0}       @ ricordati il puntatore
        bl elem         @ r0 = elemento da cercare in input
        mov r1, r0      @ sposta l'elemento da cercare in r1
        pop {r0}        @ r0 ritorna ad essere il puntatore alla lista
        bl search       @ cerca l'elemento
        bl print        @ stampa
        pop {pc}
