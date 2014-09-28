//
//  main.m
//  DateList
//
//  Created by Lucas Pennati on 31.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //Create three NSDate Objects
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday =[now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        
        //Create a mutabe array
        NSMutableArray *dateList = [NSMutableArray array];
        [dateList addObject:now];
        [dateList addObject:tomorrow];
        [dateList insertObject:yesterday atIndex:0];
        
        
        //Iterate over the array
        for (NSDate *d in dateList){
            NSLog(@"Here is a date: %@", d);
        }
        
        //Remove yesterday
        [dateList removeObjectAtIndex:0];
        NSLog(@"Now the first date is %@", dateList[0]);
    }
    return 0;
}

