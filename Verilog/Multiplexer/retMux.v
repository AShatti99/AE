primitive retMux(output y, input s, input d1, input d0);

        table
                0 ? 0 : 0;      // se il segnale di controllo s e' 0 passa d0
                0 ? 1 : 1;
                1 0 ? : 0;      // altrimenti se e' 1 passa d1
                1 1 ? : 1;
        endtable
endprimitive
