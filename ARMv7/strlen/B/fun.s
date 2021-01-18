        .text
        .global mystrstr

mystrstr:       push {r4-r6, lr}
                mov r4, r0              @ r4 = indirizzo stringa
                mov r5, r1              @ r5 = indirizzo parola
                bl strlen
                push {r0}
                mov r0, r5
                bl strlen 
                mov r1, r0              @ r1 = lp
                pop {r0}                @ r0 = ls

                mov r2, #-1             @ trovata = -1
                mov r3, #0              @ i = 0
                mov r6, r0
                sub r6, r6, r1
                add r6, r6, #1          @ r6 = (ls - lp + 1)

loop1:          cmp r3, r6              @ i < (ls - lp + 1)
                beq end
                push {r0, r2, r3, r6}
                bl match
                cmp r0, #1              @ se res = 1
                pop {r0, r2, r3, r6}
                moveq r2, r3            @ allora trovata = i
                beq end                 @ allora esci
                add r4, r4, #1          @ vai avanti con la stringa
                add r3, r3, #1          @ i++
                b loop1

end:            mov r0, r2
                pop {r4-r6, lr}
                bx lr


match:          mov r0, #1              @ res = 1
                mov r3, #0              @ i = 0

loop2:          cmp r3, r1              @ i < l
                beq fine                 
                ldrb r2, [r4, r3]       @ uno[i]
                ldrb r6, [r5, r3]       @ due[i]
                cmp r2, r6              @ se uno[i] != due[i]
                movne r0, #0            @ allora res = 0
                bne fine                @ allora ritorna
                add r3, r3, #1          @ altrimenti i++
                b loop2

fine:           mov pc, lr
