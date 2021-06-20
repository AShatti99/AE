@ Scrivere il codice della funzione filtrapari che riceve come parametri:
@ - la lunghezza del vettore (n)
@ - l'indirizzo base del vettore v di interi di n posizioni
@ e sostituisce con 0 tutti gli elementi di valore pari nel vettore.
@ !!! La parte della stampa non era richiesta !!!


        .data

v:      .word 1, 2, 3, 4, 5, 6, 7, 8
n:      .word 8
str1:   .string "%d -> "
str2:   .string "FINE\n"

        .text
        .global main

main:   push {r4, lr}
        ldr r0, =v
        ldr r1, =n
        ldr r1, [r1]            @ n
        mov r4, #0              @ offset
        push {r0, r1}           @ mi ricordo l'indirizzo del vettore e la lunghezza per la stampa

for:    cmp r1, #0
        beq print
        ldr r2, [r0, r4]
        mov r3, r2              @ r3 = valore di supporto per ricordarsi temporaneamente il valore di r2
        and r2, #81             @ r2 && 1: quindi i valori pari diventano 0, i valori dispari diventano 1
        cmp r2, #1              @ se r2 == 1, allora r2 si riprende il suo valore
        moveq r2, r3
        strne r2, [r0, r4]      @ se r2 == 0, riscrivilo in memoria
        add r4, r4, #4
        sub r1, r1, #1
        b for

print:  pop {r0, r1}            @ si riprende il valore dell'indirizzo e la lunghezza del vettore

loop:   cmp r1, #0
        beq end
        ldr r2, [r0], #4

        push {r0, r1}           @ si salva r0, r1 perche' bl me li sporchera'
        mov r1, r2
        ldr r0, =str1
        bl printf
        pop {r0, r1}

        sub r1, r1, #1
        b loop

end:    ldr r0, =str2
        bl printf
        pop {r4, lr}
