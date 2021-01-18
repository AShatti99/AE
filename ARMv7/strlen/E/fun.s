        .text
        .global somma

somma:  push {r4, lr}
        mov r4, r0              @ r4 = indirizzo stringa
        bl strlen               @ r0 = n
        mov r1, #0              @ sum = 0
        mov r2, #0              @ i = 0

loop:   cmp r2, r0              @ i < n
        beq end
        ldrb r3, [r4, r2]       @ s[i]
        push {r0, r2}
        bl quanto
        add r1, r1, r0          @ sum += quanto(s[i])
        pop {r0, r2}
        add r2, r2, #1          @ i++
        b loop

end:    mov r0, r1
        pop {r4, lr}
        bx lr


quanto: mov r0, #0              @ ret = 0
        mov r2, r3
        sub r2, r2, #0x30       @ v = c - '0'
        cmp r2, #0              @ se v < 0
        blt fine                @ ritorna
        cmp r2, #9              @ se > 9
        bgt fine                @ ritorna
        mov r0, r2              @ ret = v

fine:   mov pc, lr 
