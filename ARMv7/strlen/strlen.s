        .data
str:    .string "LatchD"
fmt:    .string "Dimensione stringa: %d\n"
        .text
        .global main

main:   push {lr}

        ldr r0, =str            @ indirizzo stringa
        bl strlen               @ assegna a r0 la dimensione della stringa

        mov r1, r0              @ sposta la dimensione stringa in r1
        ldr r0, =fmt            @ indirizzo fmt
        bl printf               @ stampa dimensione

end:    pop {lr}
        bx lr
