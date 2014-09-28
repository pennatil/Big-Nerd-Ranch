//
//  main.c
//  Triangle
//
//  Created by Lucas Pennati on 28.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>

float remainingAngle(float angleA, float angleB){
    float remainingAngle = 180.0 - angleA - angleB;
    return remainingAngle;
}

int main(int argc, const char * argv[])
{
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA, angleB);
    printf("The third angle is %.2f degrees.\n", angleC);
    return 0;
}

