        .data
str:    .string "somma: %d\n"
        .text
        .global main

main:   push {r4, r5, lr}
        add r4, r1, #4
        mov r5, #0              @ somma

for:    ldr r0, [r4], #4        @ carico argomento
        cmp r0, #0              @ se r0 == NULL, esci
        beq end
        bl atoi                 @ converti in numero
        bl conv                 @ vai a conv
        add r5, r5, r0          @ somma += r0
        b for

end:    mov r1, r5              @
        ldr r0, =str            @ stampa
        bl printf               @
        pop {r4, r5, lr}
        mov pc, lr

conv:   and r1, r0, #7          @ r0 AND 111
        cmp r1, #0              @ se r1 != 0 allora r0 = 0
        movne r0, #0
        mov pc, lr  
