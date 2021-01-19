        .text
        .global subst

subst:  cmp r0, #0              @ se la lista e' vuota
        moveq pc, lr            @ esci
        ldr r1, [r0, #4]        @ r1 = next (r0 non viene modificato)
        cmp r1, #0              @ se r1 == 0 la lista e' finita
        moveq pc, lr            @ esci
        ldr r3, [r0]            @ cur->info
        ldr r2, [r1]            @ cur->next->info
        cmp r3, r2              @ se r3 > r2, scambia i valori
        strgt r2, [r0]          
        strgt r3, [r1]
        mov r0, r1              @ cur=cur->next
        b subst
