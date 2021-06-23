        .data
str1:   .string "%d -> "
str2:   .string "FINE\n"
        .text
        .global print

print:  push {lr}

for:    cmp r0, #0              @ se r0 == NULL, esci
        beq end
        ldr r1, [r0], #4

        push {r0}
        ldr r0, =str1
        bl printf
        pop {r0}

        ldr r0, [r0]
        b for

end:    ldr r0, =str2
        bl printf
        pop {pc}
