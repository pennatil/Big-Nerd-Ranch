//
//  main.c
//  Coolness
//
//  Created by Lucas Pennati on 28.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int i;
    for (i = 0; i < 12; i++){
        if (i % 3 == 0){
            continue;
        }
        printf("Checking i = %d\n", i);
        if (i * i == i + 90){
            break;
        }
    }
    printf("The answer is %d\n", i);
    return 0;
}

