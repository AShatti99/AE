#include <stdio.h>

extern void div(int a, int b);

int main(){

        int x, y;

        scanf("%d%d", &x, &y);
        div(x, y);

        return 0;
}
