@ Fattoriale di un numero
       
       
        .data
str:    .string "Fattoriale: %d\n"
        .text
        .global main

main:   mov r0, #5              @ 4!
        mov r1, #1              @ accumulatore

fat:    cmp r0, #1              @ caso base del fattoriale
        beq print
        mul r1, r1, r0                 
        sub r0, r0, #1
        b fat

print:  push {lr}
        ldr r0, =str
        bl printf
        pop {pc}
