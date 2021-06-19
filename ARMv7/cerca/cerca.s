@ Ricerca di un valore dato in input in un array di interi, restituire la posizione. Nel caso in cui il valore non ci sia, restituire -1

        .data
v:      .word 34, 21, 45, 98, 23, 12, 74, 89
n:      .word 8
str:    .string "Posizione: %d\n"
        .text
        .global cerca
                                @ r0 = input
cerca:  push {r4, lr}
        ldr r1, =v
        ldr r2, =n
        ldr r2, [r2]            @ n
        mov r3, #1              @ posizione

loop:   ldr r4, [r1], #4
        cmp r0, r4              @ se si e' trovato l'elemento, esci
        beq end
        add r3, r3, #1          @ posizione++
        cmp r3, r2              @ se posizione >  n: r3 = -1, esci
        movgt r3, #-1
        bgt end
        b loop

end:    mov r0, r3
        mov r1, r0
        ldr r0, =str
        bl printf
        pop {r4, lr}
