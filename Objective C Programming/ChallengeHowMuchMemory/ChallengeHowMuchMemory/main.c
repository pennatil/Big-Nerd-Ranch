//
//  main.c
//  ChallengeHowMuchMemory
//
//  Created by Lucas Pennati on 29.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    printf("A float is %zu bytes\n", sizeof(float));
    printf("A pointer to a float is %zu bytes\n", sizeof(float *));
    return 0;
}

