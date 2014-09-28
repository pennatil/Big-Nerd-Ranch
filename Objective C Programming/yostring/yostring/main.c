//
//  main.c
//  yostring
//
//  Created by Lucas Pennati on 08.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, const char * argv[])
{
//    char x = '!'; //The character '!'
//    
//    while (x <= '~') { //THe character '~'
//        printf("%x is %c\n",x,x);
//        x++;
//    }
    
    //Get a pointer to 5 bytes of memory on the heap
    const char *start = "A Backslash after two newlines and a tab: \n\n\t";
    
    printf("%s has %zu characters \n", start, strlen(start));
    
    printf("The third letter is %c\n", start[2]);
    
 
    
    return 0;
}

