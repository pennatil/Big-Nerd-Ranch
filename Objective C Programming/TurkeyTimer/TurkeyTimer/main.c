//
//  main.c
//  TurkeyTimer
//
//  Created by Lucas Pennati on 28.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>


int hello = 3;

void showCookingTimeForTurkey(int pounds){
    int necessaryMinutes = 15 + 15 * pounds;
    printf("Cook for %d minutes.\n", necessaryMinutes);
    if (necessaryMinutes > 120) {
        int halfway = necessaryMinutes / 2;
        printf("Rotate after %d of the %d minutes.\n", halfway, necessaryMinutes);
    }
}

int main(int argc, const char * argv[])
{
    int totalWeight = 10;
    int gibleWeight = 1;
    int turkeyWeight = totalWeight - gibleWeight;
    printf("%d", hello);
    showCookingTimeForTurkey(turkeyWeight);
    return 0;
}

