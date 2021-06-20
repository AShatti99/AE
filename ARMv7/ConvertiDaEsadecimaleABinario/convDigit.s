        .text
        .global convDigit
                                        @ r1 = singolo carattere
convDigit:      cmp r1, #57             @ se r1 <= '9'
                suble r1, r1, #48       @            sottrai 48
                subgt r1, r1, #87       @ altrimenti sottrai 87
                
                mov r0, r1              @ metti il risultato in r0
                mov pc, lr
