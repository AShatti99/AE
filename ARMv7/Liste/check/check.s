        .data
fmt1:   .string "Ordinata\n"
fmt2:   .string "Non ordinata\n"
        .text
        .global check
                                @ Stampa "Ordinata" se la lista e' in ordine non decrescente, altrimenti stampa "Non ordinata"
check:  push {lr}

loop:   cmp r0, #0              @ se la lista e' vuota
        moveq r1, #1            @ allora r1 = 1
        beq end                 @ vai a end
        ldr r1, [r0, #4]        @ r1 = next
        cmp r1, #0              @ se r1 == next
        moveq r1, #1            @ allora r1 = 1
        beq end                 @ vai a end
        ldr r2, [r0]            @ cur->info
        ldr r3, [r1]            @ cur->next->info
        cmp r2, r3              @ se r2 > r3
        movgt r1, #0            @ r1 =0
        bgt end                 @ vai a ned
        mov r0, r1              @ cur=cur->next
        b loop

end:    cmp r1, #1              @ se r1==1
        ldreq r0, =fmt1         @ allora la lista e' ordinata
        bleq printf
        ldrne r0, =fmt2         @ altrimenti non e' ordinata
        blne printf
        pop {lr}
        bx lr
