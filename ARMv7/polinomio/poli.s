                                @ Dati due valore x e n, calcolare la sommatoria per i=1 fino a n di i*x^i
                                @ x + 2x^2 + 3x^3 + ... + nx^n
        .data
fmt:    .string "Sommatoria: %d\n"
        .text
        .global main

main:   push {r4, r5, lr}
        mov r0, #0              @ somma
        mov r1, #4              @ x
        mov r2, #3              @ n
        mov r3, #1              @ i
        mov r4, #1              @ supporto

loop:   cmp r3, r2
        bgt print
        mul r4, r4, r1          @ x^i, dove a ogni iterazione conservo il valore precedente
        mul r5, r3, r4          @ i*x^i
        add r0, r0, r5          @ r0 = r0 + i*x^i
        add r3, r3, #1          @ i++
        b loop

print:  mov r1, r0              @ 
        ldr r0, =fmt            @ stampa
        bl printf               @

end:    pop {r4, r5, lr}
        bx lr
