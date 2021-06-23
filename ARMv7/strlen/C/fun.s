        .text
        .global cambia

cambia: push {r0, r4-r6, lr}
        bl strlen                
        mov r1, r0              @ r1 = ls
        pop {r0}                @ r0 = puntatore alla stringa
        mov r2, #0              @ r2 -> sum = 0

        mov r3, #0              @ r3 -> i = 0
        mov r4, r1
        sub r4, r4, #1          @ r4 = ls - 1

for1:   cmp r3, r4
        beq end

        mov r5, r3
        add r5, r5, #1          @ r5 -> j = i+1
for2:   cmp r5, r1              @ se j == ls
        addeq r3, r3, #1        @ allora i++
        beq for1                @ allora esci dal for interno

        push {r0, r1, r4}
        bl cambiaV
        add r2, r2, r0          @ sum = cambiaV(s, i, j)
        pop {r0, r1, r4}

        add r5, r5, #1          @ j++
        b for2

end:    mov r0, r2
        pop {r4-r6, lr}
        bx lr


cambiaV:        mov r1, r0              @ r1 = puntatore stringa
                mov r0, #0              @ r0 -> cambio = 0
                ldrb r4, [r1, r3]
                ldrb r6, [r1, r5]
                cmp r4, r6              @ se s[i] <= s[j]
                ble next                @ allora esci
                strb r6, [r1, r3]
                strb r4, [r1, r5]
                mov r0, #1              @ cambio = 1

next:           mov pc, lr
