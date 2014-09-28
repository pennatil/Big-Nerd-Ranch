//
//  main.c
//  Degrees
//
//  Created by Lucas Pennati on 28.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>


float fahrenheitFromCelsius(float celsius){
    float fahrenheit = celsius * 1.8 + 32.0;
    printf("%f Celsius = %f Fahrenheit.\n", celsius, fahrenheit);
    return fahrenheit;
}


int main(int argc, const char * argv[])
{
    float freezeInC = 0;
    float freezeInF = fahrenheitFromCelsius(freezeInC);
    printf("Water freezes at %f degrees Fahrenheit. \n", freezeInF);
    return 0;
}