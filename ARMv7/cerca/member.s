@ Dato un vettore, la sua lunghezza e un intero restituire 1 se il valore e' presente, altrimenti restituire 0

        .data
v:      .word 1, 2, 3, 4, 5, 6, 7, 8
fmt:    .string "Il valore e' presente: %d\n"
        .text
        .global main

main:   mov r0, #8              @ lunghezza vettore
        ldr r1, =v              @ indirizzo vettore
        mov r2, #11             @ dato da cercare
        push {lr}
        bl cerca
        pop {pc}

cerca:  cmp r0, #0              @ r0 == 0
        moveq r1, #0            @ se si, r1=0
        beq fine                @ ed esci
        ldr r3, [r1], #4        @ carica r3
        cmp r2, r3              @ r2 == r3
        moveq r1, #1            @ se si, r1=1
        beq fine                @ ed esci
        sub r0, r0, #1          @ r0--
        b cerca

fine:   push {r0, lr}
        ldr r0, =fmt            @ stampa
        bl printf
        pop {r0, lr}
        mov pc, lr              @ ritorna
