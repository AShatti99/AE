        .text
        .global somma

somma:  push {r0, r4, lr}
        bl strlen
        mov r1, r0              @ r1 = ls
        pop {r0}                @ r0 = puntatore alla stringa
        mov r2, #0              @ r2 -> sum = 0
        mov r3, #0              @ r3 -> i = 0

w:      cmp r3, r1
        beq end
        ldrb r4, [r0, r3]

        push {r0, r1, r3}
        bl quanto
        add r2, r2, r0
        pop {r0, r1, r3}

        add r3, r3, #1
        b w

end:    mov r0, r2
        pop {r4, lr}
        bx lr


quanto: mov r0, #0              @ r0 -> ret = 0
        mov r1, r4              @ r1 -> v = c
        sub r1, r1, #0x30       @ r1 -> v -= 0
        cmp r1, #0              @ se r1 < 0, esci
        blt next
        cmp r1, #9              @ se r1 > 9, esci
        bgt next
        mov r0, r1              @ ret = v

next:   mov pc, lr
