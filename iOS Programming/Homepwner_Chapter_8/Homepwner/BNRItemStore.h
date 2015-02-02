//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Lucas Pennati on 07.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic,readonly,copy) NSArray *allItems;
@property (nonatomic, readonly) NSArray *cheapItems;
@property (nonatomic, readonly) NSArray *expensiveItems;
+(instancetype)sharedStore;


- (BNRItem *)createItem;

@end
