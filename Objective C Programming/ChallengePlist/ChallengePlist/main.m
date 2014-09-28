//
//  main.m
//  ChallengePlist
//
//  Created by Lucas Pennati on 05.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //Entire Plist
        NSMutableArray *propertyList = [[NSMutableArray alloc] init];
        
        //Dictionary
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:@"APPLE" forKey:@"symbol"];
        [dict setObject:[NSNumber numberWithInt:200] forKey:@"shares"];
        [propertyList addObject:dict];
        
        //Array
        NSArray *anArray = [[NSArray alloc] initWithObjects:@"item1", @"item2", @"item3", nil];
        [propertyList addObject:anArray];
        
        //String
        NSString *aString = @"Some String!";
        [propertyList addObject:aString];
        
        //Data
        NSData *someData = [NSData dataWithContentsOfFile:@"/tmp/cool.txt"
                                                  options:NSUTF8StringEncoding
                                                    error:nil];
        [propertyList addObject:someData];
        
        //Date
        NSDate *currentDate = [NSDate date];
        [propertyList addObject:currentDate];
        
        //Integer
        NSNumber *anInteger = [NSNumber numberWithInteger:100];
        [propertyList addObject:anInteger];
        
        //Float
        NSNumber *aFloat = [NSNumber numberWithFloat:10.1];
        [propertyList addObject:aFloat];
        
        //Boolean
        NSNumber *aBool = [NSNumber numberWithBool:YES];
        [propertyList addObject:aBool];
        
        
        NSLog(@"%@", propertyList);
        
        //Write to file
        [propertyList writeToFile:@"/tmp/challengePropertyList.plist"
                       atomically:YES];
    }
    return 0;
}

