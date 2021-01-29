        .data
fmt:    .string "max: %d\n"
        .text
        .global max

max:    push {r0, lr}           @ mi ricordo r0 per la funzione print
        ldr r2, [r0], #4        @ carico il primo numero
        ldr r0, [r0]            @ e scorro la lista
        mov r1, r2              @ r1 = max

loop:   cmp r0, #0              @ se lista == NULL
        beq end                 @ esci
        ldr r2, [r0], #4        @ carico r2
        cmp r2, r1              @ r2 > r1?
        movgt r1, r2            @ se si aggiorno il max
        ldr r0, [r0]            @ scorro la lista
        b loop

end:    ldr r0, =fmt    
        bl printf               @ stampo
        pop {r0, lr}
        bx lr
