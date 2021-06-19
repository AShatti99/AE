#include <stdio.h>

extern void odd(char * s);

int main(){

        char str[100];
        scanf("%s", str);

        odd(str);

        return 0;
}
