#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int cambiaV(char * , int , int);
extern int cambia(char *);

int main(int argc, char ** argv) {

  char * s = (char *) malloc(128);
  strcpy(s,"vediamoquestacomelaordina"); 
  int c = cambia(s); 
  if(c==130 && strcmp(s,"aaaacddeeeiilmmnoooqrstuv")==0)
    printf("Corretto\n");
  else 
    printf("Sbagliato\n");
  return 0;
}
