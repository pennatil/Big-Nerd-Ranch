//
//  NSDate+BNRDateConvenience.m
//  DateMonger
//
//  Created by Lucas Pennati on 07.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "NSDate+BNRDateConvenience.h"

@implementation NSDate (BNRDateConvenience)
+ (NSDate *)bnr_dateFromDay:(int)day Month:(int)month Year:(int)year
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc]init];
    
    NSDate *provisionalDate = [[NSDate alloc]init];
    
    [components setDay:day];
    [components setYear:year];
    [components setMonth:month];
    
    provisionalDate = [cal dateFromComponents:components];
    
    return provisionalDate;
    
}
@end
