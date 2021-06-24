        .data
str1:   .string "%s\n"
str2:   .string "ReversE"
        .text
        .global main


main:   push {r4, r5, lr}
        ldr r0, =str2
        push {r0}
        bl strlen               @ r0 = puntatore alla lista
        mov r1, r0              @ r1 = dimensione lista
        pop {r0}
        mov r2, #0              @ r2-> i = 0
        mov r3, r1              @ r3-> j = dim
        sub r3, r3, #1

for1:   cmp r2, r3
        bgt end
        ldrb r4, [r0, r2]
        ldrb r5, [r0, r3]
        strb r4, [r0, r3]
        strb r5, [r0, r2]
        add r2, r2, #1
        sub r3, r3, #1
        b for1

end:    ldr r0, =str1
        ldr r1, =str2
        bl printf
        pop {r4, r5, lr}
        bx lr
