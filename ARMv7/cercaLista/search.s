        .data
str:    .string "Pos: %d\n"
        .text
        .global search
                                        @ r0 = puntatore alla lista
                                        @ r1 = elemento da cercare
search: push {r0, lr}
        mov r2, #1                      @ r2 = posizione

loop:   cmp r0, #0
        moveq r2, #-1                   @ r0 == NULL, esci
        beq end
        ldr r3, [r0], #4                @ M[r0] -> r3, r0 += 4
        cmp r3, r1
        beq end
        add r2, r2, #1                  @ posizione++
        ldr r0, [r0]                    @ r0 -> next
        b loop

end:    mov r1, r2
        ldr r0, =str
        bl printf
        pop {r0, lr}
        bx lr
