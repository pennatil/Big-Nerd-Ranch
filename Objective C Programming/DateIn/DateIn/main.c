//
//  main.c
//  DateIn
//
//  Created by Lucas Pennati on 29.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#include <stdio.h>
#include <time.h>

int main(int argc, const char * argv[])
{
    //Get seconds since 1970
    long secondsSince1970 = time(NULL);
    struct tm now;
    localtime_r(&secondsSince1970, &now);
    
    int recalcYear = 1900 + now.tm_year;
    // Add 1 as the range of after.tm_mon is 0 to 31
    int recalcMonth = 1 + now.tm_mon;
    int recalcDay = now.tm_mday;
    
    
    printf("The date right now is: %d-%d-%d\n", recalcYear,recalcMonth, recalcDay);
    
    
    
    
    
    //add 4'000'000 seconds to it
    long secondsSince1970Plus4MilSecs =  secondsSince1970 + 4000000;
    
    struct tm after;
    localtime_r(&secondsSince1970Plus4MilSecs, &after);
    //Add 1900 as what is returned by the struct is the years since 1900
    recalcYear = 1900 + after.tm_year;
    // Add 1 as the range of after.tm_mon is 0 to 31
    recalcMonth = 1 + after.tm_mon;
    recalcDay = after.tm_mday;
    //Print it!
    printf("The date in 4'000'000 seconds is going to be: %d-%d-%d\n", recalcYear,recalcMonth, recalcDay);
    return 0;
}

