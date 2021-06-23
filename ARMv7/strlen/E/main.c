#include <stdio.h>
#include <string.h>

extern int quanto(char);
extern int somma(char *);

int main(int argc, char ** argv) {

  char * s = "ab1c234d56e7f8g9a";  
  int c = somma(s);
  if(c == 45) 
    printf("Corretto\n");
  else 
    printf("Sbagliato\n");
  return 0;
}
