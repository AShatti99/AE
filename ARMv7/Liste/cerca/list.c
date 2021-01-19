#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct _node {

        int info;
        struct _node * next;
} node_t;

void * list(int n, int max){

        node_t * start = NULL;
        srand(time(NULL));
        for(int i=0; i<n; i++){
                node_t * ptr = (node_t *) malloc (sizeof(node_t));
                ptr->info = rand() % max;
                ptr->next = start;
                start = ptr;
        }

        return ((void *) start);
}
