        .data
v:      .word 1, 2, 3, 4, 5
        .text
        .global main
                                  @ |      valore             |      r1        |        r0      | NOTE
main:   ldr r0, =v                @ |                         |                |      66512     |
        ldr r1, [r0]              @ |   r1 = M[r0+0]          |       1        |      66512     | r0 non cambia
        ldr r1, [r0, #4]          @ |   r1 = M[r0+4]          |       2        |      66512     |
        mov r2, #8                @ |                         |                |                |
        ldr r1, [r0, r2]!         @ |   r1 = M[r0+r2]         |       3        |      66520     | PRE-INDEX
        ldr r1, [r0, #-4]         @ |   r1 = M[r0-4]          |       2        |      66520     | 
        ldr r1, [r0], #4          @ |   r1 = M[r0]            |       3        |      66524     | POST-INDEX
                                  @ |                         |                |                |
        mov r2, #2                @ |                         |                |                |
        ldr r1, [r0, r2, lsl #1]  @ |   r1 = M[r0 + r2 * 2]   |       5        |      66524     | lo shift a sinistra di una posizione
                                  @ |                         |                |                | corrisponde a moltiplicare per 2
        mov r2, #16               @ |                         |                |                |
        ldr r1, [r0, r2, lsr #2]  @ |   r1 = M[r0 + r2 / 4]   |       5        |      66524     | lo shift a destra di due posizioni
                                  @ |                         |                |                | corrisponde a dividere per 4
        mov pc, lr
