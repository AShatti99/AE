         .text
         .global cambia

cambia:  push {r4-r5, lr}
         mov r4, r0              @ r4 = dimensione stringa
         bl strlen               @ r0 = ls
         mov r1, #0              @ sum = 0
         mov r2, #0              @ i = 0

loop:    cmp r2, r0              @ i < ls
         beq end
         push {r0, r2}
         ldrb r3, [r4, r2]       @ r3 = cc
         mov r5, r3              @ r5 = s[i]
         bl cambiaV
         cmp r3, r5              @ cc != s[i]
         movne r3, r5            @ allora s[i] = cc
         addne r1, r1, #1        @ sum++
         pop {r0, r2}
         strb r3, [r4, r2]
         add r2, r2, #1          @ i++
         b loop

end:     mov r0, r1
         pop {r4-r5, lr}
         bx lr


cambiaV: mov r0, r5
         sub r0, r0, #0x30      @ v = c - '0'
         cmp r0, #0             @ se v < 0
         blt fine               @ vai a fine
         cmp r0, #9             @ se v > 9
         bgt fine               @ vai a fine
         add r0, r0, #5         @ v = v + 5
         cmp r0, #9             @ se v <= 9
         ble fine               @ allora vai a fine, altrimenti fai la divisione
         mov r2, #0             @ r2 = risultato divisione

div:     cmp r0, #2             @ se r0 >= 2 
         movlt r0, r2           @ altrimenti prima di uscire assegni il risultato della divisione a r0
         blt fine
         sub r0, r0, #2         @ allora r0 = r0 - 2
         add r2, r2, #1         @ allora r2++
         b div

fine:    mov r5, r0
         add r5, r5, #0x30      @ c = v + '0'
         mov pc, lr
