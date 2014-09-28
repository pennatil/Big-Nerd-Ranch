//
//  main.m
//  NameOfComputer
//
//  Created by Lucas Pennati on 29.08.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSHost *nameOfCurrentHost = [NSHost currentHost];
        NSString *nameOfHost = [nameOfCurrentHost localizedName];
        NSLog(@"Name of the computer: %@", nameOfHost);
        
    }
    return 0;
}

