        .data
fmt1:   .string "Il risultato e' %d\n"
fmt2:   .string "Il resto e' %d\n"
        .text
        .global div
                                @ primo numero salvato in r0
                                @ secondo numero salvato in r1
div:    push {lr}               @ ricorda il punto di ritorno del main
        mov r2, #0              @ in r2 ci sara' il risultato della divisione

loop:   cmp r0, r1              @ r0 < r1?
        blt print               @ se si, stampa
        sub r0, r0, r1          @ r0 = r0 - r1
        add r2, r2, #1          @ r2++
        b loop

print:  push {r0}               @ ricorda il valore di r0
        mov r1, r2              @ sposta il risultato in r1
        ldr r0, =fmt1           @ indirizzo stringa fmt1
        bl printf               @ stampa

        pop {r0}                @ riprendi il valore di r0
        mov r1, r0              @ sposta il risultato in r1
        ldr r0, =fmt2           @ indirizzo stringa fmt2
        bl printf               @ stampa

end:    pop {lr}                @ ritorno
        bx lr
