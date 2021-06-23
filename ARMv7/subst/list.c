#include <stdio.h>
#include <stdlib.h>

/* tipo per l'elemento della lista: due parole contigue con informazione (intera)
e puntatore al prossimo elemento della lista */

typedef struct __node { 
        int info; 
        struct __node * next; 
} node_t;

/* alloca una lista con un numero di elementi dato (informazione: numero pseudo
casuale in [0,max) e restituisce il puntatore al primo elemento */

void * l_alloca(int n, int max) {
        node_t * start = NULL;
        srand(123);
        for(int i=0; i<n; i++) {
                node_t * ptr = (node_t *) malloc(sizeof(node_t));
                ptr->info = rand() % max;
                ptr->next = start;
                start = ptr;
        }

        return ((void *) start);
}

/* stampa una lista di elementi node_t (solo campo info) */
void l_stampa(node_t * p) {
        printf("Lista generata:\n");
        while(p != NULL) {
                printf("%d -> ",p->info);
                p = p->next;
        }

                printf("Fine lista\n");
        return;
}
