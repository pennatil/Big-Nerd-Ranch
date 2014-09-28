//
//  main.m
//  HowManySecondsYouHaveBeenAlive
//
//  Created by Lucas Pennati on 29.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //Get the current date
        NSDate *now = [[NSDate alloc] init];
        //Set up my birthdate
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        //Set up each component individually
        [comps setYear:1991];
        [comps setMonth:8];
        [comps setDay:1];
        [comps setHour:23];
        [comps setMinute:45];
        [comps setSecond:00];
        //Create a calendar
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        //Create a birtdate variable with the components above
        NSDate *dateOfBirth = [g dateFromComponents:comps];
        //Time in seconds
        unsigned long timeInterval = [now timeIntervalSinceDate:dateOfBirth];
        //Print it
        NSLog(@"I have been alive for %lu seconds.", timeInterval);
        
    }
    return 0;
}

