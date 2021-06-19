@ Calcolo della media dei voti. I voti sono definiti in una direttiva .word e utilizziamo un valore speciale -1 per terminare la lista. 
@ Si realizzi la divisione come funzione

        .data
v:      .word 30, 28, 27, 24, 28, 18, -1
str:    .string "Media: %d\n"
        .text
        .global main

main:   mov r0, #0              @ somma voti
        ldr r1, =v
        mov r3, #0              @ indice sui numeri da fare la media

somma:  ldr r2, [r1], #4        @ carico un numero
        cmp r2, #-1             @ controllo:
        addne r0, r0, r2        @               se e' uguale a -1, lo inserisco nella nella somma
        addne r3, r3, #1        @               e incremento l'indice
        bne somma               @               e torno a somma

        pusheq {lr}             @               altrimenti faccio la divisione
        bleq div

end:    mov r1, r0
        ldr r0, =str
        bl printf
        pop {pc}


div:    mov r1, #0              @ r1 = risultato divisione
for:    cmp r0, r3
        movlt r0, r1            @ per convenzione il risultato deve essere poi spostato in r0
        movlt pc, lr
        sub r0, r0, r3
        add r1, r1, #1
        b for
