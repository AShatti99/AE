        .data
fmt:    .string "multiplexer"
        .text
        .global main

main:   push {r4, r5, lr}
        ldr r0, =fmt            @ r0 = indirizzo stringa
        push {r0}
        bl strlen
        mov r1, r0              @ r1 = lunghezza stringa 
        mov r0, #0
        push {r1}

div:    cmp r1, #2
        blt rev
        sub r1, r1, #2
        add r0, r0, #1
        b div

rev:    mov r2, r0              @ r2 = lunghezza lista / 2
        pop {r1}
        pop {r0}
        sub r1, r1, #1
        mov r3, #0              @ r3 = i

loop:   cmp r3, r2              @ i < lunghezza lista /2
        beq end
        ldrb r4, [r0, r3]       @ carichi la prima lettera
        ldrb r5, [r0, r1]       @ carichi l'ultima lettera
        strb r5, [r0, r3]       @
        strb r4, [r0, r1]       @ li scambi
        add r3, r3, #1          @ i++
        sub r1, r1, #1          @ lunghezza lista --
        b loop

end:    ldr r0, =fmt
        bl printf               @ stampi la nuova stringa
        pop {r4, r5, lr}
        bx lr
