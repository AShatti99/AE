        .data
str:    .string "StAcK fRaMe"
fmt:    .string "%s\n"
        .text
        .global main

main:   push {lr}
        ldr r0, =str            @ indirizzo stringa

loop:   ldrb r1, [r0]           @ carica r1
        cmp r1, #0              @ ri == 0
        beq print               @ se si, esci la stringa e' finita

        cmp r1, #97             @ r1 < 97                                       (ASCII a = 97)
        blt next                @ significa che e' una maiuscola, vai a next
        cmp r1, #122            @ r1 > 123
        bgt next                @ significa che non e' una lettera, vai a next  (ASCII z = 122)
        sub r1, r1, #32         @ allora e' una lettera minuscola, sottrai 32 e la fai diventare maiuscola
        strb r1, [r0]           @ e la scrivi in memoria

next:   add r0, r0, #1          @ vai avanti con la stringa
        b loop

print:  ldr r0, =str            @
        ldr r1, =fmt            @ stampa
        bl printf               @

end:    pop {lr}
        bx lr
