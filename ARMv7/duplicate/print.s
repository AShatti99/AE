        .data
fmt:   .string "%d "
        .text
        .global print

print:  push {lr}

loop:   cmp r2, #0            @ se lunghezza lista == 0
        beq end               @ esci
        ldr r1, [r0], #4      @ carica r1
        push {r0, r2}         @ ricorda indirizzo e lunghezza lista

        ldr r0, =fmt          @ stampa
        bl printf

        pop {r0, r2}          @ riprendi i valori
        sub r2, r2, #1        @ lunghezza lista--
        b loop

end:    pop {lr}
        bx lr
