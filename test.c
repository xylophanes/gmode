#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char *argv[])

{   if(sizeof(void *) == 8) 
       (void)fprintf(stderr,"Pointers are 8 bytes (64 bit mode)\n");
    else
       (void)fprintf(stderr,"Pointers are 4 bytes (32 bit mode)\n");
    (void)fflush(stderr);

    exit(0);
}

