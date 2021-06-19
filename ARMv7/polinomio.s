@ Calcolo di x + 2x^2 + 3x^3 + ... + nx^n

        .data
str:    .string "Risultato: %d\n"
        .text
        .global main

main:   push {r4, lr} 
        mov r1, #4              @ x
        mov r2, #3              @ n
        mov r3, #2              @ indice che si ferma quando supera n

        mov r4, r1              @ accumulatore per calcolare x^n
        mov r0, r1              @ somma inizializzata al valore di x
loop:   cmp r3, r2              @ se l'indice e' maggiore di n, esci
        bgt end
        mul r4, r4, r1          @ x^n
        mla r0, r4, r3, r0      @ somma += nx^n
        add r3, r3, #1          @ incrementa l'indice
        b loop

end:    mov r1, r0
        ldr r0, =str
        bl printf
        pop {r4, lr}
