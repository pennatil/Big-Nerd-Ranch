//
//  main.m
//  Appliances
//
//  Created by Lucas Pennati on 07.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRAppliance.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //BNRAppliance *a = [[BNRAppliance alloc]initWithProductName:@"Oven"];
        BNRAppliance *a = [[BNRAppliance alloc]init];
        NSLog(@"a is %@",a);
        [a setValue:@"Washing Machine" forKeyPath:@"productName"];
        [a setValue:[NSNumber numberWithInt:120] forKeyPath:@"voltage"];
        NSLog(@"a is %@",a);
        
        NSLog(@"The product name is %@",[a valueForKey:@"productName"]);
        NSLog(@"The voltage is %@", [a valueForKey:@"voltage"]);
    }
    return 0;
}

