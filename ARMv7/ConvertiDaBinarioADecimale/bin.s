        .data
str:    .string "Equivale ad %d\n"
        .text
        .global bin

bin:    mov r1, #0              @ somma

for:    ldrb r2, [r0]
        cmp r2, #0              @ se r2 == NULL, esci
        beq end

        sub r2, r2, #48         @ fai diventare il carattere un numero

        lsl r1, r1, #1          @ r1 = 0 * 2
        add r1, r1, r2          @ somma += r2
        add r0, r0, #1          @ vai avanti con il prossimo carattere
        b for

end:    push {lr}
        ldr r0, =str
        bl printf
        pop {pc}
