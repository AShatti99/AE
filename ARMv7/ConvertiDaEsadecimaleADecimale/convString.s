        .text
        .global convstring
                                @ r0 = stringa
convstring:     mov r2, #0      @ somma
                mov r3, #16     @ accumulatore di 16

        push {lr}
for:    ldrb r1, [r0]
        cmp r1, #0              @ se r1 == NULL, esci
        beq end

        push {r0}
        bl convDigit            @ trasforma il carattere in un numero
        mov r1, r0
        pop {r0}

        mul r2, r2, r3          @ somma = somma * 16
        add r2, r2, r1          @ somma = somma + r1
        add r0, r0, #1          @ vai avanti con il prossimo carattere
        b for

end:    mov r0, r2              @ metti il risultato in r0
        pop {lr}                @ torna
        bx lr
