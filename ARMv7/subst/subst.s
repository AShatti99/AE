        .text
        .global subst

subst:  push {r0, lr}
        mov r1, r0

        ldr r3, [r1], #4        @ succ = corr->next
        ldr r1, [r1]

for:    cmp r1, #0
        beq end

        ldr r2, [r0]            @ corr->info
        ldr r3, [r1]            @ succ->info
        cmp r2, r3              @ se corr->info > succ->info
        strgt r2, [r1]          @ allora fai uno swap dei valori
        strgt r3, [r0]
        ldr r0, [r0, #4]        @ corr = corr->next
        ldr r1, [r1, #4]        @ succ = succ->next
        b for

end:    pop {r0, lr}
        bx lr
