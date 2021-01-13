        .data
v:      .word 1, 2, 3, 4, 5, 6, 7, 8
        .text
        .global main

main:   ldr r0, =v                      @ indirizzo vettore
        mov r1, #8                      @ lunghezza vettore
        push {lr}
        bl filtrapari
        pop {pc}


filtrapari:     cmp r1, #0              @ r1 == 0
                beq end                 @ se si, esci
                ldr r2, [r0], #4        @ carica vettore in r2
                mov r3, r2              @ copia di r2
                and r2, r2, #1          @ and bit a bit di r2
                cmp r2, #1              @ se r2 != 1 significa che e' pari
                bne pari                @ allora vai a pari
                mov r2, r3              @ altrimenti significa che e' dispari e si riprende il suo valore

pari:           sub r1, r1, #1          
                b filtrapari

end:            mov pc, lr
