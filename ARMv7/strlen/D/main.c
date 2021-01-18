#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char cambiaV(char);
extern int cambia(char *);

int main(int argc, char ** argv) {

  char * s = (char *) malloc(128); 
  strcpy(s,"a01b23c4d5e678f9a0a"); 
  int c = cambia(s); 
  if(strcmp(s,"a56b78c9d5e566f7a5a")==0 && c ==10) 
    printf("Corretto\n");
  else 
    printf("Sbagliato\n");
  return 0;
}
