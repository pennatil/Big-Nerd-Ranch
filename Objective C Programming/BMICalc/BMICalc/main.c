//
//  main.c
//  BMICalc
//
//  Created by Lucas Pennati on 29.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>

//Declaring the struct
typedef struct {
    float heightInMeters;
    int weightInKilos;
}Person;

float bodyMassIndex(Person p){
    return p.weightInKilos/(p.heightInMeters * p.heightInMeters);
}


int main(int argc, const char * argv[])
{
    Person mikey;
    mikey.heightInMeters = 1.7;
    mikey.weightInKilos = 96;
    
    Person aaron;
    aaron.heightInMeters = 1.97;
    aaron.weightInKilos = 84;
    
    float bmi;
    bmi = bodyMassIndex(mikey);
    printf("Mikey has a BMI of %.2f\n", bmi);
    
    bmi = bodyMassIndex(aaron);
    printf("Aaron has a BMI of %.2f\n", bmi);
    
    return 0;
}