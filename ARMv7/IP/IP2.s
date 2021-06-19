@ Versione alternativa utilizzando MLA e senza l'indice i
        
        
        .data

x:      .word 1, 2, 3, 4
y:      .word 5, 6, 7, 8
n:      .word 4
str:    .string "Inner product: %d\n"

        .text
        .global main

main:   push {r4, r5, lr}

        mov r0, #0              @ sum = 0
        ldr r1, =x
        ldr r2, =y
        ldr r3, =n
        ldr r3, [r3]            @ r3 = n

for:    cmp r3, #0              @ se n==0, esci
        beq end
        ldr r4, [r1], #4        @ x[i]
        ldr r5, [r2], #4        @ y[i]
        mla r0, r4, r5, r0      @ sum+= x[i] * y[i]
        sub r3, r3, #1          @ n--
        b for

end:    mov r1, r0
        ldr r0, =str
        bl printf

        pop {r4, r5, lr}
        bx lr
