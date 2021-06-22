#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern char cifra(char,int);
extern int cambia(char *,int);


int main(int argc, char ** argv) {

  char * s = (char *) malloc(10);
  strcpy(s,"abcxyz");
  int c = cambia(s,1);
  char * r = (char *) malloc(10);
  strcpy(r,"abcxyz");
  int d = cambia(r,5);

  if(strcmp(s,"bcdyza")==0 && c == 6 && strcmp(r, "fghcde") == 00 && d == 6 )
    printf("Corretto\n");
  else
    printf("Sbagliato\n");
  return(0);
}
