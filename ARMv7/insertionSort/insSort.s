        .data
fmt1:   .string "pipeline"
fmt2:   .string "\n"
        .text
        .global main

main:   push {r4, r5, lr}       @ INSERTION SORT
        ldr r0, =fmt1
        mov r4, r0              @ r4 = indirizzo stringa
        bl strlen               @ r0 = lunghezza stringa
        mov r1, #1              @ j = 1

loop1:  cmp r1, r0              @ j < lunghezza stringa
        beq end
        ldrb r2, [r4, r1]       @ key = a[j];
        mov r3, r1
        sub r3, r3, #1          @ i = j - 1
        push {r0, r1}

loop2:  cmp r3, #0              @ se i < 0
        blt fine                @ vai a fine
        ldrb r0, [r4, r3]       @ a[i]
        cmp r0, r2              @ se a[i] <= key
        ble fine                @ vai a fine
        mov r1, r3
        add r1, r1, #1          @ i+1
        mov r5, r0
        strb r5, [r4, r1]       @ a[i+1]=a[i]
        sub r3, r3, #1          @ i--
        b loop2

fine:   cmp r3, #-1
        moveq r1, #0
        movne r1, r3
        addne r1, r1, #1        @ i+1
        mov r5, r2
        strb r5, [r4, r1]       @ a[i+1]=key
        pop {r0, r1}
        add r1, r1, #1          @ j++
        b loop1

end:    ldr r0, =fmt1
        bl printf
        ldr r0, =fmt2
        bl printf
        pop {r4, r5, lr}
        bx lr
