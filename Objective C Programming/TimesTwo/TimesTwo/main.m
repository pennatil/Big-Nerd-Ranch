//
//  main.m
//  TimesTwo
//
//  Created by Lucas Pennati on 31.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDate *currentTime = [NSDate date];
        NSLog(@"currentTime's value is %p", currentTime);
        NSDate *startTime = currentTime;
        
        sleep(2);
        
        currentTime = [NSDate date];
        NSLog(@"currentTime's value is %p", currentTime);
        NSLog(@"startTime's value is %p", startTime);
        
        currentTime = nil;
        NSLog(@"CurrentTime's value is now %p", currentTime);
        
    }
    return 0;
}

