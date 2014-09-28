//
//  main.c
//  CountDown
//
//  Created by Lucas Pennati on 28.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    //Loop through numbers from 99 to 0, qith a decrease of 3
    for (int i = 99; i>=0; i-=3){
        printf("%d\n",i);
        // If divisible by five, print the sentence
        if (i % 5 == 0){
            printf("Found one!\n");
        }
    }
    return 0;
}

