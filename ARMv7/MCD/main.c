#include <stdio.h>

extern void mcd(int x, int y);

int main(){

        int x, y;

        scanf("%d%d", &x, &y);

        mcd(x, y);

        return 0;
}
