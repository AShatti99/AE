        .text
        .global cambia
                                @ r1 = l
cambia: push {r0, r1, r4, r5, lr}
        bl strlen
        mov r4, r0              @ r4 = ls
        pop {r0, r1}            @ r0 = indirizzo stringa
        mov r2, #0              @ sum = 0
        mov r3, #0              @ i = 0

loop:   cmp r3, r4              @ i < ls
        beq end
        push {r4}
        ldrb r5, [r0, r3]       @ cc = cifra(s[i], l)
        bl cifra
        cmp r4, r5              @ se cc != s[i]
        movne r5, r4            @ allora s[i] = cc    
        addne r2, r2, #1        @ allora sum++
        pop {r4}
        strb r5, [r0, r3]       
        add r3, r3, #1          @ i++
        b loop

end:    mov r0, r2
        pop {r4, r5, lr}
        bx lr


cifra:  mov r4, r5              @ cc = c
        cmp r5, #0x7a           @ se c > 'z'
        bgt fine                @ allora ritorna
        cmp r5, #0x61           @ c < 'a'
        blt fine                @ allora ritorna
        add r4, r5, r1          @ cc = c + n
        cmp r4, #0x7a           @ se cc > 'z' allora cc = cc - 'z' + 'a' - 1
        subgt r4, r4, #0x7a
        addgt r4, r4, #0x61
        subgt r4, r4, #1

fine:   mov pc, lr
