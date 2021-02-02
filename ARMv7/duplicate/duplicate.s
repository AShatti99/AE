        .data
fmt:    .string "Doppione!\n"
        .text
        .global duplicate
                                @ r2 = lunghezza lista
duplicate: push {r0, r4-r7, lr}
           mov r1, #1           @ i
           mov r3, #4           @ offset1

loop1:  cmp r1, r2              @ i < lunghezza lista
        moveq r1, #0            @ se i == lunghezza lista allora r1=0
        beq end                 @ esci
        ldr r4, [r0, r3]        @ carica r4 (parte dal secondo elemento)
        mov r5, #0              @ j
        mov r6, #0              @ offset2
loop2:  cmp r5, r1              @ j < i
        addeq r1, r1, #1        @ se j == i allora i++
        addeq r3, r3, #4        @ offset1 += 4
        beq loop1
        ldr r7, [r0, r6]        @ carica r7 (parte dal primo elemento)
        cmp r4, r7              @ r4 == r7?
        moveq r1, #1            @ se si, r1=1
        beq end                 @ esci
        add r6, r6, #4          @ altrimenti offset2 += 4
        add r5, r5, #1          @ j++
        b loop2

end:    cmp r1, #1              @ se r1 == 1 significa vi e' un doppione
        ldreq r0, =fmt          @ stampa
        bleq printf
        pop {r0, r4-r7, lr}
        bx lr
