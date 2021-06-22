
        .text
        .global mystrstr

mystrstr:       push {r4-r6, lr}
                                        @ sposto i puntatori delle stringhe su r4 e r5 che non possono essere sporcate dalla strlen
                mov r4, r0              @ r4 = puntatore a ls
                mov r5, r1              @ r5 = puntatore a lp
                bl strlen
                push {r0}               @ r0 = ls e me lo salvo
                mov r0, r5
                bl strlen
                mov r1, r0              @ r1 = lp
                pop {r0}                @ r0 = ls

                mov r2, #-1             @ r2 = trovata
                mov r3, #0              @ r3 = i
                mov r6, #0
                add r6, r0, #1
                sub r6, r6, r1          @ ls - lp + 1

for1:           cmp r3, r6              @ i < (ls - lp + 1)
                beq end

                push {r0, r2, r3, r6}
                bl match
                cmp r0, #1              @ if(match(&stringa[i],parola,lp) == 1)
                pop {r0, r2, r3, r6}

                moveq r2, r3            @ allora trovata = i
                beq end                 @ allora break
                add r3, r3, #1          @ i++
                add r4, r4, #1          @ vado avanti con il puntatore di ls
                b for1

end:            mov r0, r2
                pop {r4-r6, lr}
                bx lr


match:          mov r0, #1              @ r0 = res
                mov r2, #0              @ r2 = i 
for2:           cmp r2, r1              @ i < l
                beq fine
                ldrb r3, [r4, r2]       @ uno[i]
                ldrb r6, [r5, r2]       @ due[i]
                cmp r3, r6              @ se uno[i] != due[i]
                movne r0, #0            @ allora res = 0
                bne fine                @ break
                add r2, r2, #1          @ i++
                b for2

fine:           mov pc, lr
