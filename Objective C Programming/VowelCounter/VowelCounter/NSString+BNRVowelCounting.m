//
//  NSString+BNRVowelCounting.m
//  VowelCounter
//
//  Created by Lucas Pennati on 07.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "NSString+BNRVowelCounting.h"

@implementation NSString (BNRVowelCounting)
- (int)bnr_vowelCount
{
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    NSInteger count = [self length];
    int sum = 0;
    for (int i=0; i<count; i++){
        unichar c = [self characterAtIndex:i];
        if ([charSet characterIsMember:c]){
            sum++;
        }
    }
    return sum;
}
@end
