//
//  BNREmployee.m
//  BMITime
//
//  Created by Lucas Pennati on 01.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNREmployee.h"
#import "BNRAsset.h"

//A class extension
@interface BNREmployee ()
{
    NSMutableSet *_assets;
}

@property (nonatomic) unsigned int officeAlarmCode;

@end

@implementation BNREmployee
-(void)setAssets:(NSArray *)a
{
    _assets = [a mutableCopy];
}

- (NSArray *)assets
{
    return [_assets copy];
}

- (void)addAsset:(BNRAsset *)a
{
    //Is the asset nil?
    if(!_assets){
        //Create the array
        _assets = [[NSMutableSet alloc] init];
    }
    
    [_assets addObject:a];
    a.holder = self;
}

-(unsigned int)valueOfAssets
{
    //Sum up the resale value
    unsigned int sum = 0;
    for (BNRAsset *a in _assets){
        sum += [a resaleValue];
    }
    return sum;
}

- (double)yearsOfEmployment
{
    //Non nil hiredate
    if (self.hireDate != nil){
        //NStimeInterval is the same as double
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs / 31557600.0;
    }
    else {
        return 0;
    }
}

-(float)bodyMassIndex
{
    float normalBMI = [super bodyMassIndex];
    return normalBMI * 0.9;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Employee %u: $%u in assets>", self.employeeID, self.valueOfAssets];
}


- (void) dealloc
{
    NSLog(@"Deallocating %@", self);
}
@end
