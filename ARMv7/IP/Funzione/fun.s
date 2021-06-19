        .text
        .global IP

IP: push {r4, r5}

loop:   cmp r3, #0
        beq end
        ldr r4, [r1], #4
        ldr r5, [r2], #4
        mla r0, r4, r5, r0
        sub r3, r3, #1
        b loop

end:    pop {r4, r5}
        mov pc, lr
