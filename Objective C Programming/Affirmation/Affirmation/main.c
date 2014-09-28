//
//  main.c
//  Affirmation
//
//  Created by Lucas Pennati on 08.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
int main(int argc, const char * argv[])
{
    if (argc != 3){
        printf(stderr, "Usage: Affirmation <adjective> <number>\n");
        return 1;
    }
    int count = atoi(argv[2]);
    
    for (int j = 0;j < count; j++) {
        printf("You are %s\n", argv[1]);
    }
    return 0;
}

