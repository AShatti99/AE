#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void * array (int n, int max) {


        int *arr = (int *)malloc(n*sizeof(int));
        srand(time(NULL));
        for(int i=0; i<n; i++){

                arr[i] = rand() % max;
        }

        return ((void *) arr);
}
