@ ./prog ciao hello hola

        .data
str1:   .string "%s"
str2:   .string "\n"
        .text
        .global main

main:   push {r4-r7, lr}
        add r1, r1, #4                  @ r1 = argv[i] con i>=1
        mov r2, #0                      @ r2 = offset

for:    ldr r0, [r1, r2, lsl #2]        @ r0 = argomento
        cmp r0, #0                      @ se r0 == NULL, esci
        beq end
        bl sort
        ldr r0, [r1, r2, lsl #2]        @ ricarica l'argomento
        push {r0, r1, r2}
        ldr r1, =str1                   @
        bl printf                       @ stampa
        ldr r0, =str2                   @
        bl printf                       @
        pop {r0, r1, r2}
        add r2, r2, #1                  @ aumenta l'offset
        b for

end:    pop {r4-r7, lr}
        mov pc, lr
                                        @ BUBBLE SORT
sort:   push {r0, r1, r2, lr}           @ r0 = indirizzo stringa
        bl strlen
        mov r1, r0                      @ r1 = dim
        mov r2, r1
        sub r2, r2, #1                  @ r2 = dim-1
        pop {r0}
        mov r3, #1                      @ r3 = j

l1:     cmp r3, r1                      @ se j = dim, esci
        popeq {r1, r2, pc}
        mov r4, #0                      @ r4 = i

l2:     cmp r4, r2                      @ se i = dim-1, allora j++ e vai a l1
        addeq r3, r3, #1
        beq l1
        mov r5, r4
        add r5, r5, #1                  @ r5 = i+1
        ldrb r6, [r0, r4]               @ a[i]
        ldrb r7, [r0, r5]               @ a[i+1]
        cmp r6, r7                      @ se a[i] > a[i+1] scambia i valori, altrimenti vai a fine
        ble fine
        strb r6, [r0, r5]
        strb r7, [r0, r4]
fine:   add r4, r4, #1                  @ i++
        b l2
