@   int IP(int * x, int *y, int n) {
@   int sum = 0;
@   for(int i=0; i<n; i++)
@   sum+=x[i]*y[i];
@   return sum;        
        
        
        .data

x:      .word 1, 2, 3, 4
y:      .word 5, 6, 7, 8
n:      .word 4
str:    .string "Inner product: %d\n"

        .text
        .global main

main:   push {r4-r6, lr}

        mov r0, #0              @ sum = 0
        ldr r1, =x
        ldr r2, =y
        ldr r3, =n
        ldr r3, [r3]            @ r3 = n

        mov r4, #0              @ i = 0
for:    cmp r4, r3              @ i < N
        beq end
        ldr r5, [r1], #4        @ x[i]
        ldr r6, [r2], #4        @ y[i]
        mul r5, r5, r6          @ x[i] * y[i]
        add r0, r0, r5          @ sum+= x[i] * y[i]
        add r4, r4, #1          @ i++
        b for

end:    mov r1, r0              @ stampa
        ldr r0, =str
        bl printf

        pop {r4-r6, lr}
        bx lr
