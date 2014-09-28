//
//  main.c
//  Turkey
//
//  Created by Lucas Pennati on 28.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    //Declaring a variable of type float with name 'weight', and store a number
    float weight = 14.2;
    
    //Log it to the user
    printf("The turkey weighs %f.\n", weight);
    
    //Declare another variable of type float, and calculate the cooking time
    float cookingTime = 15.0 + 15.0 * weight;
    
    //Log it to the user
    printf("It's going to take %f minutes to cook.\n", cookingTime);
    
    return 0;
    
    
}

