        .data
fmt1:   .string "%d -> "
fmt2:   .string "Fine lista\n"
        .text
        .global print

print:  push {lr}

loop:   cmp r0, #0              @ se la lista e' vuota
        beq end                 @ esci
        ldr r1, [r0], #4        @ r0 -> next
        push {r0, r1}
        ldr r0, =fmt1
        bl printf               @ stampa fmt1
        pop {r0, r1}
        ldr r0, [r0]            @ scorri la lista
        b loop

end:    ldr r0, =fmt2
        bl printf               @ stampa fmt2
        pop {lr}
        bx lr
