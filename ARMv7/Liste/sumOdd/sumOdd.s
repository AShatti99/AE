        .data
fmt:    .string "Somma: %d\n"
        .text
        .global sumOdd

sumOdd: push {r0, lr}           @ mi devo ricordare r0 per la funzione print
        mov r3, #0              @ somma 

loop:   cmp r0, #0              @ r0 == NULL
        beq end                 @ allora esci
        ldr r1, [r0], #4        @ carico r1
        mov r2, r1              @ r2 = r1
        and r2, r2, #1          @ r2 and 1
        cmp r2, #1              @ se r2 == 1 significa che e' dispari
        addeq r3, r3, r1        @ allora r3 += r1
        ldr r0, [r0]            @ vai avanti con la lista
        b loop          

end:    mov r1, r3              @ sposta la somma su r1
        ldr r0, =fmt            
        bl printf               @ stampa
        pop {r0, lr}
        bx lr
