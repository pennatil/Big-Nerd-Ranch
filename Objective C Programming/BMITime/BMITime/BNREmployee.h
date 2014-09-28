//
//  BNREmployee.h
//  BMITime
//
//  Created by Lucas Pennati on 01.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

@class BNRAsset;

@interface BNREmployee : BNRPerson

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic, copy) NSSet *assets;

-(double)yearsOfEmployment;
-(void) addAsset:(BNRAsset *)a;
-(unsigned int)valueOfAssets;

@end
