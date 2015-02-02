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
+(instancetype)sharedStore;
- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;
-(void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
@end
