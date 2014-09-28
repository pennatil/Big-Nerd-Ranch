//
//  main.m
//  Groceries
//
//  Created by Lucas Pennati on 31.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //OPTION 1: Initialize the array, and immediately add the items
//        NSMutableArray *groceryList = [NSMutableArray arrayWithObjects:@"Loaf of Bread", @"Container of Milk", @"Stick of Butter", nil];
        
        //Option 2: Initialize the array, and later add the items
        NSMutableArray *groceryList = [NSMutableArray array];
        [groceryList addObject:@"Loaf of Bread"];
        [groceryList addObject:@"Container of Milk"];
        [groceryList addObject:@"Stick of Butter"];

        //Print out the items
        NSLog(@"My grocery list consists of:");
        for (NSString *s in groceryList){
            NSLog(@"%@", s);
        }
        
    }
    return 0;
}

