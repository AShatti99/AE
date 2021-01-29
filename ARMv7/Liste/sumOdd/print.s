        .data
fmt1:   .string "%d -> "
fmt2:   .string "Fine lista\n"
        .text
        .global print

print:  push {lr}

loop:   cmp r0, #0
        beq end
        ldr r1, [r0], #4
        push {r0, r1}
        ldr r0, =fmt1
        bl printf
        pop {r0, r1}
        ldr r0, [r0]
        b loop

end:    ldr r0, =fmt2
        bl printf
        pop {lr}
        bx lr
