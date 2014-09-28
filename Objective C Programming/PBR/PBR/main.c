//
//  main.c
//  PBR
//
//  Created by Lucas Pennati on 29.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>
#include <math.h>

void metersToFeetAndInches(double meters, unsigned int *ftPtr, double *inPtr){
    //This function assumes meters is non-negative
    
    //Convert the number of meters into a floating-point number of feet
    double rawFeet = meters * 3.281;
    
    //How many complete feet as an unsigned int?
    unsigned int feet = (unsigned int)floor(rawFeet);
    
    //Store the number of feet at the supplied address
    printf("Storing %u to the address %p \n", feet, ftPtr);
    
    //Calculate inches
    double fractionalFoot = rawFeet - feet;
    double inches = fractionalFoot * 12.0;
    
    //Store the number of inches at the supplied address
    printf("Storing %.2f to the address %p\n", inches, inPtr);
    *inPtr = inches;
}


int main(int argc, const char * argv[])
{
    //First part
/*
    double pi = 3.14;
    double integerPart;
    double fractionPart;
    
    //Pass the address of integerPart as an argument
    fractionPart = modf(pi, &integerPart);
    
    //Find the value stored in integerPart
    printf("integerPart = %.0f, fractionPart = %.2f\n", integerPart, fractionPart);
*/
    double meters = 3.281;
    unsigned int feet;
    double inches;
    
    metersToFeetAndInches(meters, &feet, &inches);
    printf("%.1f meters is equal to %d feet and %.1f inches.\n", meters, feet, inches);
    return 0;
}

