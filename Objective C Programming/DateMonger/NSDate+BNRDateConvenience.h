//
//  NSDate+BNRDateConvenience.h
//  DateMonger
//
//  Created by Lucas Pennati on 07.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BNRDateConvenience)
+ (NSDate *)bnr_dateFromDay:(int)day Month:(int)month Year:(int)year;
@end
