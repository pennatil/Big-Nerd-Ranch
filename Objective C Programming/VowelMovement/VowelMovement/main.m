//
//  main.m
//  VowelMovement
//
//  Created by Lucas Pennati on 04.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSArray *originalStrings = @[@"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Missisippi"];
        
        NSLog(@"Original: %@", originalStrings);
        
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        
        NSArray *vowels = @[@"a",@"e",@"i",@"o",@"u"];
        
        //Declare a block variable
        //void (^devowelizer)(id,NSUInteger, BOOL *);
        
        //Compose a block and assign it to the variable
       // devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
        [originalStrings enumerateObjectsUsingBlock:^(id string, NSUInteger i, BOOL *stop){
            NSRange yRange = [string rangeOfString:@"y"
                                           options:NSCaseInsensitiveSearch];
            
            //Did it find a Y?
            if (yRange.location != NSNotFound) {
                *stop = YES;
                return;
            }
            
            
            
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            //Iterate over the array of vowels, replacing the occurrences of each with an empty string
            for (NSString *s in vowels){
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            [devowelizedStrings addObject:newString];
        }];
        
        
        //Iterate over the array with the block
        //[originalStrings enumerateObjectsUsingBlock:devowelizer];
        NSLog(@"Devowelized Strings: %@", devowelizedStrings);
    }
    return 0;
}

