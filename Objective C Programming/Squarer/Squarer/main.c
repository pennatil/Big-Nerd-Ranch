//
//  main.c
//  Squarer
//
//  Created by Lucas Pennati on 28.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>


int main(int argc, const char * argv[])
{
    int valueToSquare = 5;
    int valueSquared = valueToSquare * valueToSquare;
    printf("\"%d\" squared is \"%d\".\n", valueToSquare, valueSquared);
    return 0;
}

