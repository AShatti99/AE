        .data
fmt:    .string "pos: %d\n"
        .text
        .global find

find:   push {r0, lr}           @ per effettuare le funzioni successive, mi ricordo l'indirizzo della lista
        mov r3, #0              @ pos = 0

loop:   cmp r0, #0              @ se la lista e' vuota
        moveq r3, #-1           @ significa che l'elemento non c'era quindi pos = -1
        beq end
        ldr r1, [r0], #4        @ r0 -> next
        cmp r1, r2              @ se r1 == elemento da cercare
        beq end                 @ esci
        ldr r0, [r0]            @ scorri la lista
        add r3, r3, #1          @ pos++
        b loop

end:    mov r1, r3
        ldr r0, =fmt            @ stampa
        bl printf
        pop {r0, lr}            @ riprendi indirizzo lista
        bx lr
