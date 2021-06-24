#include <stdio.h>

extern int check (char * x);
extern void bin (char * x);

int main() {

        char a[100];
        printf("Inserisci un numero binario: ");
        scanf("%s", a);

        if(check(a) == 1){

                bin(a);
        }
        else{
                printf("Il numero inserito non e' binario!\n");
        }

        return 0;
}
