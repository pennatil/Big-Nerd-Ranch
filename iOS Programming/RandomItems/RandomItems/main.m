//
//  main.m
//  RandomItems
//
//  Created by Lucas Pennati on 08.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *items = [[NSMutableArray alloc]init];
        
        BNRItem *backpack = [[BNRItem alloc]initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        BNRItem *calculator = [[BNRItem alloc]initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        
        backpack.containedItem = calculator;
        
        backpack = nil;
        calculator = nil;
        
//        //SILVER CHALLENGE
//        BNRItem *anitem = [[BNRItem alloc]initWithItemName:@"aName"
//                                              serialNumber:@"AAA"];
//        NSLog(@"%@", anitem);
//        
        
        for (BNRItem *item in items){
            NSLog(@"%@", item);
        }
        //BRONZE CHALLENGE:
        //NSLog(@"%@", items[10]);
        
        
        NSLog(@"Setting items to nil...");
        items = nil;
        
        
    
    }
    return 0;
}

