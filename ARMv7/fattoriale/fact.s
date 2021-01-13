                                       @ Da gdb per vedere i valori che salva la push in sp -> x/2dw #NumeroEsadecimale
        .data
fmt:    .string "Fattoriale: %d\n"
        .text
        .global main

main:   push {lr}                      
        mov r0, #4                      @ fai il fattoriale di 4
        bl fact                         @ vai a fact

print:  mov r1, r0                      @
        ldr r0, =fmt                    @ stampa
        bl printf                       @

end:    pop {lr}
        bx lr

fact:   push {r0, lr}                   @ ricorda r0 e lr
        cmp r0, #1                      @ r0 != 1
        bne ric                         @ se si vai a ric
        mov pc, lr                                              @ esci, cioe' fai la pop/moltiplicazione di ric

ric:    sub r0, r0, #1                  @ r0--
        bl fact                         @ vai a fact
        pop {r1, lr}                                            @ recupera il PRIMO VALORE della pila e assegnalo ad r1
        mul r0, r1, r0                                          @ r0 = r0 * r1
        mov pc, lr                                              @ torna a pop finche' non finisce la pila
