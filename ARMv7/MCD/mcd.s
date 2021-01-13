        .data
fmt:    .string "MCD: %d\n"
        .text
        .global mcd
                                @ r0= primo valore; r1= secondo valore
mcd:    push {lr}

loop:   cmp r0, r1              @ r0 == r1
        beq print               @ se si, stampa l'mcd
        subgt r0, r0, r1        @ se r0 > r1 -> r0=r0-r1
        sublt r1, r1, r0        @ se r1 > r0 -> r1=r1-r0
        b loop

print:  ldr r0, =fmt            @ indirizzo stringa
        bl printf               @ stampa

end:    pop {lr}
        bx lr

