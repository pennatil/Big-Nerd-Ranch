//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Lucas Pennati on 07.01.15.
//  Copyright (c) 2015 Lucas Pennati. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRImageStore.h"
@interface BNRItemStore ()

@property (nonatomic)NSMutableArray *privateItems;

@end

@implementation BNRItemStore
+(instancetype)sharedStore {
    static BNRItemStore *sharedStore;
    
    if (!sharedStore){
        sharedStore = [[self alloc]initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init {
    [NSException raise:@"Singleton" format:@"Use +[BNRItemStore sharedStore]"];
    return nil;
}

-(instancetype)initPrivate {
    self = [super init];
    if (self){
        self.privateItems = [[NSMutableArray alloc]init];
    }
    return self;
}

- (NSArray *) allItems
{
    return [self.privateItems copy];
}

-(BNRItem *)createItem {
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

- (void)removeItem:(BNRItem *)item {
    
    NSString *key = item.itemKey;
    
    [[BNRImageStore sharedStore]deleteImageForKey:key];
    
    [self.privateItems removeObjectIdenticalTo:item];
}

-(void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if (fromIndex == toIndex) {
        return;
    }
    
    BNRItem *item = self.privateItems[fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
}


@end
