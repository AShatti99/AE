        .text
        .global check

check:  ldrb r1, [r0]
        cmp r1, #0              @ se r1 == NULL, esci
        moveq r0, #1            @ ok, il numero e' binario
        moveq pc, lr

        sub r1, r1, #48         @ sottrai 48 al carattere, cioe' fallo diventare un numero

        cmp r1, #0              @ se r1 < 0
        movlt r0, #0            @ allora r0 = 0, esci
        movlt pc, lr

        cmp r1, #1              @ se r1 > 0
        movgt r0, #0            @ allora r0 = 0, esci
        movgt pc, lr

        add r0, r0, #1          @ vai avanti con il prossimo carattere
        b check
