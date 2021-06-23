        .data
str:    .string "MAX: %d\n"
        .text
        .global max

max:    push {r0, lr}           @ ti ricordi il puntatore alla stringa
        ldr r1, [r0], #4        @ r1 = max (inizializzato al primo valore della lista)
        ldr r0, [r0]

for:    cmp r0, #0              @ se r0 == NULL, esci
        beq end
        ldr r2, [r0], #4
        cmp r2, r1              @ se r2 > r1 allora r1 = r2
        movgt r1, r2
        ldr r0, [r0]
        b for

end:    ldr r0, =str
        bl printf
        pop {r0, lr}
        bx lr
