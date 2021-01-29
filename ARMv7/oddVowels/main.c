#include <stdio.h>
#define MAX 100

extern int oddVowels(char *z);
int main(){

        char s[MAX];
        scanf("%s", s);

        printf("%d\n", oddVowels(s));

        return 0;
}
