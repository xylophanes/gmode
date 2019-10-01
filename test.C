//#include <iostream>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

//using namespace std;
int main(int argc, char *argv[])

{   if(sizeof(void *) == 8) 
       //cout << "Pointers are 8 bytes (64 bit mode)\n";
       fprintf(stderr,"Pointers are 8 bytes (64 bit mode)\n");
    else
      //cout << "Pointers are 4 bytes (32 bit mode)\n";
       fprintf(stderr,"Pointers are 8 bytes (32 bit mode)\n");

    exit(0);
}

