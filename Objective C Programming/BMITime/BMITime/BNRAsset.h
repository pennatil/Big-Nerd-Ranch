//
//  BNRAsset.h
//  BMITime
//
//  Created by Lucas Pennati on 01.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNREmployee;

@interface BNRAsset : NSObject

@property (nonatomic, copy) NSString *label;
@property (nonatomic) unsigned int resaleValue;

@property (nonatomic, weak) BNREmployee *holder;
@end
