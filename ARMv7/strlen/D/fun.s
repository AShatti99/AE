        .text
        .global cambia

cambia: push {r0, r4-r5, lr}
        bl strlen
        mov r1, r0              @ r1 = ls
        pop {r0}                @ r0 = puntatore alla stringa

        mov r2, #0              @ r2 -> sum = 0
        mov r3, #0              @ r3 -> i = 0

for:    cmp r3, r1
        beq end
        ldrb r4, [r0, r3]       @ s[i]

        push {r0-r2}
        bl cambiaV              @ cambiaV(s[i])
        mov r5, r0              @ r5 = cc
        pop {r0-r2}

        cmp r5, r4              @ se cc== s[i], vai a next1
        beq next1
        strb r5, [r0, r3]       @ s[i] = c
        add r2, r2, #1          @ sum++

next1:  add r3, r3, #1          @ i++
        b for

end:    mov r0, r2
        pop {r4-r5, lr}
        bx lr


cambiaV:        mov r1, r4              @ r1 -> v
                sub r1, r1, #0x30       @ v = c - 0

                cmp r1, #0              @ se v < 0, vai a next2
                blt next2
                cmp r1, #9              @ se v > 9, vai a next2
                bgt next2
                add r1, r1, #5          @ v = v + 5
                cmp r1, #9              @ se v <= 9, vai a next2
                ble next2

                mov r2, #0              @ r2 = risultato della divisione
div:            cmp r1, #2
                movlt r1, r2
                blt next2
                sub r1, r1, #2
                add r2, r2, #1
                b div

next2:          mov r0, r1              @ r0 -> r0 = v
                add r0, r0, #0x30       @ r0 -> r0 += 0
                mov pc, lr 
