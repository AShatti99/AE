        .data
v:      .word 30, 28, 27, 24, 28, 18, -1
fmt:    .string "Media: %d\n"
        .text
        .global main

main:   push {lr}
        ldr r0, =v              @ indirizzo voti
        mov r2, #0              @ somma voti
        mov r3, #0              @ numero voti

somma:  ldr r1, [r0], #4        @ carico voto in r1
        cmp r1, #-1             @ r1 == -1
        beq div                 @ se si, vai a div
        add r2, r2, r1          @ r2 = r2 + r1
        add r3, r3, #1          @ r3++
        b somma

div:    mov r0, #0              @ r0 = 0
loop:   cmp r2, r3              @ r2 < r3
        blt print               @ se si, stampa la media
        sub r2, r2, r3          @ r2 = r2 - r3
        add r0, r0, #1          @ r0++ (la media)
        b loop

print:  mov r1, r0              @ sposta la media in r1
        ldr r0, =fmt            @ indirizzo stringa
        bl printf               @ stampa

end:    pop {lr}
        bx lr
