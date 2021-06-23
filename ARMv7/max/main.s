        .text
        .global main

main:   push {lr}
        bl list         @ r0 = puntatore alla lista
        bl max          @ trova il max
        bl print        @ stampa lista
        pop {pc}
