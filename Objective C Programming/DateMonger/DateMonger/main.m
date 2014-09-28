//
//  main.m
//  DateMonger
//
//  Created by Lucas Pennati on 07.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+BNRDateConvenience.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDate *newDate = [NSDate bnr_dateFromDay:01 Month:01 Year:1900];
        
        
        NSLog(@"%@", newDate);
    }
    return 0;
}

