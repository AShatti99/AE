        .text
        .global cambia

cambia: push {r4-r6, lr}
        mov r4, r0              @ r4 = indirizzo stringa
        bl strlen               @ r0 = ls
        mov r1, #0              @ sum = 0
        mov r2, #0              @ i = 0
        mov r5, r0
        sub r5, r5, #1          @ r5 = ls - 1

loop1:  cmp r2, r5              @ i < ls -1
        beq end
        mov r3, r2
        add r3, r3, #1          @ r3 = j = i+1

loop2:  cmp r3, r0              @ j < ls
        addeq r2, r2, #1        @ se j = ls allora i++
        beq loop1
        push {r0, r1, r5}
        bl cambiaV
        pop {r0, r1, r5}
        add r1, r1, r6          @ sum += cambiaV(s,i,j)
        add r3, r3, #1          @ j++
        b loop2

end:    mov r0, r1
        pop {r4-r6, lr}
        bx lr


cambiaV: mov r6, #0             @ cambio = 0
         ldrb r0, [r4, r2]      @ s[i]
         ldrb r1, [r4, r3]      @ s[j]
         cmp r0, r1             @ se s[i] > s[j] 
         movgt r5, r0           @ allora c = s[i]
         movgt r0, r1           @ allora s[i] = s[j]
         movgt r1, r5           @ allora s[j] = c
         movgt r6, #1           @ cambio = 1
         strb r0, [r4, r2]      
         strb r1, [r4, r3]
         mov pc, lr
