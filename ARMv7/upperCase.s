@ Trasformazione di una stringa ASCII in maiuscolo
        
        .data
str:    .string "%s\n"
fmt:    .string "sTacK fRaMe"
        .text
        .global main

main:   ldr r1, =fmt

loop:   ldrb r2, [r1]           @ carico in r2 una lettera
        cmp r2, #0              @ se r2 == NULL, esci
        beq end
        cmp r2, #97             @ se la lettera e' piu' piccola di 'a', vai a next
        blt next
        cmp r2, #122            @ se la lettera e' piu' grande di 'z', vai a next
        bgt next
        sub r2, r2, #32         @ quindi la lettera e' compresa tra 'a' e 'z', sottrai 32, cioe' fai diventare la lettera maiuscola
        strb r2, [r1]           @ carichi in r1 il valore di r2

next:   add r1, r1, #1          @ vai avanti con la prossima lettera
        b loop

end:    ldr r0, =str            @ stampa
        ldr r1, =fmt
        bl printf

        mov r7, #1              @ exit
        svc 0
