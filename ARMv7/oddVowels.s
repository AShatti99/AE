@ retituire 1 se il numero di vocali dati in input e' dispari, altrimenti restituire 0

           .text
           .global oddVowels
                                @ r0 = stringa
oddVowels: push {r0, r4, lr}
           bl strlen
           mov r1, r0           @ r1 = dimensione stringa
           pop {r0}
           mov r2, #0           @ i
           mov r3, #0           @ somma

loop:      cmp r2, r1
           beq end
           ldrb r4, [r0, r2]
           cmp r4, #97          @ se r4 == a
           addeq r3, r3, #1     @ sum++
           cmp r4, #101         @ se r4 == e
           addeq r3, r3, #1     @ sum++
           cmp r4, #105         @ se r4 == i
           addeq r3, r3, #1     @ sum++
           cmp r4, #111         @ se r4 == o
           addeq r3, r3, #1     @ sum++
           cmp r4, #117         @ se r4 == u
           addeq r3, r3, #1     @ sum++
           add r2, r2, #1       @ i++
           b loop

end:       and r3, r3, #1
           mov r0, r3
           pop {r4, lr}
           bx lr
