//
//  BNROwnedAppliance.m
//  Appliances
//
//  Created by Lucas Pennati on 07.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNROwnedAppliance.h"
@interface BNROwnedAppliance ()
{
    NSMutableSet *_ownerNames;
}
@end


@implementation BNROwnedAppliance
- (instancetype)initWithProductName:(NSString *)pn firstOwnerName:(NSString *)n
{
    //Call the superclass initializer
    if (self = [super initWithProductName:pn]){
        //Create a set to hold owners names
        _ownerNames = [[NSMutableSet alloc]init];
        
        //Is the first owner name non nil
        if (n){
            [_ownerNames addObject:n];
        }
    }
    return self;
}

- (void)addOwnerName:(NSString *)n
{
    [_ownerNames addObject:n];
}

- (void)removeOwnerName:(NSString *)n
{
    [_ownerNames removeObject:n];
}

- (NSSet *)ownerNames
{
    return [_ownerNames copy];
}
- (instancetype)initWithProductName:(NSString *)pn
{
    return [self initWithProductName:pn firstOwnerName:nil];
}
@end
