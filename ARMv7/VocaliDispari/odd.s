@ Restituire 1 se il numero di vocali presente nella stringa data in input e' dispari, altrimenti restituire 0


        .data
str:    .string "%d\n"
        .text
        .global odd
                                @ r0 = stringa
odd:    mov r1, #0              @ numero vocali

        push {lr}
        bl lower                @ converti tutta la stringa in lowerCase 

for:    ldrb r2, [r0]
        cmp r2, #0              @ se r3 == NULL, esci
        beq end

        cmp r2, #97             @ se r3 == 'a'
        addeq r1, r1, #1
        cmp r2, #101            @ se r3 == 'e'
        addeq r1, r1, #1
        cmp r2, #105            @ se r3 == 'i'
        addeq r1, r1, #1
        cmp r2, #111            @ se r3 == 'o'
        addeq r1, r1, #1
        cmp r2, #117            @ se r3 == 'u'
        addeq r1, r1, #1

        add r0, r0, #1
        b for

end:    and r1, #1              @ r2 && 1
        ldr r0, =str
        bl printf
        pop {pc}


lower:  push {r0, r1}

for2:   ldrb r1, [r0]
        cmp r1, #0              @ se r1 == NULL, esci
        popeq {r0, r1}
        moveq pc, lr
        cmp r1, #65             @ se r1 < 'A', vai avanti
        blt next
        cmp r1, #90             @ se r1 > 'Z', vai avanti
        bgt next
        add r1, r1, #32         @ rendilo minuscolo
        strb r1, [r0]

next:   add r0, r0, #1
        b for2
