//
//  main.c
//  CountDownUserInput
//
//  Created by Lucas Pennati on 28.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>
#include <readline/readline.h>

int main(int argc, const char * argv[])
{
    printf("Where does the loop start? ");
    const char *startNumberCHAR = readline(NULL);
    int startNumber = atoi(startNumberCHAR);
    
    for (int i = startNumber; i >= 0; i-=3){
        printf("%d\n", i);
        if (i % 5 == 0){
            printf("Found One!\n");
        }
    }
    return 0;
}

