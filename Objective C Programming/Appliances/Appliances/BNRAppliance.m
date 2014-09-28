//
//  BNRAppliance.m
//  Appliances
//
//  Created by Lucas Pennati on 07.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNRAppliance.h"

@implementation BNRAppliance

- (instancetype)initWithProductName:(NSString *)pn
{
    //Did it return something nil?
    if (self = [super init]){
        //Set the product name (Get the functions argument, and copy it in)
        _productName = [pn copy];
        //Give voltage a starting value
        _voltage = 120;
    }
    
    //Return a pointer to the new object
    return self;
}

- (instancetype)init
{
    return [self initWithProductName:@"Unknown"];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %d volts>", _productName, self.voltage];
}
- (void)setVoltage:(int)x
{
    NSLog(@"Setting voltage to %d",x);
    _voltage = x;
}
@end
