@ Versione alternativa utilizzando una funzione

        .data

x:      .word 1, 2, 3, 4
y:      .word 5, 6, 7, 8
n:      .word 4

str:    .string "Inner product: %d\n"

        .text
        .global main

main:   mov r0, #0
        ldr r1, =x
        ldr r2, =y
        ldr r3, =n
        ldr r3, [r3]

        push {lr}
        bl IP

end:    mov r1, r0
        ldr r0, =str
        bl printf
        pop {pc}
