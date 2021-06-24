@  Dato un vettore, la sua lunghezza e un intero restituire 1 se il valore e' presente, altrimenti restituire 0

        .data
v:      .word 1, 2, 3, 4, 5, 6, 7, 8
n:      .word 8
str:    .string "%d\n"
        .text
        .global main

main:   ldr r0, =v                      @ puntatore all'array
        ldr r1, =n
        ldr r1, [r1]                    @ dimensione array
        mov r2, #4                      @ valore da cercare
        mov r3, #0                      @ i

for:    cmp r3, r1                      @ i < dim
        moveq r1, #0                    @ se i == dim allora r1 = 0
        beq end                         @ allora esci
        ldr r4, [r0, r3, lsl #2]        @ M[r0 + r3 * 4] -> r4
        cmp r4, r2                      @ se r4 == r2
        moveq r1, #1                    @ allora r1 = 1
        beq end                         @ allora esci
        add r3, r3, #1                  @ i++
        b for

end:    push {lr}
        ldr r0, =str
        bl printf
        pop {pc}
