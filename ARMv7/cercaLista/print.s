        .data
str1:   .string "%d -> "
str2:   .string "FINE\n"
        .text
        .global print

print:  push {lr}
loop:   cmp r0, #0
        beq end
        ldr r1, [r0], #4

        push {r0}
        ldr r0, =str1
        bl printf
        pop {r0}

        ldr r0, [r0]
        b loop

end:    ldr r0, =str2
        bl printf
        pop {lr}
        bx lr
