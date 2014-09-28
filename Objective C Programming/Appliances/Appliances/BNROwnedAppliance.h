//
//  BNROwnedAppliance.h
//  Appliances
//
//  Created by Lucas Pennati on 07.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNRAppliance.h"

@interface BNROwnedAppliance : BNRAppliance
@property (readonly) NSSet *ownerNames;
//Designated Initializer
- (instancetype)initWithProductName:(NSString *)pn firstOwnerName:(NSString *)n;
- (void)addOwnerName:(NSString *)n;
- (void)removeOwnerName:(NSString *)n;
@end
