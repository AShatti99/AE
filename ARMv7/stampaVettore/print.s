        .data
v:      .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
fmt:    .string "%d\n"
        .text
        .global main

main:   push {lr}
        ldr r0, =v              @ indirizzo vettore
        mov r1, #10             @ lunghezza vettore

loop:   cmp r1, #0              @ r1 == 0
        beq end                 @ se si, esci
        ldr r2, [r0], #4        @ carica r2
        push {r0, r1}           @ ricorda l'indirizzo e la lunghezza

        mov r1, r2              @
        ldr r0, =fmt            @ stampa
        bl printf               @

        pop {r0, r1}            @ riprendi l'indirizzo e la lunghezza
        sub r1, r1, #1          @ r1--
        b loop                  @ torna a loop

end:    pop {lr}
        bx lr

