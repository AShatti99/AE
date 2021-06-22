        .text
        .global cambia

cambia: push {r4-r5, lr}        @ mi ricordo il puntatore alla stringa, e l'intero
        push {r0, r1}
        bl strlen
        mov r2, r0              @ r2 = ls
        pop {r0, r1}

        mov r3, #0              @ r3 = sum
        mov r4, #0              @ r4 = i

for:    cmp r4, r2
        beq end
        ldrb r5, [r0, r4]       @  s[i]

        push {r0}
        bl cifra
        cmp r0, r5              @ se cc != s[i]
        movne r5, r0            @ allora s[i] = cc
        addne r3, r3, #1        @ allora sum ++
        pop {r0}

        strb r5, [r0, r4]       @ riscrivi in memoria
        add r4, r4, #1          @ i++
        b for

end:    mov r0, r3
        pop {r4-r5, lr}
        bx lr


cifra:  mov r0, r5              @ cc = c
        cmp r5, #0x7a           @ c > 'z', ritorna
        bgt next2
        cmp r5, #0x61           @ c < 'a', ritorna
        blt next2
        add r0, r5, r1          @ cc = c + n
        cmp r0, #0x7a           @ cc > 'z' allora cc = cc- z + a - 1
        addgt r0, r0, #0x61     
        subgt r0, r0, #0x7a     
        subgt r0, r0, #1        

next2:  mov pc, lr
