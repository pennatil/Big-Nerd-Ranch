//
//  main.c
//  gradeInTheShade
//
//  Created by Lucas Pennati on 08.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

float averageFloats(float *data, int dataCount)
{
    float sum = 0.0;
    for (int i = 0; i<dataCount; i++){
        sum += data[i];
    }
    return sum/dataCount;
}
int main(int argc, const char * argv[])
{
    //Create an array of floats
    float gradeBook[3];
    gradeBook[0] = 60.2;
    gradeBook[1] = 94.5;
    gradeBook[2] = 81.1;
    
    //Calculate te^he average
    float average = averageFloats(gradeBook, 3);
    
    
    printf("Average = %.2f\n", average);
    
    return 0;
}

